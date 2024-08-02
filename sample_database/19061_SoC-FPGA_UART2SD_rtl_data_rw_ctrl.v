// This program was cloned from: https://github.com/abdelazeem201/SoC-FPGA
// License: MIT License

//*************************************************************************
//*   ASIC                       *
//*   UART2SD                                               
//*  Top File : data_rw_ctrl.v                                                 *
//*  Author: Abdelazeem                                                         *
//*  Revision 0.1                                                         *
//*  Date     2024/01/26                                                   *
//*  Email : a.abdelazeem201@gmail.com                                             *
//*************************************************************************
`timescale  1ns/1ns

module  data_rw_ctrl
(
    input   wire            sys_clk     ,   
    input   wire            sys_rst_n   ,   
    input   wire            init_end    ,   
    
    input   wire            rx_flag     ,   
    input   wire    [7:0]   rx_data     ,   
    input   wire            wr_req      ,   
    input   wire            wr_busy     ,   

    output  wire            wr_en       ,   
    output  wire    [31:0]  wr_addr     ,   
    output  wire    [15:0]  wr_data     ,   

    input   wire            rd_data_en  ,   
    input   wire    [15:0]  rd_data     ,   
    input   wire            rd_busy     ,   
    output  reg             rd_en       ,   
    output  wire    [31:0]  rd_addr     ,   
    output  reg             tx_flag     ,   
    output  wire    [7:0]   tx_data         
);


parameter   DATA_NUM    =   12'd256     ;   
parameter   SECTOR_ADDR =   32'd1000    ;   
parameter   CNT_WAIT_MAX=   16'd60000   ;   

wire    [11:0]  wr_fifo_data_num    ;   
wire            wr_busy_fall        ;   
wire            rd_busy_fall        ;   

reg             wr_busy_dly         ;   
reg             rd_busy_dly         ;   
reg             send_data_en        ;   
reg     [15:0]  cnt_wait            ;   
reg     [11:0]  send_data_num       ;   
reg             rd_fifo_rd_en       ;

assign  wr_en = ((wr_fifo_data_num == (DATA_NUM)) && (init_end == 1'b1))
                ? 1'b1 : 1'b0;


assign  wr_addr = SECTOR_ADDR;


always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        wr_busy_dly <=  1'b0;
    else
        wr_busy_dly <=  wr_busy;

assign  wr_busy_fall = ((wr_busy == 1'b0) && (wr_busy_dly == 1'b1))
                        ? 1'b1 : 1'b0;


always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        rd_en   <=  1'b0;
    else    if(wr_busy_fall == 1'b1)
        rd_en   <=  1'b1;
    else
        rd_en   <=  1'b0;


assign  rd_addr = SECTOR_ADDR;

always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        rd_busy_dly <=  1'b0;
    else
        rd_busy_dly <=  rd_busy;

assign  rd_busy_fall = ((rd_busy == 1'b0) && (rd_busy_dly == 1'b1))
                        ? 1'b1 : 1'b0;

always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        send_data_en    <=  1'b0;
    else    if((send_data_num == (DATA_NUM * 2) - 1'b1)
                && (cnt_wait == CNT_WAIT_MAX - 1'b1))
        send_data_en    <=  1'b0;
    else    if(rd_busy_fall == 1'b1)
        send_data_en    <=  1'b1;
    else
        send_data_en    <=  send_data_en;

always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        cnt_wait    <=  16'd0;
    else    if(send_data_en == 1'b1)
        if(cnt_wait == CNT_WAIT_MAX)
            cnt_wait    <=  16'd0;
        else
            cnt_wait    <=  cnt_wait + 1'b1;
    else
        cnt_wait    <=  16'd0;

always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        send_data_num   <=  12'd0;
    else    if(send_data_en == 1'b1)
        if(cnt_wait == CNT_WAIT_MAX)
            send_data_num   <=  send_data_num + 1'b1;
        else
            send_data_num   <=  send_data_num;
    else
        send_data_num   <=  12'd0;

always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        rd_fifo_rd_en   <=  1'b0;
    else    if(cnt_wait == (CNT_WAIT_MAX - 1'b1))
        rd_fifo_rd_en   <=  1'b1;
    else
        rd_fifo_rd_en   <=  1'b0;

always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        tx_flag <=  1'b0;
    else
        tx_flag <=  rd_fifo_rd_en;


fifo_wr_v9_1   fifo_wr_data_inst
(
    .rst            (~sys_rst_n         ),  
    .wr_clk         (sys_clk            ),  
    .wr_en          (rx_flag            ),  
    .din            (rx_data            ),  

    .full           (),
    .empty          (),
    .rd_clk         (sys_clk            ),  
    .rd_en          (wr_req             ),  
    .dout           (wr_data            ),  
    .rd_data_count  (wr_fifo_data_num   )   
);


fifo_rd_v9_1   fifo_rd_data_inst
(
    .rst        (~sys_rst_n     ),  
    .wr_clk     (sys_clk        ),  
    .wr_en      (rd_data_en     ),  
    .din        (rd_data        ),  

    .full       (),
    .empty      (),
    .rd_clk     (sys_clk        ),  
    .rd_en      (rd_fifo_rd_en  ),  
    .dout       (tx_data        )   
);

endmodule
