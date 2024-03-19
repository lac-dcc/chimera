/* "a b c d e f g h"
    *   --a--
 *  *  |     |
 *  *  f     b
 *  *  |     |
 *  *   --g--
 *  *  |     |
 *  *  e     c
 *  *  |     |
 *  *   --d--
 *  */

module nibble (
	       input wire [3:0] number,
	       output reg [7:0] segment
	       );
   always @(number)
     case(number)
       4'h0: segment <= 8'b11000000;
       4'h1: segment <= 8'b11111001;
       4'h2: segment <= 8'b10100100;
       4'h3: segment <= 8'b10110000;
       4'h4: segment <= 8'b10011001;
       4'h5: segment <= 8'b10010010;
       4'h6: segment <= 8'b10000010;
       4'h7: segment <= 8'b11111000;
       4'h8: segment <= 8'b10000000;
       4'h9: segment <= 8'b10010000;
       4'ha: segment <= 8'b10001000;
       4'hb: segment <= 8'b10000011;
       4'hc: segment <= 8'b11000110;
       4'hd: segment <= 8'b10100001;
       4'he: segment <= 8'b10000110;
       4'hf: segment <= 8'b10001110;
       default: segment <= 8'bx;
     endcase // case (number)
endmodule // nibble

module display (
		input wire clk,
		input wire [31:0] num,

		output reg[7:0] seg,
		output reg[3:0] an
		);


   reg [15:0] 			count = 0;

   wire [1:0] 			n;


   assign n = count[15:14];


   always @(posedge clk) begin
      count = count + 1'b1;

      case(n)
	0: seg <= num[31:24];
	1: seg <= num[23:16];
	2: seg <= num[15:8];
	3: seg <= num[7:0];

      endcase // case (n)
      case(n)
	0: an <= 4'b1110;
	1: an <= 4'b1101;
	2: an <= 4'b1011;
	3: an <= 4'b0111;

      endcase // case (n)
   end // always @ (posedge clk)

endmodule // display

module nexys7seg_wb (input rst_i,
		     input 	  clk_i,
		     input [15:0] wb_dat_i,
		     input [1:0]  wb_sel_i,
		     input 	  wb_we_i,
		     input 	  wb_cyc_i,
		     input 	  wb_stb_i,
		     output 	  wb_ack_o,
		     input clk_100mhz_i,
		     output [7:0] seg,
		     output [3:0] an);

   reg [15:0] 			  value = 15'h00;

   reg 				  ack = 1'b0;
   assign wb_ack_o = ack;
   
   always @(posedge clk_i)
     begin
	value <= (wb_we_i & wb_stb_i & wb_cyc_i) ? wb_dat_i[15:0] : value;
	ack <= wb_stb_i & wb_cyc_i;
     end
   
   nexys7seg display (.clk (clk_100mhz_i),
		      .word (value),
		      .seg (seg),
		      .an (an));

endmodule // nexys7seg_wb


module nexys7seg (
		   input wire clk,
		   input wire [15:0] word,
		   output wire [7:0] seg,
		   output wire [3:0] an
		   );
   wire [31:0] 			     num;

   nibble conv1(.number(word[15:12]), .segment(num[7:0]));
   nibble conv2(.number(word[11:8]),  .segment(num[15:8]));
   nibble conv3(.number(word[7:4]),   .segment(num[23:16]));
   nibble conv4(.number(word[3:0]),   .segment(num[31:24]));
   display display(.clk(clk), .num(num), .seg(seg), .an(an));

endmodule // hexdisplay
