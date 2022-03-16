//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
contract StorageSlotTest {
    struct Struct {
        address sender;
        uint256[] numbers;
    }

    mapping(uint256 => Struct) public structs;

    function setValue(uint256 index, uint256[] memory _array) external {
        structs[index] = Struct(msg.sender, _array);
    }
}