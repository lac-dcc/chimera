module dummyprint1
  (input wire 	     i_clk,
   input wire 	     i_rst,
   output wire [7:0] o_tdata,
   output wire 	     o_tlast,
   output wire 	     o_tvalid,
   input wire 	     i_tready);

   parameter memfile = "dummyprint1.hex";

   base #(.memfile (memfile)) base
     (.i_clk    (i_clk),
      .i_rst    (i_rst),
      .o_wb_coll_adr (),
      .o_wb_coll_dat (),
      .o_wb_coll_we  (),
      .o_wb_coll_stb (),
      .i_wb_coll_rdt (32'd0),
      .i_wb_coll_ack (1'b0),
      .o_tdata  (o_tdata),
      .o_tlast  (o_tlast),
      .o_tvalid (o_tvalid),
      .i_tready (i_tready));

endmodule
