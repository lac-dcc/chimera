// This program was cloned from: https://github.com/abdelazeem201/SoC-FPGA
// License: MIT License

`timescale  1ns/1ns

//*********************************************************************
//* ASIC Fresh Board                                                   *
//*  Malogic uart                                                     *
//*  Top File : uart.v                                                *
//*  Author: abdelazeem                                               *
//*  Revision 0.1                                                     *
//*  Date     2023/12/12                                              *
//*  Email : a.abdelazeem201@gmail.com                                * 
//*********************************************************************

module  uart_top
(
    input   wire    sys_clk     ,   //clk 50MHz
    input   wire    sys_rst_n   ,  
    input   wire    rx          ,  

    output  wire    tx            
);

 
parameter   UART_BPS    =   20'd9600        ,    
            CLK_FREQ    =   26'd50_000_000  ;   

//wire  define
wire    [7:0]   po_data;
wire            po_flag;

 
uart_rx
#(
    .UART_BPS    (UART_BPS  ),   
    .CLK_FREQ    (CLK_FREQ  )   
)
uart_rx_inst
(
    .sys_clk    (sys_clk    ),   
    .sys_rst_n  (!sys_rst_n  ),   
    .rx         (rx         ),   
            
    .po_data    (po_data    ),   
    .po_flag    (po_flag    )   
);

 
uart_tx
#(
    .UART_BPS    (UART_BPS  ),   
    .CLK_FREQ    (CLK_FREQ  )  
)
uart_tx_inst
(
    .sys_clk    (sys_clk    ),   
    .sys_rst_n  (!sys_rst_n  ),   
    .pi_data    (po_data    ),  
    .pi_flag    (po_flag    ),  
                
    .tx         (tx         )    
);

endmodule
