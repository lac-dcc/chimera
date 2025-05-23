// This program was cloned from: https://github.com/Mazamars312/Analogue-Amiga
// License: GNU General Public License v3.0

// MIT License

// Copyright (c) 2022 Eric Lewis

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
////////////////////////////////////////////////////////////////////////////////

// Module for Developer Debug Key provided by Analogue.
//
// The LED uses the equivalent of the GBA /RD pin as an output
// The button uses the equivalent of the AD0 pin as an input.
// Both are not really implementation details you need to worry about.
//
// Note: you will need to enable the cart power in your core.json for this to work.
//
module debug_key(
    output  wire       cart_tran_bank0_dir,
    inout   wire [7:4] cart_tran_bank0,
    output  wire       cart_tran_bank3_dir,
    inout   wire [7:0] cart_tran_bank3,
    output  wire       cart_tran_pin31_dir,
    inout   wire       cart_tran_pin31,
    input   wire       led,
    output  wire       button,
    input   wire       uart_tx,
    output  wire       uart_rx
);

// Enable bus output.
// Note: UART uses this bank.
assign cart_tran_bank0_dir = 1'b1;

// Enable bus input.
assign cart_tran_bank3_dir = 1'b0;
assign cart_tran_pin31_dir = 1'b0;

// Pin 4 is LED.
assign cart_tran_bank0[5]  = led;

// Pin 6 is button, we invert since button is always high.
assign button              = ~cart_tran_bank3[0];

// Pin 3 is UART output
assign cart_tran_bank0[6]  = uart_tx;

// Pin 31 is UART input
assign cart_tran_pin31     = uart_rx;

endmodule