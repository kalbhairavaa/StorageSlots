// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const hre = require('hardhat')
// const { ethers } = require("hardhat");

async function main() {
  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile
  // manually to make sure everything is compiled
  // await hre.run('compile');

  // We get the contract to deploy
  const Greeter = await hre.ethers.getContractFactory('StorageSlotTest')
  const greeter = await Greeter.deploy()

  await greeter.deployed()

  // Adding values
  await greeter.setValue('0', ['1', '2', '3'])
  const value = await greeter.structs('0')
  console.log(`value - ${value}`)

  console.log('Greeter deployed to:', greeter.address)

  // getting storage slots
  // contract StorageSlotTest {
  // struct Struct {
  //     address sender;    // 0
  //     uint256[] numbers;  // 1
  // }

  // mapping(uint256 => Struct) public structs; // 0

  // function setValue(uint256 index, uint256[] memory _array) external {
  //     structs[index] = Struct(msg.sender, _array);
  // }
  // }

  // structs mapping is the first property
  // so it is at slot index 0
  // get it

  // as an example
  /**
     * value - 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
Greeter deployed to: 0x5FbDB2315678afecb367f032d93F642f64180aa3
     */
  const slot0 = await hre.ethers.provider.getStorageAt(greeter.address, 0)

  console.log(`slot0 - ${slot0}`) // returns  slot0 - 0x0000000000000000000000000000000000000000000000000000000000000000
  // as this is a mapping
  // we need to calculate the slot

  // we are trying to calculate the slot for the mapping with key "0" at slot 0
  // so structs[0] is at keccak256(uint256(0) . uint256(0)) // (.) is concatenation

  // calculation slot value for structs[0]

  const index = hre.ethers.utils.hexZeroPad(
    hre.ethers.BigNumber.from(0).toHexString(),
    32,
  ) // slot index
  const key = hre.ethers.utils.hexZeroPad(
    hre.ethers.BigNumber.from(0).toHexString(),
    32,
  ) // mappings key

  // now calculating the slot number
  const newSlotNumber = hre.ethers.utils.concat([key, index])
  console.log(`newSlotNumber - ${newSlotNumber}`)
  // newSlotNumber - 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

  console.log(hre.ethers.utils.keccak256(newSlotNumber)) // slot index
  // 0xad3228b676f7d3cd4284a5443f17f1962b36e491b30a40b2405849e597ba5fb5

  // pass this and get the value
  const slot0_0 = await hre.ethers.provider.getStorageAt(
    greeter.address,
    hre.ethers.utils.keccak256(newSlotNumber),
  )
  console.log(`slot0_0 - ${slot0_0}`) // value struct

  // Now we have the struct (saved as tuples)

  // (basically the value of the first  parameter of the struct is at slot offset 0)
  // this the true for 256 bit data as storage slots are 32 bytes
  // if is less that 32, they are packed at the same slot (no zero padding)
  // so here in our case , the first parameter was the address 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266

  // we get back // slot0_0 - 0x000000000000000000000000f39fd6e51aad88f6f4ce6ab8827279cfffb92266 (zero padded)

  // Next struct parameter is at slot 1 - this means
  // hre.ethers.utils.keccak256(newSlotNumber) + 1
  // so this returns the length of the array
  // get second value at slot (slot 0) + 1

  const slot0_1_value = hre.ethers.BigNumber.from(
    hre.ethers.utils.keccak256(newSlotNumber),
  ).add(hre.ethers.BigNumber.from(1))

  const slot0_1 = await hre.ethers.provider.getStorageAt(
    greeter.address,
    slot0_1_value,
  )

  console.log(`slot0_1 - ${slot0_1}`)
  // slot0_1 - 0x0000000000000000000000000000000000000000000000000000000000000003
  // returns array length // 3

  // array elements are at keccak256 of this value
  const slot0_1_0_value = hre.ethers.utils.keccak256(slot0_1_value)

  const slot0_1_0 = await hre.ethers.provider.getStorageAt(
    greeter.address,
    slot0_1_0_value,
  )

  console.log(`slot0_1_0 - ${slot0_1_0}`) // array element 1
  // slot0_1_0 - 0x0000000000000000000000000000000000000000000000000000000000000001

  const slot0_1_1_value = hre.ethers.BigNumber.from(slot0_1_0_value).add(
    hre.ethers.BigNumber.from(1),
  )

  const slot0_1_1 = await hre.ethers.provider.getStorageAt(
    greeter.address,
    slot0_1_1_value,
  )

  console.log(`slot0_1_1 - ${slot0_1_1}`) // array element 2
  // slot0_1_1 - 0x0000000000000000000000000000000000000000000000000000000000000002

  const slot0_1_2_value = hre.ethers.BigNumber.from(slot0_1_1_value).add(
    hre.ethers.BigNumber.from(1),
  )

  const slot0_1_2 = await hre.ethers.provider.getStorageAt(
    greeter.address,
    slot0_1_2_value,
  )

  console.log(`slot0_1_2 - ${slot0_1_2}`) // array element 3
  // slot0_1_2 - 0x0000000000000000000000000000000000000000000000000000000000000003
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error)
    process.exit(1)
  })
