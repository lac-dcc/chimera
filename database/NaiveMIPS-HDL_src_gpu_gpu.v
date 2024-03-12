`default_nettype none
module gpu(

  input wire            clk_bus,
  input wire            clk_pixel,
  input wire            rst_n,

  //bus
  //output
  output wire[31:0]      bus_data_o,
  output wire           bus_stall,
  //input
  input wire[23:0]      bus_address,
  input wire[31:0]      bus_data_i,
  input wire            bus_read,
  input wire            bus_write,

  //vga
  output wire           de,
  output reg           vsync,
  output reg           hsync,
  output wire[8:0]     pxlData


);

`define REG_PIX_OFFSET 24'h50000

assign bus_data_o = 32'd0;
assign bus_stall = 1'b0;


`define HOR_PXL      800
`define VER_PXL      600
`define TOL_PXL      (`HOR_PXL * `VER_PXL)
`define HSYNC_POL    1 //positive
`define VSYNC_POL    1 //positive
`define HBACK_POCH   64
`define HFRNT_POCH   56
`define HSYNC_TIME   120
`define VBACK_POCH   23
`define VFRNT_POCH   37
`define VSYNC_TIME   6

`define HTOL_TIME    (`HBACK_POCH + `HFRNT_POCH + `HSYNC_TIME + `HOR_PXL)
`define VTOL_TIME    (`VBACK_POCH + `VFRNT_POCH + `VSYNC_TIME + `VER_PXL)

`define HPXL_BEIGN   (`HSYNC_TIME + `HBACK_POCH )
`define VPXL_BEGIN   (`VSYNC_TIME + `VBACK_POCH)

reg [13:0] pixelOffsetReg[0:1];

reg [13:0] pixelOffset;

reg nowColor; 
reg [31:0] nowWord;

reg [31:0] x;
reg [31:0] y;


wire [31:0] graphX;
wire [31:0] graphY;
reg  [31:0] pxlCnt;


wire [31:0] wrdata;
wire [13:0] wraddr;
wire        wren;

wire [31:0] rddata;
wire        rden;
wire [13:0] rdaddr;

wire [26:0] offsetTemp;

GPUMemory mem(
  .data_a(wrdata),
  .address_a(wraddr),
  .wren_a(wren),
  .clock_a(clk_bus),
  .aclr_a(~rst_n),
  .q_a      (),

  .data_b   (),
  .address_b(rdaddr),
  .wren_b   (1'b0),
  .clock_b(clk_pixel),
  .aclr_b(~rst_n),
  .q_b(rddata)
);

assign wrdata = bus_data_i;
assign wraddr = bus_address[15:2];
assign wren = bus_write;

assign pxlData = (de && nowColor) ? 9'h1ff : 9'd0;
assign offsetTemp = pxlCnt[31:5]+1+pixelOffset;
assign rdaddr[13:0] = offsetTemp >= (2*`TOL_PXL/32) ? offsetTemp-(2*`TOL_PXL/32) : 
                      (offsetTemp >= `TOL_PXL/32 ? offsetTemp-`TOL_PXL/32 : offsetTemp);


always @(posedge clk_bus or negedge rst_n) begin
  if(~rst_n) begin
    pixelOffsetReg[0] <= 0;
  end else if(bus_write) begin
    if(bus_address == `REG_PIX_OFFSET) begin
      pixelOffsetReg[0] <= (`TOL_PXL/32) - bus_data_i;
    end
  end
end

always @(posedge clk_pixel or negedge rst_n) begin
  if(~rst_n) begin
    pixelOffset <= 0;
    pixelOffsetReg[1] <= 0;
  end else begin
    pixelOffset <= pixelOffsetReg[1];
    pixelOffsetReg[1] <= pixelOffsetReg[0];
  end
end

always @(posedge clk_pixel or negedge rst_n) begin
  if(!rst_n)begin
    nowWord <= 32'd0;
  end else begin
  
    if(pxlCnt[4:0] == 5'd31) begin
      nowWord <= rddata;
    end else begin
      nowWord <= nowWord;
    end
    
  end

end

always @(posedge clk_pixel or negedge rst_n) begin

  if(!rst_n)begin
    x      <= 0;
    y      <= 0;
  end else begin
    if(x == `HTOL_TIME - 1) begin
      x <= 0;
      if (y == `VTOL_TIME - 1) begin
        y <= 0;
      end else begin 
        y <= y+1;
      end
    end else begin
      x <= x+1;
    end
  end

end

always @(posedge clk_pixel or negedge rst_n) begin

  if(!rst_n)begin
    hsync  <= `HSYNC_POL;
  end else begin
    if(x == `HTOL_TIME - 1) begin
      hsync <= `HSYNC_POL;
    end else if (x == `HSYNC_TIME - 1) begin
      hsync <= ~`HSYNC_POL;
    end
  end
end

always @(posedge clk_pixel or negedge rst_n) begin

  if(!rst_n)begin
    vsync  <= `VSYNC_POL;
  end else begin
    if(y == `VTOL_TIME - 1 && x == `HTOL_TIME - 1) begin
      vsync <= `VSYNC_POL;
    end else if (y == `VSYNC_TIME - 1 && x == `HTOL_TIME - 1) begin
      vsync <= ~`VSYNC_POL;
    end
  end
end

assign graphX = x >= `HPXL_BEIGN ? (x - `HPXL_BEIGN < `HOR_PXL ? x - `HPXL_BEIGN : 0) : 0;
assign graphY = y >= `VPXL_BEGIN ? (y - `VPXL_BEGIN < `VER_PXL ? y - `VPXL_BEGIN : 0) : 0;

assign de = x >= `HPXL_BEIGN && x - `HPXL_BEIGN < `HOR_PXL && y >= `VPXL_BEGIN && y - `VPXL_BEGIN < `VER_PXL;


always @(posedge clk_pixel or negedge rst_n) begin

  if(!rst_n)begin
    pxlCnt <= 0;
  end else begin
    if(de) begin
      if(pxlCnt == `TOL_PXL - 1) begin
        pxlCnt <= 0;
      end else begin 
        pxlCnt <= pxlCnt + 1;
      end
    end
  end
end

always @(*) begin

  if(pxlCnt[4:0] == 5'd0) begin
    nowColor <= nowWord[0];
  end else if(pxlCnt[4:0] == 5'd1) begin
    nowColor <= nowWord[1];
  end else if(pxlCnt[4:0] == 5'd2) begin
    nowColor <= nowWord[2];
  end else if(pxlCnt[4:0] == 5'd3) begin
    nowColor <= nowWord[3];
  end else if(pxlCnt[4:0] == 5'd4) begin
    nowColor <= nowWord[4];
  end else if(pxlCnt[4:0] == 5'd5) begin
    nowColor <= nowWord[5];
  end else if(pxlCnt[4:0] == 5'd6) begin
    nowColor <= nowWord[6];
  end else if(pxlCnt[4:0] == 5'd7) begin
    nowColor <= nowWord[7];
  end else if(pxlCnt[4:0] == 5'd8) begin
    nowColor <= nowWord[8];
  end else if(pxlCnt[4:0] == 5'd9) begin
    nowColor <= nowWord[9];
  end else if(pxlCnt[4:0] == 5'd10) begin
    nowColor <= nowWord[10];
  end else if(pxlCnt[4:0] == 5'd11) begin
    nowColor <= nowWord[11];
  end else if(pxlCnt[4:0] == 5'd12) begin
    nowColor <= nowWord[12];
  end else if(pxlCnt[4:0] == 5'd13) begin
    nowColor <= nowWord[13];
  end else if(pxlCnt[4:0] == 5'd14) begin
    nowColor <= nowWord[14];
  end else if(pxlCnt[4:0] == 5'd15) begin
    nowColor <= nowWord[15];
  end else if(pxlCnt[4:0] == 5'd16) begin
    nowColor <= nowWord[16];
  end else if(pxlCnt[4:0] == 5'd17) begin
    nowColor <= nowWord[17];
  end else if(pxlCnt[4:0] == 5'd18) begin
    nowColor <= nowWord[18];
  end else if(pxlCnt[4:0] == 5'd19) begin
    nowColor <= nowWord[19];
  end else if(pxlCnt[4:0] == 5'd20) begin
    nowColor <= nowWord[20];
  end else if(pxlCnt[4:0] == 5'd21) begin
    nowColor <= nowWord[21];
  end else if(pxlCnt[4:0] == 5'd22) begin
    nowColor <= nowWord[22];
  end else if(pxlCnt[4:0] == 5'd23) begin
    nowColor <= nowWord[23];
  end else if(pxlCnt[4:0] == 5'd24) begin
    nowColor <= nowWord[24];
  end else if(pxlCnt[4:0] == 5'd25) begin
    nowColor <= nowWord[25];
  end else if(pxlCnt[4:0] == 5'd26) begin
    nowColor <= nowWord[26];
  end else if(pxlCnt[4:0] == 5'd27) begin
    nowColor <= nowWord[27];
  end else if(pxlCnt[4:0] == 5'd28) begin
    nowColor <= nowWord[28];
  end else if(pxlCnt[4:0] == 5'd29) begin
    nowColor <= nowWord[29];
  end else if(pxlCnt[4:0] == 5'd30) begin
    nowColor <= nowWord[30];
  end else begin
    nowColor <= nowWord[31];
  end
  
end

endmodule


