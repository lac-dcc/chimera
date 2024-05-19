// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module AHBlite_GPIO(
    input  wire          HCLK,    
    input  wire          HRESETn, 
    input  wire          HSEL,    
    input  wire   [31:0] HADDR,   
    input  wire    [1:0] HTRANS,  
    input  wire    [2:0] HSIZE,   
    input  wire    [3:0] HPROT,   
    input  wire          HWRITE,  
    input  wire   [31:0] HWDATA,  
    input  wire          HREADY,  
    output wire          HREADYOUT, 
    output wire   [31:0] HRDATA,  
    output wire          HRESP,
    output wire         outEn,
    output wire   [7:0] oData,
    input  wire   [7:0] iData  
);

assign HRESP = 1'b0;
assign HREADYOUT = 1'b1;

wire write_en;
assign write_en = HSEL & HTRANS[1] & HWRITE & HREADY;

wire read_en;
assign read_en=HSEL&HTRANS[1]&(~HWRITE)&HREADY;

reg [3:0] addr_reg;
always@(posedge HCLK or negedge HRESETn) begin
  if(~HRESETn) addr_reg <= 4'h0;
  else if(read_en || write_en) addr_reg <= HADDR[3:0];
end

reg rd_en_reg;
always@(posedge HCLK or negedge HRESETn) begin
  if(~HRESETn) rd_en_reg <= 1'b0;
  else if(read_en) rd_en_reg <= 1'b1;
  else rd_en_reg <= 1'b0;
end

reg wr_en_reg;
always@(posedge HCLK or negedge HRESETn) begin
  if(~HRESETn) wr_en_reg <= 1'b0;
  else if(write_en) wr_en_reg <= 1'b1;
  else  wr_en_reg <= 1'b0;
end


// always@(*) begin
//   if(rd_en_reg) begin
//     if(addr_reg == 4'h4) HRDATA <= {24'b0,iData};
//     else HRDATA <= 32'd0;
//     end 
//     else HRDATA <= 32'd0;
// end]

assign HRDATA = (rd_en_reg  & (addr_reg == 4'h4)) ? {24'd0,iData} : 32'd0;

reg [7:0] oData_reg;
reg outEn_reg;
always@(posedge HCLK or negedge HRESETn) begin
    if(~HRESETn) begin
        oData_reg <= 8'd0;
        outEn_reg <= 1'd0;
    end
    else if(wr_en_reg & addr_reg == 4'h0)  oData_reg <= HWDATA[7:0];
    else if(wr_en_reg & addr_reg == 4'h8)  outEn_reg <= HWDATA[0];
  end
    

assign oData = oData_reg;
assign outEn = outEn_reg;

endmodule
