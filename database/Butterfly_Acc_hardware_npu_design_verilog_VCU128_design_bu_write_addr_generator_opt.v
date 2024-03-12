`timescale 1ns / 1ps
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


module bu_write_addr_generator_opt
# (
  // The data width of input data
  parameter data_width = 16,
  // The data width utilized for accumulated results
  parameter bu_parallelism = 8,
  parameter depth_per_ram = 512,
  parameter write_addr_width = $clog2(bu_parallelism)
)
(
  input  wire                        clk,
  input  wire                        rst_n,
  // Control signal
  input  wire                        is_fft,
  input  wire                        butterfly_finish, // Finish signal from butterfly engine
  
  output wire                        butterfly_start_A, // Output to both bu_read_addr_generator and butterfly_indx_generator
  output wire                        butterfly_start_B, // Output to both bu_read_addr_generator and butterfly_indx_generator
  output wire                        butterfly_start_fft, // Output to both bu_read_addr_generator and butterfly_indx_generator

  output  wire                       seq_out_start_A, // Output to both bu_read_addr_generator
  output  wire                       seq_out_start_B, // Output to both bu_read_addr_generator
  output  wire                       seq_out_start_fft, // Output to both bu_read_addr_generator
  
  input  wire                        seq_out_finish_A, // Get from  both bu_read_addr_generator
  input  wire                        seq_out_finish_B, // Get from  both bu_read_addr_generator
  input  wire  [16-1:0]              length,
  // In and Outputs
  input  wire                        up_vld,
  input  wire                        bu_vld, // Get from from butterfly unit
  input  wire                        fft_vld, // Get from from butterfly unit
  input wire  [32*bu_parallelism-1:0]      bu_indx_A, // Get from from butterfly unit
  input wire  [32*bu_parallelism-1:0]      bu_indx_B, // Get from from butterfly unit
  output wire                        write_vld_A,
  output wire                        write_vld_B,
  output wire  [32*bu_parallelism-1:0]      write_addr_A,
  output wire  [32*bu_parallelism-1:0]      write_addr_B
);

localparam seq_in_mode = 2'b00;
localparam idle_mode = 2'b10;
localparam seq_out_mode = 2'b01;
localparam butterfly_mode = 2'b11;
localparam num_out_bits = $clog2(bu_parallelism);
localparam num_ram_bits = $clog2(depth_per_ram);

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
/////////////////////Timing//////////////////////////

genvar i;

reg [2-1:0]                    fft_state;
reg [16-1:0]                   in_counter_fft;
reg                            butterfly_start_r_fft;
reg                            seq_out_start_r_fft;


reg [2-1:0]                    bfly_state_A;
reg [16-1:0]                   in_counter_A;
reg                            butterfly_start_r_A;
reg                            seq_out_start_r_A;

reg [2-1:0]                    bfly_state_B;
reg [16-1:0]                   in_counter_B;
reg                            butterfly_start_r_B;
reg                            seq_out_start_r_B;

reg [32-1:0]                   bfly_write_addrs_r_A[bu_parallelism-1:0];
reg [32-1:0]                   bfly_write_addrs_r_B[bu_parallelism-1:0];


reg [32-1:0]                   fft_write_addrs_r_A[bu_parallelism-1:0];
reg [32-1:0]                   fft_write_addrs_r_B[bu_parallelism-1:0];

reg [32-1:0]                   fft_write_addrs_bias_pingpong;

wire [32-1:0]                  butterfly_indxs_r_A[bu_parallelism-1:0];
wire [32-1:0]                  butterfly_indxs_r_B[bu_parallelism-1:0];

reg                            bfly_write_vld_r_A;
reg                            bfly_write_vld_r_B;

reg                            fft_write_vld_r_A;
reg                            fft_write_vld_r_B;

assign  butterfly_start_A = butterfly_start_r_A;
assign  butterfly_start_B = butterfly_start_r_B;
assign  butterfly_start_fft = butterfly_start_r_fft;

assign  seq_out_start_A = seq_out_start_r_A;
assign  seq_out_start_B = seq_out_start_r_B;
assign  seq_out_start_fft = seq_out_start_r_fft;

// =========================================================================== //
// Control state
// =========================================================================== //

// =========================for fft control state========================== //
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    fft_state <= seq_in_mode;
    in_counter_fft <= 0;
    butterfly_start_r_fft <= 1'b0;
    seq_out_start_r_fft <=1'b0;
end
else begin
    if (is_fft_r) begin
        if (fft_state == seq_in_mode) begin // positive
            butterfly_start_r_fft <= 1'b0;
            seq_out_start_r_fft <= 1'b0;
            if (up_vld) begin
                if (in_counter_fft == length_r - bu_parallelism)begin
                    in_counter_fft <= 0;
                    fft_state <= butterfly_mode;
                    butterfly_start_r_fft <= 1'b1;
                    seq_out_start_r_fft <= 1'b0;
                end
                else in_counter_fft <= in_counter_fft + bu_parallelism;
            end
        end
        else if (fft_state == butterfly_mode) begin
            butterfly_start_r_fft <= 1'b0;
            seq_out_start_r_fft <= 1'b0; 
            if (butterfly_finish) begin
                fft_state <= seq_in_mode;
                butterfly_start_r_fft <= 1'b0;
                seq_out_start_r_fft <= 1'b1;
            end
        end
    end
    else begin
        fft_state <= seq_in_mode;
        in_counter_fft <= 0;
        butterfly_start_r_fft <= 1'b0;
        seq_out_start_r_fft <=1'b0;
    end
end


// =========================for bfly control state A========================== //
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    bfly_state_A <= seq_in_mode;
    in_counter_A <= 0;
    butterfly_start_r_A <= 1'b0;
    seq_out_start_r_A <=1'b0;
end
else begin
    if (!is_fft_r) begin
        if (bfly_state_A == seq_in_mode) begin // positive
            butterfly_start_r_A <= 1'b0;
            seq_out_start_r_A <= 1'b0;
            if (up_vld) begin
                if (in_counter_A == length_r - bu_parallelism)begin
                    in_counter_A <= 0;
                    bfly_state_A <= butterfly_mode;
                    butterfly_start_r_A <= 1'b1;
                    seq_out_start_r_A <= 1'b0;
                end
                else in_counter_A <= in_counter_A + bu_parallelism;
            end
        end
        else if (bfly_state_A == butterfly_mode) begin
            butterfly_start_r_A <= 1'b0;
            seq_out_start_r_A <= 1'b0; 
            if (butterfly_finish) begin
                bfly_state_A <= seq_out_mode;
                butterfly_start_r_A <= 1'b0;
                seq_out_start_r_A <= 1'b1;
            end
        end
        else if (bfly_state_A == seq_out_mode) begin
            butterfly_start_r_A <= 1'b0;
            seq_out_start_r_A <= 1'b0; 
            if (seq_out_finish_A) begin
                bfly_state_A <= seq_in_mode;
            end
        end
    end
    else begin
        bfly_state_A <= seq_in_mode;
        in_counter_A <= 0;
        butterfly_start_r_A <= 1'b0;
        seq_out_start_r_A <=1'b0;
    end
end

// =========================for bfly control state B========================== //

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    bfly_state_B <= idle_mode;
    in_counter_B <= 0;
    butterfly_start_r_B <= 1'b0;
    seq_out_start_r_B <=1'b0;
end
else begin
    if (!is_fft_r) begin
        if (bfly_state_B == idle_mode) begin // idle state when the pipeline is imbalanced
            butterfly_start_r_B <= 1'b0;
            seq_out_start_r_B <= 1'b0;
            if (butterfly_start_r_A) begin
                bfly_state_B <= seq_in_mode;
            end
            else if (seq_out_start_r_A) begin
                bfly_state_B <= butterfly_mode;
                butterfly_start_r_B <= 1'b1;
                seq_out_start_r_B <= 1'b0;
            end
            else if (seq_out_finish_A) begin
                bfly_state_B <= seq_out_mode;
                butterfly_start_r_B <= 1'b0;
                seq_out_start_r_B <= 1'b1;
            end
        end
        else if (bfly_state_B == seq_in_mode) begin // positive
            butterfly_start_r_B <= 1'b0;
            seq_out_start_r_B <= 1'b0;
            if (up_vld) begin
                if (in_counter_B == length_r - bu_parallelism)begin
                    in_counter_B <= 0;
                    // make sure the compute of A is complete
                    if ((bfly_state_A != butterfly_mode) | seq_out_start_r_A) begin 
                        bfly_state_B <= butterfly_mode;
                        butterfly_start_r_B <= 1'b1;
                        seq_out_start_r_B <= 1'b0;
                    end
                    else begin
                        bfly_state_B <= idle_mode;
                    end
                end
                else in_counter_B <= in_counter_B + bu_parallelism;
            end
        end
        else if (bfly_state_B == butterfly_mode) begin
            butterfly_start_r_B <= 1'b0;
            seq_out_start_r_B <= 1'b0; 
            if (butterfly_finish) begin
                // make sure the output transfer of A is complete
                if ((bfly_state_A != seq_out_mode) | seq_out_finish_A) begin 
                    bfly_state_B <= seq_out_mode;
                    butterfly_start_r_B <= 1'b0;
                    seq_out_start_r_B <= 1'b1;
                end
                else begin
                    bfly_state_B <= idle_mode;
                end
            end
        end
        else if (bfly_state_B == seq_out_mode) begin
            butterfly_start_r_B <= 1'b0;
            seq_out_start_r_B <= 1'b0; 
            if (seq_out_finish_B) begin
                // make sure the input transfer of A is complete
                if ((bfly_state_A != seq_in_mode) | butterfly_start_r_A) begin 
                    bfly_state_B <= seq_in_mode;
                end
                else begin
                    bfly_state_B <= idle_mode;
                end
                
            end
        end
    end
    else begin
        bfly_state_B <= idle_mode;
        in_counter_B <= 0;
        butterfly_start_r_B <= 1'b0;
        seq_out_start_r_B <=1'b0;
    end
end


// =========================================================================== //
// Generate write address for butterfly mode
// =========================================================================== //

generate

for(i=0 ; i<bu_parallelism ; i=i+1)
begin : GENERATE_WRITE_WIRING
    assign butterfly_indxs_r_A[i] = bu_indx_A[( 32*i + 32-1) : (32*i)];
    assign butterfly_indxs_r_B[i] = bu_indx_B[( 32*i + 32-1) : (32*i)];
end

for(i=0 ; i<bu_parallelism ; i=i+1)
begin : GENERATE_WRITE_ADDR_A
    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        bfly_write_addrs_r_A[i] <= 0; 
    end
    else begin
        if (bfly_state_A == seq_in_mode) begin // positive
            bfly_write_addrs_r_A[i] <= (in_counter_A >> num_out_bits);
        end
        else if (bfly_state_A == butterfly_mode) begin
            bfly_write_addrs_r_A[i] <= butterfly_indxs_r_A[i];
        end
        else if (bfly_state_A == seq_out_mode) begin  
            bfly_write_addrs_r_A[i] <= 0;
        end
    end
end

endgenerate


generate

for(i=0 ; i<bu_parallelism ; i=i+1)
begin : GENERATE_WRITE_ADDR_B
    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        bfly_write_addrs_r_B[i] <= 0; 
    end
    else begin
        if (bfly_state_B == seq_in_mode) begin // positive
            bfly_write_addrs_r_B[i] <= (in_counter_B >> num_out_bits);
        end
        else if (bfly_state_B == butterfly_mode) begin
            bfly_write_addrs_r_B[i] <= butterfly_indxs_r_B[i];
        end
        else if (bfly_state_B == seq_out_mode) begin  
            bfly_write_addrs_r_B[i] <= 0;
        end
    end
end

endgenerate




// =========================================================================== //
// Generate write address for FFT mode
// =========================================================================== //

/*
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    fft_write_addrs_bias_pingpong <= 0; 
end
else begin
    if (seq_out_start_r_fft) begin // Start pingpong when the butterfly of A finish
        fft_write_addrs_bias_pingpong <= fft_write_addrs_bias_pingpong + (length_r>>num_out_bits);
    end
    else begin
        fft_write_addrs_bias_pingpong <= fft_write_addrs_bias_pingpong - (length_r>>num_out_bits);
    end
end
*/

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    fft_write_addrs_bias_pingpong <= 0; 
end
else begin
    if (seq_out_start_r_fft) begin // Start pingpong when the butterfly of A finish
        if (fft_write_addrs_bias_pingpong[num_ram_bits]) fft_write_addrs_bias_pingpong <= 0;
        else fft_write_addrs_bias_pingpong <= depth_per_ram>>num_out_bits;
    end
    else begin
        fft_write_addrs_bias_pingpong <= fft_write_addrs_bias_pingpong;
    end
end

generate

for(i=0 ; i<bu_parallelism ; i=i+1)
begin : GENERATE_WRITE_WIRING_AB
    assign write_addr_A[( 32*i + 32-1) : (32*i)] = is_fft_r? fft_write_addrs_r_A[i] : bfly_write_addrs_r_A[i];
    assign write_addr_B[( 32*i + 32-1) : (32*i)] = is_fft_r? fft_write_addrs_r_B[i] : bfly_write_addrs_r_B[i];
end

for(i=0 ; i<bu_parallelism ; i=i+1)
begin : GENERATE_WRITE_ADDR
    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        fft_write_addrs_r_A[i] <= 0; 
        fft_write_addrs_r_B[i] <= 0; 
    end
    else begin
        if (fft_state == seq_in_mode) begin // positive
            fft_write_addrs_r_A[i] <= (in_counter_fft >> num_out_bits) + fft_write_addrs_bias_pingpong;
            fft_write_addrs_r_B[i] <= (in_counter_fft >> num_out_bits) + fft_write_addrs_bias_pingpong;
        end
        else if (fft_state == butterfly_mode) begin
            fft_write_addrs_r_A[i] <= butterfly_indxs_r_A[i] + fft_write_addrs_bias_pingpong;
            fft_write_addrs_r_B[i] <= butterfly_indxs_r_B[i] + fft_write_addrs_bias_pingpong;
        end
    end
end

endgenerate



// =========================================================================== //
// Generate write address for Dn_vld
// =========================================================================== //

assign write_vld_A = is_fft_r? fft_write_vld_r_A : bfly_write_vld_r_A;
assign write_vld_B = is_fft_r? fft_write_vld_r_B : bfly_write_vld_r_B;

// ====================dn_vld for butterfly============================== //
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    bfly_write_vld_r_A <= 1'b0; 
end
else begin
    if (!is_fft_r) begin
        if (bfly_state_A == seq_in_mode) begin // positive
            bfly_write_vld_r_A <= up_vld; 
        end
        else if (bfly_state_A == butterfly_mode) begin
            bfly_write_vld_r_A <= bu_vld; 
        end
        else begin 
            bfly_write_vld_r_A <= 1'b0; 
        end
    end
    else begin
        bfly_write_vld_r_A <= 1'b0; 
    end
end


always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    bfly_write_vld_r_B <= 1'b0; 
end
else begin
    if (!is_fft_r) begin
        if (bfly_state_B == seq_in_mode) begin // positive
            bfly_write_vld_r_B <= up_vld; 
        end
        else if (bfly_state_B == butterfly_mode) begin
            bfly_write_vld_r_B <= bu_vld; 
        end
        else begin 
            bfly_write_vld_r_B <= 1'b0; 
        end
    end
    else begin
        bfly_write_vld_r_B <= 1'b0;
    end
end


// ====================dn_vld for fft================================= //

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    fft_write_vld_r_A <= 1'b0;
    fft_write_vld_r_B <= 1'b0;
end
else begin
        if (is_fft_r) begin
        if (fft_state == seq_in_mode) begin // positive
            fft_write_vld_r_A <= up_vld; 
            fft_write_vld_r_B <= up_vld; 
        end
        else if (fft_state == butterfly_mode) begin
            fft_write_vld_r_A <= fft_vld; 
            fft_write_vld_r_B <= fft_vld;
        end
        else begin 
            fft_write_vld_r_A <= 1'b0; 
            fft_write_vld_r_B <= 1'b0; 
        end
    end
    else begin
        fft_write_vld_r_A <= 1'b0;
        fft_write_vld_r_B <= 1'b0;
    end
end



endmodule
