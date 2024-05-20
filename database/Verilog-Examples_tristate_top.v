// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

//**************************************************************************
//
//    Copyright (C) 2024  John Winans
//
//    This library is free software; you can redistribute it and/or
//    modify it under the terms of the GNU Lesser General Public
//    License as published by the Free Software Foundation; either
//    version 2.1 of the License, or (at your option) any later version.
//
//    This library is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
//    Lesser General Public License for more details.
//
//    You should have received a copy of the GNU Lesser General Public
//    License along with this library; if not, write to the Free Software
//    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
//    USA
//
//**************************************************************************

`default_nettype none

/**
* This attempts to create an open-collector style output with a pullup.
**************************************************************************/
module top (
    input  wire     s1_n,
    output wire     led1,
    output wire     d_out
    );

    // This version does not seem to turn on the pullup when d_out=1'bz
    // It *does* appear to let d_out float when it is set to z.

    // Yosys includes a warning about limited tri-state support.  
    // So this misfeature is probably a thing.

    assign led1 = s1_n;                 // LED will go on when press s1
    assign d_out = ~s1_n ? 1'b0 : 1'bz; // tri-state when s1 is released

endmodule



/**
* Manually can configure the IO block to be the way we want it.
* See The LATTICE ICE Technology Library (SBTICETechnologyLibrary201504.pdf)
**************************************************************************/
module XXtop (
    input  wire     s1_n,
    output wire     led1,
    output wire     d_out
    );

    wire driver_enable;

    // SBTICETechnologyLibrary201504.pdf notes the following regarding
    // the PULLUP parameter on the SB_IO:
    //
    // By default, the IO will have NO pull up. This parameter is used only 
    // on bank 0, 1, and 2. Ignored when it is placed at bank 3.
    //
    // And yet... it seems to work fine on pin 44 (which is on bank 3.)

    SB_IO #(
        .PIN_TYPE(6'b1010_01),
        .PULLUP(1'b1)                   // enable the pullup
    ) tri_state (
        .PACKAGE_PIN(d_out),            // the physical pin number with the pullup on it
        .OUTPUT_ENABLE(driver_enable),  // when driver_enable is high, turn on the output
        .D_OUT_0(1'b0)                  // the value to write out the pin when the driver is on
    );

    assign led1 = s1_n;                 // LED will go on when press s1

    assign driver_enable = ~s1_n;       // turn on driver when s1 is low

endmodule

