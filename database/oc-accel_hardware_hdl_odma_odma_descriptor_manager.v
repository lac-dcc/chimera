/*
 * Copyright 2019 International Business Machines
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
`timescale 1ns/1ps
//Yanheng Lu
//IBM CSL OpenPower
//lyhlu@cn.ibm.com

module odma_descriptor_manager (
        input                           clk             ,
        input                           rst_n           ,
        //configure
        input      [063:0]              init_addr0      ,
        input      [063:0]              init_addr1      ,
        input      [063:0]              init_addr2      ,
        input      [063:0]              init_addr3      ,
        input      [005:0]              init_size0      ,
        input      [005:0]              init_size1      ,
        input      [005:0]              init_size2      ,
        input      [005:0]              init_size3      ,
        input                           dsc_ch0_h2a     , //0:a2h 1:h2a
        input                           dsc_ch1_h2a     ,
        input                           dsc_ch2_h2a     ,
        input                           dsc_ch3_h2a     ,
        input                           dsc_ch0_axi_st  , //0:mm 1:st
        input                           dsc_ch1_axi_st  ,
        input                           dsc_ch2_axi_st  ,
        input                           dsc_ch3_axi_st  ,
        output     [063:0]              manager_error   ,
        input      [3:0]                manager_start   ,
        //Read
        output                          lcl_rd_valid    ,
        output     [63:0]               lcl_rd_ea       ,
        output     [4:0]                lcl_rd_axi_id   ,
        output                          lcl_rd_last     ,
        output                          lcl_rd_first    ,
        output     [127:0]              lcl_rd_be       ,
        output                          lcl_rd_ctx_valid,
        output     [8:0]                lcl_rd_ctx      , 
        input                           lcl_rd_ready    ,
        input                           lcl_rd_data_valid,
        input      [4:0]                lcl_rd_data_axi_id,
        input      [1023:0]             lcl_rd_data     ,
        input                           lcl_rd_data_last,
        input                           lcl_rd_rsp_code ,
        output                          lcl_rd_rsp_ready,
        //completion
        output     [3:0]                channel_done    ,
        output reg [29:0]               channel_id0     ,
        output reg [29:0]               channel_id1     ,
        output reg [29:0]               channel_id2     ,
        output reg [29:0]               channel_id3     ,
        output     [3:0]                manager_start_w ,
        //engine
        input      [3:0]                eng_buf_full    ,
        output     [3:0]                eng_buf_write   ,
        output reg [255:0]              eng_dsc_data0   ,
        output reg [255:0]              eng_dsc_data1   ,
        output reg [255:0]              eng_dsc_data2   ,
        output reg [255:0]              eng_dsc_data3
);

//lcl
    reg  [1:0]      read_channel;
    reg  [3:0]      beat_cnt;
    reg             read_start;
    reg  [5:0]      total_num;
    reg  [127:0]    read_byte_enable;
    reg  [63:0]     next_addr;
    reg  [3:0]      manager_start_r;
//channel
    wire            manager_start0;
    reg             channel0_done;
    reg  [63:0]     next_addr0;
    reg  [5:0]      ajacent_cnt0;
    reg             in_read0;
    wire            read_request0;
    wire [1023:0]   fifo_in0;
    reg  [1023:0]   fifo_in0_r;
    wire            fifo_push0;
    wire [6:0]      fifo_cnt0;
    wire            fifo_empty0;
    wire            fifo_full0;
    wire            fifo_pull0;
	wire [1023:0]   fifo_out0;
    reg  [255:0]    current_out0;
	reg  [1:0]      current_valid0;
	wire            unvalid_dsc0;
	wire            next_dsc0;

    wire            manager_start1;
    reg             channel1_done;
    reg  [63:0]     next_addr1;
    reg  [5:0]      ajacent_cnt1;
    reg             in_read1;
    wire            read_request1;
    wire [1023:0]   fifo_in1;
    reg  [1023:0]   fifo_in1_r;
    wire            fifo_push1;
    wire [6:0]      fifo_cnt1;
    wire            fifo_empty1;
    wire            fifo_full1;
    wire            fifo_pull1;
	wire [1023:0]   fifo_out1;
    reg  [255:0]    current_out1;
	reg  [1:0]      current_valid1;
	wire            unvalid_dsc1;
	wire            next_dsc1;

    wire            manager_start2;
    reg             channel2_done;
    reg  [63:0]     next_addr2;
    reg  [5:0]      ajacent_cnt2;
    reg             in_read2;
    wire            read_request2;
    wire [1023:0]   fifo_in2;
    reg  [1023:0]   fifo_in2_r;
    wire            fifo_push2;
    wire [6:0]      fifo_cnt2;
    wire            fifo_empty2;
    wire            fifo_full2;
    wire            fifo_pull2;
	wire [1023:0]   fifo_out2;
    reg  [255:0]    current_out2;
	reg  [1:0]      current_valid2;
	wire            unvalid_dsc2;
	wire            next_dsc2;

    wire            manager_start3;
    reg             channel3_done;
    reg  [63:0]     next_addr3;
    reg  [5:0]      ajacent_cnt3;
    reg             in_read3;
    wire            read_request3;
    wire [1023:0]   fifo_in3;
    reg  [1023:0]   fifo_in3_r;
    wire            fifo_push3;
    wire [6:0]      fifo_cnt3;
    wire            fifo_empty3;
    wire            fifo_full3;
    wire            fifo_pull3;
	wire [1023:0]   fifo_out3;
    reg  [255:0]    current_out3;
	reg  [1:0]      current_valid3;
	wire            unvalid_dsc3;
	wire            next_dsc3;

//engine
    reg             engine0_ready;
    reg  [1:0]      engine0_channel;
    reg             engine1_ready;
    reg  [1:0]      engine1_channel;
    reg             engine2_ready;
    reg  [1:0]      engine2_channel;
    reg             engine3_ready;
    reg  [1:0]      engine3_channel;

//channel arbiter
    assign lcl_rd_valid = read_start;
    assign lcl_rd_ea = next_addr + 'd128 * beat_cnt;
    assign lcl_rd_axi_id = {read_channel,3'b100};
    assign lcl_rd_last = (beat_cnt == total_num[5:2]) & read_start;
    assign lcl_rd_first = (beat_cnt == 'b0) & lcl_rd_valid;
    assign lcl_rd_be = read_byte_enable;
    assign lcl_rd_ctx = 9'b0;
    assign lcl_rd_ctx_valid = 0;
    assign lcl_rd_rsp_ready = 1'b1;
    assign manager_error = 64'b0;
    assign manager_start_w = {manager_start3,manager_start2,manager_start1,manager_start0};

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        manager_start_r <= 4'b0;
    else
        manager_start_r <= manager_start;

    always@(*)
    if(!rst_n)
        total_num = 'd0;
    else case(read_channel)
            2'b00: total_num = ajacent_cnt0;
            2'b01: total_num = ajacent_cnt1;
            2'b10: total_num = ajacent_cnt2;
            2'b11: total_num = ajacent_cnt3;
        endcase

    always@(*)
    if(!rst_n)
        next_addr = 'd0;
    else case(read_channel)
            2'b00: next_addr = next_addr0;
            2'b01: next_addr = next_addr1;
            2'b10: next_addr = next_addr2;
            2'b11: next_addr = next_addr3;
        endcase

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        read_start <= 1'b0;
    else if(lcl_rd_last & lcl_rd_valid & lcl_rd_ready)
        read_start <= 1'b0;
    else if(read_request0 | read_request1 | read_request2 | read_request3)
        read_start <= 1'b1;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        read_channel <= 2'b00;
    else if(read_start)
        read_channel <= read_channel;
    else if(read_request0)
        read_channel <= 2'b00;
    else if(read_request1)
        read_channel <= 2'b01;
    else if(read_request2)
        read_channel <= 2'b10;
    else if(read_request3)
        read_channel <= 2'b11;

    always@(*)
    if(!rst_n)
        read_byte_enable = 128'b0;
    else if(lcl_rd_last)
        case(total_num[1:0])
        2'b00: read_byte_enable = 128'h000000000000000000000000ffffffff;
        2'b01: read_byte_enable = 128'h0000000000000000ffffffffffffffff;
        2'b10: read_byte_enable = 128'h00000000ffffffffffffffffffffffff;
        2'b11: read_byte_enable = 128'hffffffffffffffffffffffffffffffff;
        endcase
    else
        read_byte_enable = 128'hffffffffffffffffffffffffffffffff;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        beat_cnt <= 4'b0;
    else if(lcl_rd_ready&lcl_rd_valid&lcl_rd_last)
        beat_cnt <= 4'b0;
    else if(lcl_rd_ready&lcl_rd_valid)
        beat_cnt <= beat_cnt + 1'b1;

//channel0
    assign read_request0 = !in_read0 & ((fifo_cnt0[4:0] + ajacent_cnt0[5:2] < 'd16) | fifo_empty0) & manager_start_r[0] & !channel0_done;
    assign manager_start0 = manager_start[0] & !manager_start_r[0];

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        channel0_done <= 1'b0;
    else if(manager_start0)
        channel0_done <= 1'b0;
    else if((lcl_rd_data_axi_id == 5'b00100) & lcl_rd_data_valid & !lcl_rd_rsp_code)
        case(ajacent_cnt0[1:0])
            2'b00: channel0_done <= lcl_rd_data[0];
            2'b01: channel0_done <= lcl_rd_data[256];
            2'b10: channel0_done <= lcl_rd_data[512];
            2'b11: channel0_done <= lcl_rd_data[768];
        endcase

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        in_read0 <= 1'b0;
    else if(read_start & (read_channel == 2'b00))
        in_read0 <= 1'b1;
    else if(in_read0 & lcl_rd_data_last & lcl_rd_data_valid & !lcl_rd_rsp_code & (lcl_rd_data_axi_id[4:0] == 5'b00100))
        in_read0 <= 1'b0;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        ajacent_cnt0 <= 6'h3f;
    else if(manager_start0)
        ajacent_cnt0 <= init_size0;
    else if(lcl_rd_data_valid & !lcl_rd_rsp_code & (lcl_rd_data_axi_id == 5'b00100) & lcl_rd_data_last)
        case(ajacent_cnt0[1:0])
            2'b11: ajacent_cnt0 <= lcl_rd_data[781:776];
            2'b10: ajacent_cnt0 <= lcl_rd_data[525:520];
            2'b01: ajacent_cnt0 <= lcl_rd_data[269:264];
            2'b00: ajacent_cnt0 <= lcl_rd_data[13:8];
        endcase

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        next_addr0 <= 'd0;
    else if(manager_start0)
        next_addr0 <= init_addr0;
    else if(lcl_rd_data_valid & !lcl_rd_rsp_code & (lcl_rd_data_axi_id == 5'b00100) & lcl_rd_data_last)
        case(ajacent_cnt0[1:0])
            2'b00: next_addr0 <= lcl_rd_data[255:192];
            2'b01: next_addr0 <= lcl_rd_data[511:448];
            2'b10: next_addr0 <= lcl_rd_data[767:704];
            2'b11: next_addr0 <= lcl_rd_data[1023:960];
        endcase

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            channel_id0 <= 30'b0;
        else if (manager_start0)
            channel_id0 <= 30'b0;
        else if(next_dsc0)
            channel_id0 <= channel_id0 + 1'b1;

    assign fifo_push0 = lcl_rd_data_valid & !lcl_rd_rsp_code & (lcl_rd_data_axi_id == 5'b00100);
    assign fifo_pull0 = ((next_dsc0 & (current_valid0 == 'd3)) | unvalid_dsc0) & !fifo_empty0;
	assign unvalid_dsc0 = (current_out0[31:16] != 16'had4b);
    assign channel_done[0] = next_dsc0 & current_out0[0];
	assign next_dsc0 = (eng_buf_write[0]&(engine0_channel==2'b00))|(eng_buf_write[1]&(engine1_channel==2'b00))|(eng_buf_write[2]&(engine2_channel==2'b00))|(eng_buf_write[3]&(engine3_channel==2'b00));
    assign fifo_in0 = fifo_in0_r;

    always@(*) begin
        fifo_in0_r = lcl_rd_data;
        if(lcl_rd_data_last & lcl_rd_data_valid & (lcl_rd_data_axi_id == 5'b00100))
            case(ajacent_cnt0[1:0])
            2'b00: fifo_in0_r[287] = 1'b0;
            2'b01: fifo_in0_r[543] = 1'b0;
            2'b10: fifo_in0_r[799] = 1'b0;
            endcase
    end

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            current_valid0 <= 2'b00;
        else if(manager_start0 | unvalid_dsc0)
            current_valid0 <= 2'b00;
        else if(next_dsc0)
            current_valid0 <= current_valid0 + 1'b1;

    always@(*)
        if(!rst_n)
            current_out0 = 256'b0;
        else case(current_valid0)
            2'b00: current_out0 = fifo_out0[255:0];
            2'b01: current_out0 = fifo_out0[511:256];
            2'b10: current_out0 = fifo_out0[767:512];
            2'b11: current_out0 = fifo_out0[1023:768];
        endcase

channel_fifo channel_fifo0 ( //256x64
    .clk            (clk            ),
    .srst           (manager_start0 ),
    .din            (fifo_in0_r     ),
    .wr_en          (fifo_push0     ),
    .rd_en          (fifo_pull0     ),
    .dout           (fifo_out0      ),
    .full           (fifo_full0     ),
	.data_count     (fifo_cnt0      ),
    .empty          (fifo_empty0    )
);

//channel1
    assign read_request1 = !in_read1 & ((fifo_cnt1[4:0] + ajacent_cnt1[5:2] < 'd16) | fifo_empty1) & manager_start_r[1] & !channel1_done;
    assign manager_start1 = manager_start[1] & !manager_start_r[1];

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        channel1_done <= 1'b0;
    else if(manager_start1)
        channel1_done <= 1'b0;
    else if((lcl_rd_data_axi_id == 5'b01100) & lcl_rd_data_valid & !lcl_rd_rsp_code)
        case(ajacent_cnt1[1:0])
            2'b00: channel1_done <= lcl_rd_data[0];
            2'b01: channel1_done <= lcl_rd_data[256];
            2'b10: channel1_done <= lcl_rd_data[512];
            2'b11: channel1_done <= lcl_rd_data[768];
        endcase

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        in_read1 <= 1'b0;
    else if(read_start & (read_channel == 2'b01))
        in_read1 <= 1'b1;
    else if(in_read1 & lcl_rd_data_last & lcl_rd_data_valid & !lcl_rd_rsp_code & (lcl_rd_data_axi_id[4:0] == 5'b01100))
        in_read1 <= 1'b0;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        ajacent_cnt1 <= 6'h3f;
    else if(manager_start1)
        ajacent_cnt1 <= init_size1;
    else if(lcl_rd_data_valid & !lcl_rd_rsp_code & (lcl_rd_data_axi_id == 5'b01100) & lcl_rd_data_last)
        case(ajacent_cnt1[1:0])
            2'b11: ajacent_cnt1 <= lcl_rd_data[781:776];
            2'b10: ajacent_cnt1 <= lcl_rd_data[525:520];
            2'b01: ajacent_cnt1 <= lcl_rd_data[269:264];
            2'b00: ajacent_cnt1 <= lcl_rd_data[13:8];
        endcase

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        next_addr1 <= 'd0;
    else if(manager_start1)
        next_addr1 <= init_addr1;
    else if(lcl_rd_data_valid & !lcl_rd_rsp_code & (lcl_rd_data_axi_id == 5'b01100) & lcl_rd_data_last)
        case(ajacent_cnt1[1:0])
            2'b00: next_addr1 <= lcl_rd_data[255:192];
            2'b01: next_addr1 <= lcl_rd_data[511:448];
            2'b10: next_addr1 <= lcl_rd_data[767:704];
            2'b11: next_addr1 <= lcl_rd_data[1023:960];
        endcase

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            channel_id1 <= 30'b0;
        else if (manager_start1)
            channel_id1 <= 30'b0;
        else if(next_dsc1)
            channel_id1 <= channel_id1 + 1'b1;

    assign fifo_push1 = lcl_rd_data_valid & !lcl_rd_rsp_code & (lcl_rd_data_axi_id == 5'b01100);
    assign fifo_pull1 = ((next_dsc1 & (current_valid1 == 'd3)) | unvalid_dsc1) & !fifo_empty1;
	assign unvalid_dsc1 = (current_out1[31:16] != 16'had4b);
    assign channel_done[1] = next_dsc1 & current_out1[0];
	assign next_dsc1 = (eng_buf_write[0]&(engine0_channel==2'b01))|(eng_buf_write[1]&(engine1_channel==2'b01))|(eng_buf_write[2]&(engine2_channel==2'b01))|(eng_buf_write[3]&(engine3_channel==2'b01));
    assign fifo_in1 = fifo_in1_r;

    always@(*) begin
        fifo_in1_r = lcl_rd_data;
        if(lcl_rd_data_last & lcl_rd_data_valid & (lcl_rd_data_axi_id == 5'b01100))
            case(ajacent_cnt1[1:0])
            2'b00: fifo_in1_r[287] = 1'b0;
            2'b01: fifo_in1_r[543] = 1'b0;
            2'b10: fifo_in1_r[799] = 1'b0;
            endcase
    end

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            current_valid1 <= 2'b00;
        else if(manager_start1 | unvalid_dsc1)
            current_valid1 <= 2'b00;
        else if(next_dsc1)
            current_valid1 <= current_valid1 + 1'b1;

    always@(*)
        if(!rst_n)
            current_out1 = 256'b0;
        else case(current_valid1)
            2'b00: current_out1 = fifo_out1[255:0];
            2'b01: current_out1 = fifo_out1[511:256];
            2'b10: current_out1 = fifo_out1[767:512];
            2'b11: current_out1 = fifo_out1[1023:768];
        endcase

channel_fifo channel_fifo1 ( //256x64
    .clk            (clk            ),
    .srst           (manager_start1 ),
    .din            (fifo_in1       ),
    .wr_en          (fifo_push1     ),
    .rd_en          (fifo_pull1     ),
    .dout           (fifo_out1      ),
    .full           (fifo_full1     ),
	.data_count     (fifo_cnt1      ),
    .empty          (fifo_empty1    )
);

//channel2
    assign read_request2 = !in_read2 & ((fifo_cnt2[4:0] + ajacent_cnt2[5:2] < 'd16) | fifo_empty2) & manager_start_r[2] & !channel2_done;
    assign manager_start2 = manager_start[2] & !manager_start_r[2];

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        channel2_done <= 1'b0;
    else if(manager_start2)
        channel2_done <= 1'b0;
    else if((lcl_rd_data_axi_id == 5'b10100) & lcl_rd_data_valid & !lcl_rd_rsp_code)
        case(ajacent_cnt2[1:0])
            2'b00: channel2_done <= lcl_rd_data[0];
            2'b01: channel2_done <= lcl_rd_data[256];
            2'b10: channel2_done <= lcl_rd_data[512];
            2'b11: channel2_done <= lcl_rd_data[768];
        endcase

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        in_read2 <= 1'b0;
    else if(read_start & (read_channel == 2'b10))
        in_read2 <= 1'b1;
    else if(in_read2 & lcl_rd_data_last & lcl_rd_data_valid & !lcl_rd_rsp_code & (lcl_rd_data_axi_id[4:0] == 5'b10100))
        in_read2 <= 1'b0;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        ajacent_cnt2 <= 6'h3f;
    else if(manager_start2)
        ajacent_cnt2 <= init_size2;
    else if(lcl_rd_data_valid & !lcl_rd_rsp_code & (lcl_rd_data_axi_id == 5'b10100) & lcl_rd_data_last)
        case(ajacent_cnt2[1:0])
            2'b11: ajacent_cnt2 <= lcl_rd_data[781:776];
            2'b10: ajacent_cnt2 <= lcl_rd_data[525:520];
            2'b01: ajacent_cnt2 <= lcl_rd_data[269:264];
            2'b00: ajacent_cnt2 <= lcl_rd_data[13:8];
        endcase

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        next_addr2 <= 'd0;
    else if(manager_start2)
        next_addr2 <= init_addr2;
    else if(lcl_rd_data_valid & !lcl_rd_rsp_code & (lcl_rd_data_axi_id == 5'b10100) & lcl_rd_data_last)
        case(ajacent_cnt2[1:0])
            2'b00: next_addr2 <= lcl_rd_data[255:192];
            2'b01: next_addr2 <= lcl_rd_data[511:448];
            2'b10: next_addr2 <= lcl_rd_data[767:704];
            2'b11: next_addr2 <= lcl_rd_data[1023:960];
        endcase

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            channel_id2 <= 30'b0;
        else if (manager_start2)
            channel_id2 <= 30'b0;
        else if(next_dsc2)
            channel_id2 <= channel_id2 + 1'b1;

    assign fifo_push2 = lcl_rd_data_valid & !lcl_rd_rsp_code & (lcl_rd_data_axi_id == 5'b10100);
    assign fifo_pull2 = ((next_dsc2 & (current_valid2 == 'd3)) | unvalid_dsc2) & !fifo_empty2;
	assign unvalid_dsc2 = (current_out2[31:16] != 16'had4b);
    assign channel_done[2] = next_dsc2 & current_out2[0];
	assign next_dsc2 = (eng_buf_write[0]&(engine0_channel==2'b10))|(eng_buf_write[1]&(engine1_channel==2'b10))|(eng_buf_write[2]&(engine2_channel==2'b10))|(eng_buf_write[3]&(engine3_channel==2'b10));
    assign fifo_in2 = fifo_in2_r;

    always@(*) begin
        fifo_in2_r = lcl_rd_data;
        if(lcl_rd_data_last & lcl_rd_data_valid & (lcl_rd_data_axi_id == 5'b10100))
            case(ajacent_cnt2[1:0])
            2'b00: fifo_in2_r[287] = 1'b0;
            2'b01: fifo_in2_r[543] = 1'b0;
            2'b10: fifo_in2_r[799] = 1'b0;
            endcase
    end

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            current_valid2 <= 2'b00;
        else if(manager_start2 | unvalid_dsc2)
            current_valid2 <= 2'b00;
        else if(next_dsc2)
            current_valid2 <= current_valid2 + 1'b1;

    always@(*)
        if(!rst_n)
            current_out2 = 256'b0;
        else case(current_valid2)
            2'b00: current_out2 = fifo_out2[255:0];
            2'b01: current_out2 = fifo_out2[511:256];
            2'b10: current_out2 = fifo_out2[767:512];
            2'b11: current_out2 = fifo_out2[1023:768];
        endcase

channel_fifo channel_fifo2 ( //256x64
    .clk            (clk            ),
    .srst           (manager_start2 ),
    .din            (fifo_in2       ),
    .wr_en          (fifo_push2     ),
    .rd_en          (fifo_pull2     ),
    .dout           (fifo_out2      ),
    .full           (fifo_full2     ),
	.data_count     (fifo_cnt2      ),
    .empty          (fifo_empty2    )
);

//channel3
    assign read_request3 = !in_read3 & ((fifo_cnt3[4:0] + ajacent_cnt3[5:2] < 'd16) | fifo_empty3) & manager_start_r[3] & !channel3_done;
    assign manager_start3 = manager_start[3] & !manager_start_r[3];

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        channel3_done <= 1'b0;
    else if(manager_start3)
        channel3_done <= 1'b0;
    else if((lcl_rd_data_axi_id == 5'b11100) & lcl_rd_data_valid & !lcl_rd_rsp_code)
        case(ajacent_cnt3[1:0])
            2'b00: channel3_done <= lcl_rd_data[0];
            2'b01: channel3_done <= lcl_rd_data[256];
            2'b10: channel3_done <= lcl_rd_data[512];
            2'b11: channel3_done <= lcl_rd_data[768];
        endcase

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        in_read3 <= 1'b0;
    else if(read_start & (read_channel == 2'b11))
        in_read3 <= 1'b1;
    else if(in_read3 & lcl_rd_data_last & lcl_rd_data_valid & !lcl_rd_rsp_code & (lcl_rd_data_axi_id[4:0] == 5'b11100))
        in_read3 <= 1'b0;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        ajacent_cnt3 <= 6'h3f;
    else if(manager_start3)
        ajacent_cnt3 <= init_size3;
    else if(lcl_rd_data_valid & !lcl_rd_rsp_code & (lcl_rd_data_axi_id == 5'b11100) & lcl_rd_data_last)
        case(ajacent_cnt3[1:0])
            2'b11: ajacent_cnt3 <= lcl_rd_data[781:776];
            2'b10: ajacent_cnt3 <= lcl_rd_data[525:520];
            2'b01: ajacent_cnt3 <= lcl_rd_data[269:264];
            2'b00: ajacent_cnt3 <= lcl_rd_data[13:8];
        endcase

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        next_addr3 <= 'd0;
    else if(manager_start3)
        next_addr3 <= init_addr3;
    else if(lcl_rd_data_valid & !lcl_rd_rsp_code & (lcl_rd_data_axi_id == 5'b11100) & lcl_rd_data_last)
        case(ajacent_cnt3[1:0])
            2'b00: next_addr3 <= lcl_rd_data[255:192];
            2'b01: next_addr3 <= lcl_rd_data[511:448];
            2'b10: next_addr3 <= lcl_rd_data[767:704];
            2'b11: next_addr3 <= lcl_rd_data[1023:960];
        endcase

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            channel_id3 <= 30'b0;
        else if (manager_start3)
            channel_id3 <= 30'b0;
        else if(next_dsc3)
            channel_id3 <= channel_id3 + 1'b1;

    assign fifo_push3 = lcl_rd_data_valid & !lcl_rd_rsp_code & (lcl_rd_data_axi_id == 5'b11100);
    assign fifo_pull3 = ((next_dsc3 & (current_valid3 == 'd3)) | unvalid_dsc3) & !fifo_empty3;
	assign unvalid_dsc3 = (current_out3[31:16] != 16'had4b);
    assign channel_done[3] = next_dsc3 & current_out3[0];
	assign next_dsc3 = (eng_buf_write[0]&(engine0_channel==2'b11))|(eng_buf_write[1]&(engine1_channel==2'b11))|(eng_buf_write[2]&(engine2_channel==2'b11))|(eng_buf_write[3]&(engine3_channel==2'b11));
    assign fifo_in3 = fifo_in3_r;

    always@(*) begin
        fifo_in3_r = lcl_rd_data;
        if(lcl_rd_data_last & lcl_rd_data_valid & (lcl_rd_data_axi_id == 5'b11100))
            case(ajacent_cnt3[1:0])
            2'b00: fifo_in3_r[287] = 1'b0;
            2'b01: fifo_in3_r[543] = 1'b0;
            2'b10: fifo_in3_r[799] = 1'b0;
            endcase
    end

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            current_valid3 <= 2'b00;
        else if(manager_start3 | unvalid_dsc3)
            current_valid3 <= 2'b00;
        else if(next_dsc3)
            current_valid3 <= current_valid3 + 1'b1;

    always@(*)
        if(!rst_n)
            current_out3 = 256'b0;
        else case(current_valid3)
            2'b00: current_out3 = fifo_out3[255:0];
            2'b01: current_out3 = fifo_out3[511:256];
            2'b10: current_out3 = fifo_out3[767:512];
            2'b11: current_out3 = fifo_out3[1023:768];
        endcase

channel_fifo channel_fifo3 ( //256x64
    .clk            (clk            ),
    .srst           (manager_start3 ),
    .din            (fifo_in3       ),
    .wr_en          (fifo_push3     ),
    .rd_en          (fifo_pull3     ),
    .dout           (fifo_out3      ),
    .full           (fifo_full3     ),
	.data_count     (fifo_cnt3      ),
    .empty          (fifo_empty3    )
);

//engine 0
    assign eng_buf_write[0] = engine0_ready&!eng_buf_full[0];

    always@(*)
        if(!rst_n)
            eng_dsc_data0 = 256'b0;
        else
            case(engine0_channel)
            2'b00:eng_dsc_data0 = {34'h0,channel_id0,current_out0[191:0]};
            2'b01:eng_dsc_data0 = {34'h1,channel_id1,current_out1[191:0]};
            2'b10:eng_dsc_data0 = {34'h2,channel_id2,current_out2[191:0]};
            2'b11:eng_dsc_data0 = {34'h3,channel_id3,current_out3[191:0]};
            endcase

    always@(*)
        if(!rst_n)
            engine0_ready = 1'b0;
        else
            case(engine0_channel)
            2'b00:engine0_ready = !fifo_empty0 & !dsc_ch0_h2a & !dsc_ch0_axi_st & (current_out0[31:16] == 16'had4b);
            2'b01:engine0_ready = !fifo_empty1 & !dsc_ch1_h2a & !dsc_ch1_axi_st & (current_out1[31:16] == 16'had4b);
            2'b10:engine0_ready = !fifo_empty2 & !dsc_ch2_h2a & !dsc_ch2_axi_st & (current_out2[31:16] == 16'had4b);
            2'b11:engine0_ready = !fifo_empty3 & !dsc_ch3_h2a & !dsc_ch3_axi_st & (current_out3[31:16] == 16'had4b);
            endcase

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            engine0_channel <= 2'b00;
        else if(!eng_buf_full[0])
            engine0_channel <= engine0_channel + 1'b1;

//engine 1
    assign eng_buf_write[1] = engine1_ready&!eng_buf_full[1];

    always@(*)
        if(!rst_n)
            eng_dsc_data1 = 1'b0;
        else
            case(engine1_channel)
            2'b00:eng_dsc_data1 = {34'h0,channel_id0,current_out0[191:0]};
            2'b01:eng_dsc_data1 = {34'h1,channel_id1,current_out1[191:0]};
            2'b10:eng_dsc_data1 = {34'h2,channel_id2,current_out2[191:0]};
            2'b11:eng_dsc_data1 = {34'h3,channel_id3,current_out3[191:0]};
            endcase

    always@(*)
        if(!rst_n)
            engine1_ready = 1'b0;
        else
            case(engine1_channel)
            2'b00:engine1_ready = !fifo_empty0 & !dsc_ch0_h2a & dsc_ch0_axi_st & (current_out0[31:16] == 16'had4b);
            2'b01:engine1_ready = !fifo_empty1 & !dsc_ch1_h2a & dsc_ch1_axi_st & (current_out1[31:16] == 16'had4b);
            2'b10:engine1_ready = !fifo_empty2 & !dsc_ch2_h2a & dsc_ch2_axi_st & (current_out2[31:16] == 16'had4b);
            2'b11:engine1_ready = !fifo_empty3 & !dsc_ch3_h2a & dsc_ch3_axi_st & (current_out3[31:16] == 16'had4b);
            endcase

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            engine1_channel <= 2'b00;
        else if(!eng_buf_full[1])
            engine1_channel <= engine1_channel + 1'b1;

//engine 2
    assign eng_buf_write[2] = engine2_ready&!eng_buf_full[2];

    always@(*)
        if(!rst_n)
            eng_dsc_data2 = 1'b0;
        else
            case(engine2_channel)
            2'b00:eng_dsc_data2 = {34'h0,channel_id0,current_out0[191:0]};
            2'b01:eng_dsc_data2 = {34'h1,channel_id1,current_out1[191:0]};
            2'b10:eng_dsc_data2 = {34'h2,channel_id2,current_out2[191:0]};
            2'b11:eng_dsc_data2 = {34'h3,channel_id3,current_out3[191:0]};
            endcase

    always@(*)
        if(!rst_n)
            engine2_ready = 1'b0;
        else
            case(engine2_channel)
            2'b00:engine2_ready = !fifo_empty0 & dsc_ch0_h2a & !dsc_ch0_axi_st & (current_out0[31:16] == 16'had4b);
            2'b01:engine2_ready = !fifo_empty1 & dsc_ch1_h2a & !dsc_ch1_axi_st & (current_out1[31:16] == 16'had4b);
            2'b10:engine2_ready = !fifo_empty2 & dsc_ch2_h2a & !dsc_ch2_axi_st & (current_out2[31:16] == 16'had4b);
            2'b11:engine2_ready = !fifo_empty3 & dsc_ch3_h2a & !dsc_ch3_axi_st & (current_out3[31:16] == 16'had4b);
            endcase

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            engine2_channel <= 2'b00;
        else if(!eng_buf_full[2])
            engine2_channel <= engine2_channel + 1'b1;

//engine 3
    assign eng_buf_write[3] = engine3_ready&!eng_buf_full[3];

    always@(*)
        if(!rst_n)
            eng_dsc_data3 = 1'b0;
        else
            case(engine3_channel)
            2'b00:eng_dsc_data3 = {34'h0,channel_id0,current_out0[191:0]};
            2'b01:eng_dsc_data3 = {34'h1,channel_id1,current_out1[191:0]};
            2'b10:eng_dsc_data3 = {34'h2,channel_id2,current_out2[191:0]};
            2'b11:eng_dsc_data3 = {34'h3,channel_id3,current_out3[191:0]};
            endcase

    always@(*)
        if(!rst_n)
            engine3_ready = 1'b0;
        else
            case(engine3_channel)
            2'b00:engine3_ready = !fifo_empty0 & dsc_ch0_h2a & dsc_ch0_axi_st & (current_out0[31:16] == 16'had4b);
            2'b01:engine3_ready = !fifo_empty1 & dsc_ch1_h2a & dsc_ch1_axi_st & (current_out1[31:16] == 16'had4b);
            2'b10:engine3_ready = !fifo_empty2 & dsc_ch2_h2a & dsc_ch2_axi_st & (current_out2[31:16] == 16'had4b);
            2'b11:engine3_ready = !fifo_empty3 & dsc_ch3_h2a & dsc_ch3_axi_st & (current_out3[31:16] == 16'had4b);
            endcase

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            engine3_channel <= 2'b00;
        else if(!eng_buf_full[3])
            engine3_channel <= engine3_channel + 1'b1;

endmodule
