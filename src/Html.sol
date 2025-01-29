// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "./IHtml.sol";

/*
 * The simplest possible HTML contract. Anyone can update the page, with no permissions.
*/
contract Html is IHtml{
    string private html;

    // roughly 640gas/character
    constructor(string memory _html) {
        html = _html;
    }

    function GET(string memory) public view returns (string memory) {
        return html;
    }

    function POST(bytes memory) external pure returns (string memory) {
        return "POST reqeusts not supported";
    }
}