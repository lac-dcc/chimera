module Mem (
	input clock, reset,
	input [9:0] addr,
	input [15:0] d,
	input rd,
	input wr,
	output reg [15:0] q,
	output mwait
);

	reg [15:0] m[0:1023];
	reg [2:0] mstate;
        reg [9:0] a;

	assign mwait = mstate != 2'd0;
        parameter IDLE = 2'd0;
        parameter READ = 2'd1;
        parameter WRITE= 2'd2;
        parameter DELAY= 2'd3;
   
   always @ (posedge clock)
      if (reset) begin
	 q <= 16'd0;
	 mstate <= IDLE;
      end
      else begin
	 case (mstate)
	   IDLE:
	     if (rd)
	       mstate <= READ;
	     else if (wr)
	       mstate <= WRITE;
	   READ:
	     begin
		q <= m[addr];
		mstate <= DELAY;
	     end
	   WRITE:
	     begin
		m[addr] <= d;
		mstate <= DELAY;
	     end
	   DELAY:
	     mstate <= IDLE;
	 endcase // case (mstate)
      end
endmodule
