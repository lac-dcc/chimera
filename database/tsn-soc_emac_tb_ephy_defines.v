// This program was cloned from: https://github.com/lvzhengde/tsn-soc
// License: BSD 3-Clause "New" or "Revised" License

/*+
 * Copyright (c) 2022-2023 Zhengde
 *
 * Copyright (c) 2002 Tadej Markovic, tadej@opencores.org 
 * 
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 * 1 Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * 
 * 2 Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * 
 * 3 Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-*/

`ifndef EPHY_DEFINES
`define EPHY_DEFINES

// Dump test messages or not
`define VERBOSE

// Address of PHY device 
`define ETH_PHY_ADDR                 5'h01

// see the specification, clause 22.2.4.1, table 22-7
// Initial set of bits 13, 12, 8 and 6 of Control Register
`define AUTO_NEG_EN                     1'b0
`define DUPLEX_MODE                     1'b1

// Supported speeds and physical ports - see the specification, page 67, table 41
// Set bits 15 to 9 of Status Register
`define SUPPORTED_SPEED_AND_PORT     7'h3F

// Extended status register (address 15)
// Set bit 8 of Status Register
`define EXTENDED_STATUS              1'b0

// Default status bits - see the specification, page 67, table 41
// Set bits 6 to 0 of Status Register
`define DEFAULT_STATUS               7'h09

// PHY ID 1 number - see the specification, page 68, table 42
// Set bits of Phy Id Register 1
`define PHY_ID1                      16'h0013

// PHY ID 2 number - see the specification, page 68, table 43
// Set bits 15 to 10 of Phy Id Register 2
`define PHY_ID2                      6'h1E

// Manufacturer MODEL number - see the specification, page 68, table 43
// Set bits 9 to 4 of Phy Id Register 2
`define MAN_MODEL_NUM                6'h0E

// Manufacturer REVISION number - see the specification, page 68, table 43
// Set bits 3 to 0 of Phy Id Register 2
`define MAN_REVISION_NUM             4'h2

`endif //EPHY_DEFINES


