//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: reg_timing
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


module reg_timing
# (
  parameter w = 32
)
(
  input           clk,
  input           rst_n,
  input           up_vld,
  input   [w-1:0] up_dat,
  output          up_rdy,
  output          dn_vld,
  output  [w-1:0] dn_dat,
  input           dn_rdy
); // sif_retime

localparam cw = w/8;

reg           up_bank;
reg           dn_bank [cw-1:0]/* synthesis preserve */;
reg   [w-1:0] bank0_data;
reg           bank0_valid;
reg   [w-1:0] bank1_data;
reg           bank1_valid;

// up stream
assign up_rdy = ~(bank0_valid & bank1_valid);

always @(posedge clk or negedge rst_n)
  if(!rst_n)
    up_bank <= 1'b0;
  else if(up_vld & up_rdy)
    up_bank <= ~up_bank;

// bank 0
always @(posedge clk or negedge rst_n)
  if(!rst_n)
    bank0_valid <= 1'b0;
  else if(up_vld & up_rdy & ~up_bank)
    bank0_valid <= 1'b1;
  else if(dn_vld & dn_rdy & ~dn_bank[0])
    bank0_valid <= 1'b0;

always @(posedge clk or negedge rst_n)
    if(!rst_n)
        bank0_data <= 0;
    else if(up_vld & up_rdy & ~up_bank)
        bank0_data <= up_dat;

// bank 1
always @(posedge clk or negedge rst_n)
  if(!rst_n)
    bank1_valid <= 1'b0;
  else if(up_vld & up_rdy & up_bank)
    bank1_valid <= 1'b1;
  else if(dn_vld & dn_rdy & dn_bank[0])
    bank1_valid <= 1'b0;

always @(posedge clk or negedge rst_n)
    if(!rst_n)
        bank1_data <= 0;
    else if(up_vld & up_rdy & up_bank)
        bank1_data <= up_dat;

genvar j;
generate
// down stream
for(j=0;j<cw;j=j+1) begin:CPY_DN_BANK0
always @(posedge clk or negedge rst_n)
  if(!rst_n)
    dn_bank[j] <= 1'b0;
  else if(dn_vld & dn_rdy)
    dn_bank[j] <= ~dn_bank[j];
end
endgenerate

assign dn_vld = (dn_bank[cw-1]) ? bank1_valid : bank0_valid;

genvar i;
generate
  for(i=0;i<cw-1;i=i+1) begin:CPY_DN_BANK1
    assign dn_dat[8*(i+1)-1:8*i] = (dn_bank[i]) ? bank1_data[8*(i+1)-1:8*i] : bank0_data[8*(i+1)-1:8*i];
  end

  assign dn_dat[w-1:8*(cw-1)] = (dn_bank[cw-1]) ? bank1_data[w-1:8*(cw-1)] : bank0_data[w-1:8*(cw-1)]; 
endgenerate
endmodule // sif_retime

