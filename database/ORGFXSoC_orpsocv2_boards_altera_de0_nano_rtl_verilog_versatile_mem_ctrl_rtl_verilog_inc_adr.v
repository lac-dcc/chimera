module inc_adr
  (
   input  [3:0] adr_i,
   input  [2:0] cti_i,
   input  [1:0] bte_i,
   input  init,
   input  inc,
   output reg [3:0] adr_o,
   output reg done,
   input clk,
   input rst
   );

   reg 	 init_i;
   
   reg [1:0] bte;
   reg [3:0] cnt;

   // delay init one clock cycle to be able to read from mem
   always @ (posedge clk or posedge rst)
     if (rst)
       init_i <= 1'b0;
     else
       init_i <= init;
   
   // bte
   always @ (posedge clk or posedge rst)
     if (rst)
       bte <= 2'b00;
     else
       if (init_i)
	 bte <= bte_i;

   // adr_o
   always @ (posedge clk or posedge rst)
     if (rst)
       adr_o <= 4'd0;
     else
       if (init_i)
	 adr_o <= adr_i;
       else
	 if (inc)
	   case (bte)
	     2'b01: adr_o <= {adr_o[3:2], adr_o[1:0] + 2'd1};
	     2'b10: adr_o <= {adr_o[3], adr_o[2:0] + 3'd1};
	     default: adr_o <= adr_o + 4'd1;
	   endcase // case (bte)
   
   // done
   always @ (posedge clk or posedge rst)
     if (rst)
       {done,cnt} <= {1'b0,4'd0};
     else
       if (init_i)
	 begin
	    done <= ({bte_i,cti_i} == {2'b00,3'b000});
	    case (bte_i)
	      2'b01: cnt <= 4'd12;
	      2'b10: cnt <= 4'd8;
	      2'b11: cnt <= 4'd0;
	      default: cnt <= adr_i;
	    endcase
	 end
       else
	 if (inc)
	   {done,cnt} <= cnt + 4'd1;

endmodule // inc_adr

   
