module memory(input clock,
	      input reset,
	      input [9:0]  Memadr,
	      input [15:0] memdata_w,
	      input        memrd,
	      input        memwrt,
	      output reg        membusy,
	      output reg [15:0] memdata_r
	      );

// state definitions for memory access
   parameter M_IDLE	    = 2'd0;
   parameter M_READING  = 2'd1;
   parameter M_WRITING  = 2'd2;
   parameter M_DONE     = 2'd3;
   reg [1:0] m_state;
   reg [15:0] Mem[0:511];

   always @(posedge clock)
     if (reset) begin
		m_state <= M_IDLE;
		membusy <= 1'b0;
     end
     else begin
	case (m_state)
	  M_IDLE:
	    if (memrd) begin
	       m_state <= M_READING;
	       memdata_r <= Mem[Memadr];
	       membusy <= 1'b1;
	    end
	    else if (memwrt) begin
	       m_state <= M_WRITING;
	       Mem[Memadr] <= memdata_w;
	       membusy <= 1'b1;
	    end
	  M_READING:
	    if (~memrd)
	      m_state <= M_DONE;
	  M_WRITING:
	    if (~memwrt)
	      m_state <= M_DONE;
	  M_DONE:
	    begin
               membusy <= 1'b0;
	       m_state <= M_IDLE;
	    end
	endcase
     end // else: !if(reset)
   // end always @ (posedge clock)

endmodule // memory
