//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: qkv_fanout
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


module tree_fanout_double
# (
  parameter in_w = 128 * 8
)
(
  input                    clk,
  input                    rst_n,
  input                     up_vld,
  input     [in_w-1:0]      up_dat,
  output                    up_rdy,

  output                   dn_vld,
  input                    dn_rdy,
  output   [2*in_w-1:0]     dn_dat
);

assign up_rdy = dn_rdy;

reg [in_w-1:0] up_dat_r;
reg up_vld_r;
reg [in_w-1:0] up_dats[2-1 : 0];
reg [in_w-1:0] up_vlds[2-1 : 0];



always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    up_dat_r <= 0;
    up_vld_r <= 0;
end
else begin
    up_dat_r <= up_dat;
    up_vld_r <= up_vld;
end

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    up_dats[0] <= 0;
    up_vlds[0] <= 0;
end
else begin
    up_dats[0] <= up_dat_r;
    up_vlds[0] <= up_vld_r;
end

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    up_dats[1] <= 0;
    up_vlds[1] <= 0;
end
else begin
    up_dats[1] <= up_dat_r;
    up_vlds[1] <= up_vld_r;
end

assign dn_dat = {up_dats[0], up_dats[1]};
assign dn_vld = up_vlds[0];

endmodule
