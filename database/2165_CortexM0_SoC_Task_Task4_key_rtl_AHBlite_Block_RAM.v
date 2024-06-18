// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module AHBlite_Block_RAM #(
    parameter                       ADDR_WIDTH = 14)(
    input  wire                     HCLK,    
    input  wire                     HRESETn, 
    input  wire                     HSEL,    
    input  wire   [31:0]            HADDR,   
    input  wire   [1:0]             HTRANS,  
    input  wire   [2:0]             HSIZE,   
    input  wire   [3:0]             HPROT,   
    input  wire                     HWRITE,  
    input  wire   [31:0]            HWDATA,   
    input wire                      HREADY, 
    output wire                     HREADYOUT, 
    output wire   [31:0]            HRDATA,  
    output wire   [1:0]             HRESP,
    output wire   [ADDR_WIDTH-1:0]  BRAM_RDADDR,
    output wire   [ADDR_WIDTH-1:0]  BRAM_WRADDR,
    input  wire   [31:0]            BRAM_RDATA,
    output wire   [31:0]            BRAM_WDATA,
    output wire   [3:0]             BRAM_WRITE
);

assign HRESP = 2'b0;
assign HRDATA = BRAM_RDATA;

wire trans_en;
assign trans_en = HSEL & HTRANS[1];

wire write_en;
assign write_en = trans_en & HWRITE;

wire read_en;
assign read_en = trans_en & (~HWRITE);

reg [3:0] size_dec;
always@(*) begin
  case({HADDR[1:0],HSIZE[1:0]})
    4'h0 : size_dec = 4'h1;
    4'h1 : size_dec = 4'h3;
    4'h2 : size_dec = 4'hf;
    4'h4 : size_dec = 4'h2;
    4'h8 : size_dec = 4'h4;
    4'h9 : size_dec = 4'hc;
    4'hc : size_dec = 4'h8;
    default : size_dec = 4'h0;
  endcase
end

reg [3:0] size_reg;
always@(posedge HCLK or negedge HRESETn) begin
  if(~HRESETn) size_reg <= 0;
  else if(write_en & HREADY) size_reg <= size_dec;
end


reg [ADDR_WIDTH-1:0] addr_reg;
always@(posedge HCLK or negedge HRESETn) begin
  if(~HRESETn) addr_reg <= 0;
  else if(trans_en & HREADY) addr_reg <= HADDR[(ADDR_WIDTH+1):2];
end


reg wr_en_reg;

always@(posedge HCLK or negedge HRESETn) begin
  if(~HRESETn) wr_en_reg <= 1'b0;
  else if(HREADY) wr_en_reg <= write_en;
  else wr_en_reg <= 1'b0;
end

assign BRAM_RDADDR = HADDR[(ADDR_WIDTH+1):2];
assign BRAM_WRADDR  = addr_reg;
assign HREADYOUT = 1'b1;
assign BRAM_WRITE = wr_en_reg ? size_reg : 4'h0;
assign BRAM_WDATA = HWDATA; 

endmodule
