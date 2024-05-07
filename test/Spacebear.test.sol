pragma solidity ^0.8.4;

import "forge-std/Test.sol";
import "../src/Spacebear.sol";

contract SpacebearTest is Test{
    Spacebear spacebear;
    address owner = msg.sender;
    function setUp() public{
        // address alice = makeAddr("alice");
        // address owner = address(bytes20(bytes("0x3078313830346338414231463132453662626633")));
        spacebear = new Spacebear(owner);
    }
    function testNameisSpacebear() public{
        assertEq(spacebear.name(),"Spacebear");
    }
    function testMintingNFTs() public{
        // address owner = address(bytes20(bytes("0x3078313830346338414231463132453662626633")));
        vm.startPrank(owner); //instructs the underlyng VM to run every txn from now on with the address given as parameter;
        spacebear.safeMint(msg.sender);
        assertEq(spacebear.ownerOf(0), msg.sender);
        assertEq(spacebear.tokenURI(0), "https://ethereum-blockchain-developer.com/2022-06-nft-truffle-hardhat-foundry/nftdata/spacebear_1.json");
        vm.stopPrank();
    }

    // function testNftCreationWrongOwner() public{
    //     address purchaser = address(0x1);
    //     vm.startPrank(purchaser);
    //     vm.expectRevert("OwnableUnauthorizedAccount(0x0000000000000000000000000000000000000001)");
    //     // vm.expectRevert(
    //     //     abi.encodeWithSelector(
    //     //         Ownable.OwnableUnauthorizedAccount.selector
    //     //     )
    //     // );
    //     spacebear.safeMint((purchaser));
    //     vm.stopPrank();

    // }
    function testNftButToken() public{
        address purchaser = address(0x2);
        vm.startPrank(purchaser);
        spacebear.buyToken();
        vm.stopPrank();
        assertEq(spacebear.ownerOf(0),purchaser);

    }
}