// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Html} from "../src/Html.sol";

contract CounterScript is Script {
    Html public html;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        string memory page = vm.readFile("./pages/readfromchain.html");
        html = new Html(page);

        vm.stopBroadcast();
    }
}
