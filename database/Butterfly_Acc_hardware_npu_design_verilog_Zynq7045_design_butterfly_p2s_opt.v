`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: butterfly_p2s
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


module butterfly_p2s_opt
# (
  // The data width of input data
  parameter data_width = 16,
  // The data width utilized for accumulated results
  parameter num_output = 8
)
(
  input  wire                        clk,
  input  wire                        rst_n,
  input  wire  [num_output*data_width-1:0]  up_dat,
  input  wire                        up_vld,
  input  wire                    by_pass,
  output wire                        up_rdy,
  output wire  [num_output*data_width-1:0]      dn_parallel_dat,
  output wire                        dn_parallel_vld,
  input wire                        dn_parallel_rdy,
  output wire  [data_width-1:0]      dn_serial_dat,
  output wire                        dn_serial_vld,
  input wire                        dn_serial_rdy
);

localparam num_out_bits = $clog2(num_output);

/////////////////////Timing//////////////////////////

reg                           by_pass_timing;
always @(posedge clk)
begin
    by_pass_timing <= by_pass;
end
/////////////////////Timing//////////////////////////

genvar i;

reg  [32-1:0]    indx_counter;
reg  [data_width-1:0]    up_dats_r[num_output-1:0];
reg                      dn_serial_vld_r;
reg  [$clog2(num_output)-1:0]    out_counter;

reg  [num_output*data_width-1:0]      dn_parallel_dat_r;
reg                        dn_parallel_vld_r;

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    dn_parallel_dat_r <= 0;
    dn_parallel_vld_r <= 0;
end
else if (by_pass_timing) begin
    dn_parallel_dat_r <= up_dat;
    dn_parallel_vld_r <= up_vld;
end
else begin
    dn_parallel_dat_r <= 0;
    dn_parallel_vld_r <= 0;
end

assign dn_parallel_dat = dn_parallel_dat_r;
assign dn_parallel_vld = dn_parallel_vld_r;

assign up_rdy = by_pass_timing? dn_parallel_rdy : dn_serial_rdy; // Need to improve to present backpressure

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    indx_counter <= 0;
end
else if (dn_serial_vld_r) begin
    indx_counter <= indx_counter + 1;
end
else begin
    indx_counter <= indx_counter;
end

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    dn_serial_vld_r <= 0;
    out_counter <= 0;
end
else if (up_vld) begin
    dn_serial_vld_r <= 1'b1;
    out_counter <= {$clog2(num_output){1'b1}};
end
else if (out_counter > 0) begin
    dn_serial_vld_r <= 1'b1;
    out_counter <= out_counter - 1;
end
else begin
    dn_serial_vld_r <= 1'b0;
end

///////////////////Timing///////////////////

reg       dn_serial_vld_r_timing[2-1:0];
reg       by_pass_r[2-1:0];

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    dn_serial_vld_r_timing[0] <= 0;
    dn_serial_vld_r_timing[1] <= 0;
    by_pass_r[0] <= 1'b0;
    by_pass_r[1] <= 1'b0;
end
else begin
    dn_serial_vld_r_timing[0] <= dn_serial_vld_r;
    dn_serial_vld_r_timing[1] <= dn_serial_vld_r_timing[0];
    by_pass_r[0] <= by_pass_timing;
    by_pass_r[1] <= by_pass_r[0]; // functional correctness
end


assign dn_serial_vld = dn_serial_vld_r_timing[1] & (!by_pass_r[1]);

reg [num_out_bits-1:0] shift_pos;
// wire [32-1:0] insert_pos;
// assign shift_pos = indx_counter[num_out_bits-1:0] + indx_counter[num_out_bits] + indx_counter[num_out_bits+1] + indx_counter[num_out_bits+2] 
//     + indx_counter[num_out_bits+3] + indx_counter[num_out_bits+4] + indx_counter[num_out_bits+5] + indx_counter[num_out_bits+6]+ indx_counter[num_out_bits+7]; // bitcount and mod opentation 
// assign insert_pos = indx_counter[num_out_bits-1:0] + indx_counter[2*num_out_bits-1:num_out_bits];

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    shift_pos <= 0;
end
else begin
    shift_pos <= indx_counter[num_out_bits-1:0] + indx_counter[num_out_bits] + indx_counter[num_out_bits+1] + indx_counter[num_out_bits+2] 
    + indx_counter[num_out_bits+3] + indx_counter[num_out_bits+4] + indx_counter[num_out_bits+5] + indx_counter[num_out_bits+6]+ indx_counter[num_out_bits+7];
end

generate
for(i=0 ; i<num_output ; i=i+1)
begin : GENERATE_SHIFT_REG
    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        up_dats_r[i] <= 0;
    end
    else if (up_vld & (!by_pass_timing)) begin
        up_dats_r[i] <= up_dat[( data_width*i + data_width-1) : (data_width*i)];
    end
end

endgenerate

///////////////////Timing///////////////////
reg  [data_width-1:0]    up_dats_timing[num_output-1:0];

generate
for(i=0 ; i<num_output ; i=i+1)
begin : GENERATE_SHIFT_REG_TIMING
    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        up_dats_timing[i] <= 0;
    end
    else begin
        up_dats_timing[i] <= up_dats_r[i];
    end
end
endgenerate


reg  [data_width-1:0]      dn_serial_dat_r;
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    dn_serial_dat_r <= 0;
end
else begin
    dn_serial_dat_r <= up_dats_timing[shift_pos];
end

// assign dn_serial_dat = up_dats_r[shift_pos];
assign dn_serial_dat = dn_serial_dat_r;
endmodule
