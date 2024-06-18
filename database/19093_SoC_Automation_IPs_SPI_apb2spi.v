// This program was cloned from: https://github.com/habibagamal/SoC_Automation
// License: GNU General Public License v2.0

/*
  Registers
    cfg (W): 0:cpol, 1:cpha, 8-15: clock divider
    ctrl (W): 0: go, 1:ssb
    status (R): 0: done
    datain (W): 0-7: data in
    datao (R): 0-7: data out
*/

module APB2SPI(

    input wire PCLK,
    input wire PRESETn,
    input wire PWRITE,
    input wire [31:0] PWDATA,
    input wire [31:0] PADDR,
    input wire PENABLE,

    input PSEL,

    output wire PREADY,
    output wire [31:0] PRDATA,

    input  wire MSI,
    output wire MSO,
    output wire SSn,
    output wire SCLK

);

  reg   [7:0]   SPI_DATAi_REG;
  wire  [7:0]   SPI_DATAo_REG;

  reg   [1:0]   SPI_CTRL_REG;
  wire          SPI_STATUS_REG;
  reg   [9:0]   SPI_CFG_REG;

  wire go, cpol, cpha, done, busy, csb;
  wire [7:0] datai, datao, clkdiv;

  // The Control Register -- Size: 2 -- offset: 4
  always @(posedge PCLK, negedge PRESETn)
  begin
    if(!PRESETn)
    begin
      SPI_CTRL_REG <= 2'b0;
    end
    else if(PENABLE & PWRITE & PREADY & PSEL & PADDR[2])
      SPI_CTRL_REG <= PWDATA[1:0];
  end

  // Configuration Register -- Size; 10 -- Offset: 8
  always @(posedge PCLK, negedge PRESETn)
  begin
    if(!PRESETn)
    begin
      SPI_CFG_REG <= 10'b0;
    end
    else if(PENABLE & PWRITE & PREADY & PSEL & PADDR[3])
      SPI_CFG_REG <= PWDATA[9:0];
  end

  // Data Register -- Size: 8 -- Offset: 0
  always @(posedge PCLK, negedge PRESETn)
  begin
    if(!PRESETn)
    begin
      SPI_DATAi_REG <= 8'b0;
    end
    else if(PENABLE & PWRITE & PREADY & PSEL & ~PADDR[2] & ~PADDR[3] & ~PADDR[4])
      SPI_DATAi_REG <= PWDATA[7:0];
  end

  assign datai  = SPI_DATAi_REG[7:0];
  assign go     = SPI_CTRL_REG[0];
  assign SSn    = ~SPI_CTRL_REG[1];
  assign cpol   = SPI_CFG_REG[0];
  assign cpha   = SPI_CFG_REG[1];
  assign clkdiv = SPI_CFG_REG[9:2];
  assign SPI_STATUS_REG = DONE;
  assign SPI_DATAo_REG  = datao;
  
  reg DONE;

  always @(posedge PCLK, negedge PRESETn)
     begin
       if(!PRESETn)
       begin
         DONE <= 1'b0;
       end
       else if(done)
         DONE <= 1'b1;
       else if(go)
         DONE <= 1'b0;
  end

  spi_master
    #(
      .DATA_WIDTH(8),
      .CLK_DIVIDER_WIDTH(8)
      ) SPI_CTRL (
         .clk(PCLK),
         .resetb(PRESETn),
         .CPOL(cpol),
         .CPHA(cpha),
         .clk_divider(clkdiv),

         .go(go),
         .datai(datai),
         .datao(datao),
         //.busy(busy),
         .done(done),

         .dout(MSI),
         .din(MSO),
         //.csb(ss),
         .sclk(SCLK)
  );

  assign PRDATA[31:0] = (PADDR[2]) ? {30'd0,SPI_CTRL_REG} :
                        (PADDR[3]) ? {{22'd0,SPI_CFG_REG}} :
                        (PADDR[4]) ? {31'd0,SPI_STATUS_REG} :
                        {24'd0,SPI_DATAo_REG};

  assign PREADY = 1'b1;
endmodule