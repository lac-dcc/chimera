// This program was cloned from: https://github.com/olofk/subservient
// License: Apache License 2.0

/*
 * uart_decoder.v : UART decoder for the subservient SoC
 *
 * SPDX-FileCopyrightText: 2021 Olof Kindgren <olof.kindgren@gmail.com>
 * SPDX-License-Identifier: Apache-2.0
 */
module uart_decoder
  (input wire [31:0] baud_rate,
   input wire 	     rx);

   integer i;
   reg [7:0] ch;

   real t;

   initial begin

      @(posedge rx);
      t = 1000000000/baud_rate;

      forever begin
	 @(negedge rx);
	 #(t/2) ch = 0;
	 for (i=0;i<8;i=i+1)
	   #t ch[i] = rx;
	 $write("%c",ch);
	 $fflush;
      end
   end
endmodule
