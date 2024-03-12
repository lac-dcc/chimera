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
  parameter INPUT_AXI_CHNL = 1,
  parameter OUTPUT_AXI_CHNL = 8,
  parameter DATA_WIDTH_AXI   = 512,
  // Engine Spec
  parameter data_width=16,
  parameter be_parallelism = 24,
  parameter act_be_parallelism = 20,
  parameter bu_parallelism = 4,
  parameter parallelism_per_control = 4,
  parameter latency_add=1,
  parameter latency_mul=2
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
  // input wire                   ddr0_clk,
  input wire                   sys_clk_p,
  input wire                   sys_clk_n,
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
  input  wire                   is_auto_write,

  //////////////////control and data for output/////////////
  //raed is not used for output buffer
  //write
  input wire  [3-1:0]           output_param_id
);

genvar i;
// =========================================================================== //
// Instantiate DDR
// =========================================================================== //

wire                   weight_vld;
wire  [DATA_WIDTH_AXI/2-1:0]  weight_dat;

wire                          input_vld;
wire  [DATA_WIDTH_AXI/2-1:0]  input_dat;

wire                     is_fft;
wire    [data_width-1:0]         length;
wire                     is_bypass_p2s;
wire                            start_write_output;
wire  [DATA_WIDTH_AXI-1:0]      output_dat;

wire                            start_write_output_timing;
wire  [DATA_WIDTH_AXI-1:0]      output_dat_timing;

ddr3 # (
  .ADDR_WIDTH(ADDR_WIDTH),  // [32] select stack 0, [33] select stack 1
  .ID_WIDTH(ID_WIDTH),
  .DATA_WIDTH(DATA_WIDTH_AXI)
) u_ddr3_0
(
  // DDR3 Interface
  .ddr3_dq              (ddr3_dq),
  .ddr3_dqs_n           (ddr3_dqs_n),
  .ddr3_dqs_p           (ddr3_dqs_p),
  .ddr3_addr            (ddr3_addr),
  .ddr3_ba              (ddr3_ba),
  .ddr3_ras_n           (ddr3_ras_n),
  .ddr3_cas_n           (ddr3_cas_n),
  .ddr3_we_n            (ddr3_we_n),
  .ddr3_reset_n         (ddr3_reset_n),
  .ddr3_ck_p            (ddr3_ck_p),
  .ddr3_ck_n            (ddr3_ck_n),
  .ddr3_cke             (ddr3_cke),
  .ddr3_cs_n            (ddr3_cs_n),
  .ddr3_dm              (ddr3_dm),
  .ddr3_odt             (ddr3_odt),
  .init_calib_complete (init_calib_complete),
  //////////////////ddr clock/////////////////
  .sys_clk(sys_clk),
  //.ddr_clk(ddr0_clk),
  .sys_clk_p(sys_clk_p),
  .sys_clk_n(sys_clk_n),
  .rst_n(rst_n), 
  .params(params),
  //////////////////control and data for input/////////////
  //read
  .start_read_input(start_read_input),
  .start_write_input(start_write_input),
  .input_param_id(input_param_id),
  .dn_input_vld(input_vld),
  .dn_input_dat(input_dat),
  .dn_weight_vld(weight_vld),
  .dn_weight_dat(weight_dat),

  .is_fft(is_fft),
  .length(length),
  .is_bypass_p2s(is_bypass_p2s),
  .is_auto_write(is_auto_write),


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
wire [(2*data_width)*be_parallelism-1:0]  input_dat_pad;
wire [be_parallelism/parallelism_per_control-1:0]                   input_vld_pad;


data_pack # (
  .be_parallelism(be_parallelism),
  .parallelism_per_control(parallelism_per_control),
  .data_width(data_width),
  .BAND_WIDTH(DATA_WIDTH_AXI/2)
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
  .be_parallelism(act_be_parallelism),
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


assign start_write_output = dn_serial_vld_A[0] | dn_serial_vld_B[0];
assign output_dat = dn_serial_vld_A[0] ? dn_serial_dat_A : dn_serial_dat_B;

/*
generate
for(i=0 ; i<OUTPUT_AXI_CHNL ; i=i+1)
begin : ASSIGN_DDR_WRITE
    assign output_dat[(DATA_WIDTH_AXI*i + DATA_WIDTH_AXI-1) : (DATA_WIDTH_AXI*i)] = dn_serial_vld_A[i] ? dn_serial_dat_A[(DATA_WIDTH_AXI*i + DATA_WIDTH_AXI-1) : (DATA_WIDTH_AXI*i)] : dn_serial_dat_B[(DATA_WIDTH_AXI*i + DATA_WIDTH_AXI-1) : (DATA_WIDTH_AXI*i)]; // Needs to improve 
end
endgenerate
*/


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