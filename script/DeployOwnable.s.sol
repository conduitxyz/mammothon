// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {HtmlOwnable} from "../src/HtmlOwnable.sol";

contract CounterScript is Script {
    HtmlOwnable public html;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        html = new HtmlOwnable("");
        vm.stopBroadcast();
    }
}
