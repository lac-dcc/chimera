// This program was cloned from: https://github.com/abdelazeem201/SoC-FPGA
// License: MIT License

//*************************************************************************
//*   ASIC                       *
//*   UART2SD                                               
//*  Top File : uart2sd.v                                                 *
//*  Author: Abdelazeem                                                         *
//*  Revision 0.1                                                         *
//*  Date     2024/01/26                                                   *
//*  Email : a.abdelazeem201@gmail.com                                             *
//*************************************************************************
`timescale  1ns/1ns
module  uart2sd
(
    input   wire            sys_clk     ,   //clk 50MHz
    input   wire            sys_rst_n   ,    
    input   wire            rx          ,             
    input   wire            sd_miso     ,             

    output  wire            sd_clk      ,                
    output  wire            sd_cs_n     ,                
    output  wire            sd_mosi     ,                
    output  wire            tx                           
);

parameter   UART_BPS    =   14'd9600        ,         
            CLK_FREQ    =   26'd50_000_000  ;         

 
wire            rx_flag         ;   
wire    [7:0]   rx_data         ;   
wire            wr_req          ;   
wire            wr_busy         ;   
wire            wr_en           ;   
wire    [31:0]  wr_addr         ;   
wire    [15:0]  wr_data         ;   
wire            rd_data_en      ;   
wire    [15:0]  rd_data         ;   
wire            rd_busy         ;   
wire            rd_en           ;   
wire    [31:0]  rd_addr         ;   
wire            tx_flag         ;   
wire    [7:0]   tx_data         ;   
wire            clk_50m         ;   
wire            clk_50m_shift   ;   
wire            locked          ;   
wire            rst_n           ;   
wire            init_end        ;   
wire            sd_clk_o;

 
assign  rst_n = ~sys_rst_n ;
BUFG u_bufg ( .I(sys_clk),   .O(clk_50m) );
BUFG s_bufg ( .I(!sys_clk),   .O(clk_50m_shift) );
BUFG sd_bufg ( .I(sd_clk_o),   .O(sd_clk) );

uart_rx
#(
    .UART_BPS    (UART_BPS  ),  
    .CLK_FREQ    (CLK_FREQ  )   
)
uart_rx_inst
(
    .sys_clk     (clk_50m   ),  
    .sys_rst_n   (rst_n     ),  
    .rx          (rx        ),  
                                
    .po_data     (rx_data   ),  
    .po_flag     (rx_flag   )   
);

 
data_rw_ctrl    data_rw_ctrl_inst
(
    .sys_clk     (clk_50m   ), 
    .sys_rst_n   (rst_n     ), 
    .init_end    (init_end  ), 
                               
    .rx_flag     (rx_flag   ), 
    .rx_data     (rx_data   ), 
    .wr_req      (wr_req    ), 
    .wr_busy     (wr_busy   ), 
                               
    .wr_en       (wr_en     ), 
    .wr_addr     (wr_addr   ), 
    .wr_data     (wr_data   ), 
                               
    .rd_data_en  (rd_data_en), 
    .rd_data     (rd_data   ), 
    .rd_busy     (rd_busy   ), 
    .rd_en       (rd_en     ), 
    .rd_addr     (rd_addr   ), 
    .tx_flag     (tx_flag   ), 
    .tx_data     (tx_data   )  
);

 
sd_ctrl sd_ctrl_inst
(
    .sys_clk         (clk_50m       ),  
    .sys_clk_shift   (clk_50m_shift ),  
    .sys_rst_n       (rst_n         ),  

    .sd_miso         (sd_miso       ),  
    .sd_clk          (sd_clk_o      ),
    .sd_cs_n         (sd_cs_n       ),  
    .sd_mosi         (sd_mosi       ),  

    .wr_en           (wr_en         ),  
    .wr_addr         (wr_addr       ),  
    .wr_data         (wr_data       ),  
    .wr_busy         (wr_busy       ),  
    .wr_req          (wr_req        ),  

    .rd_en           (rd_en         ),  
    .rd_addr         (rd_addr       ),  
    .rd_busy         (rd_busy       ),  
    .rd_data_en      (rd_data_en    ),  
    .rd_data         (rd_data       ),  

    .init_end        (init_end      )   
);

 
uart_tx
#(
    .UART_BPS    (UART_BPS  ), 
    .CLK_FREQ    (CLK_FREQ  )  
)
uart_tx_inst
(
    .sys_clk     (clk_50m   ), 
    .sys_rst_n   (rst_n     ), 
    .pi_data     (tx_data   ), 
    .pi_flag     (tx_flag   ), 

    .tx          (tx        )  
);

endmodule
