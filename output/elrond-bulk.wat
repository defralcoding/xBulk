(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func (param i32 i32)))
  (type (;3;) (func (result i32)))
  (type (;4;) (func))
  (type (;5;) (func (param i32 i32 i32) (result i32)))
  (type (;6;) (func (param i32)))
  (type (;7;) (func (param i32 i32 i64 i32 i32) (result i32)))
  (type (;8;) (func (param i32 i64)))
  (type (;9;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;10;) (func (param i32 i32 i32)))
  (type (;11;) (func (result i64)))
  (type (;12;) (func (param i32 i64) (result i32)))
  (type (;13;) (func (param i32 i32 i64 i32 i32 i32)))
  (import "env" "signalError" (func (;0;) (type 2)))
  (import "env" "mBufferNew" (func (;1;) (type 3)))
  (import "env" "mBufferAppend" (func (;2;) (type 0)))
  (import "env" "mBufferAppendBytes" (func (;3;) (type 5)))
  (import "env" "managedSignalError" (func (;4;) (type 6)))
  (import "env" "mBufferGetArgument" (func (;5;) (type 0)))
  (import "env" "getNumArguments" (func (;6;) (type 3)))
  (import "env" "mBufferGetLength" (func (;7;) (type 1)))
  (import "env" "bigIntSign" (func (;8;) (type 1)))
  (import "env" "bigIntSetInt64" (func (;9;) (type 8)))
  (import "env" "mBufferGetByteSlice" (func (;10;) (type 9)))
  (import "env" "mBufferSetBytes" (func (;11;) (type 5)))
  (import "env" "mBufferToBigIntUnsigned" (func (;12;) (type 0)))
  (import "env" "bigIntCmp" (func (;13;) (type 0)))
  (import "env" "bigIntAdd" (func (;14;) (type 10)))
  (import "env" "managedMultiTransferESDTNFTExecute" (func (;15;) (type 7)))
  (import "env" "checkNoPayment" (func (;16;) (type 4)))
  (import "env" "getNumESDTTransfers" (func (;17;) (type 3)))
  (import "env" "bigIntGetCallValue" (func (;18;) (type 6)))
  (import "env" "bigIntGetESDTCallValue" (func (;19;) (type 6)))
  (import "env" "getESDTTokenName" (func (;20;) (type 1)))
  (import "env" "getESDTTokenNonce" (func (;21;) (type 11)))
  (import "env" "managedTransferValueExecute" (func (;22;) (type 7)))
  (func (;23;) (type 1) (param i32) (result i32)
    (local i32)
    call 1
    local.tee 1
    local.get 0
    call 2
    drop
    local.get 1)
  (func (;24;) (type 2) (param i32 i32)
    (local i32)
    i32.const 1048653
    i32.const 23
    call 25
    local.tee 2
    i32.const 1048755
    i32.const 8
    call 3
    drop
    local.get 2
    i32.const 1048676
    i32.const 3
    call 3
    drop
    local.get 2
    local.get 0
    local.get 1
    call 3
    drop
    local.get 2
    call 4
    unreachable)
  (func (;25;) (type 0) (param i32 i32) (result i32)
    (local i32)
    call 27
    local.tee 2
    local.get 0
    local.get 1
    call 11
    drop
    local.get 2)
  (func (;26;) (type 3) (result i32)
    (local i32)
    call 27
    local.tee 0
    i32.const 1048764
    i32.const 0
    call 11
    drop
    local.get 0)
  (func (;27;) (type 3) (result i32)
    (local i32)
    i32.const 1048780
    i32.const 1048780
    i32.load
    i32.const 1
    i32.sub
    local.tee 0
    i32.store
    local.get 0)
  (func (;28;) (type 2) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 1
    i32.const 8
    i32.shl
    i32.const 16711680
    i32.and
    local.get 1
    i32.const 24
    i32.shl
    i32.or
    local.get 1
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    local.get 1
    i32.const 24
    i32.shr_u
    i32.or
    i32.or
    i32.store offset=12
    local.get 0
    local.get 2
    i32.const 12
    i32.add
    i32.const 4
    call 3
    drop
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;29;) (type 2) (param i32 i32)
    (local i32)
    local.get 1
    call 7
    local.set 2
    local.get 0
    i32.const 0
    i32.store offset=8
    local.get 0
    local.get 1
    i32.store
    local.get 0
    local.get 2
    i32.const 2
    i32.shr_u
    i32.store offset=4)
  (func (;30;) (type 12) (param i32 i64) (result i32)
    local.get 1
    i64.eqz
    if  ;; label = @1
      i32.const -1
      local.get 0
      call 8
      local.tee 0
      i32.const 0
      i32.ne
      local.get 0
      i32.const 0
      i32.lt_s
      select
      return
    end
    i32.const -14
    i64.const 1
    call 9
    local.get 0
    i32.const -14
    call 31)
  (func (;31;) (type 0) (param i32 i32) (result i32)
    i32.const -1
    local.get 0
    local.get 1
    call 13
    local.tee 0
    i32.const 0
    i32.ne
    local.get 0
    i32.const 0
    i32.lt_s
    select)
  (func (;32;) (type 5) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.const 4
    local.get 2
    call 10
    i32.const 0
    i32.ne)
  (func (;33;) (type 1) (param i32) (result i32)
    local.get 0
    call 7
    i32.eqz)
  (func (;34;) (type 1) (param i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 0
    i32.load offset=8
    local.set 3
    local.get 1
    i32.const 0
    i32.store offset=12
    local.get 0
    i32.load
    local.get 3
    i32.const 2
    i32.shl
    local.get 1
    i32.const 12
    i32.add
    call 32
    i32.eqz
    if  ;; label = @1
      local.get 1
      i32.load offset=12
      local.set 2
      local.get 0
      local.get 3
      i32.const 1
      i32.add
      i32.store offset=8
      local.get 2
      i32.const 8
      i32.shl
      i32.const 16711680
      i32.and
      local.get 2
      i32.const 24
      i32.shl
      i32.or
      local.get 2
      i32.const 8
      i32.shr_u
      i32.const 65280
      i32.and
      local.get 2
      i32.const 24
      i32.shr_u
      i32.or
      i32.or
      call 23
      local.get 1
      i32.const 16
      i32.add
      global.set 0
      return
    end
    i32.const 1048679
    i32.const 17
    call 24
    unreachable)
  (func (;35;) (type 2) (param i32 i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      local.get 1
      i32.load offset=8
      local.get 1
      i32.load offset=4
      i32.lt_u
      if (result i32)  ;; label = @2
        local.get 1
        call 34
        call 23
        local.tee 2
        call 7
        i32.const 32
        i32.ne
        br_if 1 (;@1;)
        local.get 1
        call 34
        call 27
        local.tee 1
        call 12
        drop
        local.get 0
        i32.const 8
        i32.add
        local.get 1
        i32.store
        local.get 0
        local.get 2
        i32.store offset=4
        i32.const 1
      else
        i32.const 0
      end
      i32.store
      return
    end
    i32.const 1048739
    i32.const 16
    call 24
    unreachable)
  (func (;36;) (type 13) (param i32 i32 i64 i32 i32 i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 6
    global.set 0
    call 26
    local.set 8
    local.get 1
    call 23
    local.set 7
    call 27
    local.tee 1
    i64.const 0
    call 9
    local.get 1
    local.get 1
    local.get 3
    call 14
    block  ;; label = @1
      local.get 1
      i64.const 0
      call 30
      i32.const 255
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 7
      call 33
      local.get 2
      i64.eqz
      i32.or
      br_if 0 (;@1;)
      local.get 1
      i64.const 1
      call 30
      drop
    end
    local.get 6
    local.get 1
    i32.const 8
    i32.shl
    i32.const 16711680
    i32.and
    local.get 1
    i32.const 24
    i32.shl
    i32.or
    local.get 1
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    local.get 1
    i32.const 24
    i32.shr_u
    i32.or
    i32.or
    i32.store offset=12
    local.get 6
    local.get 7
    i32.const 8
    i32.shl
    i32.const 16711680
    i32.and
    local.get 7
    i32.const 24
    i32.shl
    i32.or
    local.get 7
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    local.get 7
    i32.const 24
    i32.shr_u
    i32.or
    i32.or
    i32.store
    local.get 6
    local.get 2
    i64.const 40
    i64.shl
    i64.const 71776119061217280
    i64.and
    local.get 2
    i64.const 56
    i64.shl
    i64.or
    local.get 2
    i64.const 24
    i64.shl
    i64.const 280375465082880
    i64.and
    local.get 2
    i64.const 8
    i64.shl
    i64.const 1095216660480
    i64.and
    i64.or
    i64.or
    local.get 2
    i64.const 8
    i64.shr_u
    i64.const 4278190080
    i64.and
    local.get 2
    i64.const 24
    i64.shr_u
    i64.const 16711680
    i64.and
    i64.or
    local.get 2
    i64.const 40
    i64.shr_u
    i64.const 65280
    i64.and
    local.get 2
    i64.const 56
    i64.shr_u
    i64.or
    i64.or
    i64.or
    i64.store offset=4 align=4
    local.get 8
    local.get 6
    i32.const 16
    call 3
    drop
    local.get 0
    local.get 8
    i64.const 0
    local.get 4
    local.get 5
    call 15
    drop
    local.get 6
    i32.const 16
    i32.add
    global.set 0)
  (func (;37;) (type 4)
    call 16
    call 6
    if  ;; label = @1
      i32.const 1048714
      i32.const 25
      call 0
      unreachable
    end)
  (func (;38;) (type 4)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)
    global.get 0
    i32.const -64
    i32.add
    local.tee 0
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            call 17
            i32.eqz
            if  ;; label = @5
              i32.const -11
              local.set 6
              i32.const -11
              call 18
              br 1 (;@4;)
            end
            i32.const -13
            local.set 6
            i32.const -13
            call 19
            call 17
            br_if 1 (;@3;)
          end
          call 26
          local.set 5
          br 1 (;@2;)
        end
        local.get 0
        i32.const 56
        i32.add
        i64.const 0
        i64.store
        local.get 0
        i32.const 48
        i32.add
        i64.const 0
        i64.store
        local.get 0
        i32.const 40
        i32.add
        i64.const 0
        i64.store
        local.get 0
        i64.const 0
        i64.store offset=32
        block  ;; label = @3
          local.get 0
          i32.const 32
          i32.add
          call 20
          local.tee 1
          i32.eqz
          if  ;; label = @4
            call 27
            local.tee 5
            i32.const 1048764
            i32.const 0
            call 11
            drop
            br 1 (;@3;)
          end
          local.get 1
          i32.const 33
          i32.ge_u
          br_if 2 (;@1;)
          call 27
          local.tee 5
          local.get 0
          i32.const 32
          i32.add
          local.get 1
          call 11
          drop
        end
      end
      call 17
      if  ;; label = @2
        call 21
        local.set 9
      end
      i32.const 1048784
      call 6
      i32.store
      i32.const 1048784
      i32.load
      i32.const 0
      i32.lt_s
      if  ;; label = @2
        i32.const 1048679
        i32.const 17
        call 0
        unreachable
      end
      local.get 0
      i32.const 0
      i32.store offset=32
      call 26
      local.set 3
      local.get 0
      i32.const 32
      i32.add
      local.tee 2
      i32.load
      local.set 1
      loop  ;; label = @2
        i32.const 1048784
        i32.load
        local.get 1
        i32.gt_s
        if  ;; label = @3
          local.get 2
          local.get 1
          i32.const 1
          i32.add
          local.tee 4
          i32.store
          local.get 1
          call 27
          local.tee 1
          call 5
          drop
          local.get 3
          local.get 1
          call 28
          local.get 4
          local.set 1
          br 1 (;@2;)
        end
      end
      i32.const 1048784
      i32.load
      local.get 0
      i32.load offset=32
      i32.gt_s
      if  ;; label = @2
        i32.const 1048696
        i32.const 18
        call 0
        unreachable
      end
      call 27
      local.tee 2
      i64.const 0
      call 9
      call 26
      local.set 7
      local.get 3
      call 7
      local.set 8
      i32.const 0
      local.set 1
      loop  ;; label = @2
        local.get 8
        local.get 1
        i32.const 4
        i32.add
        local.tee 4
        i32.ge_u
        if  ;; label = @3
          local.get 0
          i32.const 0
          i32.store offset=32
          local.get 3
          local.get 1
          local.get 0
          i32.const 32
          i32.add
          call 32
          drop
          local.get 7
          local.get 0
          i32.load offset=32
          local.tee 1
          i32.const 24
          i32.shl
          local.get 1
          i32.const 8
          i32.shl
          i32.const 16711680
          i32.and
          i32.or
          local.get 1
          i32.const 8
          i32.shr_u
          i32.const 65280
          i32.and
          local.get 1
          i32.const 24
          i32.shr_u
          i32.or
          i32.or
          call 23
          call 28
          local.get 4
          local.set 1
          br 1 (;@2;)
        end
      end
      local.get 0
      local.get 7
      call 29
      local.get 0
      i32.const 24
      i32.add
      local.get 0
      i32.const 8
      i32.add
      i32.load
      i32.store
      local.get 0
      local.get 0
      i64.load
      i64.store offset=16
      loop  ;; label = @2
        local.get 0
        i32.const 32
        i32.add
        local.get 0
        i32.const 16
        i32.add
        call 35
        local.get 0
        i32.load offset=32
        if  ;; label = @3
          local.get 2
          local.get 2
          local.get 0
          i32.load offset=40
          call 14
          br 1 (;@2;)
        else
          local.get 6
          local.get 2
          call 31
          i32.const 255
          i32.and
          i32.eqz
          if  ;; label = @4
            local.get 0
            local.get 3
            call 29
            local.get 0
            i32.const 24
            i32.add
            local.get 0
            i32.const 8
            i32.add
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load
            i64.store offset=16
            loop  ;; label = @5
              local.get 0
              i32.const 32
              i32.add
              local.get 0
              i32.const 16
              i32.add
              call 35
              block  ;; label = @6
                local.get 0
                i32.load offset=32
                if  ;; label = @7
                  local.get 0
                  i32.load offset=40
                  local.set 1
                  local.get 0
                  i32.load offset=36
                  local.set 4
                  i32.const 1048764
                  i32.const 0
                  call 25
                  local.set 3
                  call 26
                  local.set 2
                  local.get 5
                  call 33
                  br_if 1 (;@6;)
                  local.get 9
                  i64.eqz
                  if  ;; label = @8
                    local.get 4
                    local.get 5
                    i64.const 0
                    local.get 1
                    local.get 3
                    local.get 2
                    call 36
                    br 3 (;@5;)
                  end
                  local.get 4
                  local.get 5
                  local.get 9
                  local.get 1
                  local.get 3
                  local.get 2
                  call 36
                  br 2 (;@5;)
                end
                local.get 0
                i32.const -64
                i32.sub
                global.set 0
                return
              end
              local.get 4
              local.get 1
              i64.const 0
              local.get 3
              local.get 2
              call 22
              drop
              br 0 (;@5;)
            end
            unreachable
          end
          i32.const 1048576
          i32.const 77
          call 0
          unreachable
        end
        unreachable
      end
      unreachable
    end
    i32.const 1048764
    i32.const 14
    call 0
    unreachable)
  (func (;39;) (type 4)
    nop)
  (memory (;0;) 17)
  (global (;0;) (mut i32) (i32.const 1048576))
  (global (;1;) i32 (i32.const 1048788))
  (global (;2;) i32 (i32.const 1048800))
  (export "memory" (memory 0))
  (export "init" (func 37))
  (export "bulksend" (func 38))
  (export "callBack" (func 39))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (data (;0;) (i32.const 1048576) "The sent amount must be equal to the sum of each transaction you want to sendargument decode error (): too few argumentstoo many argumentswrong number of argumentsbad array lengthvar args\00panic occurred")
  (data (;1;) (i32.const 1048780) "\9c\ff\ff\ff"))
