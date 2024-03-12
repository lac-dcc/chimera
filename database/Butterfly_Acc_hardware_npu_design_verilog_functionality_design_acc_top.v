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


module bfly_acc_top
# (
  // AXI Spec
  parameter AXI_CHANNELS  = 16,
  parameter ADDR_WIDTH   = 33,  // [32] select stack 0, [33] select stack 1
  parameter ID_WIDTH     = 5,
  parameter WEIGHT_AXI_CHNL = 1, // Reuse one output channel 
  parameter INPUT_AXI_CHNL = 8,
  parameter OUTPUT_AXI_CHNL = 8,
  parameter DATA_WIDTH_AXI   = 256,
  // Engine Spec
  parameter data_width=16,
  parameter be_parallelism = 128,
  parameter bu_parallelism = 4,
  parameter parallelism_per_control = 4,
  parameter latency_add=1,
  parameter latency_mul=2
)
(
  //////////////////ddr clock/////////////////
  input wire                   sys_clk,
  input wire                   ddr0_clk,
  input wire                   rst_n,  
  input  wire  [ADDR_WIDTH-1:0] params,
  //////////////////control and data for input/////////////
  //read
  input  wire                   start_read_input,
  input wire                    start_write_input,
  input wire  [4-1:0]           input_param_id,

  //////////////////control and data for weightput/////////////
  //read
  input  wire                   start_read_weight,
  input wire                    start_write_weight,
  input wire  [4-1:0]           weight_param_id,
  input  wire                   auto_write_weight,

  //////////////////control and data for output/////////////
  //raed is not used for output buffer
  //write
  input wire  [3-1:0]           output_param_id
);

genvar i;
// =========================================================================== //
// Instantiate HBM
// =========================================================================== //

wire                   weight_vld;
wire  [DATA_WIDTH_AXI*WEIGHT_AXI_CHNL-1:0]  weight_dat;

wire  [INPUT_AXI_CHNL-1:0]    input_vld;
wire  [DATA_WIDTH_AXI*INPUT_AXI_CHNL-1:0]  input_dat;

wire                     is_fft;
wire    [32-1:0]         length;
wire                     is_bypass_p2s;
wire  [OUTPUT_AXI_CHNL-1:0]                  start_write_output;
wire  [OUTPUT_AXI_CHNL*DATA_WIDTH_AXI-1:0]      output_dat;

wire  [OUTPUT_AXI_CHNL-1:0]                  start_write_output_timing;
wire  [OUTPUT_AXI_CHNL*DATA_WIDTH_AXI-1:0]      output_dat_timing;

hbm # (
  .AXI_CHANNELS(AXI_CHANNELS),
  .ADDR_WIDTH(ADDR_WIDTH),  // [32] select stack 0, [33] select stack 1
  .ID_WIDTH(ID_WIDTH),
  .WEIGHT_AXI_CHNL(WEIGHT_AXI_CHNL), // Reuse one output channel 
  .INPUT_AXI_CHNL(INPUT_AXI_CHNL),
  .OUTPUT_AXI_CHNL(OUTPUT_AXI_CHNL),
  .DATA_WIDTH(DATA_WIDTH_AXI)
) u_hbm_0
(
  //////////////////ddr clock/////////////////
  .sys_clk(sys_clk),
  .ddr_clk(ddr0_clk),
  .rst_n(rst_n), 
  .params(params),
  //////////////////control and data for input/////////////
  //read
  .start_read_input(start_read_input),
  .start_write_input(start_write_input),
  .input_param_id(input_param_id),
  .dn_input_vld(input_vld),
  .dn_input_dat(input_dat),
  .is_fft(is_fft),
  .length(length),
  .is_bypass_p2s(is_bypass_p2s),

  //////////////////control and data for weightput/////////////
  //read
  .start_read_weight(start_read_weight),
  .start_write_weight(start_write_weight),
  .weight_param_id(weight_param_id),
  .auto_write_weight(auto_write_weight),
  .dn_weight_vld(weight_vld),
  .dn_weight_dat(weight_dat),

  //////////////////control and data for output/////////////
  //raed is not used for output buffer
  //write
  .start_write_output(start_write_output),
  .output_param_id(output_param_id),
  // output data from the butterfly engine 
  .up_output_dat(output_dat)
);


// =========================================================================== //
// Instantiate Input Data Pack
// =========================================================================== //
wire [2*DATA_WIDTH_AXI*INPUT_AXI_CHNL-1:0]  input_dat_pad;
wire [INPUT_AXI_CHNL-1:0]                   input_vld_pad;

data_pack # (
  .INPUT_AXI_CHNL(INPUT_AXI_CHNL),
  .vld_parallelism(be_parallelism/parallelism_per_control),
  .DATA_WIDTH(DATA_WIDTH_AXI)
) u_data_pack
(
  //////////////////clock & control signals/////////////////
  .clk(sys_clk),
  .rst_n(rst_n), 
  .is_pad(is_fft), // need to improve

  //////////////////Up data and signals/////////////
  .up_dat(input_dat),
  .up_vld(input_vld),
  .up_rdy(),

  //////////////////Up data and signals/////////////
  .dn_dat(input_dat_pad), // assume ddr bandwidht is 256*8, input buffer bandwidth is 128*32
  .dn_vld(input_vld_pad),
  .dn_rdy(1'b1)
);

// =========================================================================== //
// Instantiate Butterfly Process
// =========================================================================== //

wire  [OUTPUT_AXI_CHNL-1:0]                     dn_serial_vld_A; 
wire  [data_width*be_parallelism-1:0]      dn_serial_dat_A; // real
wire  [OUTPUT_AXI_CHNL-1:0]                      dn_serial_vld_B; 
wire  [data_width*be_parallelism-1:0]      dn_serial_dat_B; // complex

butterfly_processor # (
  // AXI Spec
  .DATA_WIDTH_AXI(DATA_WIDTH_AXI),
  .WEIGHT_AXI_CHNL(WEIGHT_AXI_CHNL),
  .INPUT_AXI_CHNL(INPUT_AXI_CHNL),
  .OUTPUT_AXI_CHNL(OUTPUT_AXI_CHNL),
  // The data width of input data
  .data_width(data_width),
  .parallelism_per_control(parallelism_per_control),
  //.be_parallelism(be_parallelism),
  .be_parallelism(40),
  .bu_parallelism(bu_parallelism),
  .latency_add(latency_add),
  .latency_mul(latency_mul)
) u_bp
(
  .clk(sys_clk),
  //.ddr_clk(ddr0_clk),
  .rst_n(rst_n),
  .is_fft(is_fft), 
  //===================weight data=======================//
  .up_weight_dat(weight_dat),
  .up_weight_vld(weight_vld),
  //=================control signal=====================//
  .length(length),
  .is_bypass_p2s(is_bypass_p2s),
  //=================input and output=====================//
  // Receive input one by one 
  .up_vld(input_vld_pad),
  .up_dat(input_dat_pad), // real + complex
  .up_rdy(),

  // Port A
  // down stream data output for FFT
  .dn_serial_vld_A(dn_serial_vld_A), 
  .dn_serial_dat_A(dn_serial_dat_A), // real
  .dn_serial_rdy_A(1'b1),
  
  // output wire                        dn_parallel_vld_A, 
  // output wire  [(2*bu_parallelism)*data_width*be_parallelism-1:0]      dn_parallel_dat_A, // real
  .dn_parallel_vld_A(),
  .dn_parallel_dat_A(),
  .dn_parallel_rdy_A(1'b1),

  // Port B
  // down stream data output for FFT
  .dn_serial_vld_B(dn_serial_vld_B), 
  .dn_serial_dat_B(dn_serial_dat_B), // complex
  .dn_serial_rdy_B(1'b1),
  
  // output wire                        dn_parallel_vld_B, 
  // output wire  [(2*bu_parallelism)*data_width*be_parallelism-1:0]      dn_parallel_dat_B, // complex
  .dn_parallel_vld_B(),
  .dn_parallel_dat_B(),
  .dn_parallel_rdy_B(1'b1)
);

generate
for(i=0 ; i<OUTPUT_AXI_CHNL ; i=i+1)
begin : ASSIGN_HBM_WRITE
    assign start_write_output[i] = dn_serial_vld_A[i] | dn_serial_vld_B[i];
    assign output_dat[(DATA_WIDTH_AXI*i + DATA_WIDTH_AXI-1) : (DATA_WIDTH_AXI*i)] = dn_serial_vld_A[i] ? dn_serial_dat_A[(DATA_WIDTH_AXI*i + DATA_WIDTH_AXI-1) : (DATA_WIDTH_AXI*i)] : dn_serial_dat_B[(DATA_WIDTH_AXI*i + DATA_WIDTH_AXI-1) : (DATA_WIDTH_AXI*i)]; // Needs to improve 
end
endgenerate



//////////////////Timing////////////////////////
/*
reg_timing # (
  .w(OUTPUT_AXI_CHNL*DATA_WIDTH_AXI)
) u_reg_timing
(
  .clk(sys_clk),
  .rst_n(rst_n),
  .up_vld(start_write_output),
  .up_dat(output_dat),
  .up_rdy(),
  .dn_vld(start_write_output_timing),
  .dn_dat(output_dat_timing),
  .dn_rdy(1'b1)
); 
*/

endmodule