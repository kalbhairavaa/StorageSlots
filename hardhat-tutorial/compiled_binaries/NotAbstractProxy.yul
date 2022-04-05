/*=====================================================*
 *                       WARNING                       *
 *  Solidity to Yul compilation is still EXPERIMENTAL  *
 *       It can result in LOSS OF FUNDS or worse       *
 *                !USE AT YOUR OWN RISK!               *
 *=====================================================*/


/// @use-src 0:"contracts/NotAbstractProxy.sol"
object "NotAbstractProxy_29" {
    code {
        /// @src 0:24:1453  "contract NotAbstractProxy {..."
        mstore(64, memoryguard(128))
        if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }

        constructor_NotAbstractProxy_29()

        let _1 := allocate_unbounded()
        codecopy(_1, dataoffset("NotAbstractProxy_29_deployed"), datasize("NotAbstractProxy_29_deployed"))

        return(_1, datasize("NotAbstractProxy_29_deployed"))

        function allocate_unbounded() -> memPtr {
            memPtr := mload(64)
        }

        function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
            revert(0, 0)
        }

        /// @src 0:24:1453  "contract NotAbstractProxy {..."
        function constructor_NotAbstractProxy_29() {

            /// @src 0:24:1453  "contract NotAbstractProxy {..."

        }
        /// @src 0:24:1453  "contract NotAbstractProxy {..."

    }
    /// @use-src 0:"contracts/NotAbstractProxy.sol"
    object "NotAbstractProxy_29_deployed" {
        code {
            /// @src 0:24:1453  "contract NotAbstractProxy {..."
            mstore(64, 128)

            if iszero(lt(calldatasize(), 4))
            {
                let selector := shift_right_224_unsigned(calldataload(0))
                switch selector

                case 0x5c60da1b
                {
                    // implementation()

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    abi_decode_tuple_(4, calldatasize())
                    let ret_0 :=  getter_fun_implementation_3()
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple_t_address__to_t_address__fromStack(memPos , ret_0)
                    return(memPos, sub(memEnd, memPos))
                }

                case 0xd784d426
                {
                    // setImplementation(address)

                    if callvalue() { revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() }
                    let param_0 :=  abi_decode_tuple_t_address(4, calldatasize())
                    fun_setImplementation_13(param_0)
                    let memPos := allocate_unbounded()
                    let memEnd := abi_encode_tuple__to__fromStack(memPos  )
                    return(memPos, sub(memEnd, memPos))
                }

                default {}
            }

            fun__28() stop()

            function shift_right_224_unsigned(value) -> newValue {
                newValue :=

                shr(224, value)

            }

            function allocate_unbounded() -> memPtr {
                memPtr := mload(64)
            }

            function revert_error_ca66f745a3ce8ff40e2ccaf1ad45db7774001b90d25810abd9040049be7bf4bb() {
                revert(0, 0)
            }

            function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
                revert(0, 0)
            }

            function abi_decode_tuple_(headStart, dataEnd)   {
                if slt(sub(dataEnd, headStart), 0) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

            }

            function shift_right_unsigned_dynamic(bits, value) -> newValue {
                newValue :=

                shr(bits, value)

            }

            function cleanup_from_storage_t_address(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function extract_from_storage_value_dynamict_address(slot_value, offset) -> value {
                value := cleanup_from_storage_t_address(shift_right_unsigned_dynamic(mul(offset, 8), slot_value))
            }

            function read_from_storage_split_dynamic_t_address(slot, offset) -> value {
                value := extract_from_storage_value_dynamict_address(sload(slot), offset)

            }

            /// @ast-id 3
            /// @src 0:56:85  "address public implementation"
            function getter_fun_implementation_3() -> ret {

                let slot := 0
                let offset := 0

                ret := read_from_storage_split_dynamic_t_address(slot, offset)

            }
            /// @src 0:24:1453  "contract NotAbstractProxy {..."

            function cleanup_t_uint160(value) -> cleaned {
                cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
            }

            function cleanup_t_address(value) -> cleaned {
                cleaned := cleanup_t_uint160(value)
            }

            function abi_encode_t_address_to_t_address_fromStack(value, pos) {
                mstore(pos, cleanup_t_address(value))
            }

            function abi_encode_tuple_t_address__to_t_address__fromStack(headStart , value0) -> tail {
                tail := add(headStart, 32)

                abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

            }

            function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
                revert(0, 0)
            }

            function validator_revert_t_address(value) {
                if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
            }

            function abi_decode_t_address(offset, end) -> value {
                value := calldataload(offset)
                validator_revert_t_address(value)
            }

            function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
                if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

                {

                    let offset := 0

                    value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
                }

            }

            function abi_encode_tuple__to__fromStack(headStart ) -> tail {
                tail := add(headStart, 0)

            }

            function shift_left_0(value) -> newValue {
                newValue :=

                shl(0, value)

            }

            function update_byte_slice_20_shift_0(value, toInsert) -> result {
                let mask := 0xffffffffffffffffffffffffffffffffffffffff
                toInsert := shift_left_0(toInsert)
                value := and(value, not(mask))
                result := or(value, and(toInsert, mask))
            }

            function identity(value) -> ret {
                ret := value
            }

            function convert_t_uint160_to_t_uint160(value) -> converted {
                converted := cleanup_t_uint160(identity(cleanup_t_uint160(value)))
            }

            function convert_t_uint160_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_uint160(value)
            }

            function convert_t_address_to_t_address(value) -> converted {
                converted := convert_t_uint160_to_t_address(value)
            }

            function prepare_store_t_address(value) -> ret {
                ret := value
            }

            function update_storage_value_offset_0t_address_to_t_address(slot, value_0) {
                let convertedValue_0 := convert_t_address_to_t_address(value_0)
                sstore(slot, update_byte_slice_20_shift_0(sload(slot), prepare_store_t_address(convertedValue_0)))
            }

            /// @ast-id 13
            /// @src 0:92:180  "function setImplementation(address _imp) external {..."
            function fun_setImplementation_13(var__imp_5) {

                /// @src 0:169:173  "_imp"
                let _1 := var__imp_5
                let expr_9 := _1
                /// @src 0:152:173  "implementation = _imp"
                update_storage_value_offset_0t_address_to_t_address(0x00, expr_9)
                let expr_10 := expr_9

            }
            /// @src 0:24:1453  "contract NotAbstractProxy {..."

            function shift_right_0_unsigned(value) -> newValue {
                newValue :=

                shr(0, value)

            }

            function extract_from_storage_value_offset_0t_address(slot_value) -> value {
                value := cleanup_from_storage_t_address(shift_right_0_unsigned(slot_value))
            }

            function read_from_storage_split_offset_0_t_address(slot) -> value {
                value := extract_from_storage_value_offset_0t_address(sload(slot))

            }

            /// @ast-id 28
            /// @src 0:1381:1451  "fallback() external payable {..."
            function fun__28() {

                /// @src 0:1429:1443  "implementation"
                let _2 := read_from_storage_split_offset_0_t_address(0x00)
                let expr_24 := _2
                fun__delegate_20(expr_24)

            }
            /// @src 0:24:1453  "contract NotAbstractProxy {..."

            /// @ast-id 20
            /// @src 0:186:1375  "function _delegate(address _imp) internal virtual {..."
            function fun__delegate_20(var__imp_15) {

                /// @src 0:246:1369  "assembly {..."
                {
                    calldatacopy(0, 0, calldatasize())
                    let usr$result := delegatecall(gas(), var__imp_15, 0, calldatasize(), 0, 0)
                    returndatacopy(0, 0, returndatasize())
                    switch usr$result
                    case 0 { revert(0, returndatasize()) }
                    default { return(0, returndatasize()) }
                }

            }
            /// @src 0:24:1453  "contract NotAbstractProxy {..."

        }

        data ".metadata" hex"a3646970667358221220ad5f856cceb0000e5ff3af2aacbe6be3898ea969c362f79a312d7fd7d047b2b46c6578706572696d656e74616cf564736f6c634300080b0041"
    }

}

