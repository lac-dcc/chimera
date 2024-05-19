// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module AHBlite_LCD(
    input  wire                         HCLK,    
    input  wire                         HRESETn, 
    input  wire                         HSEL,    
    input  wire   [31:0]                HADDR,   
    input  wire    [1:0]                HTRANS,  
    input  wire    [2:0]                HSIZE,   
    input  wire    [3:0]                HPROT,   
    input  wire                         HWRITE,  
    input  wire   [31:0]                HWDATA,  
    input  wire                         HREADY,  
    output wire                         HREADYOUT, 
    output wire    [31:0]               HRDATA,  
    output wire                         HRESP,

    output  wire                        LCD_CS,
    output  wire                        LCD_RS,
    output  wire                        LCD_WR,
    output  wire                        LCD_RD,
    output  wire                        LCD_RST,
    output  wire    [15:0]              LCD_DATA,
    output  wire                        LCD_BL_CTR
);

assign HRESP = 1'b0;
assign HREADYOUT = 1'b1;

wire read_en;
assign read_en=HSEL&HTRANS[1]&(~HWRITE)&HREADY;

wire write_en;
assign write_en=HSEL&HTRANS[1]&(HWRITE)&HREADY;

reg [5:0] addr;
always@(posedge HCLK or negedge HRESETn) begin
  if(~HRESETn) addr <= 6'b0;
  else if(read_en || write_en) addr <= HADDR[7:2];
end

reg write_en_reg;
always@(posedge HCLK or negedge HRESETn) begin
  if(~HRESETn) write_en_reg <= 1'b0;
  else if(write_en) write_en_reg <= 1'b1;
  else  write_en_reg <= 1'b0;
end

wire        LCD_CS_en;
wire        LCD_RS_en;
wire        LCD_WR_en;
wire        LCD_RD_en;
wire        LCD_RST_en;
wire        LCD_BL_CTR_en;
wire [15:0] LCD_DATA_en;

assign LCD_CS_en        = addr == 6'h00 & write_en_reg;
assign LCD_RS_en        = addr == 6'h01 & write_en_reg;
assign LCD_WR_en        = addr == 6'h02 & write_en_reg;
assign LCD_RD_en        = addr == 6'h03 & write_en_reg;
assign LCD_RST_en       = addr == 6'h04 & write_en_reg;
assign LCD_BL_CTR_en    = addr == 6'h05 & write_en_reg;
assign LCD_DATA_en[0]   = addr == 6'h06 & write_en_reg;
assign LCD_DATA_en[1]   = addr == 6'h07 & write_en_reg;
assign LCD_DATA_en[2]   = addr == 6'h08 & write_en_reg;
assign LCD_DATA_en[3]   = addr == 6'h09 & write_en_reg;
assign LCD_DATA_en[4]   = addr == 6'h0A & write_en_reg;
assign LCD_DATA_en[5]   = addr == 6'h0B & write_en_reg;
assign LCD_DATA_en[6]   = addr == 6'h0C & write_en_reg;
assign LCD_DATA_en[7]   = addr == 6'h0D & write_en_reg;
assign LCD_DATA_en[8]   = addr == 6'h0E & write_en_reg;
assign LCD_DATA_en[9]   = addr == 6'h0F & write_en_reg;
assign LCD_DATA_en[10]  = addr == 6'h10 & write_en_reg;
assign LCD_DATA_en[11]  = addr == 6'h11 & write_en_reg;
assign LCD_DATA_en[12]  = addr == 6'h12 & write_en_reg;
assign LCD_DATA_en[13]  = addr == 6'h13 & write_en_reg;
assign LCD_DATA_en[14]  = addr == 6'h14 & write_en_reg;
assign LCD_DATA_en[15]  = addr == 6'h15 & write_en_reg;

reg        LCD_CS_reg;
reg        LCD_RS_reg;
reg        LCD_WR_reg;
reg        LCD_RD_reg;
reg        LCD_RST_reg;
reg        LCD_BL_CTR_reg;
reg [15:0] LCD_DATA_reg;

always@(posedge HCLK or negedge HRESETn) begin
    if(~HRESETn) begin
        LCD_CS_reg <= 1'b0;
        LCD_RS_reg <= 1'b0;
        LCD_WR_reg <= 1'b0;
        LCD_RD_reg <= 1'b0;
        LCD_RST_reg <= 1'b0;
        LCD_BL_CTR_reg <= 1'b0;
    end 
    else begin
        if (LCD_CS_en) begin
            LCD_CS_reg <= HWDATA[0];
        end
        if (LCD_RS_en) begin
            LCD_RS_reg <= HWDATA[0];
        end
        if (LCD_WR_en) begin
            LCD_WR_reg <= HWDATA[0];
        end
        if (LCD_RD_en) begin
            LCD_RD_reg <= HWDATA[0];
        end
        if (LCD_RST_en) begin
            LCD_RST_reg <= HWDATA[0];
        end
        if (LCD_BL_CTR_en) begin
            LCD_BL_CTR_reg <= HWDATA[0];
        end
        //-----------------------------------------------
        //              DATA
        //-----------------------------------------------
        if (LCD_DATA_en[0]) begin
            LCD_DATA_reg[0] <= HWDATA[0];
        end
        if (LCD_DATA_en[1]) begin
            LCD_DATA_reg[1] <= HWDATA[0];
        end
        if (LCD_DATA_en[2]) begin
            LCD_DATA_reg[2] <= HWDATA[0];
        end
        if (LCD_DATA_en[3]) begin
            LCD_DATA_reg[3] <= HWDATA[0];
        end
        if (LCD_DATA_en[4]) begin
            LCD_DATA_reg[4] <= HWDATA[0];
        end
        if (LCD_DATA_en[5]) begin
            LCD_DATA_reg[5] <= HWDATA[0];
        end
        if (LCD_DATA_en[6]) begin
            LCD_DATA_reg[6] <= HWDATA[0];
        end
        if (LCD_DATA_en[7]) begin
            LCD_DATA_reg[7] <= HWDATA[0];
        end
        if (LCD_DATA_en[8]) begin
            LCD_DATA_reg[8] <= HWDATA[0];
        end
        if (LCD_DATA_en[9]) begin
            LCD_DATA_reg[9] <= HWDATA[0];
        end
        if (LCD_DATA_en[10]) begin
            LCD_DATA_reg[10] <= HWDATA[0];
        end
        if (LCD_DATA_en[11]) begin
            LCD_DATA_reg[11] <= HWDATA[0];
        end
        if (LCD_DATA_en[12]) begin
            LCD_DATA_reg[12] <= HWDATA[0];
        end
        if (LCD_DATA_en[13]) begin
            LCD_DATA_reg[13] <= HWDATA[0];
        end
        if (LCD_DATA_en[14]) begin
            LCD_DATA_reg[14] <= HWDATA[0];
        end
        if (LCD_DATA_en[15]) begin
            LCD_DATA_reg[15] <= HWDATA[0];
        end
    end
end

//-------------------------------------------------------------------       
//                  HRDATA DECODER
//-------------------------------------------------------------------

assign HRDATA[0] =  (   addr == 6'h00   ) ?  LCD_CS_reg        :   (         
                    (   addr == 6'h01   ) ?  LCD_RS_reg        :   (
                    (   addr == 6'h02   ) ?  LCD_WR_reg        :   (
                    (   addr == 6'h03   ) ?  LCD_RD_reg        :   (
                    (   addr == 6'h04   ) ?  LCD_RST_reg        :   (
                    (   addr == 6'h05   ) ?  LCD_BL_CTR_reg     :   (
                    (   addr == 6'h06   ) ?  LCD_DATA_reg[0]    :   (
                    (   addr == 6'h07   ) ?  LCD_DATA_reg[1]    :   (
                    (   addr == 6'h08   ) ?  LCD_DATA_reg[2]    :   (
                    (   addr == 6'h09   ) ?  LCD_DATA_reg[3]    :   (
                    (   addr == 6'h0A   ) ?  LCD_DATA_reg[4]    :   (
                    (   addr == 6'h0B   ) ?  LCD_DATA_reg[5]    :   (
                    (   addr == 6'h0C   ) ?  LCD_DATA_reg[6]    :   (
                    (   addr == 6'h0D   ) ?  LCD_DATA_reg[7]    :   (
                    (   addr == 6'h0E   ) ?  LCD_DATA_reg[8]    :   (
                    (   addr == 6'h0F   ) ?  LCD_DATA_reg[9]    :   (
                    (   addr == 6'h10   ) ?  LCD_DATA_reg[10]   :   (
                    (   addr == 6'h11   ) ?  LCD_DATA_reg[11]   :   (
                    (   addr == 6'h12   ) ?  LCD_DATA_reg[12]   :   (
                    (   addr == 6'h13   ) ?  LCD_DATA_reg[13]   :   (
                    (   addr == 6'h14   ) ?  LCD_DATA_reg[14]   :   (
                    (   addr == 6'h15   ) ?  LCD_DATA_reg[15]   :   1'b0)))))))))))))))))))));
assign HRDATA[31 : 1] = 31'b0;

assign LCD_CS       = LCD_CS_reg;
assign LCD_RS       = LCD_RS_reg;
assign LCD_WR       = LCD_WR_reg;
assign LCD_RD       = LCD_RD_reg;
assign LCD_RST      = LCD_RST_reg;
assign LCD_BL_CTR   = LCD_BL_CTR_reg;
assign LCD_DATA     = LCD_DATA_reg;
endmodule


