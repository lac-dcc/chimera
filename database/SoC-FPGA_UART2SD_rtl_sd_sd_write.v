// This program was cloned from: https://github.com/abdelazeem201/SoC-FPGA
// License: MIT License

//*************************************************************************
//*  ASIC                                                                *
//*  UART2SD                                               
//*  Top File : sd_write.v                                                 *
//*  Author: Abdelazeem                                                   *
//*  Revision 0.1                                                         *
//*  Date     2024/01/26                                                   *
//*  Email : a.abdelazeem201@gmail.com                                      *
//*************************************************************************
`timescale  1ns/1ns
module  sd_write
(
    input   wire            sys_clk         ,   
    input   wire            sys_clk_shift   ,   
    input   wire            sys_rst_n       ,   
    input   wire            miso            ,   
    input   wire            wr_en           ,   
    input   wire    [31:0]  wr_addr         ,   
    input   wire    [15:0]  wr_data         ,   

    output  reg             cs_n            ,   
    output  reg             mosi            ,   
    output  wire            wr_busy         ,   
    output  wire            wr_req              
);

parameter   IDLE        =   3'b000  ,   
            SEND_CMD24  =   3'b001  ,   
            CMD24_ACK   =   3'b011  ,   
            WR_DATA     =   3'b010  ,   
            WR_BUSY     =   3'b110  ,   
            WR_END      =   3'b111  ;   
parameter   DATA_NUM    =   12'd256 ;   
parameter   BYTE_HEAD   =   16'hfffe;   


wire    [47:0]  cmd_wr      ;   

reg     [2:0]   state       ;   
reg     [7:0]   cnt_cmd_bit ;   
reg             ack_en      ;   
reg     [7:0]   ack_data    ;   
reg     [7:0]   cnt_ack_bit ;   
reg     [11:0]  cnt_data_num;   
reg     [3:0]   cnt_data_bit;   
reg     [7:0]   busy_data   ;   
reg     [2:0]   cnt_end     ;   
reg             miso_dly    ;   

assign  wr_busy = (state != IDLE) ? 1'b1 : 1'b0;


assign  wr_req = ((cnt_data_num <= DATA_NUM - 1'b1) && (cnt_data_bit == 4'd15))
                ? 1'b1 : 1'b0;


assign  cmd_wr = {8'h58,wr_addr,8'hff};


always@(posedge sys_clk_shift or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        miso_dly    <=  1'b0;
    else
        miso_dly    <=  miso;


always@(posedge sys_clk_shift or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        ack_en  <=  1'b0;
    else    if(cnt_ack_bit == 8'd15)
        ack_en  <=  1'b0;
    else    if((state == CMD24_ACK) && (miso == 1'b0)
                && (miso_dly == 1'b1) && (cnt_ack_bit == 8'd0))
        ack_en  <=  1'b1;
    else
        ack_en  <=  ack_en;


always@(posedge sys_clk_shift or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        begin
            ack_data    <=  8'b0;
            cnt_ack_bit <=  8'd0;
        end
    else    if(ack_en == 1'b1)
        begin
            cnt_ack_bit     <=  cnt_ack_bit + 8'd1;
            if(cnt_ack_bit < 8'd8)
                ack_data    <=  {ack_data[6:0],miso_dly};
            else
                ack_data    <=  ack_data;
        end
    else
        cnt_ack_bit <=  8'd0;


always@(posedge sys_clk_shift or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        busy_data   <=  8'd0;
    else    if(state == WR_BUSY)
        busy_data   <=  {busy_data[6:0],miso};
    else
        busy_data   <=  8'd0;


always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        state   <=  IDLE;
    else
        case(state)
            IDLE:
                if(wr_en == 1'b1)
                    state   <=  SEND_CMD24;
                else
                    state   <=  state;
            SEND_CMD24:
                if(cnt_cmd_bit == 8'd47)
                    state   <=  CMD24_ACK;
                else
                    state   <=  state;
            CMD24_ACK:
                if(cnt_ack_bit == 8'd15)
                    if(ack_data == 8'h00)
                        state   <=  WR_DATA;
                    else
                        state   <=  SEND_CMD24;
                else
                    state   <=  state;
            WR_DATA:
                if((cnt_data_num == (DATA_NUM + 1'b1))
                    && (cnt_data_bit == 4'd15))
                    state   <=  WR_BUSY;
                else
                    state   <=  state;
            WR_BUSY:
                if(busy_data == 8'hff)
                    state   <=  WR_END;
                else
                    state   <=  state;
            WR_END:
                if(cnt_end == 3'd7)
                    state   <=  IDLE;
                else
                    state   <=  state;
            default:state   <=  IDLE;
        endcase


always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        cs_n    <=  1'b1;
    else    if(cnt_end == 3'd7)
        cs_n    <=  1'b1;
    else    if(wr_en == 1'b1)
        cs_n    <=  1'b0;
    else
        cs_n    <=  cs_n;

always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        cnt_cmd_bit     <=  8'd0;
    else    if(state == SEND_CMD24)
        cnt_cmd_bit     <=  cnt_cmd_bit + 8'd1;
    else
        cnt_cmd_bit     <=  8'd0;

always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        mosi    <=  1'b1;
    else    if(state == SEND_CMD24)
        mosi    <=  cmd_wr[8'd47 - cnt_cmd_bit];
    else    if(state == WR_DATA)
        if(cnt_data_num == 12'd0)
            mosi    <=  BYTE_HEAD[15 - cnt_data_bit];
        else    if((cnt_data_num >= 12'd1) && (cnt_data_num <= DATA_NUM))
            mosi    <=  wr_data[15 - cnt_data_bit];
        else
            mosi    <=  1'b1;
    else
        mosi    <=  1'b1;

always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        cnt_data_bit    <=  4'd0;
    else    if(state == WR_DATA)
        cnt_data_bit    <=  cnt_data_bit + 4'd1;
    else
        cnt_data_bit    <=  4'd0;

always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        cnt_data_num    <=  12'd0;
    else    if(state == WR_DATA)
        if(cnt_data_bit == 4'd15)
            cnt_data_num    <=  cnt_data_num + 12'd1;
        else
            cnt_data_num    <=  cnt_data_num;
    else
        cnt_data_num    <=  12'd0;

always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        cnt_end <=  3'd0;
    else    if(state == WR_END)
        cnt_end <=  cnt_end + 3'd1;
    else
        cnt_end <=  3'd0;

endmodule

