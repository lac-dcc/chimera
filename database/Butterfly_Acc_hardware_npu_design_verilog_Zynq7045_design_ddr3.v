`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: ddr3
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ddr3
# (
  parameter ADDR_WIDTH   = 33,  // [32] select stack 0, [33] select stack 1
  parameter ID_WIDTH     = 5,
  parameter DATA_WIDTH   = 512
)
(
  // DDR3     Inouts
  inout [63:0]                         ddr3_dq,
  inout [7:0]                        ddr3_dqs_n,
  inout [7:0]                        ddr3_dqs_p,

  // DDR3     Outputs
  output [14-1:0]                       ddr3_addr,
  output [2:0]                      ddr3_ba,
  output                                       ddr3_ras_n,
  output                                       ddr3_cas_n,
  output                                       ddr3_we_n,
  output                                       ddr3_reset_n,
  output [0:0]                        ddr3_ck_p,
  output [0:0]                        ddr3_ck_n,
  output [0:0]                       ddr3_cke,

  output [0:0]           ddr3_cs_n,

  output [7:0]                        ddr3_dm,

  output [0:0]                       ddr3_odt,
  output                                       init_calib_complete, // Can be internal
  //////////////////ddr clock/////////////////
  input wire                   sys_clk,
  input wire                   sys_clk_p,
  input wire                   sys_clk_n,
  input wire                   rst_n, 
  input  wire  [ADDR_WIDTH-1:0] params,
  //////////////////control and data for input/////////////
  //read
  input  wire                   start_read_input,
  input wire                    start_write_input,
  input wire  [4-1:0]           input_param_id,
  output wire                      dn_input_vld,
  output wire  [DATA_WIDTH/2-1:0]  dn_input_dat,

  output wire                     is_fft,
  output wire    [32-1:0]         length,
  output wire                     is_bypass_p2s,
  input wire                      is_auto_write,
  //////////////////control and data for weightput/////////////
  //read
  output wire                   dn_weight_vld,
  output wire  [DATA_WIDTH/2-1:0]  dn_weight_dat,

  //////////////////control and data for output/////////////
  //raed is not used for output buffer
  //write
  input wire                   start_write_output,
  input wire  [3-1:0]           output_param_id,
  // output data from the butterfly engine 
  input wire  [DATA_WIDTH-1:0]      up_output_dat
);


wire  [32-1:0]         input_read_ops;
wire  [32-1:0]         input_read_stride;
wire  [ADDR_WIDTH-1:0] input_read_init_addr;
wire  [16-1:0]         input_read_mem_burst_size;

wire   [32-1:0]         output_write_ops;
wire   [32-1:0]         output_write_stride;
wire   [ADDR_WIDTH-1:0] output_write_init_addr;
wire   [16-1:0]         output_write_mem_burst_size;

wire                      dn_read_vld;
wire  [DATA_WIDTH-1:0]  dn_read_dat;

ddr3_control # (
  .ADDR_WIDTH(ADDR_WIDTH)
) u_ddr3_control
(
  //////////////////ddr clock/////////////////
  .clk(sys_clk),
  .rst_n(rst_n), 
  //////////////////paramters /////////////
  .params(params),
  .input_param_id(input_param_id),
  .output_param_id(output_param_id),

  //////////////////control and data for input/////////////
  //read
  .input_read_ops(input_read_ops),
  .input_read_stride(input_read_stride),
  .input_read_init_addr(input_read_init_addr),
  .input_read_mem_burst_size(input_read_mem_burst_size),

  //other signals
  .is_fft(is_fft),
  .length(length),
  .is_bypass_p2s(is_bypass_p2s),

  //////////////////control and data for output/////////////
  //raed is not used for output buffer
  //write
  .output_write_ops(output_write_ops),
  .output_write_stride(output_write_stride),
  .output_write_init_addr(output_write_init_addr),
  .output_write_mem_burst_size(output_write_mem_burst_size)
);


ddr3_top # (
  .ENGINE_ID(0),
  .ADDR_WIDTH(ADDR_WIDTH),  // [32] select stack 0, [33] select stack 1
  .DATA_WIDTH(DATA_WIDTH),
  .ID_WIDTH(ID_WIDTH)
) u_ddr3_top
(
  // DDR3     Inouts
  .ddr3_dq(ddr3_dq),
  .ddr3_dqs_n(ddr3_dqs_n),
  .ddr3_dqs_p(ddr3_dqs_p),

  // DDR3     Outputs
  .ddr3_addr(ddr3_addr),
  .ddr3_ba(ddr3_ba),
  .ddr3_ras_n(ddr3_ras_n),
  .ddr3_cas_n(ddr3_cas_n),
  .ddr3_we_n(ddr3_we_n),
  .ddr3_reset_n(ddr3_reset_n),
  .ddr3_ck_p(ddr3_ck_p),
  .ddr3_ck_n(ddr3_ck_n),
  .ddr3_cke(ddr3_cke),
    
  .ddr3_cs_n(ddr3_cs_n),
    
  .ddr3_dm(ddr3_dm),
    
  .ddr3_odt(ddr3_odt),
  .init_calib_complete(init_calib_complete), // Can be internal

  //////////////////control and data for input & weight/////////////
  //read
  .start_read(start_read_input),
  .read_ops(input_read_ops),
  .read_stride(input_read_stride),
  .read_init_addr(input_read_init_addr),
  .read_mem_burst_size(input_read_mem_burst_size),
  // output data from the butterfly engine 
  .up_dat(up_output_dat),
  .dn_vld(dn_read_vld),
  .dn_dat(dn_read_dat),

  //////////////////control and data for output/////////////
  //write
  .start_write(start_write_output),
  .write_ops(output_write_ops),
  .write_stride(output_write_stride),
  .write_init_addr(output_write_init_addr),
  .write_mem_burst_size(output_write_mem_burst_size),
  .is_auto_write(is_auto_write),

  //////////////////ddr clock/////////////////
  .sys_clk_p(sys_clk_p),
  .sys_clk_n(sys_clk_n),
  .sys_rst(rst_n)
);

assign dn_input_vld = dn_read_vld;
assign dn_weight_vld = dn_read_vld;

assign dn_input_dat = dn_read_dat[DATA_WIDTH/2-1 :0];
assign dn_weight_dat = dn_read_dat[DATA_WIDTH-1 : DATA_WIDTH/2];

endmodule
