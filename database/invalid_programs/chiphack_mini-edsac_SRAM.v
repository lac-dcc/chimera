module Mem (
	input 		  clock, reset,
	input [9:0] 	  addr,
	input [15:0] 	  d,
	input 		  rd,
	input 		  wr,
	output reg [15:0] q,
	output 		  mwait,
	output [18:0] 	  rama, // sram address
	inout [15:0] 	  ramd, // sram data bus
	output reg 	  ramcs, // chip select
	output reg 	  ramoe, // chip output enable
	output reg        ramwe  // chip write enable
);

   reg [2:0] 		  mstate;

   assign mwait = mstate != 2'd0;
   parameter IDLE = 2'd0;
   parameter READ = 2'd1;
   parameter WRITE= 2'd2;
   parameter DELAY= 2'd3;
   parameter pt = 6'b101001;

   wire [15:0] 	  ramrd;
   wire [15:0] 	  ramwr;
   assign rama = addr;

   SB_IO #(
	   .PIN_TYPE(pt),
	   .PULLUP(0),) ts[15:0] (
				  .PACKAGE_PIN(ramd),
				  .OUTPUT_ENABLE(~ramwe),
				  .D_OUT_0(d),
				  .D_IN_0(ramrd)
				  );

   always @ (posedge clock)
      if (reset) begin
	 q <= 16'd0;
	 mstate <= IDLE;
	 ramoe <= 1'b1;
	 ramwe <= 1'b1;
      end
      else begin
	 case (mstate)
	   IDLE:
	     if (rd) begin
		ramcs <= 1'b0;		// select the chip
		ramoe <= 1'b0;
		mstate <= READ;
	     end
	     else if (wr) begin
	       ramcs <= 1'b0;		// select the chip
	       mstate <= WRITE;
	     end
	   READ:
	     begin
		q <= ramrd;
		mstate <= DELAY;
	     end
	   WRITE:
	     begin
		ramwe <= 1'b0;
		mstate <= DELAY;
	     end
	   DELAY:
	     begin
		ramwe <= 1'b1;
		ramoe <= 1'b1;
		ramcs <= 1'b1;		// de-select the chip
		mstate <= IDLE;
	     end
	 endcase // case (mstate)
      end
endmodule
