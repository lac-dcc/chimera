//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: butterfly_engine
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

module butterfly_engine_opt
# (
  // The data width of input data
  parameter data_width=16,
  parameter bu_parallelism = 4,
  parameter latency_add=1,
  parameter latency_mul=2
)
(
  input  wire                        clk,
  input  wire                        rst_n,
  input  wire                        is_fft, 
  //===================================================//
  input  wire  [(4*data_width)*bu_parallelism-1:0]  butterfly_coef, //Wb4, 3, 2, 1
  // input  wire  [(data_width)*bu_parallelism-1:0]  butterfly_coef_debug, //Wb4, 3, 2, 1
  input  wire                          butterfly_coef_vld,
  //=================control signal=====================//
  input  wire  [16-1:0]              length,
  input  wire                        is_bypass_p2s,
  output wire                        butterfly_start,
  //=================input and output=====================//
  // Receive input one by one 
  input wire                        up_vld,
  input wire  [2*data_width-1:0]      up_dat, // real + complex
  output  wire                        up_rdy,

  // Port A
  // down stream data output for FFT
  output wire                        dn_serial_vld_A, 
  output wire  [data_width-1:0]      dn_serial_dat_A,
  input wire                         dn_serial_rdy_A,
  
  output wire                        dn_parallel_vld_A, 
  output wire  [(2*bu_parallelism)*(data_width)-1:0]      dn_parallel_dat_A,
  input wire                         dn_parallel_rdy_A,

  // Port B
  // down stream data output for FFT
  output wire                        dn_serial_vld_B, 
  output wire  [data_width-1:0]      dn_serial_dat_B,
  input wire                         dn_serial_rdy_B,
  
  output wire                        dn_parallel_vld_B, 
  output wire  [(2*bu_parallelism)*(data_width)-1:0]      dn_parallel_dat_B,
  input wire                         dn_parallel_rdy_B
);

localparam depth_per_ram = 4096/(2*bu_parallelism);

// Debug //
// wire  [(4*data_width)*bu_parallelism-1:0]  butterfly_coef;
// assign butterfly_coef = {butterfly_coef_debug, butterfly_coef_debug, butterfly_coef_debug, butterfly_coef_debug};
// Debug //


// =========================================================================== //
// Serial input to parallel input, fit with bu parallelsim
// =========================================================================== //

wire                 parallel_up_vld;
wire   [(2*bu_parallelism)*(2*data_width)-1:0]      parallel_up_dat; // real + complex
reg   [(2*bu_parallelism)*(2*data_width)-1:0]      parallel_up_dat_r;

butterfly_s2p_opt # (
  // The data width of input data
  .data_width(2*data_width), // real + complex
  // The data width utilized for accumulated results
  .num_output(2*bu_parallelism)
) u_butterfly_s2p
(
  .clk(clk),
  .rst_n(rst_n),
  .up_dat(up_dat),
  .up_vld(up_vld),
  .length(length),
  .up_rdy(),
  .dn_dat(parallel_up_dat),
  .dn_vld(parallel_up_vld),
  .dn_rdy(1'b1)
);

// =========================================================================== //
// Address generator
// =========================================================================== //

wire                        butterfly_finish; // Finish signal from butterfly engine
wire                        butterfly_start_A; // Output to both bu_read_addr_generator and butterfly_indx_generator
wire                        butterfly_start_B; // Output to both bu_read_addr_generator and butterfly_indx_generator
wire                        butterfly_start_fft; // Output to both bu_read_addr_generator and butterfly_indx_generator

wire                       seq_out_start_A; // Output to both bu_read_addr_generator
wire                       seq_out_start_B; // Output to both bu_read_addr_generator
wire                       seq_out_start_fft; // Output to both bu_read_addr_generator

wire                        seq_out_finish; // Get from  both bu_read_addr_generator

wire                        bu_dn_vld; // Get from from butterfly unit
wire  [32*(2*bu_parallelism)-1:0]      bu_indx_A; // Get from from butterfly unit
wire  [32*(2*bu_parallelism)-1:0]      bu_indx_B; // Get from from butterfly unit
wire                        write_vld_A;
wire  [32*(2*bu_parallelism)-1:0]      write_addr_A;

wire                        write_vld_B;
wire  [32*(2*bu_parallelism)-1:0]      write_addr_B;
wire                        seq_out_finish_A;
wire                        seq_out_finish_B;
// Write address generator

bu_write_addr_generator_opt
# (
  // The data width of input data
  .data_width(data_width),
  // The data width utilized for accumulated results
  .bu_parallelism(2*bu_parallelism)
) u_bu_write_addr_generator
(
  .clk(clk),
  .rst_n(rst_n),
  // Control signal
  .is_fft(is_fft),
  .butterfly_finish(butterfly_finish), // Finish signal from butterfly engine

  .butterfly_start_A(butterfly_start_A), // Output to both bu_read_addr_generator and butterfly_indx_generator
  .butterfly_start_B(butterfly_start_B), // Output to both bu_read_addr_generator and butterfly_indx_generator
  .butterfly_start_fft(butterfly_start_fft), // Output to both bu_read_addr_generator and butterfly_indx_generator

  .seq_out_start_A(seq_out_start_A), // Output to both bu_read_addr_generator
  .seq_out_start_B(seq_out_start_B), // Output to both bu_read_addr_generator
  .seq_out_start_fft(seq_out_start_fft), // Output to both bu_read_addr_generator

  .seq_out_finish_A(seq_out_finish_A), // Get from  both bu_read_addr_generator
  .seq_out_finish_B(seq_out_finish_B), // Get from  both bu_read_addr_generator

  .length(length),
  // In and Outputs
  .up_vld(parallel_up_vld),
  
  .bu_vld(bu_dn_vld), // Get from from butterfly unit
  .bu_indx_A(bu_indx_A), // Get from from butterfly unit
  .bu_indx_B(bu_indx_B), // Get from from butterfly unit
  .write_vld_A(write_vld_A),
  .write_vld_B(write_vld_B),
  .write_addr_A(write_addr_A),
  .write_addr_B(write_addr_B)
);

assign butterfly_start = butterfly_start_A | butterfly_start_B | butterfly_start_fft;
// Butterfly indexing generator
wire            butterfly_indx_finish;
wire            butterfly_indx_vld;
wire  [32*(2*bu_parallelism)-1:0]      butterfly_indx;

butterfly_indx_generator# (
  // The data width of input data
  .data_width(data_width),
  // The data width utilized for accumulated results
  .bu_parallelism(2*bu_parallelism)
) u_butterfly_indx_generator
(
  .clk(clk),
  .rst_n(rst_n),
  .start(butterfly_start),
  .length(length),
  .butterfly_indx_finish(butterfly_indx_finish),
  .butterfly_vld(butterfly_indx_vld),
  .butterfly_indx(butterfly_indx)
);



// Read address generator
localparam delay_recover_stage = 1 + (latency_mul) + (latency_add + 1) + 1 + 1;
genvar i;
wire            butterfly_read_finish;
reg [2*bu_parallelism*$clog2(2*bu_parallelism)-1:0]        butterfly_read_finish_r[delay_recover_stage-1:0];

wire                        read_vld_A;
wire  [32*(2*bu_parallelism)-1:0]      read_addr_A;
wire                        read_vld_B;
wire  [32*(2*bu_parallelism)-1:0]      read_addr_B;

wire [2*bu_parallelism*$clog2(2*bu_parallelism)-1:0]        permute_A;
reg [2*bu_parallelism*$clog2(2*bu_parallelism)-1:0]        permute_r_A;
wire [2*bu_parallelism*$clog2(2*bu_parallelism)-1:0]        recover_A;
reg [2*bu_parallelism*$clog2(2*bu_parallelism)-1:0]        recover_r_A[delay_recover_stage-1:0];

wire [2*bu_parallelism*$clog2(2*bu_parallelism)-1:0]        permute_B;
reg [2*bu_parallelism*$clog2(2*bu_parallelism)-1:0]        permute_r_B;
wire [2*bu_parallelism*$clog2(2*bu_parallelism)-1:0]        recover_B;
reg [2*bu_parallelism*$clog2(2*bu_parallelism)-1:0]        recover_r_B[delay_recover_stage-1:0];

wire                                                       enable_p2s_A;
wire                                                       enable_p2s_B;
wire                                                       enable_p2s_fft;

wire                                                       compute_A;
wire                                                       compute_B;

reg                                                       compute_r_A[delay_recover_stage-1:0];
reg                                                       compute_r_B[delay_recover_stage-1:0];

assign butterfly_finish = butterfly_read_finish_r[delay_recover_stage-1];
// Delay the up data to match the delay of address generator
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    permute_r_A <= 0;
    recover_r_A[0] <= 0;
    permute_r_B <= 0;
    recover_r_B[0] <= 0;
    butterfly_read_finish_r[0] <= 0;
    compute_r_A[0] <= 0;
    compute_r_B[0] <= 0;
end
else begin
    permute_r_A <= permute_A;
    recover_r_A[0] <= recover_A;
    permute_r_B <= permute_B;
    recover_r_B[0] <= recover_B;
    butterfly_read_finish_r[0] <= butterfly_read_finish;
    compute_r_A[0] <= compute_A;
    compute_r_B[0] <= compute_B;
end

generate
for(i=1 ; i<delay_recover_stage ; i=i+1)
begin : ASSIGN_RECOVER_DELAY
    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        recover_r_A[i] <= 0;
        recover_r_B[i] <= 0;
        butterfly_read_finish_r[i] <= 0;
        compute_r_A[i] <= 0;
        compute_r_B[i] <= 0;
    end
    else begin
        recover_r_A[i] <= recover_r_A[i-1];
        recover_r_B[i] <= recover_r_B[i-1];
        butterfly_read_finish_r[i] <= butterfly_read_finish_r[i-1];
        compute_r_A[i] <= compute_r_A[i-1];
        compute_r_B[i] <= compute_r_B[i-1];
    end
end
endgenerate

bu_read_addr_generator_opt# (
  // The data width of input data
  .data_width(data_width),
  // The data width utilized for accumulated results
  .bu_parallelism(2*bu_parallelism)
) u_bu_read_addr_generator
(
  .clk(clk),
  .rst_n(rst_n),
  // Control signal
  .is_fft(is_fft),
  .is_bypass_p2s(is_bypass_p2s),

  .enable_p2s_A(enable_p2s_A),
  .enable_p2s_B(enable_p2s_B),
  .enable_p2s_fft(enable_p2s_fft),

  .compute_A(compute_A),
  .compute_B(compute_B),

  .butterfly_indx_finish(butterfly_indx_finish), // Connect to butterfly indexing module
  .butterfly_read_finish(butterfly_read_finish), // Propage to butterfly engine


  .butterfly_start_A(butterfly_start_A), // Get from bu_read_addr_generator
  .butterfly_start_B(butterfly_start_B), // Get from bu_read_addr_generator
  .butterfly_start_fft(butterfly_start_fft), // Get from bu_read_addr_generator

  .seq_out_start_A(seq_out_start_A), // Get from bu_read_addr_generator
  .seq_out_start_B(seq_out_start_B), // Get from bu_read_addr_generator
  .seq_out_start_fft(seq_out_start_fft), // Get from bu_read_addr_generator

  .seq_out_finish_A(seq_out_finish_A), // Output from bu_read_addr_generator
  .seq_out_finish_B(seq_out_finish_B), // Output from bu_read_addr_generator
  .length(length),

  .permute_A(permute_A),
  .recover_A(recover_A),
  .permute_B(permute_B),
  .recover_B(recover_B),

  // In and Outputs,
  .butterfly_vld(butterfly_indx_vld), // Get from butterfly indexing module
  .butterfly_indx(butterfly_indx), // Get from butterfly indexing module
  .read_vld_A(read_vld_A),
  .read_vld_B(read_vld_B),
  .read_addr_A(read_addr_A),
  .read_addr_B(read_addr_B)
);


// =========================================================================== //
// RAM
// =========================================================================== //
// Receive write_addr, write_vld, parallel_up_dat_r and bu_dn_dat_r

wire   [data_width*2*bu_parallelism-1:0]    ram_up_dat_A;    // data in
reg   [data_width*2*bu_parallelism-1:0]    ram_up_dat_r_A;    // data in

wire   [data_width*2*bu_parallelism-1:0]    ram_up_dat_B;    // data in
reg   [data_width*2*bu_parallelism-1:0]    ram_up_dat_r_B;    // data in
wire                   re_A;   // active high read enable
wire                   re_B;   // active high read enable

wire  [data_width*2*bu_parallelism-1:0]     ram_dn_dat_A;     // data out
wire  [data_width*2*bu_parallelism-1:0]     ram_dn_dat_B;     // data out

wire  [data_width*2*bu_parallelism-1:0]     bu_dn_dat;
wire  [data_width*2*bu_parallelism-1:0]     bu_dn_dat_recovered;
wire                   ram_dn_vld_A;
wire                   ram_dn_vld_B;
wire  [32*(2*bu_parallelism)-1:0]      read_addr_r_A;
wire  [32*(2*bu_parallelism)-1:0]      read_addr_r_B;

// Split the data
wire   [(2*bu_parallelism)*(data_width)-1:0]      parallel_up_dat_A; 
wire   [(2*bu_parallelism)*(data_width)-1:0]      parallel_up_dat_B;

generate
for(i=0 ; i<2*bu_parallelism ; i=i+1)
begin : ASSIGN_SPLIT_DAT
    assign parallel_up_dat_A[(data_width*i + data_width-1) : (data_width*i)] = parallel_up_dat[(2*data_width*i + data_width-1) : (2*data_width*i)];
    assign parallel_up_dat_B[(data_width*i + data_width-1) : (data_width*i)] = parallel_up_dat[(2*data_width*i + 2*data_width-1) : (2*data_width*i + data_width)];
end
endgenerate

// Delay the up data to match the delay of address generator
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    ram_up_dat_r_A <= 0;
end
else begin
    if (compute_r_A[delay_recover_stage-1]) begin
        if (bu_dn_vld) ram_up_dat_r_A <= bu_dn_dat_recovered;// butterfly mode
        else ram_up_dat_r_A <= 0;
    end
    else begin
        if (parallel_up_vld) ram_up_dat_r_A <= parallel_up_dat_A; // seq_in mode
        else ram_up_dat_r_A <= 0;
    end
end

assign ram_up_dat_A = ram_up_dat_r_A;


always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    ram_up_dat_r_B <= 0;
end
else begin
    if (compute_r_B[delay_recover_stage-1]) begin
        if (bu_dn_vld) ram_up_dat_r_B <= bu_dn_dat_recovered;// butterfly mode
        else ram_up_dat_r_B <= 0;
    end
    else begin
        if (parallel_up_vld) ram_up_dat_r_B <= parallel_up_dat_B; // seq_in mode
        else ram_up_dat_r_B <= 0;
    end
end

assign ram_up_dat_B = ram_up_dat_r_B;


pingpong_ram_2d # (
 .num_rams(2*bu_parallelism),
 .w(data_width),
 .d(depth_per_ram)
)u_pingpong_ram_2d
(
  .clk(clk),  // common clock for read/write access
  .rst_n(rst_n),
  .we_A(write_vld_A),   // active high write enable
  .write_addr_A(write_addr_A),   // write address
  .din_A(ram_up_dat_A),    // data in

  .re_A(read_vld_A),   // active high read enable
  .read_addr_A(read_addr_A),   // read address
  .read_addr_r_A(read_addr_r_A),
  .dout_vld_A(ram_dn_vld_A),
  .dout_A(ram_dn_dat_A),     // data out

  .we_B(write_vld_B),   // active high write enable
  .write_addr_B(write_addr_B),   // write address
  .din_B(ram_up_dat_B),    // data in

  .re_B(read_vld_B),   // active high read enable
  .read_addr_B(read_addr_B),   // read address
  .read_addr_r_B(read_addr_r_B),
  .dout_vld_B(ram_dn_vld_B),
  .dout_B(ram_dn_dat_B)     // data out
); // ram_simple_dual

// Data Permutation before feeding to Butterfly units
wire  [data_width*2*bu_parallelism-1:0]     ram_dn_dat_permuted_A;     // data out
wire  [data_width*2*bu_parallelism-1:0]     ram_dn_dat_permuted_B;     // data out
crossbar_comb #(
    .data_width(data_width),
    .num_output(2*bu_parallelism),
    .num_input(2*bu_parallelism)
) u_crossbar_comb_permute_A
(
    .up_dat(ram_dn_dat_A),
    .sel(permute_r_A),
    .dn_dat(ram_dn_dat_permuted_A)
);

crossbar_comb #(
    .data_width(data_width),
    .num_output(2*bu_parallelism),
    .num_input(2*bu_parallelism)
) u_crossbar_comb_permute_B
(
    .up_dat(ram_dn_dat_B),
    .sel(permute_r_B),
    .dn_dat(ram_dn_dat_permuted_B)
);

// =========================================================================== //
// Butterfly units
// =========================================================================== //

wire  [4*data_width-1:0]  butterfly_coefs[bu_parallelism-1:0]; //Wb4, 3, 2, 1
  // up stram data input of butterfly factorization
wire  [2*data_width-1:0]  butterfly_up_dats[bu_parallelism-1:0]; //Ib2, 1: {higher_fft_index, lower_fft_index(add result)}
wire                           butterfly_dat_rdy;

wire  [2*data_width-1:0]  fft_dats_real[bu_parallelism-1:0]; 
wire  [2*data_width-1:0]  fft_dats_img[bu_parallelism-1:0]; 

wire  [data_width-1:0]  fft_coefs_real[bu_parallelism-1:0]; 
wire  [data_width-1:0]  fft_coefs_img[bu_parallelism-1:0]; 

  // down stream data output for butterfly
wire                        butterfly_dn_vlds[bu_parallelism-1:0];
wire  [2*data_width-1:0]    butterfly_dn_dats[bu_parallelism-1:0];
wire                        butterfly_dn_rdy;

wire  [32*(2)-1:0]      read_addrs_r_A[bu_parallelism-1:0];
wire  [32*(2)-1:0]      read_addrs_r_B[bu_parallelism-1:0];
wire  [32*(2)-1:0]      write_addrs_r_A[bu_parallelism-1:0];
wire  [32*(2)-1:0]      write_addrs_r_B[bu_parallelism-1:0];

reg  [data_width*2*bu_parallelism-1:0]     bfly_up_dat_permuted_r;     // data out
reg  [data_width*2*bu_parallelism-1:0]     fft_up_dat_permuted_real_r;     // data out
reg  [data_width*2*bu_parallelism-1:0]     fft_up_dat_permuted_img_r;     // data out

wire                                        fft_coef_vld;
reg                           butterfly_dat_vld_r;
reg                           fft_dat_vld_r;

reg            enable_p2s_r_A;
reg            enable_p2s_r_B;
reg            enable_p2s_r_fft;

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    bfly_up_dat_permuted_r <= 0;
    butterfly_dat_vld_r <= 1'b0;
    fft_dat_vld_r <= 1'b0;
    fft_up_dat_permuted_real_r <= 0;
    fft_up_dat_permuted_img_r <= 0;
end
else begin
    // Vld for FFT and butterfly
    if (is_fft) begin
        // Input for FFT
        if (!enable_p2s_r_fft) begin
            fft_dat_vld_r <= ram_dn_vld_A | ram_dn_vld_B;
            fft_up_dat_permuted_real_r <= ram_dn_dat_permuted_A;
            fft_up_dat_permuted_img_r <= ram_dn_dat_permuted_B;
        end
        else begin
            fft_dat_vld_r <= 1'b0;
            fft_up_dat_permuted_real_r <= 0;
            fft_up_dat_permuted_img_r <= 0;
        end
        // Input for butterfly
        butterfly_dat_vld_r <= 1'b0;
        bfly_up_dat_permuted_r <= 0;
    end
    else begin
        // Input for FFT
        fft_dat_vld_r <= 1'b0;
        fft_up_dat_permuted_real_r <= 0;
        fft_up_dat_permuted_img_r <= 0;

        // Input for butterfly
        if (compute_r_A[1] & !(enable_p2s_A)) begin
            bfly_up_dat_permuted_r <= ram_dn_dat_permuted_A;
            butterfly_dat_vld_r <= ram_dn_vld_A;
        end
        else if (compute_r_B[1] & !(enable_p2s_B)) begin
            bfly_up_dat_permuted_r <= ram_dn_dat_permuted_B;
            butterfly_dat_vld_r <= ram_dn_vld_B;
        end
        else begin
            bfly_up_dat_permuted_r <= 0;
            butterfly_dat_vld_r <= 1'b0;
        end
    end
end

generate
for(i=0 ; i<bu_parallelism ; i=i+1)
begin : ASSIGN_UP_DAT
    assign butterfly_coefs[i] = butterfly_coef[( 4*data_width*i + 4*data_width-1) : (4*data_width*i)];
    assign butterfly_up_dats[i] = bfly_up_dat_permuted_r[( 2*data_width*i + 2*data_width-1) : (2*data_width*i)];
    assign bu_dn_dat[( 2*data_width*i + 2*data_width-1) : (2*data_width*i)] = butterfly_dn_dats[i];
    assign read_addrs_r_A[i] = read_addr_r_A[( 2*32*i + 2*32-1) : (2*32*i)];
    assign read_addrs_r_B[i] = read_addr_r_B[( 2*32*i + 2*32-1) : (2*32*i)];
    assign bu_indx_A[( 2*32*i + 2*32-1) : (2*32*i)] = write_addrs_r_A[i];
    assign bu_indx_B[( 2*32*i + 2*32-1) : (2*32*i)] = write_addrs_r_B[i];

    assign fft_dats_real[i] = fft_up_dat_permuted_real_r[( 2*data_width*i + 2*data_width-1) : (2*data_width*i)];
    assign fft_dats_img[i] = fft_up_dat_permuted_img_r[( 2*data_width*i + 2*data_width-1) : (2*data_width*i)];
    assign fft_coef_vld = butterfly_coef_vld;
    assign fft_coefs_real[i] = butterfly_coef[( 4*data_width*i + data_width-1) : (4*data_width*i)];
    assign fft_coefs_img[i] = butterfly_coef[( 4*data_width*i + 2*data_width-1) : (4*data_width*i+data_width)];
end

for(i=0 ; i<bu_parallelism ; i=i+1)
begin : GENERATE_BUTTERFLY
    butterfly_unit_opt # (
      // The data width of input data
      .in_data_width(data_width),
      // The data width utilized for accumulated results
      .out_data_width(data_width)
    ) u_butterfly_unit
    (
      .clk(clk),
      .rst_n(rst_n),
      .is_fft(is_fft), 
      .read_addr_r_A(read_addrs_r_A[i]),
      .read_addr_r_B(read_addrs_r_B[i]),
      .write_addr_r_A(write_addrs_r_A[i]),
      .write_addr_r_B(write_addrs_r_B[i]),
      //===================================================//
      // Perform butterfly multiplication: (Ib1 x Wb1), (Ib1 x Wb2), (Ib2 x Wb3), (Ib2 x Wb4)
      // coefficients for butterfly factorization
      .butterfly_coef(butterfly_coefs[i]), //Wb4, 3, 2, 1
      .butterfly_coef_vld(butterfly_coef_vld),
      // up stram data input of butterfly factorization
      .butterfly_dat_vld(butterfly_dat_vld_r),
      .butterfly_dat(butterfly_up_dats[i]), //Ib2, 1: {higher_fft_index, lower_fft_index(add result)}
      .butterfly_dat_rdy(),
    
      // down stream data output for butterfly
      .butterfly_dn_vld(butterfly_dn_vlds[i]),
      .butterfly_dn_dat(butterfly_dn_dats[i]),
      .butterfly_dn_rdy(1'b1),
    
      //===================================================//
      // Perform FFT, twiddle factor multiplication: (Ir2 + Ii2(i)) x (Wr + Wi(i))
      // coefficients for FFT
      .fft_coef_real(fft_coefs_real[i]),  // Wr
      .fft_coef_img(fft_coefs_img[i]),  // Wi(i)
      .fft_coef_vld(fft_coef_vld),
    
      // up stram data input of FFT
      .fft_dat_vld(fft_dat_vld_r),
      .fft_dat_real(fft_dats_real[i]), // Ir1, 2
      .fft_dat_img(fft_dats_img[i]), // Ii2(i), 2(i)
      .fft_dat_rdy(),
    
      // down stream data output for FFT
      .fft_dn_vld(),
      .fft_dn_dat_real(),
      .fft_dn_dat_img(),
      .fft_dn_rdy()
    );
end
endgenerate

assign bu_dn_vld = butterfly_dn_vlds[0];

reg [2*bu_parallelism*$clog2(2*bu_parallelism)-1:0]        recover_r;

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    recover_r <= 0;
end
else begin
    if (compute_r_A[delay_recover_stage-2]) begin
        recover_r <= recover_r_A[delay_recover_stage-2];
    end
    else if (compute_r_B[delay_recover_stage-2]) begin
        recover_r <= recover_r_B[delay_recover_stage-2];
    end
end

crossbar_comb #(
    .data_width(data_width),
    .num_output(2*bu_parallelism),
    .num_input(2*bu_parallelism)
) u_crossbar_comb_recover
(
    .up_dat(bu_dn_dat),
    .sel(recover_r),
    .dn_dat(bu_dn_dat_recovered)
);



// Delay the up data to match the delay of address generator

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    enable_p2s_r_A <= 0;
    enable_p2s_r_B <= 0;
    enable_p2s_r_fft <= 0;
end
else begin
    enable_p2s_r_A <= enable_p2s_A;
    enable_p2s_r_B <= enable_p2s_B;
    enable_p2s_r_fft <= enable_p2s_fft;
end

butterfly_p2s_opt # (
  // The data width of input data
  .data_width(data_width),
  // The data width utilized for accumulated results
  .num_output(2*bu_parallelism)
) u_butterfly_p2s_A
(
  .clk(clk),
  .rst_n(rst_n),
  .up_dat(ram_dn_dat_A),
  .up_vld(ram_dn_vld_A & (enable_p2s_r_A | enable_p2s_r_fft)),
  .by_pass(is_bypass_p2s),
  .up_rdy(),
  .dn_parallel_dat(dn_parallel_dat_A),
  .dn_parallel_vld(dn_parallel_vld_A),
  .dn_parallel_rdy(dn_parallel_rdy_A),
  .dn_serial_dat(dn_serial_dat_A),
  .dn_serial_vld(dn_serial_vld_A),
  .dn_serial_rdy(dn_serial_rdy_A)
);

butterfly_p2s_opt # (
  // The data width of input data
  .data_width(data_width),
  // The data width utilized for accumulated results
  .num_output(2*bu_parallelism)
) u_butterfly_p2s_B
(
  .clk(clk),
  .rst_n(rst_n),
  .up_dat(ram_dn_dat_B),
  .up_vld(ram_dn_vld_B & (enable_p2s_r_B | enable_p2s_r_fft)),
  .by_pass(is_bypass_p2s),
  .up_rdy(),
  .dn_parallel_dat(dn_parallel_dat_B),
  .dn_parallel_vld(dn_parallel_vld_B),
  .dn_parallel_rdy(dn_parallel_rdy_B),
  .dn_serial_dat(dn_serial_dat_B),
  .dn_serial_vld(dn_serial_vld_B),
  .dn_serial_rdy(dn_serial_rdy_B)
);


endmodule
