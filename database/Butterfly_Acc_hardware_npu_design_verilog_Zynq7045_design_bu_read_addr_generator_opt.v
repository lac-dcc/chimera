//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: bu_read_addr_generator
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


module bu_read_addr_generator_opt
# (
  // The data width of input data
  parameter data_width = 16,
  // The data width utilized for accumulated results
  parameter bu_parallelism = 8
)
(
  input  wire                        clk,
  input  wire                        rst_n,
  // Control signal
  input  wire                        is_fft,
  input  wire                        is_bypass_p2s,
  output  wire                        enable_p2s_A,
  output  wire                        enable_p2s_B,
  output  wire                        enable_p2s_fft,

  output  wire                        compute_A,
  output  wire                        compute_B,
  output  wire                        compute_FFT,

  input  wire                        butterfly_indx_finish, // Connect to butterfly indexing module
  output  wire                        butterfly_read_finish, // Propage to butterfly engine

  input wire                        butterfly_start_A, // Get from bu_engine
  input wire                        butterfly_start_B, // Get from bu_engine
  input wire                        butterfly_start_fft, // Get from bu_engine

  input  wire                       seq_out_start_A, // Get from bu_read_addr_generator
  input  wire                       seq_out_start_B, // Get from bu_read_addr_generator
  input  wire                       seq_out_start_fft, // Get from bu_read_addr_generator


  output  wire                        seq_out_finish_A, // Output from bu_read_addr_generator
  output  wire                        seq_out_finish_B, // Output from bu_read_addr_generator
  input  wire  [16-1:0]              length,
  output wire [bu_parallelism*$clog2(bu_parallelism)-1:0]        permute_A,
  output wire [bu_parallelism*$clog2(bu_parallelism)-1:0]        recover_A,

  output wire [bu_parallelism*$clog2(bu_parallelism)-1:0]        permute_B,
  output wire [bu_parallelism*$clog2(bu_parallelism)-1:0]        recover_B,
  // In and Outputs,
  input  wire                        butterfly_vld, // Get from butterfly indexing module
  input wire  [32*bu_parallelism-1:0]      butterfly_indx, // Get from butterfly indexing module
  output wire                        read_vld_A,
  output wire                        read_vld_B,
  output wire  [32*bu_parallelism-1:0]      read_addr_A,
  output wire  [32*bu_parallelism-1:0]      read_addr_B
);

localparam seq_in_mode = 2'b00;
localparam seq_out_mode = 2'b01;
localparam idle = 2'b10;
localparam butterfly_mode = 2'b11;
localparam num_out_bits = $clog2(bu_parallelism);

/////////////////////Timing//////////////////////////
reg  [16-1:0]                          length_r;
always @(posedge clk)
begin
    length_r <= length;
end

reg                            is_fft_r;
always @(posedge clk)
begin
    is_fft_r <= is_fft;
end

reg                           is_bypass_p2s_r;
always @(posedge clk)
begin
    is_bypass_p2s_r <= is_bypass_p2s;
end
/////////////////////Timing//////////////////////////

wire [32-1:0]                   fft_read_addrs_A[bu_parallelism-1:0];
wire [32-1:0]                   fft_read_addrs_B[bu_parallelism-1:0]; 

reg [num_out_bits-1:0]                   fft_x_permute[bu_parallelism-1:0];
reg [32-1:0]                   fft_read_xaddrs_r[bu_parallelism-1:0];
reg [num_out_bits-1:0]                   fft_read_yaddrs_r[bu_parallelism-1:0];

wire [32-1:0]                   bfly_read_addrs_A[bu_parallelism-1:0];
wire [32-1:0]                   bfly_read_addrs_B[bu_parallelism-1:0]; 

reg [num_out_bits-1:0]                   bfly_x_permute_A[bu_parallelism-1:0];
reg [32-1:0]                   bfly_read_xaddrs_r_A[bu_parallelism-1:0];
reg [num_out_bits-1:0]                   bfly_read_yaddrs_r_A[bu_parallelism-1:0];

reg [num_out_bits-1:0]                   bfly_x_permute_B[bu_parallelism-1:0];
reg [32-1:0]                   bfly_read_xaddrs_r_B[bu_parallelism-1:0];
reg [num_out_bits-1:0]                   bfly_read_yaddrs_r_B[bu_parallelism-1:0];


reg                            compute_A_r;
reg                            compute_B_r;
reg                            compute_FFT_r;

wire [32-1:0]                   butterfly_indxs_r[bu_parallelism-1:0];
reg                            bfly_read_vld_r_A;
reg                            bfly_read_vld_r_B;
reg                            fft_read_vld_r;

reg                            bfly_enable_p2s_r_A;
reg                            bfly_enable_p2s_r_B;
reg                            fft_enable_p2s_r;



// =========================================================================== //
// Control state
// =========================================================================== //

// =========================for fft control state========================== //
reg [2-1:0]                    fft_state;
reg [16-1:0]                   out_counter_fft;
reg                            butterfly_read_finish_r_fft;

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    fft_state <= seq_in_mode;
    out_counter_fft <= 0;
    butterfly_read_finish_r_fft <= 1'b0;
    compute_FFT_r <= 1'b0;
end
else begin
    if (is_fft_r) begin
        if (fft_state == seq_in_mode) begin // positive
            out_counter_fft <= 0;
            compute_FFT_r <= 1'b0;
            butterfly_read_finish_r_fft <= 1'b0;
            if (butterfly_start_fft) begin
                compute_FFT_r <= 1'b1;
                fft_state <= butterfly_mode;
            end
        end
        else if (fft_state == butterfly_mode) begin
            out_counter_fft <= 0;
            compute_FFT_r <= 1'b1;
            butterfly_read_finish_r_fft <= 1'b0;
            if (butterfly_indx_finish) begin
                fft_state <= idle;
                compute_FFT_r <= 1'b0;
                butterfly_read_finish_r_fft <= 1'b1;
            end
        end
        else if (fft_state == idle) begin
            out_counter_fft <= 0;
            butterfly_read_finish_r_fft <= 1'b0;
            compute_FFT_r <= 1'b0;
            if (seq_out_start_fft) fft_state <= seq_out_mode;
        end
        else if (fft_state == seq_out_mode) begin
            butterfly_read_finish_r_fft <= 1'b0;
            compute_FFT_r <= 1'b0;
            if (is_bypass_p2s_r) begin // outputs bu_parallelism by bu_parallelism
                if (out_counter_fft == length_r-bu_parallelism) begin
                    fft_state <= seq_in_mode;
                    butterfly_read_finish_r_fft <= 1'b0;
                end
                else out_counter_fft <= out_counter_fft + bu_parallelism;
            end
            else begin // outputs one by one
                if (out_counter_fft == length_r-1) begin
                    fft_state <= seq_in_mode;
                    butterfly_read_finish_r_fft <= 1'b0;
                end
                else out_counter_fft <= out_counter_fft + 1;
            end
        end
    end
    else begin
        fft_state <= seq_in_mode;
        out_counter_fft <= 0;
        butterfly_read_finish_r_fft <= 1'b0;
    end
end

assign compute_FFT = compute_FFT_r;

// =========================for butterfly control state========================== //

reg [2-1:0]                    bfly_state_A;
reg [16-1:0]                   out_counter_A;
reg                            butterfly_read_finish_r_A;
reg                            seq_out_finish_r_A;

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    bfly_state_A <= seq_in_mode;
    out_counter_A <= 0;
    butterfly_read_finish_r_A <= 1'b0;
    seq_out_finish_r_A <=1'b0;
    compute_A_r <= 1'b0;
end
else begin
    if (!is_fft_r) begin
        if (bfly_state_A == seq_in_mode) begin // positive
            out_counter_A <= 0;
            butterfly_read_finish_r_A <= 1'b0;
            seq_out_finish_r_A <=1'b0;
            compute_A_r <= 1'b0;
            if (butterfly_start_A) begin
                bfly_state_A <= butterfly_mode;
                compute_A_r <= 1'b1;
            end
        end
        else if (bfly_state_A == butterfly_mode) begin
            out_counter_A <= 0;
            butterfly_read_finish_r_A <= 1'b0;
            seq_out_finish_r_A <=1'b0;
            compute_A_r <= 1'b1;
            if (butterfly_indx_finish) begin
                bfly_state_A <= idle;
                butterfly_read_finish_r_A <= 1'b1;
                seq_out_finish_r_A <= 1'b0;
                compute_A_r <= 1'b0;
            end
        end
        else if (bfly_state_A == idle) begin
            out_counter_A <= 0;
            butterfly_read_finish_r_A <= 1'b0;
            seq_out_finish_r_A <=1'b0;
            compute_A_r <= 1'b0;
            if (seq_out_start_A) bfly_state_A <= seq_out_mode;
        end
        else if (bfly_state_A == seq_out_mode) begin
            butterfly_read_finish_r_A <= 1'b0;
            seq_out_finish_r_A <=1'b0;
            compute_A_r <= 1'b0;
            if (is_bypass_p2s_r) begin // outputs bu_parallelism by bu_parallelism
                if (out_counter_A == length_r-bu_parallelism) begin
                    bfly_state_A <= seq_in_mode;
                    butterfly_read_finish_r_A <= 1'b0;
                    seq_out_finish_r_A <=1'b1;
                end
                else out_counter_A <= out_counter_A+bu_parallelism;
            end
            else begin // outputs one by one
                if (out_counter_A == length_r-1) begin
                    bfly_state_A <= seq_in_mode;
                    butterfly_read_finish_r_A <= 1'b0;
                    seq_out_finish_r_A <=1'b1;
                end
                else out_counter_A <= out_counter_A+1;
            end
        end
    end
    else begin
        bfly_state_A <= seq_in_mode;
        out_counter_A <= 0;
        butterfly_read_finish_r_A <= 1'b0;
        seq_out_finish_r_A <=1'b0;
    end
end
assign seq_out_finish_A = seq_out_finish_r_A;
assign compute_A = compute_A_r;

reg [2-1:0]                    bfly_state_B;
reg [16-1:0]                   out_counter_B;
reg                            butterfly_read_finish_r_B;
reg                            seq_out_finish_r_B;

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    bfly_state_B <= seq_in_mode;
    out_counter_B <= 0;
    butterfly_read_finish_r_B <= 1'b0;
    seq_out_finish_r_B <=1'b0;
    compute_B_r <= 1'b0;
end
else begin
    if (!is_fft_r) begin
        if (bfly_state_B == seq_in_mode) begin // positive
            out_counter_B <= 0;
            butterfly_read_finish_r_B <= 1'b0;
            seq_out_finish_r_B <=1'b0;
            compute_B_r <= 1'b0;
            if (butterfly_start_B) begin
                bfly_state_B <= butterfly_mode;
                compute_B_r <= 1'b1;
            end
        end
        else if (bfly_state_B == butterfly_mode) begin
            out_counter_B <= 0;
            butterfly_read_finish_r_B <= 1'b0;
            seq_out_finish_r_B <=1'b0;
            compute_B_r <= 1'b1;
            if (butterfly_indx_finish) begin
                bfly_state_B <= idle;
                butterfly_read_finish_r_B <= 1'b1;
                seq_out_finish_r_B <= 1'b0;
                compute_B_r <= 1'b0;
            end
        end
        else if (bfly_state_B == idle) begin
            out_counter_B <= 0;
            butterfly_read_finish_r_B <= 1'b0;
            seq_out_finish_r_B <=1'b0;
            compute_B_r <= 1'b0;
            if (seq_out_start_B) bfly_state_B <= seq_out_mode;
        end
        else if (bfly_state_B == seq_out_mode) begin
            butterfly_read_finish_r_B <= 1'b0;
            seq_out_finish_r_B <=1'b0;
            compute_B_r <= 1'b0;
            if (is_bypass_p2s_r) begin // outputs bu_parallelism by bu_parallelism
                if (out_counter_B == length_r-bu_parallelism) begin
                    bfly_state_B <= seq_in_mode;
                    butterfly_read_finish_r_B <= 1'b0;
                    seq_out_finish_r_B <=1'b1;
                end
                else out_counter_B <= out_counter_B+bu_parallelism;
            end
            else begin // outputs one by one
                if (out_counter_B == length_r-1) begin
                    bfly_state_B <= seq_in_mode;
                    butterfly_read_finish_r_B <= 1'b0;
                    seq_out_finish_r_B <=1'b1;
                end
                else out_counter_B <= out_counter_B+1;
            end
        end
    end
    else begin
        bfly_state_B <= seq_in_mode;
        out_counter_B <= 0;
        butterfly_read_finish_r_B <= 1'b0;
        seq_out_finish_r_B <=1'b0;
    end
end
assign seq_out_finish_B = seq_out_finish_r_B;
assign compute_B = compute_B_r;

// =========================================================================== //
// Generate read address for different modes
// =========================================================================== //

genvar i;

wire [num_out_bits-1:0]      y_position_shift[bu_parallelism-1:0];

generate
for(i=0 ; i<bu_parallelism ; i=i+1)
begin : GENERATE_WRITE_POS_SHIFT
    assign butterfly_indxs_r[i] = butterfly_indx[( 32*i + 32-1) : (32*i)];
    assign y_position_shift[i] = butterfly_indxs_r[i][num_out_bits-1:0] + butterfly_indxs_r[i][num_out_bits+1] + butterfly_indxs_r[i][num_out_bits+2] 
        + butterfly_indxs_r[i][num_out_bits+3] + butterfly_indxs_r[i][num_out_bits+4] + butterfly_indxs_r[i][num_out_bits+5] 
        + butterfly_indxs_r[i][num_out_bits+6]+ butterfly_indxs_r[i][num_out_bits+7] + butterfly_indxs_r[i][num_out_bits];
end
endgenerate

// Generate read address for fft mode
wire [bu_parallelism*$clog2(bu_parallelism)-1:0]        fft_permute;
wire [bu_parallelism*$clog2(bu_parallelism)-1:0]        fft_recover;

generate
for(i=0 ; i<bu_parallelism ; i=i+1)
begin : GENERATE_WRITE_WIRING_FFT
    assign fft_read_addrs_A[i] = fft_read_xaddrs_r[fft_x_permute[i]];
    assign fft_read_addrs_B[i] = fft_read_xaddrs_r[fft_x_permute[i]];
    assign fft_permute[(num_out_bits*i + num_out_bits-1) : (num_out_bits*i)] = fft_read_yaddrs_r[i];
    assign fft_recover[(num_out_bits*i + num_out_bits-1) : (num_out_bits*i)] = fft_x_permute[i];
    always @(*)
        if (fft_read_yaddrs_r[0] == i) fft_x_permute[i] = 0;
        else if (fft_read_yaddrs_r[1] == i) fft_x_permute[i] = 1;
        else if (fft_read_yaddrs_r[2] == i) fft_x_permute[i] = 2;
        else if (fft_read_yaddrs_r[3] == i) fft_x_permute[i] = 3;
        else if (fft_read_yaddrs_r[4] == i) fft_x_permute[i] = 4;
        else if (fft_read_yaddrs_r[5] == i) fft_x_permute[i] = 5;
        else if (fft_read_yaddrs_r[6] == i) fft_x_permute[i] = 6;
        else if (fft_read_yaddrs_r[7] == i) fft_x_permute[i] = 7;
end

for(i=0 ; i<bu_parallelism ; i=i+1)
begin : GENERATE_WRITE_ADDR_FFT
    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        fft_read_xaddrs_r[i] <= 0;
        fft_read_yaddrs_r[i] <= 0;
    end
    else begin
        if (fft_state == seq_in_mode) begin // positive
            fft_read_xaddrs_r[i] <= 0;
            fft_read_yaddrs_r[i] <= 0;
        end
        else if (fft_state == butterfly_mode) begin
            fft_read_xaddrs_r[i] <= (butterfly_indxs_r[i] >> num_out_bits);
            fft_read_yaddrs_r[i] <= y_position_shift[i];
        end
        else if (fft_state == idle) begin
            fft_read_xaddrs_r[i] <= 0;
            fft_read_yaddrs_r[i] <= 0;
        end
        else if (fft_state == seq_out_mode) begin  
            fft_read_xaddrs_r[i] <= (out_counter_fft >> num_out_bits);
            fft_read_yaddrs_r[i] <= i;
        end
    end
end
endgenerate



// Generate read address for butterfly mode, A bank
wire [bu_parallelism*$clog2(bu_parallelism)-1:0]        bfly_permute_A;
wire [bu_parallelism*$clog2(bu_parallelism)-1:0]        bfly_recover_A;
generate
for(i=0 ; i<bu_parallelism ; i=i+1)
begin : GENERATE_WRITE_WIRING_BFLY_A
    assign bfly_read_addrs_A[i] = bfly_read_xaddrs_r_A[bfly_x_permute_A[i]];
    assign bfly_permute_A[(num_out_bits*i + num_out_bits-1) : (num_out_bits*i)] = bfly_read_yaddrs_r_A[i];
    assign bfly_recover_A[(num_out_bits*i + num_out_bits-1) : (num_out_bits*i)] = bfly_x_permute_A[i];
    always @(*)
        if (bfly_read_yaddrs_r_A[0] == i) bfly_x_permute_A[i] = 0;
        else if (bfly_read_yaddrs_r_A[1] == i) bfly_x_permute_A[i] = 1;
        else if (bfly_read_yaddrs_r_A[2] == i) bfly_x_permute_A[i] = 2;
        else if (bfly_read_yaddrs_r_A[3] == i) bfly_x_permute_A[i] = 3;
        else if (bfly_read_yaddrs_r_A[4] == i) bfly_x_permute_A[i] = 4;
        else if (bfly_read_yaddrs_r_A[5] == i) bfly_x_permute_A[i] = 5;
        else if (bfly_read_yaddrs_r_A[6] == i) bfly_x_permute_A[i] = 6;
        else if (bfly_read_yaddrs_r_A[7] == i) bfly_x_permute_A[i] = 7;
end

for(i=0 ; i<bu_parallelism ; i=i+1)
begin : GENERATE_WRITE_ADDR_BFLY_A
    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        bfly_read_xaddrs_r_A[i] <= 0;
        bfly_read_yaddrs_r_A[i] <= 0; 
    end
    else begin
        if (bfly_state_A == seq_in_mode) begin // positive
            bfly_read_xaddrs_r_A[i] <= 0;
            bfly_read_yaddrs_r_A[i] <= 0;
        end
        else if (bfly_state_A == butterfly_mode) begin
            bfly_read_xaddrs_r_A[i] <= (butterfly_indxs_r[i] >> num_out_bits);
            bfly_read_yaddrs_r_A[i] <= y_position_shift[i];
        end
        else if (bfly_state_A == idle) begin
            bfly_read_xaddrs_r_A[i] <= 0;
            bfly_read_yaddrs_r_A[i] <= 0;
        end
        else if (bfly_state_A == seq_out_mode) begin  
            bfly_read_xaddrs_r_A[i] <= (out_counter_A >> num_out_bits);
            bfly_read_yaddrs_r_A[i] <= i;
        end
    end
end
endgenerate

// Generate read address for butterfly mode, B bank
wire [bu_parallelism*$clog2(bu_parallelism)-1:0]        bfly_permute_B;
wire [bu_parallelism*$clog2(bu_parallelism)-1:0]        bfly_recover_B;
generate
for(i=0 ; i<bu_parallelism ; i=i+1)
begin : GENERATE_WRITE_WIRING_BFLY_B
    assign bfly_read_addrs_B[i] = bfly_read_xaddrs_r_B[bfly_x_permute_B[i]];
    assign bfly_permute_B[(num_out_bits*i + num_out_bits-1) : (num_out_bits*i)] = bfly_read_yaddrs_r_B[i];
    assign bfly_recover_B[(num_out_bits*i + num_out_bits-1) : (num_out_bits*i)] = bfly_x_permute_B[i];
    always @(*)
        if (bfly_read_yaddrs_r_B[0] == i) bfly_x_permute_B[i] = 0;
        else if (bfly_read_yaddrs_r_B[1] == i) bfly_x_permute_B[i] = 1;
        else if (bfly_read_yaddrs_r_B[2] == i) bfly_x_permute_B[i] = 2;
        else if (bfly_read_yaddrs_r_B[3] == i) bfly_x_permute_B[i] = 3;
        else if (bfly_read_yaddrs_r_B[4] == i) bfly_x_permute_B[i] = 4;
        else if (bfly_read_yaddrs_r_B[5] == i) bfly_x_permute_B[i] = 5;
        else if (bfly_read_yaddrs_r_B[6] == i) bfly_x_permute_B[i] = 6;
        else if (bfly_read_yaddrs_r_B[7] == i) bfly_x_permute_B[i] = 7;
end

for(i=0 ; i<bu_parallelism ; i=i+1)
begin : GENERATE_WRITE_ADDR_BFLY_B
    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        bfly_read_xaddrs_r_B[i] <= 0;
        bfly_read_yaddrs_r_B[i] <= 0; 
    end
    else begin
        if (bfly_state_B == seq_in_mode) begin // positive
            bfly_read_xaddrs_r_B[i] <= 0;
            bfly_read_yaddrs_r_B[i] <= 0;
        end
        else if (bfly_state_B == butterfly_mode) begin
            bfly_read_xaddrs_r_B[i] <= (butterfly_indxs_r[i] >> num_out_bits);
            bfly_read_yaddrs_r_B[i] <= y_position_shift[i];
        end
        else if (bfly_state_B == idle) begin
            bfly_read_xaddrs_r_B[i] <= 0;
            bfly_read_yaddrs_r_B[i] <= 0;
        end
        else if (bfly_state_B == seq_out_mode) begin  
            bfly_read_xaddrs_r_B[i] <= (out_counter_B >> num_out_bits);
            bfly_read_yaddrs_r_B[i] <= i;
        end
    end
end
endgenerate

// Generate final read address
generate
for(i=0 ; i<bu_parallelism ; i=i+1)
begin : GENERATE_WRITE_WIRING_FINAL
    assign read_addr_A[( 32*i + 32-1) : (32*i)] = is_fft_r? fft_read_addrs_A[i] : bfly_read_addrs_A[i];
    assign read_addr_B[( 32*i + 32-1) : (32*i)] = is_fft_r? fft_read_addrs_B[i] : bfly_read_addrs_B[i];
end
endgenerate

assign permute_A = is_fft_r? fft_permute : bfly_permute_A;
assign permute_B = is_fft_r? fft_permute : bfly_permute_B;
assign recover_A = is_fft_r? fft_recover : bfly_recover_A;
assign recover_B = is_fft_r? fft_recover : bfly_recover_B;

// =========================================================================== //
// Generate read address for Dn_vld
// =========================================================================== //

// ====================dn_vld for butterfly============================== //
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    bfly_read_vld_r_A <= 1'b0;
    bfly_enable_p2s_r_A <= 1'b0;
end
else begin
    if (bfly_state_A == seq_in_mode) begin // positive
        bfly_read_vld_r_A <= 1'b0;
        bfly_enable_p2s_r_A <= 1'b0;
    end
    else if (bfly_state_A == butterfly_mode) begin
        bfly_read_vld_r_A <= butterfly_vld; 
        bfly_enable_p2s_r_A <= 1'b0;
    end
    else if (bfly_state_A == idle) begin 
        bfly_read_vld_r_A <= 1'b0; 
        bfly_enable_p2s_r_A <= 1'b0;
    end
    else if (bfly_state_A == seq_out_mode) begin
        bfly_enable_p2s_r_A <= 1'b1;
        if (is_bypass_p2s_r) begin 
            bfly_read_vld_r_A <= 1'b1;
        end else begin
            if (out_counter_A[num_out_bits-1:0] == {num_out_bits{1'b0}}) bfly_read_vld_r_A <= 1'b1;
            else bfly_read_vld_r_A <= 1'b0;
        end
    end
end

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    bfly_read_vld_r_B <= 1'b0;
    bfly_enable_p2s_r_B <= 1'b0;
end
else begin
    if (bfly_state_B == seq_in_mode) begin // positive
        bfly_read_vld_r_B <= 1'b0;
        bfly_enable_p2s_r_B <= 1'b0;
    end
    else if (bfly_state_B == butterfly_mode) begin
        bfly_read_vld_r_B <= butterfly_vld; 
        bfly_enable_p2s_r_B <= 1'b0;
    end
    else if (bfly_state_B == idle) begin 
        bfly_read_vld_r_B <= 1'b0; 
        bfly_enable_p2s_r_B <= 1'b0;
    end
    else if (bfly_state_B == seq_out_mode) begin
        bfly_enable_p2s_r_B <= 1'b1;
        if (is_bypass_p2s_r) begin 
            bfly_read_vld_r_B <= 1'b1;
        end else begin
            if (out_counter_B[num_out_bits-1:0] == {num_out_bits{1'b0}}) bfly_read_vld_r_B <= 1'b1;
            else bfly_read_vld_r_B <= 1'b0;
        end
    end
end

// ====================dn_vld for FFT============================== //
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    fft_read_vld_r <= 1'b0;
    fft_enable_p2s_r <= 1'b0;
end
else begin
    if (fft_state == seq_in_mode) begin // positive
        fft_read_vld_r <= 1'b0;
        fft_enable_p2s_r <= 1'b0;
    end
    else if (fft_state == butterfly_mode) begin
        fft_read_vld_r <= butterfly_vld; 
        fft_enable_p2s_r <= 1'b0;
    end
    else if (fft_state == idle) begin 
        fft_read_vld_r <= 1'b0; 
        fft_enable_p2s_r <= 1'b0;
    end
    else if (fft_state == seq_out_mode) begin
        fft_enable_p2s_r <= 1'b1;
        if (is_bypass_p2s_r) begin 
            fft_read_vld_r <= 1'b1;
        end else begin
            if (out_counter_fft[num_out_bits-1:0] == {num_out_bits{1'b0}}) fft_read_vld_r <= 1'b1;
            else fft_read_vld_r <= 1'b0;
        end
    end
end


// ====================dn_vld for final============================== //

assign enable_p2s_fft = fft_enable_p2s_r;
assign enable_p2s_A = bfly_enable_p2s_r_A;
assign enable_p2s_B = bfly_enable_p2s_r_B;

assign read_vld_A = is_fft_r ? fft_read_vld_r : bfly_read_vld_r_A;
assign read_vld_B = is_fft_r ? fft_read_vld_r : bfly_read_vld_r_B;
assign butterfly_read_finish = butterfly_read_finish_r_fft | butterfly_read_finish_r_B | butterfly_read_finish_r_A;

endmodule
