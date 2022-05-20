(module
  (type (;0;) (func (param i32 i32)))
  (type (;1;) (func (result i32)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func (param i32 i32 i32) (result i32)))
  (type (;4;) (func (param i32)))
  (type (;5;) (func (param i32) (result i32)))
  (type (;6;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;7;) (func (param i32 i64)))
  (type (;8;) (func))
  (type (;9;) (func (param i32 i32 i64 i32 i32) (result i32)))
  (type (;10;) (func (param i32 i32 i32)))
  (type (;11;) (func (param i32 i32 i32 i32)))
  (import "env" "signalError" (func (;0;) (type 0)))
  (import "env" "mBufferNew" (func (;1;) (type 1)))
  (import "env" "mBufferAppend" (func (;2;) (type 2)))
  (import "env" "mBufferAppendBytes" (func (;3;) (type 3)))
  (import "env" "managedSignalError" (func (;4;) (type 4)))
  (import "env" "mBufferGetArgument" (func (;5;) (type 2)))
  (import "env" "getNumArguments" (func (;6;) (type 1)))
  (import "env" "mBufferGetLength" (func (;7;) (type 5)))
  (import "env" "mBufferGetByteSlice" (func (;8;) (type 6)))
  (import "env" "mBufferSetBytes" (func (;9;) (type 3)))
  (import "env" "mBufferToBigIntUnsigned" (func (;10;) (type 2)))
  (import "env" "bigIntSetInt64" (func (;11;) (type 7)))
  (import "env" "checkNoPayment" (func (;12;) (type 8)))
  (import "env" "getNumESDTTransfers" (func (;13;) (type 1)))
  (import "env" "bigIntGetCallValue" (func (;14;) (type 4)))
  (import "env" "bigIntGetESDTCallValue" (func (;15;) (type 4)))
  (import "env" "getESDTTokenName" (func (;16;) (type 5)))
  (import "env" "bigIntCmp" (func (;17;) (type 2)))
  (import "env" "managedTransferValueExecute" (func (;18;) (type 9)))
  (import "env" "bigIntAdd" (func (;19;) (type 10)))
  (import "env" "bigIntSign" (func (;20;) (type 5)))
  (import "env" "managedMultiTransferESDTNFTExecute" (func (;21;) (type 9)))
  (func (;22;) (type 8)
    i32.const 1048576
    i32.const 77
    call 0
    unreachable)
  (func (;23;) (type 5) (param i32) (result i32)
    (local i32)
    call 1
    local.tee 1
    local.get 0
    call 2
    drop
    local.get 1)
  (func (;24;) (type 8)
    call 22
    unreachable)
  (func (;25;) (type 11) (param i32 i32 i32 i32)
    (local i32)
    i32.const 1048653
    i32.const 23
    call 26
    local.tee 4
    local.get 0
    local.get 1
    call 3
    drop
    local.get 4
    i32.const 1048676
    i32.const 3
    call 3
    drop
    local.get 4
    local.get 2
    local.get 3
    call 3
    drop
    local.get 4
    call 4
    unreachable)
  (func (;26;) (type 2) (param i32 i32) (result i32)
    (local i32)
    call 29
    local.tee 2
    local.get 0
    local.get 1
    call 9
    drop
    local.get 2)
  (func (;27;) (type 5) (param i32) (result i32)
    (local i32 i32 i32 i32)
    call 28
    local.set 1
    local.get 0
    i32.load
    local.set 2
    block  ;; label = @1
      loop  ;; label = @2
        local.get 2
        i32.const 0
        i32.load offset=1048784
        i32.ge_s
        br_if 1 (;@1;)
        local.get 0
        local.get 2
        i32.const 1
        i32.add
        local.tee 3
        i32.store
        local.get 2
        call 29
        local.tee 4
        call 5
        drop
        local.get 1
        local.get 4
        call 30
        local.get 3
        local.set 2
        br 0 (;@2;)
      end
    end
    local.get 1)
  (func (;28;) (type 1) (result i32)
    (local i32)
    call 29
    local.tee 0
    i32.const 1048764
    i32.const 0
    call 9
    drop
    local.get 0)
  (func (;29;) (type 1) (result i32)
    (local i32)
    i32.const 0
    i32.const 0
    i32.load offset=1048780
    i32.const -1
    i32.add
    local.tee 0
    i32.store offset=1048780
    local.get 0)
  (func (;30;) (type 0) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 1
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
  (func (;31;) (type 4) (param i32)
    block  ;; label = @1
      i32.const 0
      i32.load offset=1048784
      local.get 0
      i32.le_s
      br_if 0 (;@1;)
      i32.const 1048696
      i32.const 18
      call 0
      unreachable
    end)
  (func (;32;) (type 8)
    block  ;; label = @1
      call 6
      br_if 0 (;@1;)
      return
    end
    i32.const 1048714
    i32.const 25
    call 0
    unreachable)
  (func (;33;) (type 8)
    block  ;; label = @1
      i32.const 0
      i32.load offset=1048784
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      return
    end
    i32.const 1048679
    i32.const 17
    call 0
    unreachable)
  (func (;34;) (type 0) (param i32 i32)
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
  (func (;35;) (type 3) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.const 4
    local.get 2
    call 8
    i32.const 0
    i32.ne)
  (func (;36;) (type 5) (param i32) (result i32)
    local.get 0
    call 7)
  (func (;37;) (type 5) (param i32) (result i32)
    local.get 0
    call 36
    i32.eqz)
  (func (;38;) (type 5) (param i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 0
    i32.load offset=8
    local.set 2
    local.get 1
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      local.get 0
      i32.load
      local.get 2
      i32.const 2
      i32.shl
      local.get 1
      i32.const 12
      i32.add
      call 35
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=12
      local.set 3
      local.get 0
      local.get 2
      i32.const 1
      i32.add
      i32.store offset=8
      local.get 3
      i32.const 24
      i32.shl
      local.get 3
      i32.const 8
      i32.shl
      i32.const 16711680
      i32.and
      i32.or
      local.get 3
      i32.const 8
      i32.shr_u
      i32.const 65280
      i32.and
      local.get 3
      i32.const 24
      i32.shr_u
      i32.or
      i32.or
      call 23
      local.set 3
      local.get 1
      i32.const 16
      i32.add
      global.set 0
      local.get 3
      return
    end
    i32.const 1048755
    i32.const 8
    i32.const 1048679
    i32.const 17
    call 25
    unreachable)
  (func (;39;) (type 0) (param i32 i32)
    (local i32)
    i32.const 0
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load offset=8
        local.get 1
        i32.load offset=4
        i32.ge_u
        br_if 0 (;@2;)
        local.get 1
        call 38
        call 23
        local.tee 2
        call 7
        i32.const 32
        i32.ne
        br_if 1 (;@1;)
        local.get 1
        call 38
        call 29
        local.tee 1
        call 10
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
        local.set 2
      end
      local.get 0
      local.get 2
      i32.store
      return
    end
    i32.const 1048755
    i32.const 8
    i32.const 1048739
    i32.const 16
    call 25
    unreachable)
  (func (;40;) (type 4) (param i32)
    local.get 0
    i64.const 0
    call 11)
  (func (;41;) (type 8)
    call 12
    call 32)
  (func (;42;) (type 8)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 80
    i32.sub
    local.tee 0
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              call 13
              br_if 0 (;@5;)
              i32.const -11
              local.set 1
              i32.const -11
              call 14
              br 1 (;@4;)
            end
            i32.const -13
            local.set 1
            i32.const -13
            call 15
            call 13
            br_if 1 (;@3;)
          end
          call 28
          local.set 2
          br 1 (;@2;)
        end
        local.get 0
        i32.const 72
        i32.add
        i64.const 0
        i64.store
        local.get 0
        i32.const 64
        i32.add
        i64.const 0
        i64.store
        local.get 0
        i32.const 56
        i32.add
        i64.const 0
        i64.store
        local.get 0
        i64.const 0
        i64.store offset=48
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.const 48
            i32.add
            call 16
            local.tee 3
            br_if 0 (;@4;)
            call 29
            local.tee 2
            i32.const 1048764
            i32.const 0
            call 9
            drop
            br 1 (;@3;)
          end
          local.get 3
          i32.const 33
          i32.ge_u
          br_if 2 (;@1;)
          call 29
          local.tee 2
          local.get 0
          i32.const 48
          i32.add
          local.get 3
          call 9
          drop
        end
        i32.const -13
        local.set 1
      end
      i32.const 0
      call 6
      i32.store offset=1048784
      call 33
      local.get 0
      i32.const 0
      i32.store offset=48
      local.get 0
      i32.const 48
      i32.add
      call 27
      local.set 4
      local.get 0
      i32.load offset=48
      call 31
      call 29
      local.tee 5
      call 40
      call 28
      local.set 6
      local.get 4
      call 7
      local.set 7
      i32.const 0
      local.set 3
      block  ;; label = @2
        loop  ;; label = @3
          local.get 3
          i32.const 4
          i32.add
          local.tee 8
          local.get 7
          i32.gt_u
          br_if 1 (;@2;)
          local.get 0
          i32.const 0
          i32.store offset=48
          local.get 4
          local.get 3
          local.get 0
          i32.const 48
          i32.add
          call 35
          drop
          local.get 6
          local.get 0
          i32.load offset=48
          local.tee 3
          i32.const 24
          i32.shl
          local.get 3
          i32.const 8
          i32.shl
          i32.const 16711680
          i32.and
          i32.or
          local.get 3
          i32.const 8
          i32.shr_u
          i32.const 65280
          i32.and
          local.get 3
          i32.const 24
          i32.shr_u
          i32.or
          i32.or
          call 23
          call 30
          local.get 8
          local.set 3
          br 0 (;@3;)
        end
      end
      local.get 0
      i32.const 16
      i32.add
      local.get 6
      call 34
      local.get 0
      i32.const 32
      i32.add
      i32.const 8
      i32.add
      local.get 0
      i32.const 16
      i32.add
      i32.const 8
      i32.add
      i32.load
      i32.store
      local.get 0
      local.get 0
      i64.load offset=16
      i64.store offset=32
      block  ;; label = @2
        loop  ;; label = @3
          local.get 0
          i32.const 48
          i32.add
          local.get 0
          i32.const 32
          i32.add
          call 39
          block  ;; label = @4
            local.get 0
            i32.load offset=48
            br_if 0 (;@4;)
            local.get 1
            local.get 5
            call 17
            br_if 2 (;@2;)
            local.get 0
            local.get 4
            call 34
            local.get 0
            i32.const 16
            i32.add
            i32.const 8
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
            block  ;; label = @5
              loop  ;; label = @6
                local.get 0
                i32.const 32
                i32.add
                local.get 0
                i32.const 16
                i32.add
                call 39
                local.get 0
                i32.load offset=32
                i32.eqz
                br_if 1 (;@5;)
                local.get 0
                i32.load offset=40
                local.set 8
                local.get 0
                i32.load offset=36
                local.set 4
                i32.const 1048764
                i32.const 0
                call 26
                local.set 7
                call 28
                local.set 6
                block  ;; label = @7
                  local.get 2
                  call 37
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 4
                  local.get 8
                  i64.const 0
                  local.get 7
                  local.get 6
                  call 18
                  drop
                  br 1 (;@6;)
                end
                call 28
                local.set 1
                local.get 2
                call 23
                local.set 5
                call 29
                local.tee 3
                call 40
                local.get 3
                local.get 3
                local.get 8
                call 19
                block  ;; label = @7
                  local.get 3
                  call 20
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 5
                  call 37
                  drop
                end
                local.get 0
                i64.const 0
                i64.store offset=52 align=4
                local.get 0
                local.get 3
                i32.const 24
                i32.shl
                local.get 3
                i32.const 8
                i32.shl
                i32.const 16711680
                i32.and
                i32.or
                local.get 3
                i32.const 8
                i32.shr_u
                i32.const 65280
                i32.and
                local.get 3
                i32.const 24
                i32.shr_u
                i32.or
                i32.or
                i32.store offset=60
                local.get 0
                local.get 5
                i32.const 24
                i32.shl
                local.get 5
                i32.const 8
                i32.shl
                i32.const 16711680
                i32.and
                i32.or
                local.get 5
                i32.const 8
                i32.shr_u
                i32.const 65280
                i32.and
                local.get 5
                i32.const 24
                i32.shr_u
                i32.or
                i32.or
                i32.store offset=48
                local.get 1
                local.get 0
                i32.const 48
                i32.add
                i32.const 16
                call 3
                drop
                local.get 4
                local.get 1
                i64.const 0
                local.get 7
                local.get 6
                call 21
                drop
                br 0 (;@6;)
              end
            end
            local.get 0
            i32.const 80
            i32.add
            global.set 0
            return
          end
          local.get 5
          local.get 5
          local.get 0
          i32.load offset=56
          call 19
          br 0 (;@3;)
        end
      end
      call 24
      unreachable
    end
    local.get 3
    call 43
    unreachable)
  (func (;43;) (type 4) (param i32)
    local.get 0
    call 47
    unreachable)
  (func (;44;) (type 8))
  (func (;45;) (type 8)
    call 46
    unreachable)
  (func (;46;) (type 8)
    i32.const 1048764
    i32.const 14
    call 0
    unreachable)
  (func (;47;) (type 4) (param i32)
    local.get 0
    call 48
    unreachable)
  (func (;48;) (type 4) (param i32)
    local.get 0
    call 49
    unreachable)
  (func (;49;) (type 4) (param i32)
    call 45
    unreachable)
  (memory (;0;) 17)
  (global (;0;) (mut i32) (i32.const 1048576))
  (global (;1;) i32 (i32.const 1048788))
  (global (;2;) i32 (i32.const 1048800))
  (export "memory" (memory 0))
  (export "init" (func 41))
  (export "bulksend" (func 42))
  (export "callBack" (func 44))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (data (;0;) (i32.const 1048576) "The sent amount must be equal to the sum of each transaction you want to sendargument decode error (): too few argumentstoo many argumentswrong number of argumentsbad array lengthvar args\00panic occurred")
  (data (;1;) (i32.const 1048780) "\9c\ff\ff\ff"))
