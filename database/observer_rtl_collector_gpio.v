module collector_gpio
  (input wire i_clk,
   input wire i_rst,
   input wire i_dat,
   input wire i_wb_stb,
   output reg o_wb_rdt,
   output reg o_wb_ack);

   reg 	  dat_r;

   always @(posedge i_clk) begin
      o_wb_ack <= i_wb_stb & !o_wb_ack;
      dat_r <= i_dat;
      o_wb_rdt <= dat_r;
      if (i_rst)
	o_wb_ack <= 1'b0;
   end
endmodule
