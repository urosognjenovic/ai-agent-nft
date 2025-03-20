// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {Script} from "forge-std/Script.sol";
import {GetGift} from "../src/GetGift.sol";

contract DeployGetGift is Script {
    GetGift private s_getGift;

    function run() external returns (GetGift) {
        vm.startBroadcast();
        s_getGift = new GetGift();
        vm.stopBroadcast();
        return s_getGift;
    }
}
