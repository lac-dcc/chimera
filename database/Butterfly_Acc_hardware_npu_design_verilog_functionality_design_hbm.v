//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: bu_write_addr_generator
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


module hbm
# (
  parameter AXI_CHANNELS  = 16,
  parameter ADDR_WIDTH   = 33,  // [32] select stack 0, [33] select stack 1
  parameter ID_WIDTH     = 5,
  parameter WEIGHT_AXI_CHNL = 1, // Reuse one output channel 
  parameter INPUT_AXI_CHNL = 8,
  parameter OUTPUT_AXI_CHNL = 8,
  parameter DATA_WIDTH   = 256
)
(
  //////////////////ddr clock/////////////////
  input wire                   sys_clk,
  input wire                   ddr_clk,
  input wire                   rst_n, 
  input  wire  [ADDR_WIDTH-1:0] params,
  //////////////////control and data for input/////////////
  //read
  input  wire                   start_read_input,
  input wire                    start_write_input,
  input wire  [4-1:0]           input_param_id,
  output wire  [INPUT_AXI_CHNL-1:0]          dn_input_vld,
  output wire  [DATA_WIDTH*INPUT_AXI_CHNL-1:0]  dn_input_dat,
  output wire                     is_fft,
  output wire    [32-1:0]         length,
  output wire                     is_bypass_p2s,

  //////////////////control and data for weightput/////////////
  //read
  input  wire                   start_read_weight,
  input wire                    start_write_weight,
  input wire  [4-1:0]           weight_param_id,
  input  wire                   auto_write_weight,
  output wire                   dn_weight_vld,
  output wire  [DATA_WIDTH*WEIGHT_AXI_CHNL-1:0]  dn_weight_dat,

  //////////////////control and data for output/////////////
  //raed is not used for output buffer
  //write
  input wire  [OUTPUT_AXI_CHNL-1:0]                 start_write_output,
  input wire  [3-1:0]           output_param_id,
  // output data from the butterfly engine 
  input wire  [OUTPUT_AXI_CHNL*DATA_WIDTH-1:0]      up_output_dat
);


wire  [32-1:0]         input_read_ops;
wire  [32-1:0]         input_read_stride;
wire  [ADDR_WIDTH-1:0] input_read_init_addr;
wire  [16-1:0]         input_read_mem_burst_size;
wire   [32-1:0]         input_write_ops;
wire   [32-1:0]         input_write_stride;
wire   [ADDR_WIDTH-1:0] input_write_init_addr;
wire   [16-1:0]         input_write_mem_burst_size;

wire  [32-1:0]         weight_read_ops;
wire  [32-1:0]         weight_read_stride;
wire  [ADDR_WIDTH-1:0] weight_read_init_addr;
wire  [16-1:0]         weight_read_mem_burst_size;
wire   [32-1:0]         weight_write_ops;
wire   [32-1:0]         weight_write_stride;
wire   [ADDR_WIDTH-1:0] weight_write_init_addr;
wire   [16-1:0]         weight_write_mem_burst_size;

wire   [32-1:0]         output_write_ops;
wire   [32-1:0]         output_write_stride;
wire   [ADDR_WIDTH-1:0] output_write_init_addr;
wire   [16-1:0]         output_write_mem_burst_size;

hbm_control # (
  .ADDR_WIDTH(ADDR_WIDTH)
) u_hbm_control
(
  //////////////////ddr clock/////////////////
  .clk(ddr_clk),
  .rst_n(rst_n), 
  //////////////////paramters /////////////
  .params(params),
  .input_param_id(input_param_id),
  .weight_param_id(weight_param_id),
  .output_param_id(output_param_id),

  //////////////////control and data for input/////////////
  //read
  .input_read_ops(input_read_ops),
  .input_read_stride(input_read_stride),
  .input_read_init_addr(input_read_init_addr),
  .input_read_mem_burst_size(input_read_mem_burst_size),

  //write
  .input_write_ops(input_write_ops),
  .input_write_stride(input_write_stride),
  .input_write_init_addr(input_write_init_addr),
  .input_write_mem_burst_size(input_write_mem_burst_size),
  .is_fft(is_fft),
  .length(length),
  .is_bypass_p2s(is_bypass_p2s),

  //////////////////control and data for weightput/////////////
  //read
  .weight_read_ops(weight_read_ops),
  .weight_read_stride(weight_read_stride),
  .weight_read_init_addr(weight_read_init_addr),
  .weight_read_mem_burst_size(weight_read_mem_burst_size),

  //write
  .weight_write_ops(weight_write_ops),
  .weight_write_stride(weight_write_stride),
  .weight_write_init_addr(weight_write_init_addr),
  .weight_write_mem_burst_size(weight_write_mem_burst_size),

  //////////////////control and data for output/////////////
  //raed is not used for output buffer
  //write
  .output_write_ops(output_write_ops),
  .output_write_stride(output_write_stride),
  .output_write_init_addr(output_write_init_addr),
  .output_write_mem_burst_size(output_write_mem_burst_size)
);


hbm_top # (
  .AXI_CHANNELS(AXI_CHANNELS),
  .ADDR_WIDTH(ADDR_WIDTH),  // [32] select stack 0, [33] select stack 1
  .ID_WIDTH(ID_WIDTH),
  .WEIGHT_AXI_CHNL(WEIGHT_AXI_CHNL), // Reuse one output channel 
  .INPUT_AXI_CHNL(INPUT_AXI_CHNL),
  .OUTPUT_AXI_CHNL(OUTPUT_AXI_CHNL),
  .DATA_WIDTH(DATA_WIDTH)
) u_hbm_top
(
  //////////////////ddr clock/////////////////
  .ddr_clk(ddr_clk),
  .sys_clk(sys_clk),
  .rst_n(rst_n),
  //////////////////control and data for input/////////////
  //read
  .start_read_input(start_read_input),
  .input_read_ops(input_read_ops),
  .input_read_stride(input_read_stride),
  .input_read_init_addr(input_read_init_addr),
  .input_read_mem_burst_size(input_read_mem_burst_size),
  //write
  .start_write_input(start_write_input),
  .input_write_ops(input_write_ops),
  .input_write_stride(input_write_stride),
  .input_write_init_addr(input_write_init_addr),
  .input_write_mem_burst_size(input_write_mem_burst_size),
  .dn_input_vld(dn_input_vld),
  .dn_input_dat(dn_input_dat),

  //////////////////control and data for weightput/////////////
  //read
  .start_read_weight(start_read_weight),
  .weight_read_ops(weight_read_ops),
  .weight_read_stride(weight_read_stride),
  .weight_read_init_addr(weight_read_init_addr),
  .weight_read_mem_burst_size(weight_read_mem_burst_size),
  //write
  .start_write_weight(start_write_weight),
  .weight_write_ops(weight_write_ops),
  .weight_write_stride(weight_write_stride),
  .weight_write_init_addr(weight_write_init_addr),
  .weight_write_mem_burst_size(weight_write_mem_burst_size),
  .auto_write_weight(auto_write_weight),
  .dn_weight_vld(dn_weight_vld),
  .dn_weight_dat(dn_weight_dat),

  //////////////////control and data for output/////////////
  //raed is not used for output buffer
  //write
  .start_write_output(start_write_output),
  .output_write_ops(output_write_ops),
  .output_write_stride(output_write_stride),
  .output_write_init_addr(output_write_init_addr),
  .output_write_mem_burst_size(output_write_mem_burst_size),
  // output data from the butterfly engine 
  .up_output_dat(up_output_dat)
);

endmodule