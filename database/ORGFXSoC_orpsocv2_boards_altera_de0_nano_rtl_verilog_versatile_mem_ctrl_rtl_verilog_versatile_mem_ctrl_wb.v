`timescale 1ns/1ns
module versatile_mem_ctrl_wb 
  (
   // wishbone side
   wb_adr_i_v, wb_dat_i_v, wb_dat_o_v,
   wb_stb_i, wb_cyc_i, wb_ack_o,
   wb_clk, wb_rst,
    // SDRAM controller interface
   sdram_dat_o, sdram_fifo_empty, sdram_fifo_rd_adr, sdram_fifo_rd_data, sdram_fifo_re,
   sdram_dat_i, sdram_fifo_wr, sdram_fifo_we, sdram_burst_reading,
   debug_wb_fsm_state, debug_ingress_fifo_empty, debug_egress_fifo_empty,
   sdram_clk, sdram_rst

);

parameter nr_of_wb_ports = 3;
    
input  [36*nr_of_wb_ports-1:0]  wb_adr_i_v;
input  [36*nr_of_wb_ports-1:0]  wb_dat_i_v;
input  [0:nr_of_wb_ports-1]     wb_stb_i;
input  [0:nr_of_wb_ports-1]     wb_cyc_i;
output [32*nr_of_wb_ports-1:0]  wb_dat_o_v;
output [0:nr_of_wb_ports-1]     wb_ack_o;
input                           wb_clk;
input                           wb_rst;

output [35:0]               sdram_dat_o;
output [0:nr_of_wb_ports-1] sdram_fifo_empty;
input                       sdram_fifo_rd_adr, sdram_fifo_rd_data;
input  [0:nr_of_wb_ports-1] sdram_fifo_re;
input  [31:0]               sdram_dat_i;
input                       sdram_fifo_wr;
input  [0:nr_of_wb_ports-1] sdram_fifo_we;
input   		    sdram_burst_reading;
input                       sdram_clk;
input                       sdram_rst;

   output [(2*nr_of_wb_ports)-1:0] debug_wb_fsm_state;
   output [nr_of_wb_ports-1:0] 	debug_ingress_fifo_empty;
   output [nr_of_wb_ports-1:0] 	debug_egress_fifo_empty;
   
   

parameter linear       = 2'b00;
parameter wrap4        = 2'b01;
parameter wrap8        = 2'b10;
parameter wrap16       = 2'b11;
parameter classic      = 3'b000;
parameter endofburst   = 3'b111;

`define CTI_I 2:0
`define BTE_I 4:3
`define WE_I  5

parameter idle = 2'b00;
parameter rd   = 2'b01;
parameter wr   = 2'b10;
parameter fe   = 2'b11;

reg [1:0] wb_state[0:nr_of_wb_ports-1];

wire [35:0] wb_adr_i[0:nr_of_wb_ports-1];
wire [35:0] wb_dat_i[0:nr_of_wb_ports-1];
wire [36*nr_of_wb_ports-1:0] egress_fifo_di;
wire [31:0] wb_dat_o;

wire [0:nr_of_wb_ports] stall;
wire [0:nr_of_wb_ports-1] state_idle;
wire [0:nr_of_wb_ports-1] egress_fifo_we,  egress_fifo_full;
wire [0:nr_of_wb_ports-1] ingress_fifo_re, ingress_fifo_empty;

   wire [1:0] 		  debug_each_wb_fsm_state [0:nr_of_wb_ports-1];
   

genvar i;

assign stall[0] = 1'b0;

`define INDEX (nr_of_wb_ports-i)*36-1:(nr_of_wb_ports-1-i)*36 
generate
    for (i=0;i<nr_of_wb_ports;i=i+1) begin : vector2array
        assign wb_adr_i[i] = wb_adr_i_v[`INDEX];
        assign wb_dat_i[i] = wb_dat_i_v[`INDEX];
        assign egress_fifo_di[`INDEX] = (state_idle[i]) ? 
					wb_adr_i[i] : wb_dat_i[i];

    end
endgenerate

   // Debug output assignments
   generate
      for (i=0;i<nr_of_wb_ports;i=i+1) begin : vector2debugarray
	 assign debug_wb_fsm_state[(nr_of_wb_ports-i)*2-1:(nr_of_wb_ports-1-i)*2] = debug_each_wb_fsm_state[i];
      end
   endgenerate
   assign debug_ingress_fifo_empty = ingress_fifo_empty;
   assign debug_egress_fifo_empty = egress_fifo_we;
   
	
generate
    for (i=0;i<nr_of_wb_ports;i=i+1) begin : fsm
        fsm_wb fsm_wb_i 
	  (
           .stall_i(stall[i]),
           .stall_o(stall[i+1]),
           .we_i (wb_adr_i[i][`WE_I]),
           .cti_i(wb_adr_i[i][`CTI_I]),
           .bte_i(wb_adr_i[i][`BTE_I]),
           .stb_i(wb_stb_i[i]),
           .cyc_i(wb_cyc_i[i]),
           .ack_o(wb_ack_o[i]),
           .egress_fifo_we(egress_fifo_we[i]),
           .egress_fifo_full(egress_fifo_full[i]),
            .ingress_fifo_re(ingress_fifo_re[i]),
           .ingress_fifo_empty(ingress_fifo_empty[i]),
           .state_idle(state_idle[i]),
	   .sdram_burst_reading(sdram_burst_reading),
	   .debug_state(debug_each_wb_fsm_state[i]),
           .wb_clk(wb_clk),
           .wb_rst(wb_rst)
           );
    end
endgenerate

egress_fifo # (
	       .a_hi_size(4),.a_lo_size(4),.nr_of_queues(nr_of_wb_ports),
	       .data_width(36))
   egress_FIFO(
	       .d(egress_fifo_di), 
	       .fifo_full(egress_fifo_full), 
	       .write(|(egress_fifo_we)), 
	       .write_enable(egress_fifo_we),
	       .q(sdram_dat_o), 
	       .fifo_empty(sdram_fifo_empty), 
	       .read_adr(sdram_fifo_rd_adr), 
	       .read_data(sdram_fifo_rd_data), 
	       .read_enable(sdram_fifo_re),
	       .clk1(wb_clk), 
	       .rst1(wb_rst), 
	       .clk2(sdram_clk), 
	       .rst2(sdram_rst)
	       );
   
   async_fifo_mq # (
		    .a_hi_size(4),.a_lo_size(4),.nr_of_queues(nr_of_wb_ports),
		    .data_width(32))
   ingress_FIFO(
		.d(sdram_dat_i), .fifo_full(), .write(sdram_fifo_wr), 
		.write_enable(sdram_fifo_we), .q(wb_dat_o), 
		.fifo_empty(ingress_fifo_empty), .read(|(ingress_fifo_re)), 
		.read_enable(ingress_fifo_re), .clk1(sdram_clk), 
		.rst1(sdram_rst), .clk2(wb_clk), .rst2(wb_rst)
		);

assign wb_dat_o_v = {nr_of_wb_ports{wb_dat_o}};

endmodule