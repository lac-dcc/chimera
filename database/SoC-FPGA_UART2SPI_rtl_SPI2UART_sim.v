// This program was cloned from: https://github.com/abdelazeem201/SoC-FPGA
// License: MIT License

//*************************************************************************
//*                                                                       *
//*  UART2SPI                                              
//*  File : SPI2UART.v                                             
//*  Author: abdelazeem                                                   *
//*  Revision 0.1                                                         *
//*  Date     2024/01/26                                                  *
//*  Email : a.abdelazeem201.com                                          *
//                                                                        *
//*************************************************************************
//`define DO_SIM 1
module SPI2UART(
    clk50M,
    rst_i,
    
    mi      ,
    sck     ,
    cs      ,
    mo      ,
    
    uart_rx,
    uart_tx
);
    input clk50M;
    input rst_i;
        input mi;
 
     //   input read;
        output sck;
        output   cs;
        output   mo;
        
        
    input uart_rx;
    output uart_tx;
 
    wire [7:0] eeprom_rddata;

    wire   clk50M_g,rst_n,rd_done;
//BUFG clock_g (
//              .I   (clk50M),
//              .O   (clk50M_g)
//              );    
assign clk50M_g =  clk50M;
assign rst_n = !rst_i;
wire spi_wr  , spi_rd ;
reg  [7:0] reg_spi_addr,reg_spi_data;
spi_93lc46 spi_top(
        .clkin   (clk50M_g),
        .reset   (rst_i),
        .write   (spi_wr),
        .read    (spi_rd),
        .spi_addr_i (reg_spi_addr),
        .spi_data_i   (reg_spi_data  ),
        .mi      (mi  ),
        .sck     (sck ),
        .cs      (cs  ),
        .mo      (mo  ),
        .rd_done (rd_done),
        .data_out(eeprom_rddata)
);
    
    wire rx_done;
    wire [7:0]rx_data;
uart_byte_rx uart_byte_rx( 
        .Clk(clk50M_g),
        .Reset_n(rst_n),
        .Baud_Set(3'd4),
        .uart_rx(uart_rx),
        .Data(rx_data),
        .Rx_Done(rx_done) 
    );

reg [1:0] reg_rx_cnt  ;
always @ (posedge clk50M_g)
  begin
  	if(rst_i) reg_spi_addr<= 8'b0 ;
     else  if(rx_done && (reg_rx_cnt ==0) )   reg_spi_addr<= rx_data;
     else reg_spi_addr<= reg_spi_addr;
  end
always @ (posedge clk50M_g)
  begin
  	if(rst_i) reg_spi_data <= 8'b0 ;
     else  if(rx_done && (reg_rx_cnt ==1))   reg_spi_data <= rx_data;
     else reg_spi_data <= reg_spi_data;
  end

always @ (posedge clk50M_g)
  begin
  	if(rst_i) reg_rx_cnt <= 2'b0 ;
     else if(rx_done &&(reg_rx_cnt != 2))   reg_rx_cnt <= reg_rx_cnt + 1;
     else if((reg_rx_cnt == 2) && rx_done) reg_rx_cnt <= 2'b0;
     else  reg_rx_cnt <= reg_rx_cnt;
  end
  
assign  spi_wr = (rx_data == 8'ha5) && (reg_rx_cnt == 2) && rx_done;
assign  spi_rd = (rx_data == 8'ha1) && (reg_rx_cnt == 2) && rx_done && (reg_spi_data == 8'hff);
    uart_data_tx
    #(
        .DATA_WIDTH(16),
        .MSB_FIRST(1)
    )
    uart_data_tx(
        .Clk(clk50M_g),
        .Rst_n(rst_n),
        .data(eeprom_rddata),
        .send_en(rd_done),   
        .Baud_Set(3'd4),  
        .uart_tx(uart_tx),  
        .Tx_Done(),   
        .uart_state()
    );

endmodule
