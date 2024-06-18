// This program was cloned from: https://github.com/OpenCAPI/oc-accel
// License: Apache License 2.0

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

module odma_completion_manager (
        input                           clk             ,
        input                           rst_n           ,
        //interrupt
        input                           action_interrupt    ,
        input     [8:0]                 action_interrupt_ctx,
        input     [63:0]                action_interrupt_src,
        output                          action_interrupt_ack,
        output reg                      odma_interrupt      ,
        output     [8:0]                odma_interrupt_ctx  ,
        output reg [63:0]               odma_interrupt_src  ,
        input                           odma_interrupt_ack  ,
        //configuration
        input      [63:0]               completion_addr0,
        input      [31:0]               completion_size0,
        input      [63:0]               completion_addr1,
        input      [31:0]               completion_size1,
        input      [63:0]               completion_addr2,
        input      [31:0]               completion_size2,
        input      [63:0]               completion_addr3,
        input      [31:0]               completion_size3,
        output     [63:0]               completion_error,
        output     [3:0]                completion_done ,
        input      [63:0]               cmp_ch0_obj_handle,
        input      [63:0]               cmp_ch1_obj_handle,
        input      [63:0]               cmp_ch2_obj_handle,
        input      [63:0]               cmp_ch3_obj_handle,
        //engine
        input      [15:0]               eng_cmp_done    ,
        output     [15:0]               eng_cmp_okay    ,
        input      [511:0]              eng_cmp_data00  ,
        input      [511:0]              eng_cmp_data01  ,
        input      [511:0]              eng_cmp_data02  ,
        input      [511:0]              eng_cmp_data03  ,
        input      [511:0]              eng_cmp_data10  ,
        input      [511:0]              eng_cmp_data11  ,
        input      [511:0]              eng_cmp_data12  ,
        input      [511:0]              eng_cmp_data13  ,
        input      [511:0]              eng_cmp_data20  ,
        input      [511:0]              eng_cmp_data21  ,
        input      [511:0]              eng_cmp_data22  ,
        input      [511:0]              eng_cmp_data23  ,
        input      [511:0]              eng_cmp_data30  ,
        input      [511:0]              eng_cmp_data31  ,
        input      [511:0]              eng_cmp_data32  ,
        input      [511:0]              eng_cmp_data33  ,
        //write
        output                          lcl_wr_valid    ,
        output     [63:0]               lcl_wr_ea       ,
        output     [4:0]                lcl_wr_axi_id   ,
        output     [127:0]              lcl_wr_be       ,
        output                          lcl_wr_first    ,
        output                          lcl_wr_last     ,
        output     [1023:0]             lcl_wr_data     ,
        output                          lcl_wr_ctx_valid,
        output     [8:0]                lcl_wr_ctx      ,
        input                           lcl_wr_ready    ,
        input                           lcl_wr_rsp_valid,
        input      [4:0]                lcl_wr_rsp_axi_id,
        input                           lcl_wr_rsp_code ,
        output                          lcl_wr_rsp_ready,
        //descriptor
        input      [3:0]                channel_done    ,
        input      [29:0]               channel_id0     ,
        input      [29:0]               channel_id1     ,
        input      [29:0]               channel_id2     ,
        input      [29:0]               channel_id3     ,
        input      [3:0]                manager_start_w
);

    reg                 write_start;
    reg     [63:0]      write_address;
    reg     [1023:0]    write_data;
    reg     [1:0]       write_channel;
    reg     [3:0]       channel_done_r;

    reg     [1:0]       write_request0;
    reg                 in_write0;
    reg     [31:0]      waddr_offside0;
    reg     [511:0]     channel0_buf;
    reg     [29:0]      channel_cnt0;
    reg     [1:0]       write_request1;
    reg                 in_write1;
    reg     [31:0]      waddr_offside1;
    reg     [511:0]     channel1_buf;
    reg     [29:0]      channel_cnt1;
    reg     [1:0]       write_request2;
    reg                 in_write2;
    reg     [31:0]      waddr_offside2;
    reg     [511:0]     channel2_buf;
    reg     [29:0]      channel_cnt2;
    reg     [1:0]       write_request3;
    reg                 in_write3;
    reg     [31:0]      waddr_offside3;
    reg     [511:0]     channel3_buf;
    reg     [29:0]      channel_cnt3;

    reg                 interrupt_source; //0:odma 1:action
    reg                 interrupt0_req;
    reg                 interrupt1_req;
    reg                 interrupt2_req;
    reg                 interrupt3_req;
    reg                 interrupt_req;
    wire                interrupt_ack;
    reg     [1:0]       interrupt_channel;

//interrupt related
    assign interrupt_ack = odma_interrupt_ack & !interrupt_source;
    assign action_interrupt_ack = odma_interrupt_ack & interrupt_source;
    assign odma_interrupt_ctx = interrupt_source ? action_interrupt_ctx : 9'b0;

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            odma_interrupt <= 1'b0;
        else if(odma_interrupt_ack)
            odma_interrupt <= 1'b0;
        else if(interrupt_req | action_interrupt)
            odma_interrupt <= 1'b1;

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            interrupt_source <= 1'b0;
        else if(odma_interrupt_ack)
            interrupt_source <= 1'b0;
        else if(action_interrupt & !interrupt_req)
            interrupt_source <= 1'b1;

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            interrupt0_req <= 1'b0;
        else if(interrupt_ack & (interrupt_channel == 2'b00))
            interrupt0_req <= 1'b0;
        else if(channel0_buf[34])
            interrupt0_req <= 1'b1;

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            interrupt1_req <= 1'b0;
        else if(interrupt_ack & (interrupt_channel == 2'b01))
            interrupt1_req <= 1'b0;
        else if(channel1_buf[34])
            interrupt1_req <= 1'b1;

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            interrupt2_req <= 1'b0;
        else if(interrupt_ack & (interrupt_channel == 2'b10))
            interrupt2_req <= 1'b0;
        else if(channel2_buf[34])
            interrupt2_req <= 1'b1;

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            interrupt3_req <= 1'b0;
        else if(interrupt_ack & (interrupt_channel == 2'b11))
            interrupt3_req <= 1'b0;
        else if(channel3_buf[34])
            interrupt3_req <= 1'b1;

    always@(*)
        if(!interrupt_source)
            case(interrupt_channel)
            2'b00: odma_interrupt_src = cmp_ch0_obj_handle;
            2'b01: odma_interrupt_src = cmp_ch1_obj_handle;
            2'b10: odma_interrupt_src = cmp_ch2_obj_handle;
            2'b11: odma_interrupt_src = cmp_ch3_obj_handle;
            endcase
        else
            odma_interrupt_src = action_interrupt_src;

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            interrupt_channel <= 2'b00;
        else if(interrupt_req)
            interrupt_channel <= interrupt_channel;
        else if(interrupt0_req)
            interrupt_channel <= 2'b00;
        else if(interrupt1_req)
            interrupt_channel <= 2'b01;
        else if(interrupt2_req)
            interrupt_channel <= 2'b10;
        else if(interrupt3_req)
            interrupt_channel <= 2'b11;

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            interrupt_req <= 1'b0;
        else if(interrupt_ack)
            interrupt_req <= 1'b0;
        else if(interrupt0_req | interrupt1_req | interrupt2_req | interrupt3_req)
            interrupt_req <= 1'b1;

//lcl write
    assign lcl_wr_first = lcl_wr_valid;
    assign lcl_wr_last = lcl_wr_valid;
    assign lcl_wr_valid = write_start;
    assign lcl_wr_be = 128'hffffffffffffffffffffffffffffffff;
    assign lcl_wr_ea = write_address;
    assign lcl_wr_data = write_data;
    assign lcl_wr_axi_id = {write_channel,3'b101};
    assign lcl_wr_ctx_valid = 1'b0;
    assign lcl_wr_ctx = 9'b0;
    assign lcl_wr_rsp_ready = 1'b1;
    assign completion_error = 64'b0;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        channel_done_r[3] <= 1'b0;
    else if(manager_start_w[3])
        channel_done_r[3] <= 1'b0;
    else if(channel_done[3])
        channel_done_r[3] <= 1'b1;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        channel_done_r[2] <= 1'b0;
    else if(manager_start_w[2])
        channel_done_r[2] <= 1'b0;
    else if(channel_done[2])
        channel_done_r[2] <= 1'b1;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        channel_done_r[1] <= 1'b0;
    else if(manager_start_w[1])
        channel_done_r[1] <= 1'b0;
    else if(channel_done[1])
        channel_done_r[1] <= 1'b1;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        channel_done_r[0] <= 1'b0;
    else if(manager_start_w[0])
        channel_done_r[0] <= 1'b0;
    else if(channel_done[0])
        channel_done_r[0] <= 1'b1;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        write_start <= 1'b0;
    else if(lcl_wr_valid & lcl_wr_ready)
        write_start <= 1'b0;
    else if(write_request0 || write_request1 || write_request2 || write_request3)
        write_start <= 1'b1;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        write_channel <= 2'b00;
    else if(write_start)
        write_channel <= write_channel;
    else if(write_request0 != 2'b00)
        write_channel <= 2'b00;
    else if(write_request1 != 2'b00)
        write_channel <= 2'b01;
    else if(write_request2 != 2'b00)
        write_channel <= 2'b10;
    else if(write_request3 != 2'b00)
        write_channel <= 2'b11;

    always@(*)
    if(!rst_n)
        write_address = 64'd0;
    else case(write_channel)
        2'b00: write_address = completion_addr0;// + waddr_offside0;
        2'b01: write_address = completion_addr1;// + waddr_offside1;
        2'b10: write_address = completion_addr2;// + waddr_offside2;
        2'b11: write_address = completion_addr3;// + waddr_offside3;
        endcase

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        write_data = 1024'd0;
    else case(write_channel)
        2'b00: write_data = {channel0_buf,482'b0,channel_cnt0};
        2'b01: write_data = {channel1_buf,482'b0,channel_cnt1};
        2'b10: write_data = {channel2_buf,482'b0,channel_cnt2};
        2'b11: write_data = {channel3_buf,482'b0,channel_cnt3};
        endcase

//channel 0
    assign completion_done[0] = (channel_cnt0 > channel_id0) & channel_done_r[0];

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        write_request0 <= 2'b0;
    else if ((eng_cmp_okay[0] | eng_cmp_okay[4] | eng_cmp_okay[8] | eng_cmp_okay[12]) & (lcl_wr_valid & lcl_wr_ready & (write_channel == 2'b00)))
        write_request0 <= write_request0;
    else if (eng_cmp_okay[0] | eng_cmp_okay[4] | eng_cmp_okay[8] | eng_cmp_okay[12])
        write_request0 <= write_request0 + 1'b1;
    else if (lcl_wr_valid & lcl_wr_ready & (write_channel == 2'b00))
        write_request0 <= write_request0 - 1'b1;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        waddr_offside0 <= 'd0;
    else if (lcl_wr_rsp_valid & !lcl_wr_rsp_code & (lcl_wr_rsp_axi_id == 5'b00101))
        waddr_offside0 <= waddr_offside0 + 'd128;
    else if(waddr_offside0 == completion_size0)
        waddr_offside0 <= 'd0;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        in_write0 <= 1'b0;
    else if(write_start & (write_channel == 2'b00))
        in_write0 <= 1'b1;
    else if(lcl_wr_rsp_valid & (lcl_wr_rsp_axi_id == 5'b00101))
        in_write0 <= 1'b0;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        channel0_buf <= 512'b0;
    else if(eng_cmp_okay[0])
        channel0_buf <= eng_cmp_data00;
    else if(eng_cmp_okay[4])
        channel0_buf <= eng_cmp_data10;
    else if(eng_cmp_okay[8])
        channel0_buf <= eng_cmp_data20;
    else if(eng_cmp_okay[12])
        channel0_buf <= eng_cmp_data30;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        channel_cnt0 <= 'd0;
    else if(manager_start_w[0])
        channel_cnt0 <= 'd1;
    else if(lcl_wr_valid & (lcl_wr_axi_id == 5'b00101) & lcl_wr_ready)
        channel_cnt0 <= channel_cnt0 + 1'b1;

//channel 1
    assign completion_done[1] = (channel_cnt1 > channel_id1) & channel_done_r[1];

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        write_request1 <= 2'b00;
    else if ((eng_cmp_okay[1] | eng_cmp_okay[5] | eng_cmp_okay[9] | eng_cmp_okay[13]) & (lcl_wr_valid & lcl_wr_ready & (write_channel == 2'b01)))
        write_request1 <= write_request1;
    else if (eng_cmp_okay[1] | eng_cmp_okay[5] | eng_cmp_okay[9] | eng_cmp_okay[13])
        write_request1 <= write_request1 + 1'b1;
    else if (lcl_wr_valid & lcl_wr_ready & (write_channel == 2'b01))
        write_request1 <= write_request1 - 1'b1;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        waddr_offside1 <= 'd0;
    else if (lcl_wr_rsp_valid & !lcl_wr_rsp_code & (lcl_wr_rsp_axi_id == 5'b01101))
        waddr_offside1 <= waddr_offside1 + 'd128;
    else if(waddr_offside1 == completion_size1)
        waddr_offside1 <= 'd0;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        channel1_buf <= 512'b0;
    else if(eng_cmp_okay[1])
        channel1_buf <= eng_cmp_data01;
    else if(eng_cmp_okay[5])
        channel1_buf <= eng_cmp_data11;
    else if(eng_cmp_okay[9])
        channel1_buf <= eng_cmp_data21;
    else if(eng_cmp_okay[13])
        channel1_buf <= eng_cmp_data31;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        channel_cnt1 <= 'd0;
    else if(manager_start_w[1])
        channel_cnt1 <= 'd1;
    else if(lcl_wr_valid & (lcl_wr_axi_id == 5'b01101) & lcl_wr_ready)
        channel_cnt1 <= channel_cnt1 + 1'b1;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        in_write1 <= 1'b0;
    else if(write_start & (write_channel == 2'b01))
        in_write1 <= 1'b1;
    else if(lcl_wr_rsp_valid & (lcl_wr_rsp_axi_id == 5'b01101))
        in_write1 <= 1'b0;

//channel 2
    assign completion_done[2] = (channel_cnt2 > channel_id2) & channel_done_r[2];

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        write_request2 <= 2'b00;
    else if ((eng_cmp_okay[2] | eng_cmp_okay[6] | eng_cmp_okay[10] | eng_cmp_okay[14]) & (lcl_wr_valid & lcl_wr_ready & (write_channel == 2'b10)))
        write_request2 <= write_request2;
    else if (eng_cmp_okay[2] | eng_cmp_okay[6] | eng_cmp_okay[10] | eng_cmp_okay[14])
        write_request2 <= write_request2 + 1'b1;
    else if (lcl_wr_valid & lcl_wr_ready & (write_channel == 2'b10))
        write_request2 <= write_request2 - 1'b1;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        waddr_offside2 <= 'd0;
    else if (lcl_wr_rsp_valid & !lcl_wr_rsp_code & (lcl_wr_rsp_axi_id == 5'b10101))
        waddr_offside2 <= waddr_offside2 + 'd128;
    else if(waddr_offside2 == completion_size2)
        waddr_offside2 <= 'd0;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        channel2_buf <= 512'b0;
    else if(eng_cmp_okay[2])
        channel2_buf <= eng_cmp_data02;
    else if(eng_cmp_okay[6])
        channel2_buf <= eng_cmp_data12;
    else if(eng_cmp_okay[10])
        channel2_buf <= eng_cmp_data22;
    else if(eng_cmp_okay[14])
        channel2_buf <= eng_cmp_data32;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        channel_cnt2 <= 'd0;
    else if(manager_start_w[2])
        channel_cnt2 <= 'd1;
    else if(lcl_wr_valid & (lcl_wr_axi_id == 5'b10101) & lcl_wr_ready)
        channel_cnt2 <= channel_cnt2 + 1'b1;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        in_write2 <= 1'b0;
    else if(write_start & (write_channel == 2'b10))
        in_write2 <= 1'b1;
    else if(lcl_wr_rsp_valid & (lcl_wr_rsp_axi_id == 5'b10101))
        in_write2 <= 1'b0;

//channel 3
    assign completion_done[3] = (channel_cnt3 > channel_id3) & channel_done_r[3];

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        waddr_offside3 <= 'd0;
    else if (lcl_wr_rsp_valid & !lcl_wr_rsp_code & (lcl_wr_rsp_axi_id == 5'b11101))
        waddr_offside3 <= waddr_offside3 + 'd128;
    else if(waddr_offside3 == completion_size3)
        waddr_offside3 <= 'd0;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        channel3_buf <= 512'b0;
    else if(eng_cmp_okay[3])
        channel3_buf <= eng_cmp_data03;
    else if(eng_cmp_okay[7])
        channel3_buf <= eng_cmp_data13;
    else if(eng_cmp_okay[11])
        channel3_buf <= eng_cmp_data23;
    else if(eng_cmp_okay[15])
        channel3_buf <= eng_cmp_data33;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        channel_cnt3 <= 'd0;
    else if(manager_start_w[3])
        channel_cnt3 <= 'd1;
    else if(lcl_wr_valid & (lcl_wr_axi_id == 5'b11101) & lcl_wr_ready)
        channel_cnt3 <= channel_cnt3 + 1'b1;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        write_request3 <= 2'b00;
    else if ((eng_cmp_okay[3] | eng_cmp_okay[7] | eng_cmp_okay[11] | eng_cmp_okay[15]) & (lcl_wr_valid & lcl_wr_ready & (write_channel == 2'b11)))
        write_request3 <= write_request3;
    else if (eng_cmp_okay[3] | eng_cmp_okay[7] | eng_cmp_okay[11] | eng_cmp_okay[15])
        write_request3 <= write_request3 + 1'b1;
    else if (lcl_wr_valid & lcl_wr_ready & (write_channel == 2'b11))
        write_request3 <= write_request3 - 1'b1;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        in_write3 <= 1'b0;
    else if(write_start & (write_channel == 2'b11))
        in_write3 <= 1'b1;
    else if(lcl_wr_rsp_valid & (lcl_wr_rsp_axi_id == 5'b11101))
        in_write3 <= 1'b0;

//engine
    assign eng_cmp_okay[0] = eng_cmp_done[0] & !write_request0;
    assign eng_cmp_okay[1] = eng_cmp_done[1] & !write_request1;
    assign eng_cmp_okay[2] = eng_cmp_done[2] & !write_request2;
    assign eng_cmp_okay[3] = eng_cmp_done[3] & !write_request3;
    assign eng_cmp_okay[4] = eng_cmp_done[4] & !write_request0;
    assign eng_cmp_okay[5] = eng_cmp_done[5] & !write_request1;
    assign eng_cmp_okay[6] = eng_cmp_done[6] & !write_request2;
    assign eng_cmp_okay[7] = eng_cmp_done[7] & !write_request3;
    assign eng_cmp_okay[8] = eng_cmp_done[8] & !write_request0;
    assign eng_cmp_okay[9] = eng_cmp_done[9] & !write_request1;
    assign eng_cmp_okay[10] = eng_cmp_done[10] & !write_request2;
    assign eng_cmp_okay[11] = eng_cmp_done[11] & !write_request3;
    assign eng_cmp_okay[12] = eng_cmp_done[12] & !write_request0;
    assign eng_cmp_okay[13] = eng_cmp_done[13] & !write_request1;
    assign eng_cmp_okay[14] = eng_cmp_done[14] & !write_request2;
    assign eng_cmp_okay[15] = eng_cmp_done[15] & !write_request3;

endmodule
