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

module butterfly_processor
# (
  // AXI Spec
  parameter DATA_WIDTH_AXI = 256,
  parameter WEIGHT_AXI_CHNL = 1,
  parameter INPUT_AXI_CHNL = 8,
  parameter OUTPUT_AXI_CHNL = 8,
  // The data width of input data
  parameter data_width=16,
  parameter be_parallelism = 128,
  parameter parallelism_per_control = 4,
  parameter bu_parallelism = 4,
  parameter num_wbuf = 1,
  parameter latency_add=1,
  parameter latency_mul=2
)
(
  input  wire                        clk,
  input  wire                        rst_n,
  input  wire                        is_fft, 
  //===================weight data=======================//
  input wire  [DATA_WIDTH_AXI*WEIGHT_AXI_CHNL-1:0]  up_weight_dat,
  input wire                                        up_weight_vld,
  //=================control signal=====================//
  input  wire  [16-1:0]              length,
  input  wire                        is_bypass_p2s,
  //=================input and output=====================//
  // Receive input one by one 
  input wire  [be_parallelism/parallelism_per_control-1:0]      up_vld,
  input wire  [(2*data_width)*be_parallelism-1:0]      up_dat, // real + complex
  output  wire                        up_rdy,

  // Port A
  // down stream data output for FFT
  output wire  [OUTPUT_AXI_CHNL-1:0]                dn_serial_vld_A, 
  output wire  [data_width*be_parallelism-1:0]      dn_serial_dat_A, // real
  input wire                         dn_serial_rdy_A,
  
  output wire  [OUTPUT_AXI_CHNL-1:0]                       dn_parallel_vld_A, 
  output wire  [(2*bu_parallelism)*data_width*be_parallelism-1:0]      dn_parallel_dat_A, // real
  input wire                         dn_parallel_rdy_A,

  // Port B
  // down stream data output for FFT
  output wire  [OUTPUT_AXI_CHNL-1:0]                dn_serial_vld_B, 
  output wire  [data_width*be_parallelism-1:0]      dn_serial_dat_B, // complex
  input wire                         dn_serial_rdy_B,
  
  output wire  [OUTPUT_AXI_CHNL-1:0]                 dn_parallel_vld_B, 
  output wire  [(2*bu_parallelism)*data_width*be_parallelism-1:0]      dn_parallel_dat_B, // complex
  input wire                         dn_parallel_rdy_B
);

genvar i;

wire  [be_parallelism-1:0]                 dn_serial_vlds_A; 
wire  [data_width*parallelism_per_control-1:0]      dn_serial_dats_A[be_parallelism/parallelism_per_control-1:0]; // real
wire                         dn_serial_rdys_A[be_parallelism/parallelism_per_control-1:0];
  
wire  [be_parallelism-1:0]                 dn_parallel_vlds_A; 
wire  [(2*bu_parallelism)*data_width*parallelism_per_control-1:0]      dn_parallel_dats_A[be_parallelism/parallelism_per_control-1:0]; // real
wire                         dn_parallel_rdys_A[be_parallelism/parallelism_per_control-1:0];

wire  [be_parallelism-1:0]                 dn_serial_vlds_B; 
wire  [data_width*parallelism_per_control-1:0]      dn_serial_dats_B[be_parallelism/parallelism_per_control-1:0]; // real
wire                         dn_serial_rdys_B[be_parallelism/parallelism_per_control-1:0];
  
wire  [be_parallelism-1:0]                 dn_parallel_vlds_B; 
wire  [(2*bu_parallelism)*data_width*parallelism_per_control-1:0]      dn_parallel_dats_B[be_parallelism/parallelism_per_control-1:0]; // real
wire                         dn_parallel_rdys_B[be_parallelism/parallelism_per_control-1:0];

// =========================================================================== //
// To improve timing, tree fanout for paramters
// =========================================================================== //
localparam fanout_reduce_level = 32;

reg  [16-1:0]              lengths_timing;
reg                        is_bypass_p2s_timing;
reg                        is_fft_timing; 

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    lengths_timing <= 0;
    is_bypass_p2s_timing <= 0;
    is_fft_timing <= 0;
end
else begin
    lengths_timing <= length;
    is_bypass_p2s_timing <= is_bypass_p2s;
    is_fft_timing <= is_fft;
end


/*
wire  [16*be_parallelism/fanout_reduce_level-1:0]              length_timing;
reg  [16-1:0]              lengths_timing[be_parallelism/fanout_reduce_level-1:0];
reg  [be_parallelism/fanout_reduce_level-1:0]                      is_bypass_p2s_timing;
reg  [be_parallelism/fanout_reduce_level-1:0]                      is_fft_timing; 

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    lengths_timing[0] <= 0;
    is_bypass_p2s_timing[0] <= 0;
    is_fft_timing[0] <= 0;
end
else begin
    lengths_timing[0] <= length;
    is_bypass_p2s_timing[0] <= is_bypass_p2s;
    is_fft_timing[0] <= is_fft;
end

generate
for(i=1 ; i<be_parallelism/fanout_reduce_level ; i=i+1)
begin : ASSIGN_TIMING
    always @(posedge clk)
    begin
        lengths_timing[i] <= lengths_timing[i-1];
        is_bypass_p2s_timing[i] <= is_bypass_p2s_timing[i-1];
        is_fft_timing[i] <= is_fft_timing[i-1];
    end
end
endgenerate
*/

/*
tree_fanout_opt # (
  .in_w(16),
  .fanout_factor(be_parallelism/fanout_reduce_level)
) u_length_tree_fanout
(
  .clk(clk),
  .rst_n(rst_n),
  .up_vld(),
  .up_dat(length),
  .up_rdy(),

  .dn_vld(),
  .dn_rdy(1'b1),
  .dn_dat(length_timing)
);

generate
for(i=0 ; i<be_parallelism/fanout_reduce_level ; i=i+1)
begin : ASSIGN_LENGTH
    assign lengths_timing[i] = length_timing[(16*i + 16-1) : (16*i)];
end
endgenerate

tree_fanout_opt # (
  .in_w(1),
  .fanout_factor(be_parallelism/fanout_reduce_level)
) u_is_bypass_tree_fanout
(
  .clk(clk),
  .rst_n(rst_n),
  .up_vld(),
  .up_dat(is_bypass_p2s),
  .up_rdy(),

  .dn_vld(),
  .dn_rdy(1'b1),
  .dn_dat(is_bypass_p2s_timing)
);

tree_fanout_opt # (
  .in_w(1),
  .fanout_factor(be_parallelism/fanout_reduce_level)
) u_is_fft_tree_fanout
(
  .clk(clk),
  .rst_n(rst_n),
  .up_vld(),
  .up_dat(is_fft),
  .up_rdy(),

  .dn_vld(),
  .dn_rdy(1'b1),
  .dn_dat(is_fft_timing)
);
*/

// =========================================================================== //
// Generate Up Wiring
// =========================================================================== //
wire                        butterfly_starts[be_parallelism/parallelism_per_control-1:0];
wire [2*data_width*parallelism_per_control-1:0]   up_dats[be_parallelism/parallelism_per_control-1:0];
generate
for(i=0 ; i<be_parallelism/parallelism_per_control ; i=i+1)
begin : ASSIGN_UP_DAT
    assign up_dats[i] = up_dat[( 2*data_width*parallelism_per_control*i + 2*data_width*parallelism_per_control-1) : (2*data_width*parallelism_per_control*i)];
end
endgenerate

// =========================================================================== //
// Generate Weight Buffer
// =========================================================================== //
localparam num_be_per_wbuf = be_parallelism/parallelism_per_control/num_wbuf;
wire [(4*data_width)*bu_parallelism-1:0]  dn_weight_dat[num_wbuf-1:0];
wire                                      dn_weight_vld[num_wbuf-1:0];
generate
for(i=0 ; i<num_wbuf ; i=i+1)
begin : GENERATE_WEIGHT_BUF
    weight_buffer # (
      .BU_PARALLELISM(bu_parallelism),
      .WEIGHT_AXI_CHNL(WEIGHT_AXI_CHNL),
      .DATA_WIDTH_BRAM(data_width),
      .DATA_WIDTH_AXI(DATA_WIDTH_AXI)
    ) u_weight_buffer
    (
      //////////////////clock & control signals/////////////////
      .clk(clk),
      .rst_n(rst_n), 
      .length(length),
      .butterfly_start(butterfly_starts[i*num_be_per_wbuf]),
      //////////////////Up data and signals/////////////
      .up_dat(up_weight_dat), // assume ddr bandwidht for wights is 256*1, input buffer bandwidth is 128*32
      .up_vld(up_weight_vld),
      .up_rdy(),
    
      //////////////////Up data and signals/////////////
      .dn_dat(dn_weight_dat[i]), 
      .dn_vld(dn_weight_vld[i]),
      .dn_rdy(1'b1)
    );
end
endgenerate


// =========================================================================== //
// Generate Butterfly Engine
// =========================================================================== //
generate
for(i=0 ; i<be_parallelism/parallelism_per_control ; i=i+1)
begin : GENERATE_ENGINE
    butterfly_engine_opt_top # (
      .data_width(data_width),
      .bu_parallelism(bu_parallelism),
      .parallelism_per_control(parallelism_per_control),
      .latency_add(latency_add),
      .latency_mul(latency_mul)
    ) u_butterfly_engine_opt
    (
      .clk(clk),
      .rst_n(rst_n),
      .is_fft(is_fft_timing), 
      //===================================================//
      .butterfly_coef(dn_weight_dat[i/num_be_per_wbuf]), //Wb4, 3, 2, 1
      .butterfly_coef_vld(dn_weight_vld[i/num_be_per_wbuf]),
      //=================control signal=====================//
      .length(lengths_timing),
      .is_bypass_p2s(is_bypass_p2s_timing),
      .butterfly_start(butterfly_starts[i]),
      //=================input and output=====================//
      // Receive input one by one 
      .up_vld(up_vld[i/(be_parallelism/parallelism_per_control/INPUT_AXI_CHNL)]),
      .up_dat(up_dats[i]), // real + complex
      .up_rdy(up_rdy),

      // Port A
      // down stream data output for FFT
      .dn_serial_vld_A(dn_serial_vlds_A[i*parallelism_per_control + parallelism_per_control-1:i*parallelism_per_control]), 
      .dn_serial_dat_A(dn_serial_dats_A[i]),
      .dn_serial_rdy_A(dn_serial_rdys_A[i]),
  
      .dn_parallel_vld_A(dn_parallel_vlds_A[i*parallelism_per_control + parallelism_per_control-1:i*parallelism_per_control]), 
      .dn_parallel_dat_A(dn_parallel_dats_A[i]),
      .dn_parallel_rdy_A(dn_parallel_rdys_A[i]),

      // Port B
      // down stream data output for FFT
      .dn_serial_vld_B(dn_serial_vlds_B[i*parallelism_per_control + parallelism_per_control-1:i*parallelism_per_control]), 
      .dn_serial_dat_B(dn_serial_dats_B[i]),
      .dn_serial_rdy_B(dn_serial_rdys_B[i]),
  
      .dn_parallel_vld_B(dn_parallel_vlds_B[i*parallelism_per_control + parallelism_per_control-1:i*parallelism_per_control]), 
      .dn_parallel_dat_B(dn_parallel_dats_B[i]),
      .dn_parallel_rdy_B(dn_parallel_rdys_B[i])
    );
    assign dn_serial_rdys_A[i] = 1;
    assign dn_parallel_rdys_A[i] = 1;
    assign dn_serial_rdys_B[i] = 1;
    assign dn_parallel_rdys_B[i] = 1;
end
endgenerate

// =========================================================================== //
// Generate Dn Wiring
// =========================================================================== //

generate
for(i=0 ; i<be_parallelism/parallelism_per_control ; i=i+1)
begin : ASSIGN_DN_DAT
    assign dn_serial_dat_A[(data_width*parallelism_per_control*i + data_width*parallelism_per_control-1) : (data_width*parallelism_per_control*i)] = dn_serial_dats_A[i];
    assign dn_serial_dat_B[(data_width*parallelism_per_control*i + data_width-1) : (data_width*parallelism_per_control*i)] = dn_serial_dats_B[i];
    assign dn_parallel_dat_A[((2*bu_parallelism)*data_width*parallelism_per_control*i + (2*bu_parallelism)*data_width*parallelism_per_control-1) : ((2*bu_parallelism)*data_width*parallelism_per_control*i)] = dn_parallel_dats_A[i];
    assign dn_parallel_dat_B[((2*bu_parallelism)*data_width*parallelism_per_control*i + (2*bu_parallelism)*data_width*parallelism_per_control-1) : ((2*bu_parallelism)*data_width*parallelism_per_control*i)] = dn_parallel_dats_B[i];
end
endgenerate

generate
for(i=0 ; i<OUTPUT_AXI_CHNL ; i=i+1)
begin : ASSIGN_DN_VLD
    assign dn_serial_vld_A[i] = dn_serial_vlds_A[i*(be_parallelism/OUTPUT_AXI_CHNL)];
    assign dn_serial_vld_B[i] = dn_serial_vlds_B[i*(be_parallelism/OUTPUT_AXI_CHNL)];
    assign dn_parallel_vld_A[i] = dn_parallel_vlds_A[i*(be_parallelism/OUTPUT_AXI_CHNL)];
    assign dn_parallel_vld_B[i] = dn_parallel_vlds_B[i*(be_parallelism/OUTPUT_AXI_CHNL)];
end
endgenerate

endmodule