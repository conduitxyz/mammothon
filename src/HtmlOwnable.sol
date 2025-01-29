// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "./IHtml.sol";

/*
 * Ownable HTML page. Can be governed by a single person, Multisig, DAO, etc.
*/
contract Html is IHtml {
    string private html;

    // roughly 640gas/character
    constructor(string memory _html) {
        html = _html;
    }

    // roughly 160gas/character (best case)
    function updateHtml(string memory _html) public {
        html = _html;
    }

    function GET(string memory) public view returns (string memory) {
        return html;
    }

    function POST(bytes memory) public pure returns (string memory) {
        return "POST reqeusts not supported";
    }
}