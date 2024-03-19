module fifo_fwft_adapter
  #(parameter DATA_WIDTH = 0)
   (input 	       clk,
    input 			rst,
    input 			rd_en_i,
    input 			fifo_empty_i,
    output 			fifo_rd_en_o,
    input [DATA_WIDTH-1:0] 	fifo_dout_i,
    output reg [DATA_WIDTH-1:0] dout_o,
    output 			empty_o);
   
   reg 				fifo_valid, middle_valid, dout_valid;
   reg [DATA_WIDTH-1:0] 	middle_dout;
   
   wire 			will_update_middle, will_update_dout;

   assign will_update_middle = fifo_valid && (middle_valid == will_update_dout);
   assign will_update_dout = (middle_valid || fifo_valid) && (rd_en_i || !dout_valid);
   assign fifo_rd_en_o = (!fifo_empty_i) && !(middle_valid && dout_valid && fifo_valid);
   assign empty_o = !dout_valid;

   always @(posedge clk)
      if (rst)
         begin
            fifo_valid <= 0;
            middle_valid <= 0;
            dout_valid <= 0;
            dout_o <= 0;
            middle_dout <= 0;
         end
      else
         begin
            if (will_update_middle)
               middle_dout <= fifo_dout_i;
            
            if (will_update_dout)
               dout_o <= middle_valid ? middle_dout : fifo_dout_i;
            
            if (fifo_rd_en_o)
               fifo_valid <= 1;
            else if (will_update_middle || will_update_dout)
               fifo_valid <= 0;
            
            if (will_update_middle)
               middle_valid <= 1;
            else if (will_update_dout)
               middle_valid <= 0;
            
            if (will_update_dout)
               dout_valid <= 1;
            else if (rd_en_i)
               dout_valid <= 0;
         end 
   
endmodule
