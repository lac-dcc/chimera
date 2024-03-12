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

module butterfly_engine_opt_top
# (
  // The data width of input data
  parameter data_width=16,
  parameter parallelism_per_control = 4,
  parameter bu_parallelism = 4,
  parameter latency_add=1,
  parameter latency_mul=2
)
(
  input  wire                        clk,
  input  wire                        rst_n,
  input  wire                        is_fft, 
  //===================weight data=======================//
  input wire [(4*data_width)*bu_parallelism-1:0]  butterfly_coef,
  input wire                                      butterfly_coef_vld,
  //=================control signal=====================//
  input  wire  [16-1:0]              length,
  input  wire                        is_bypass_p2s,
  output  wire                        butterfly_start,
  //=================input and output=====================//
  // Receive input one by one 
  input wire                        up_vld,
  input wire  [(2*data_width)*parallelism_per_control-1:0]      up_dat, // real + complex
  output  wire                        up_rdy,

  // Port A
  // down stream data output for FFT
  output wire  [parallelism_per_control-1:0]                 dn_serial_vld_A, 
  output wire  [data_width*parallelism_per_control-1:0]      dn_serial_dat_A, // real
  input wire                         dn_serial_rdy_A,
  
  output wire  [parallelism_per_control-1:0]                       dn_parallel_vld_A, 
  output wire  [(2*bu_parallelism)*data_width*parallelism_per_control-1:0]      dn_parallel_dat_A, // real
  input wire                         dn_parallel_rdy_A,

  // Port B
  // down stream data output for FFT
  output wire  [parallelism_per_control-1:0]                 dn_serial_vld_B, 
  output wire  [data_width*parallelism_per_control-1:0]      dn_serial_dat_B, // complex
  input wire                         dn_serial_rdy_B,
  
  output wire  [parallelism_per_control-1:0]                      dn_parallel_vld_B, 
  output wire  [(2*bu_parallelism)*data_width*parallelism_per_control-1:0]      dn_parallel_dat_B, // complex
  input wire                         dn_parallel_rdy_B
);

genvar i;

wire                        dn_serial_vlds_A[parallelism_per_control-1:0]; 
wire  [data_width-1:0]      dn_serial_dats_A[parallelism_per_control-1:0]; // real
wire                         dn_serial_rdys_A[parallelism_per_control-1:0];
  
wire                        dn_parallel_vlds_A[parallelism_per_control-1:0]; 
wire  [(2*bu_parallelism)*data_width-1:0]      dn_parallel_dats_A[parallelism_per_control-1:0]; // real
wire                         dn_parallel_rdys_A[parallelism_per_control-1:0];

wire                        dn_serial_vlds_B[parallelism_per_control-1:0]; 
wire  [data_width-1:0]      dn_serial_dats_B[parallelism_per_control-1:0]; // real
wire                         dn_serial_rdys_B[parallelism_per_control-1:0];
  
wire                        dn_parallel_vlds_B[parallelism_per_control-1:0]; 
wire  [(2*bu_parallelism)*data_width-1:0]      dn_parallel_dats_B[parallelism_per_control-1:0]; // real
wire                         dn_parallel_rdys_B[parallelism_per_control-1:0];


wire [2*bu_parallelism*$clog2(2*bu_parallelism)-1:0]        permute_A;
wire [2*bu_parallelism*$clog2(2*bu_parallelism)-1:0]        recover_A;
   
wire [2*bu_parallelism*$clog2(2*bu_parallelism)-1:0]        permute_B;
wire [2*bu_parallelism*$clog2(2*bu_parallelism)-1:0]        recover_B;
  
wire                                                       compute_A;
wire                                                       compute_B; 
wire                                                       compute_FFT;

wire                                                       enable_p2s_A;
wire                                                       enable_p2s_B;
wire                                                       enable_p2s_fft;

wire                        read_vld_A;
wire  [32*(2*bu_parallelism)-1:0]      read_addr_A;
wire                        read_vld_B;
wire  [32*(2*bu_parallelism)-1:0]      read_addr_B;

wire                        write_vld_A;
wire  [32*(2*bu_parallelism)-1:0]      write_addr_A;
wire                        write_vld_B;
wire  [32*(2*bu_parallelism)-1:0]      write_addr_B;

// =========================================================================== //
// Generate Up Wiring
// =========================================================================== //
reg [(4*data_width)*bu_parallelism-1:0]  butterfly_coef_timing;
reg                                      butterfly_coef_vld_timing;

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    butterfly_coef_vld_timing <= 0;
end
else begin
    butterfly_coef_vld_timing <= butterfly_coef_vld;
end

always @(posedge clk)
begin
    butterfly_coef_timing <= butterfly_coef;
end

// =========================================================================== //
// Generate Up Wiring
// =========================================================================== //
wire [2*data_width-1:0]   up_dats[parallelism_per_control-1:0];
generate
for(i=0 ; i<parallelism_per_control ; i=i+1)
begin : ASSIGN_UP_DAT
    assign up_dats[i] = up_dat[( 2*data_width*i + 2*data_width-1) : (2*data_width*i)];
end
endgenerate


butterfly_engine_opt_control # (
  .data_width(data_width),
  .bu_parallelism(bu_parallelism),
  .latency_add(latency_add),
  .latency_mul(latency_mul)
) u_butterfly_engine_opt_control
(
  .clk(clk),
  .rst_n(rst_n),
  .is_fft(is_fft), 
  //===================================================//
  .butterfly_coef(butterfly_coef_timing), //Wb4, 3, 2, 1
  .butterfly_coef_vld(butterfly_coef_vld_timing),
  //=================control signal=====================//
  .length(length),
  .is_bypass_p2s(is_bypass_p2s),
  .butterfly_start(butterfly_start),
  //=================control signal=====================//
  .permute_A(permute_A),
  .recover_A(recover_A),

  .permute_B(permute_B),
  .recover_B(recover_B),

  .compute_A(compute_A),
  .compute_B(compute_B), 
  .compute_FFT(compute_FFT),

  .enable_p2s_A(enable_p2s_A),
  .enable_p2s_B(enable_p2s_B),
  .enable_p2s_fft(enable_p2s_fft),

  .read_vld_A(read_vld_A),
  .read_addr_A(read_addr_A),
  .read_vld_B(read_vld_B),
  .read_addr_B(read_addr_B),

  .write_vld_A(write_vld_A),
  .write_addr_A(write_addr_A),
  .write_vld_B(write_vld_B),
  .write_addr_B(write_addr_B),
//====================================================//
  //=================input and output=====================//
  // Receive input one by one 
  .up_vld(up_vld),
  .up_dat(up_dats[0]), // real + complex
  .up_rdy(up_rdy),

  // Port A
  // down stream data output for FFT
  .dn_serial_vld_A(dn_serial_vlds_A[0]), 
  .dn_serial_dat_A(dn_serial_dats_A[0]),
  .dn_serial_rdy_A(dn_serial_rdys_A[0]),

  .dn_parallel_vld_A(dn_parallel_vlds_A[0]), 
  .dn_parallel_dat_A(dn_parallel_dats_A[0]),
  .dn_parallel_rdy_A(dn_parallel_rdys_A[0]),

  // Port B
  // down stream data output for FFT
  .dn_serial_vld_B(dn_serial_vlds_B[0]), 
  .dn_serial_dat_B(dn_serial_dats_B[0]),
  .dn_serial_rdy_B(dn_serial_rdys_B[0]),

  .dn_parallel_vld_B(dn_parallel_vlds_B[0]), 
  .dn_parallel_dat_B(dn_parallel_dats_B[0]),
  .dn_parallel_rdy_B(dn_parallel_rdys_B[0])
);
assign dn_serial_rdys_A[0] = 1;
assign dn_parallel_rdys_A[0] = 1;
assign dn_serial_rdys_B[0] = 1;
assign dn_parallel_rdys_B[0] = 1;
// =========================================================================== //
// Generate Butterfly Engine
// =========================================================================== //
generate
for(i=1 ; i<parallelism_per_control ; i=i+1)
begin : GENERATE_ENGINE
    butterfly_engine_opt_comp # (
      .data_width(data_width),
      .bu_parallelism(bu_parallelism),
      .latency_add(latency_add),
      .latency_mul(latency_mul)
    ) u_butterfly_engine_opt_comp
    (
      .clk(clk),
      .rst_n(rst_n),
      .is_fft(is_fft), 
      //===================================================//
      .butterfly_coef(butterfly_coef_timing), //Wb4, 3, 2, 1
      .butterfly_coef_vld(butterfly_coef_vld_timing),
      //=================control signal=====================//
      .length(length),
      .is_bypass_p2s(is_bypass_p2s),
      //=================control signal=====================//
      .permute_A(permute_A),
      .recover_A(recover_A),
   
      .permute_B(permute_B),
      .recover_B(recover_B),
  
      .compute_A(compute_A),
      .compute_B(compute_B), 
      .compute_FFT(compute_FFT),
  
      .enable_p2s_A(enable_p2s_A),
      .enable_p2s_B(enable_p2s_B),
      .enable_p2s_fft(enable_p2s_fft),

      .read_vld_A(read_vld_A),
      .read_addr_A(read_addr_A),
      .read_vld_B(read_vld_B),
      .read_addr_B(read_addr_B),

      .write_vld_A(write_vld_A),
      .write_addr_A(write_addr_A),
      .write_vld_B(write_vld_B),
      .write_addr_B(write_addr_B),
    //====================================================//
      //=================input and output=====================//
      // Receive input one by one 
      .up_vld(up_vld),
      .up_dat(up_dats[i]), // real + complex
      .up_rdy(up_rdy),

      // Port A
      // down stream data output for FFT
      .dn_serial_vld_A(dn_serial_vlds_A[i]), 
      .dn_serial_dat_A(dn_serial_dats_A[i]),
      .dn_serial_rdy_A(dn_serial_rdys_A[i]),
  
      .dn_parallel_vld_A(dn_parallel_vlds_A[i]), 
      .dn_parallel_dat_A(dn_parallel_dats_A[i]),
      .dn_parallel_rdy_A(dn_parallel_rdys_A[i]),

      // Port B
      // down stream data output for FFT
      .dn_serial_vld_B(dn_serial_vlds_B[i]), 
      .dn_serial_dat_B(dn_serial_dats_B[i]),
      .dn_serial_rdy_B(dn_serial_rdys_B[i]),
  
      .dn_parallel_vld_B(dn_parallel_vlds_B[i]), 
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
for(i=0 ; i<parallelism_per_control ; i=i+1)
begin : ASSIGN_DN_DAT
    assign dn_serial_dat_A[(data_width*i + data_width-1) : (data_width*i)] = dn_serial_dats_A[i];
    assign dn_serial_dat_B[(data_width*i + data_width-1) : (data_width*i)] = dn_serial_dats_B[i];
    assign dn_parallel_dat_A[((2*bu_parallelism)*data_width*i + (2*bu_parallelism)*data_width-1) : ((2*bu_parallelism)*data_width*i)] = dn_parallel_dats_A[i];
    assign dn_parallel_dat_B[((2*bu_parallelism)*data_width*i + (2*bu_parallelism)*data_width-1) : ((2*bu_parallelism)*data_width*i)] = dn_parallel_dats_B[i];
end
endgenerate


generate
for(i=0 ; i<parallelism_per_control ; i=i+1)
begin : ASSIGN_DN_VLD
    assign dn_serial_vld_A[i] = dn_serial_vlds_A[i];
    assign dn_serial_vld_B[i] = dn_serial_vlds_B[i];
    assign dn_parallel_vld_A[i] = dn_parallel_vlds_A[i];
    assign dn_parallel_vld_B[i] = dn_parallel_vlds_B[i];
end
endgenerate



endmodule