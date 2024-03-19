/*
 mem = 00
 coll = 01
 timer = 10
 FIFO = 11
 */
module base_mux
  (
   input wire 	      i_clk,
   input wire 	      i_rst,
   input wire [31:0]  i_wb_dbus_adr,
   input wire [31:0]  i_wb_dbus_dat,
   input wire [3:0]   i_wb_dbus_sel,
   input wire 	      i_wb_dbus_we,
   input wire 	      i_wb_dbus_cyc,
   output wire [31:0] o_wb_dbus_rdt,
   output wire 	      o_wb_dbus_ack,
   //RW
   output wire [31:0] o_wb_dmem_adr,
   output wire [31:0] o_wb_dmem_dat,
   output wire [3:0]  o_wb_dmem_sel,
   output wire 	      o_wb_dmem_we,
   output wire 	      o_wb_dmem_cyc,
   input wire [31:0]  i_wb_dmem_rdt,
   //RW
   output wire [31:0] o_wb_coll_adr,
   output wire [31:0] o_wb_coll_dat,
   output wire 	      o_wb_coll_we,
   output wire 	      o_wb_coll_stb,
   input wire [31:0]  i_wb_coll_rdt,
   input wire 	      i_wb_coll_ack,
   //RW
   output wire [31:0] o_wb_timer_dat,
   output wire 	      o_wb_timer_we,
   output wire 	      o_wb_timer_cyc,
   input wire [31:0]  i_wb_timer_rdt,
   //W
   output wire [8:0]  o_wb_fifo_dat,
   output wire 	      o_wb_fifo_we,
   output wire 	      o_wb_fifo_stb,
   input wire 	      i_wb_fifo_ack);

   parameter sim = 0;

   reg 		      ack;

   wire 	  dmem_en  = i_wb_dbus_adr[31:30] == 2'b00;
   wire 	  coll_en  = i_wb_dbus_adr[31:30] == 2'b01;
   wire 	  timer_en = i_wb_dbus_adr[31:30] == 2'b10;
   wire 	  fifo_en  = i_wb_dbus_adr[31:30] == 2'b11;

   assign o_wb_dbus_rdt = coll_en  ? i_wb_coll_rdt :
			  timer_en ? i_wb_timer_rdt :
			  i_wb_dmem_rdt;
   assign o_wb_dbus_ack = coll_en ? i_wb_coll_ack :
			  fifo_en ? i_wb_fifo_ack :
			  ack;

   always @(posedge i_clk) begin
      ack <= 1'b0;
      if (i_wb_dbus_cyc & (dmem_en | timer_en) & !ack)
	ack <= 1'b1;
      if (i_rst)
	ack <= 1'b0;
   end

   assign o_wb_dmem_adr = i_wb_dbus_adr;
   assign o_wb_dmem_dat = i_wb_dbus_dat;
   assign o_wb_dmem_sel = i_wb_dbus_sel;
   assign o_wb_dmem_we  = i_wb_dbus_we;
   assign o_wb_dmem_cyc = i_wb_dbus_cyc & dmem_en;

   assign o_wb_coll_adr = i_wb_dbus_adr;
   assign o_wb_coll_dat = i_wb_dbus_dat;
   assign o_wb_coll_we  = i_wb_dbus_we;
   assign o_wb_coll_stb = i_wb_dbus_cyc & coll_en;

   assign o_wb_timer_dat = i_wb_dbus_dat;
   assign o_wb_timer_we  = i_wb_dbus_we;
   assign o_wb_timer_cyc = i_wb_dbus_cyc & timer_en;

   assign o_wb_fifo_dat = i_wb_dbus_dat[8:0];
   assign o_wb_fifo_we  = i_wb_dbus_we;
   assign o_wb_fifo_stb = i_wb_dbus_cyc & fifo_en;
endmodule
