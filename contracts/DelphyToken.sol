/*
  Copyright 2017 Delphy Foundation.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

*/

//   /$$$$$$$            /$$           /$$
//  | $$__  $$          | $$          | $$
//  | $$  \ $$  /$$$$$$ | $$  /$$$$$$ | $$$$$$$  /$$   /$$
//  | $$  | $$ /$$__  $$| $$ /$$__  $$| $$__  $$| $$  | $$
//  | $$  | $$| $$$$$$$$| $$| $$  \ $$| $$  \ $$| $$  | $$
//  | $$  | $$| $$_____/| $$| $$  | $$| $$  | $$| $$  | $$
//  | $$$$$$$/|  $$$$$$$| $$| $$$$$$$/| $$  | $$|  $$$$$$$
//  |_______/  \_______/|__/| $$____/ |__/  |__/ \____  $$
//                          | $$                 /$$  | $$
//                          | $$                |  $$$$$$/
//                          |__/                 \______/

pragma solidity ^0.4.11;
import "./StandardToken.sol";

/// @title Delphy Token contract
/// For Delphy ICO details: https://delphy.org/index.html#ICO
/// For Delphy Project: https://delphy.org
/// @author jsw@delphy.org
contract DelphyToken is StandardToken {
    /*
     *  Constants
     */

    string constant public name = "Delphy Token";
    string constant public symbol = "DPY";
    uint8 constant public decimals = 18;

    /// Delphy token total supply
    uint public constant TOTAL_TOKENS = 100000000 * 10**18; // 1e

    /*
     *  Public functions
     */

    /// @dev Initialization of the Delphy Token contract
    /// @param owners is the addresses of Delphy token distribution
    /// @param tokens is the token number of Delphy token distribution
    function DelphyToken(address[] owners, uint[] tokens)
        public
    {
        totalSupply = 0;

        for (uint i=0; i<owners.length; i++) {
            require (owners[i] != 0);

            balances[owners[i]] += tokens[i];
            Transfer(0, owners[i], tokens[i]);
            totalSupply += tokens[i];
        }

        require (totalSupply == TOTAL_TOKENS);
    }
}
