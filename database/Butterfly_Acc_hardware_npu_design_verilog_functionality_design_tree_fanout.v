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


module tree_fanout
# (
  parameter in_w = 128 * 8,
  parameter fanout_factor = 3
)
(
  input                    clk,
  input                    rst_n,
  input                     up_vld,
  input     [in_w-1:0]      up_dat,
  output                    up_rdy,

  output                   dn_vld,
  input                    dn_rdy,
  output   [fanout_factor*in_w-1:0]     dn_dat
);

assign up_rdy = dn_rdy;

reg [in_w-1:0] up_dats[fanout_factor-1 : 0][fanout_factor-1 : 0];
reg [in_w-1:0] up_vlds[fanout_factor-1 : 0][fanout_factor-1 : 0];
reg dn_vld_r;
wire [fanout_factor*in_w-1:0] dn_dat_w;
reg [fanout_factor*in_w-1:0] dn_dat_r;

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    up_dats[0][0] <= 0;
    up_vlds[0][0] <= 0;
end
else begin
    up_dats[0][0] <= up_dat;
    up_vlds[0][0] <= up_vld;
end

genvar i;
genvar j;

generate
for(j=1; j<fanout_factor; j=j+1)
begin : FIRST_ROW_PIPELINING
    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        up_dats[0][j] <= 0;
        up_vlds[0][j] <= 0;
    end
    else begin
        up_dats[0][j] <= up_dats[0][j-1];
        up_vlds[0][j] <= up_vlds[0][j-1];
    end
end
endgenerate

generate
for(i=1; i<fanout_factor; i=i+1)
begin : ROW_LOOP
    for(j=i; j<fanout_factor; j=j+1)
    begin : COLUMN_LOOP
        always @(posedge clk or negedge rst_n)
        if(!rst_n) begin
            up_dats[i][j] <= 0;
            up_vlds[i][j] <= 0;
        end
        else begin
            up_dats[i][j] <= up_dats[i-1][j-1];
            up_vlds[i][j] <= up_vlds[i-1][j-1];
        end
    end
end
endgenerate

generate
for(i=0; i<fanout_factor; i=i+1)
begin : GENERATE_OUTPUTS
    assign dn_dat_w[(in_w*i + in_w-1) : (in_w*i)] = up_dats[i][fanout_factor-1];
end
endgenerate

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    dn_vld_r <= 0;
    dn_dat_r <= 0;
end
else begin
    dn_vld_r <= up_vlds[0][fanout_factor-1];
    dn_dat_r <= dn_dat_w;
end

assign dn_vld = dn_vld_r;
assign dn_dat = dn_dat_r;

endmodule
