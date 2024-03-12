`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: butterfly_s2p
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


module butterfly_s2p_opt
# (
  // The data width of input data
  parameter data_width = 16,
  // The data width utilized for accumulated results
  parameter num_output = 8
)
(
  input  wire                        clk,
  input  wire                        rst_n,
  input  wire  [data_width-1:0]  up_dat,
  input  wire                        up_vld,
  input  wire  [16-1:0]          length,
  output wire                        up_rdy,
  output wire  [num_output*data_width-1:0]      dn_dat,
  output wire                        dn_vld,
  input wire                        dn_rdy
);

localparam num_out_bits = $clog2(num_output);

/////////////////////Timing//////////////////////////
reg  [16-1:0]                          length_r;
always @(posedge clk)
begin
    length_r <= length;
end

reg  [data_width-1:0]  up_dat_r;
reg                        up_vld_r;

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    up_dat_r <= 0;
    up_vld_r <= 0;
end
else begin
    up_dat_r <= up_dat;
    up_vld_r <= up_vld;
end
/////////////////////Timing//////////////////////////

genvar i;

reg  [16-1:0]    up_counter;
reg  [data_width-1:0]    up_dats_r[num_output-1:0];
reg                      dn_vld_r;
reg                      dn_vld_timing;

assign up_rdy = dn_rdy; // Need to improve to present backpressure
assign dn_vld = dn_vld_timing;

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    up_counter <= 0;
end
else if (up_vld_r) begin
    if (up_counter == length_r - 1) up_counter <=0;
    else up_counter <= up_counter + 1;
end

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    dn_vld_r <= 0;
end
else if (up_counter[num_out_bits-1:0] == {num_out_bits{1'b1}}) begin
    dn_vld_r <= 1'b1;
end
else begin
    dn_vld_r <= 1'b0;
end

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    dn_vld_timing <= 0;
end
else begin
    dn_vld_timing <= dn_vld_r;
end

reg [num_out_bits-1:0] shift_pos;
// wire [32-1:0] insert_pos;
// assign shift_pos = up_counter[num_out_bits-1:0] + up_counter[num_out_bits] + up_counter[num_out_bits+1] + up_counter[num_out_bits+2] 
//     + up_counter[num_out_bits+3] + up_counter[num_out_bits+4] + up_counter[num_out_bits+5] + up_counter[num_out_bits+6]+ up_counter[num_out_bits+7];  
// assign insert_pos = up_counter[num_out_bits-1:0] + up_counter[2*num_out_bits-1:num_out_bits];

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    shift_pos <= 0;
end
else begin
    shift_pos <= up_counter[num_out_bits-1:0] + up_counter[num_out_bits] + up_counter[num_out_bits+1] + up_counter[num_out_bits+2] 
    + up_counter[num_out_bits+3] + up_counter[num_out_bits+4] + up_counter[num_out_bits+5] + up_counter[num_out_bits+6]+ up_counter[num_out_bits+7];
end


reg  [data_width-1:0]  up_dat_timing;
reg                        up_vld_timing;

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    up_dat_timing <= 0;
    up_vld_timing <= 0;
end
else begin
    up_dat_timing <= up_dat_r;
    up_vld_timing <= up_vld_r;
end

generate
for(i=0 ; i<num_output ; i=i+1)
begin : GENERATE_SHIFT_REG
    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        up_dats_r[i] <= 0;
    end
    else if (up_vld_timing & (shift_pos[num_out_bits-1:0] == i)) begin
        up_dats_r[i] <= up_dat_timing;
    end
end

for(i=0 ; i<num_output ; i=i+1)
begin : GENERATE_UP_DAT_WIRING
    assign dn_dat[( data_width*i + data_width-1) : (data_width*i)] = up_dats_r[i];
end

endgenerate


endmodule
