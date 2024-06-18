// This program was cloned from: https://github.com/ultraembedded/core_soc
// License: GNU General Public License v2.0

//-----------------------------------------------------------------
//                     Basic Peripheral SoC
//                           V1.1
//                     Ultra-Embedded.com
//                     Copyright 2014-2020
//
//                 Email: admin@ultra-embedded.com
//
//                         License: GPL
// If you would like a version with a more permissive license for
// use in closed source commercial applications please contact me
// for details.
//-----------------------------------------------------------------
//
// This file is open source HDL; you can redistribute it and/or 
// modify it under the terms of the GNU General Public License as 
// published by the Free Software Foundation; either version 2 of 
// the License, or (at your option) any later version.
//
// This file is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public 
// License along with this file; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
// USA
//-----------------------------------------------------------------

//-----------------------------------------------------------------
//                          Generated File
//-----------------------------------------------------------------

`define TIMER_CTRL0    8'h8

    `define TIMER_CTRL0_INTERRUPT      1
    `define TIMER_CTRL0_INTERRUPT_DEFAULT    0
    `define TIMER_CTRL0_INTERRUPT_B          1
    `define TIMER_CTRL0_INTERRUPT_T          1
    `define TIMER_CTRL0_INTERRUPT_W          1
    `define TIMER_CTRL0_INTERRUPT_R          1:1

    `define TIMER_CTRL0_ENABLE      2
    `define TIMER_CTRL0_ENABLE_DEFAULT    0
    `define TIMER_CTRL0_ENABLE_B          2
    `define TIMER_CTRL0_ENABLE_T          2
    `define TIMER_CTRL0_ENABLE_W          1
    `define TIMER_CTRL0_ENABLE_R          2:2

`define TIMER_CMP0    8'hc

    `define TIMER_CMP0_VALUE_DEFAULT    0
    `define TIMER_CMP0_VALUE_B          0
    `define TIMER_CMP0_VALUE_T          31
    `define TIMER_CMP0_VALUE_W          32
    `define TIMER_CMP0_VALUE_R          31:0

`define TIMER_VAL0    8'h10

    `define TIMER_VAL0_CURRENT_DEFAULT    0
    `define TIMER_VAL0_CURRENT_B          0
    `define TIMER_VAL0_CURRENT_T          31
    `define TIMER_VAL0_CURRENT_W          32
    `define TIMER_VAL0_CURRENT_R          31:0

`define TIMER_CTRL1    8'h14

    `define TIMER_CTRL1_INTERRUPT      1
    `define TIMER_CTRL1_INTERRUPT_DEFAULT    0
    `define TIMER_CTRL1_INTERRUPT_B          1
    `define TIMER_CTRL1_INTERRUPT_T          1
    `define TIMER_CTRL1_INTERRUPT_W          1
    `define TIMER_CTRL1_INTERRUPT_R          1:1

    `define TIMER_CTRL1_ENABLE      2
    `define TIMER_CTRL1_ENABLE_DEFAULT    0
    `define TIMER_CTRL1_ENABLE_B          2
    `define TIMER_CTRL1_ENABLE_T          2
    `define TIMER_CTRL1_ENABLE_W          1
    `define TIMER_CTRL1_ENABLE_R          2:2

`define TIMER_CMP1    8'h18

    `define TIMER_CMP1_VALUE_DEFAULT    0
    `define TIMER_CMP1_VALUE_B          0
    `define TIMER_CMP1_VALUE_T          31
    `define TIMER_CMP1_VALUE_W          32
    `define TIMER_CMP1_VALUE_R          31:0

`define TIMER_VAL1    8'h1c

    `define TIMER_VAL1_CURRENT_DEFAULT    0
    `define TIMER_VAL1_CURRENT_B          0
    `define TIMER_VAL1_CURRENT_T          31
    `define TIMER_VAL1_CURRENT_W          32
    `define TIMER_VAL1_CURRENT_R          31:0

