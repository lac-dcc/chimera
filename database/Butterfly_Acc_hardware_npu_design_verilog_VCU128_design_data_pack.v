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
  parameter INPUT_AXI_CHNL = 8,
  parameter vld_parallelism = 128,
  parameter DATA_WIDTH   = 256
)
(
  //////////////////clock & control signals/////////////////
  input wire                   clk,
  input wire                   rst_n, 
  input wire                   is_pad,

  //////////////////Up data and signals/////////////
  input wire  [DATA_WIDTH*INPUT_AXI_CHNL-1:0]  up_dat,
  input wire  [INPUT_AXI_CHNL-1:0]      up_vld,
  output wire                                  up_rdy,

  //////////////////Up data and signals/////////////
  output wire  [2*DATA_WIDTH*INPUT_AXI_CHNL-1:0]  dn_dat, // assume ddr bandwidht is 256*8, input buffer bandwidth is 128*32
  output wire  [INPUT_AXI_CHNL-1:0]               dn_vld,
  input wire                                  dn_rdy
);

genvar i;
/////////////////////Timing//////////////////////////
reg                            is_pad_r[INPUT_AXI_CHNL-1:0];

generate
for(i=0 ; i<INPUT_AXI_CHNL; i=i+1)
begin : GENERATE_IS_PAD_REG
    always @(posedge clk)
    begin
        is_pad_r[i] <= is_pad;
    end
end
endgenerate


/////////////////////Timing//////////////////////////


assign up_rdy = 1;

wire  [DATA_WIDTH*INPUT_AXI_CHNL-1:0]  up_dat_r1;
wire  [DATA_WIDTH*INPUT_AXI_CHNL-1:0]  up_dat_r2;
reg  [DATA_WIDTH-1:0]  up_dats_r1[INPUT_AXI_CHNL-1:0];
reg  [DATA_WIDTH-1:0]  up_dats_r2[INPUT_AXI_CHNL-1:0];
reg                                   up_vld_r[INPUT_AXI_CHNL-1:0];
reg                                   pack_complex[INPUT_AXI_CHNL-1:0];

generate
for(i=0 ; i<INPUT_AXI_CHNL; i=i+1)
begin : GENERATE_UP_DAT_REG
    always @(posedge clk)
    begin
      up_dats_r1[i] <= up_dat[(DATA_WIDTH*i + DATA_WIDTH-1) : (DATA_WIDTH*i)];
      if (is_pad_r[i]) begin
        up_dats_r2[i] <= 0;
        pack_complex[i] <= 1'b0;
      end
      else begin
        up_dats_r2[i] <= up_dats_r1[i];
        pack_complex[i] <= !pack_complex[i];
      end
    end
end
endgenerate

generate
for(i=0 ; i<INPUT_AXI_CHNL; i=i+1)
begin : GENERATE_UP_DAT_WIRING
    assign up_dat_r1[(DATA_WIDTH*i + DATA_WIDTH-1) : (DATA_WIDTH*i)] = up_dats_r1[i];
    assign up_dat_r2[(DATA_WIDTH*i + DATA_WIDTH-1) : (DATA_WIDTH*i)] = up_dats_r2[i];
end
endgenerate


//////////////////Timing//////////////////
generate
for(i=0 ; i<INPUT_AXI_CHNL; i=i+1)
begin : ASSIGN_TIMING
    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
      up_vld_r[i] <= 0;
    end
    else begin
      if (is_pad_r[i]) begin
        up_vld_r[i] <= up_vld[i];
      end
      else begin
        up_vld_r[i] <= up_vld[i] & pack_complex[i];
      end
    end
end
endgenerate

generate
for(i=0 ; i<INPUT_AXI_CHNL; i=i+1)
begin : ASSIGN_TIMING_DN_VLD
    assign dn_vld[i] = up_vld_r[i];
end
endgenerate

assign dn_dat = {up_dat_r2, up_dat_r1};

endmodule