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


module data_pack
# (
  parameter be_parallelism = 32,
  parameter parallelism_per_control = 4,
  parameter data_width = 16,
  parameter BAND_WIDTH   = 256
)
(
  //////////////////clock & control signals/////////////////
  input wire                   clk,
  input wire                   rst_n, 
  input wire                   is_pad,

  //////////////////Up data and signals/////////////
  input wire  [BAND_WIDTH-1:0]                 up_dat,
  input wire                                   up_vld,
  output wire                                  up_rdy,

  //////////////////Up data and signals/////////////
  output wire  [(2*data_width)*be_parallelism-1:0]  dn_dat, // assume ddr bandwidht is 256*8, input buffer bandwidth is 128*32
  output wire  [be_parallelism/parallelism_per_control-1:0]               dn_vld,
  input wire                                  dn_rdy
);

localparam num_pack_cycle = (2*data_width*be_parallelism)/BAND_WIDTH;

genvar i;
/////////////////////Timing//////////////////////////
reg                            is_pad_r;

always @(posedge clk)
begin
    is_pad_r <= is_pad;
end


/////////////////////Timing//////////////////////////

assign up_rdy = 1;

reg  [BAND_WIDTH-1:0]  up_dat_r[num_pack_cycle-1:0];

always @(posedge clk)
begin
  up_dat_r[0] <= up_dat;
end

assign dn_dat[BAND_WIDTH-1:0] = up_dat_r[0];

generate
for(i=1 ; i<num_pack_cycle; i=i+1)
begin : ASSIGN_TIMING
    always @(posedge clk)
    begin
      up_dat_r[i] <= up_dat_r[i-1];
    end
    assign dn_dat[BAND_WIDTH*i + BAND_WIDTH - 1 : BAND_WIDTH*i] = up_dat_r[i];
end
endgenerate


reg [4-1 : 0] in_counter;
reg dn_vld_reg;

always @(posedge clk)
if(!rst_n) begin
    in_counter <= 0;
    dn_vld_reg <= 0;
end else begin
    if (up_vld) begin
      if (in_counter == num_pack_cycle-1) begin
        in_counter <= 0;
        dn_vld_reg <= 1;
      end else begin
        in_counter <= in_counter + 1;
        dn_vld_reg <= 0;
      end
    end
end

assign dn_vld = dn_vld_reg;
//////////////////Timing//////////////////


endmodule