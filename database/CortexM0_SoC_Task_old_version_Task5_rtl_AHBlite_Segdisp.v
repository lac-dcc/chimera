// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module AHBlite_Segdisp(
    input  wire           HCLK,
    input  wire           HRESETn,
    input  wire           HSEL,
    input  wire   [31:0]  HADDR,
    input  wire    [1:0]  HTRANS,
    input  wire    [2:0]  HSIZE,
    input  wire    [3:0]  HPROT,
    input  wire           HWRITE,
    input  wire   [31:0]  HWDATA,
    input  wire           HREADY,
    output wire           HREADYOUT,
    output wire   [31:0]  HRDATA,
    output wire           HRESP,

    output wire    [4:0]  disp_data
);

assign HRESP = 1'b0;
assign HREADYOUT = 1'b1;

wire write_en;
assign write_en = HSEL & HTRANS[1] & HWRITE & HREADY;

reg wr_en_reg;
always@(posedge HCLK or negedge HRESETn) begin
  if(~HRESETn) wr_en_reg <= 1'b0;
  else if(write_en) wr_en_reg <= 1'b1;
  else wr_en_reg <= 1'b0;
end

assign disp_data = wr_en_reg ? HWDATA[4:0] : 5'd0;
assign HRDATA = {28'd0,disp_data[3:0]};

endmodule