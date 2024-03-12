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

module wr_data_send_channel #(
                       parameter ID_WIDTH      = 2,
                       parameter ADDR_WIDTH    = 64,
                       parameter DATA_WIDTH    = 512,
                       parameter AWUSER_WIDTH  = 8,
                       parameter ARUSER_WIDTH  = 8,
                       parameter WUSER_WIDTH   = 1,
                       parameter RUSER_WIDTH   = 1,
                       parameter BUSER_WIDTH   = 1
                       )
                      (
                       input                           clk                ,
                       input                           rst_n              , 

                       //---- AXI bus ----
                          // AXI write data channel
                       output reg        [1023:0]      m_axi_wdata        ,
                       output reg        [0127:0]      m_axi_wstrb        ,
                       output reg                      m_axi_wvalid       ,
                       output reg                      m_axi_wlast        ,
                       input                           m_axi_wready       ,

                       //---- local control ----
                       input             [0039:0]      total_wr_beat_count,
                       input                           wr_engine_start    ,
                       input                           wrap_mode          ,
                       input      [003:0]              wrap_len           ,
                       input             [0002:0]      wr_size            ,
                       input             [0007:0]      wr_len             ,
                       input             [0031:0]      wr_init_data       
                      );

    parameter IDLE    = 4'h1;
    parameter BIAS1   = 4'h2;  //calculate bias stage 1
    parameter WAIT    = 4'h4;  //wait for all data to be send
    parameter DONE    = 4'h8;

    reg  [003:0]              cstate;
    reg  [003:0]              nstate;

    reg  [5:0]                beat_bias;
    reg  [5:0]                beat_bias_selected;
    wire                      beat_data_sent;

    reg  [1023:0]             wr_data_selected;
    reg  [127:0]              wr_strb_selected;
    wire                      stage2_ready;
    wire                      stage1_valid;
    wire                      stage1_sent;
    wire                      stage1_wlast;

    reg [007:0]               wr_len_counter_stage1;
    reg [004:0]               stage1_cycle_cnt;
    reg [039:0]               beat_counter;
    reg [031:0]               base_data;
    reg [031:0]               base_data_wrap;
    wire [031:0]              base_data_incr;

    //---- write data send state machine ----
    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            cstate <= IDLE;
        else
            cstate <= nstate;
    end

    always@*
    begin
        case(cstate)
            IDLE:
                if(wr_engine_start)
                    nstate = BIAS1;
                else
                    nstate = IDLE;
            BIAS1:
                nstate = WAIT;
            WAIT:
                if(beat_counter == 0)
                    nstate = DONE;
                else
                    nstate = WAIT;
            DONE:
                nstate = IDLE;
            default:
                nstate = IDLE;
        endcase
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            beat_bias <= 0;
        else if(cstate == BIAS1)
            beat_bias <= beat_bias_selected;
    end

    always@*
    begin
        case(wr_size)
            3'b010:  beat_bias_selected = 6'd1;   
            3'b011:  beat_bias_selected = 6'd2;   
            3'b100:  beat_bias_selected = 6'd4;   
            3'b101:  beat_bias_selected = 6'd8;   
            3'b110:  beat_bias_selected = 6'd16;  
            3'b111:  beat_bias_selected = 6'd32;  
            default: beat_bias_selected = 6'd32;  
        endcase
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            base_data <= 0;
        else if(cstate == BIAS1)
            base_data <= wr_init_data;
        else if((cstate == WAIT) && stage2_ready)
            base_data <= wrap_mode ? base_data_wrap : base_data_incr;
    end

    assign base_data_incr = base_data + {26'b0, beat_bias};

    always@*
    begin
        case(wrap_len)
            4'b0000: base_data_wrap = {base_data[31:10], base_data_incr[9:0]};
            4'b0001: base_data_wrap = {base_data[31:11], base_data_incr[10:0]};
            4'b0010: base_data_wrap = {base_data[31:12], base_data_incr[11:0]};
            4'b0011: base_data_wrap = {base_data[31:13], base_data_incr[12:0]};
            4'b0100: base_data_wrap = {base_data[31:14], base_data_incr[13:0]};
            4'b0101: base_data_wrap = {base_data[31:15], base_data_incr[14:0]};
            4'b0110: base_data_wrap = {base_data[31:16], base_data_incr[15:0]};
            4'b0111: base_data_wrap = {base_data[31:17], base_data_incr[16:0]};
            4'b1000: base_data_wrap = {base_data[31:18], base_data_incr[17:0]};
            4'b1001: base_data_wrap = {base_data[31:19], base_data_incr[18:0]};
            4'b1010: base_data_wrap = {base_data[31:20], base_data_incr[19:0]};
            4'b1011: base_data_wrap = {base_data[31:21], base_data_incr[20:0]};
            4'b1100: base_data_wrap = {base_data[31:22], base_data_incr[21:0]};
            4'b1101: base_data_wrap = {base_data[31:23], base_data_incr[22:0]};
            4'b1110: base_data_wrap = {base_data[31:24], base_data_incr[23:0]};
            4'b1111: base_data_wrap = {base_data[31:25], base_data_incr[24:0]};
            default: base_data_wrap = {base_data[31:10], base_data_incr[9:0]};
        endcase                                                        
    end                                                                

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            beat_counter <= 0;
        else if (cstate == BIAS1)
            beat_counter <= total_wr_beat_count;
        else if (beat_data_sent)
            beat_counter <= beat_counter - 1'b1;
    end

    assign beat_data_sent = (cstate == WAIT) && stage2_ready;
    assign stage1_valid = (cstate == WAIT) && (beat_counter != 0);
    assign stage2_ready = !m_axi_wvalid || m_axi_wready;
    assign stage1_sent = stage1_valid && stage2_ready;

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            stage1_cycle_cnt <= 5'b0;
        else if(stage1_wlast)
            stage1_cycle_cnt <= 5'b0;
        else if(stage1_sent)
            stage1_cycle_cnt <= stage1_cycle_cnt + 1'b1;
    end

    
    always@*
    begin
        case(wr_size)
            3'b010:
                begin
                    case(stage1_cycle_cnt[4:0])
                        5'b00000: wr_strb_selected = {124'b0, 4'hf};
                        5'b00001: wr_strb_selected = {120'b0, 4'hf,4'b0};
                        5'b00010: wr_strb_selected = {116'b0, 4'hf,8'b0};
                        5'b00011: wr_strb_selected = {112'b0, 4'hf,12'b0};
                        5'b00100: wr_strb_selected = {108'b0, 4'hf,16'b0};
                        5'b00101: wr_strb_selected = {104'b0, 4'hf,20'b0};
                        5'b00110: wr_strb_selected = {100'b0, 4'hf,24'b0};
                        5'b00111: wr_strb_selected = {96'b0, 4'hf,28'b0};
                        5'b01000: wr_strb_selected = {92'b0, 4'hf,32'b0};
                        5'b01001: wr_strb_selected = {88'b0, 4'hf,36'b0};
                        5'b01010: wr_strb_selected = {84'b0, 4'hf,40'b0};
                        5'b01011: wr_strb_selected = {80'b0, 4'hf,44'b0};
                        5'b01100: wr_strb_selected = {76'b0, 4'hf,48'b0};
                        5'b01101: wr_strb_selected = {72'b0, 4'hf,52'b0};
                        5'b01110: wr_strb_selected = {68'b0, 4'hf,56'b0};
                        5'b01111: wr_strb_selected = {64'b0, 4'hf,60'b0};
                        5'b10000: wr_strb_selected = {60'b0, 4'hf,64'b0};
                        5'b10001: wr_strb_selected = {56'b0, 4'hf,68'b0};
                        5'b10010: wr_strb_selected = {52'b0, 4'hf,72'b0};
                        5'b10011: wr_strb_selected = {48'b0, 4'hf,76'b0};
                        5'b10100: wr_strb_selected = {44'b0, 4'hf,80'b0};
                        5'b10101: wr_strb_selected = {40'b0, 4'hf,84'b0};
                        5'b10110: wr_strb_selected = {36'b0, 4'hf,88'b0};
                        5'b10111: wr_strb_selected = {32'b0, 4'hf,92'b0};
                        5'b11000: wr_strb_selected = {28'b0, 4'hf,96'b0};
                        5'b11001: wr_strb_selected = {24'b0, 4'hf,100'b0};
                        5'b11010: wr_strb_selected = {20'b0, 4'hf,104'b0};
                        5'b11011: wr_strb_selected = {16'b0, 4'hf,108'b0};
                        5'b11100: wr_strb_selected = {12'b0, 4'hf,112'b0};
                        5'b11101: wr_strb_selected = {8'b0 , 4'hf,116'b0};
                        5'b11110: wr_strb_selected = {4'b0 , 4'hf,120'b0};
                        5'b11111: wr_strb_selected = {4'hf,124'b0};
                        default:  wr_strb_selected = {124'b0, 4'hf};
                    endcase
                end
            3'b011:
                begin
                    case(stage1_cycle_cnt[3:0])
                        4'b0000: wr_strb_selected = {120'b0,8'hff};
                        4'b0001: wr_strb_selected = {112'b0,8'hff,8'b0 };
                        4'b0010: wr_strb_selected = {104'b0,8'hff,16'b0};
                        4'b0011: wr_strb_selected = {96'b0,8'hff,24'b0};
                        4'b0100: wr_strb_selected = {88'b0,8'hff,32'b0};
                        4'b0101: wr_strb_selected = {80'b0,8'hff,40'b0};
                        4'b0110: wr_strb_selected = {72'b0,8'hff,48'b0};
                        4'b0111: wr_strb_selected = {64'b0,8'hff,56'b0};
                        4'b1000: wr_strb_selected = {56'b0,8'hff,64'b0};
                        4'b1001: wr_strb_selected = {48'b0,8'hff,72'b0};
                        4'b1010: wr_strb_selected = {40'b0,8'hff,80'b0};
                        4'b1011: wr_strb_selected = {32'b0,8'hff,88'b0};
                        4'b1100: wr_strb_selected = {24'b0,8'hff,96'b0};
                        4'b1101: wr_strb_selected = {16'b0,8'hff,104'b0};
                        4'b1110: wr_strb_selected = {8'b0 ,8'hff,112'b0};
                        4'b1111: wr_strb_selected = {8'hff,120'b0};
                        default: wr_strb_selected = {120'b0,8'hff};
                    endcase
                end
            3'b100:
                begin
                    case(stage1_cycle_cnt[2:0])
                        3'b000:
                            wr_strb_selected = {112'b0,16'hffff};
                        3'b001:
                            wr_strb_selected = {96'b0,16'hffff,16'b0};
                        3'b010:
                            wr_strb_selected = {80'b0,16'hffff,32'b0};
                        3'b011:
                            wr_strb_selected = {64'b0,16'hffff,48'b0};
                        3'b100:
                            wr_strb_selected = {48'b0,16'hffff,64'b0};
                        3'b101:
                            wr_strb_selected = {32'b0,16'hffff,80'b0};
                        3'b110:
                            wr_strb_selected = {16'b0,16'hffff,96'b0};
                        3'b111:
                            wr_strb_selected = {16'hffff,112'b0};
                        default:
                            wr_strb_selected = {112'b0,16'hffff};
                    endcase
                end 
            3'b101:
                begin
                    case(stage1_cycle_cnt[1:0])
                        2'b00:
                            wr_strb_selected = {96'b0,{32{1'b1}}};
                        2'b01:
                            wr_strb_selected = {64'b0,{32{1'b1}},32'b0};
                        2'b10:
                            wr_strb_selected = {32'b0,{32{1'b1}},64'b0};
                        2'b11:
                            wr_strb_selected = {{32{1'b1}},96'b0};
                        default:
                            wr_strb_selected = {96'b0,{32{1'b1}}};
                    endcase
                end
            3'b110:
                begin
                    case(stage1_cycle_cnt[0])
                        1'b0:
                            wr_strb_selected = {64'b0,{64{1'b1}}};

                        1'b1:
                            wr_strb_selected = {{64{1'b1}},64'b0};
                        default:
                            wr_strb_selected = {64'b0,{64{1'b1}}};
                    endcase
                end
            3'b111:
                begin
                    wr_strb_selected = {128{1'b1}};
                end
            default:
                begin
                    wr_strb_selected = {128{1'b1}};

                end
        endcase
    end

    always@*
    begin
        case(wr_size)
            3'b010:
                begin
                    case(stage1_cycle_cnt[4:0])
                        5'b00000: wr_data_selected = {992'b0, base_data};
                        5'b00001: wr_data_selected = {960'b0, base_data,32'b0};
                        5'b00010: wr_data_selected = {928'b0, base_data,64'b0};
                        5'b00011: wr_data_selected = {896'b0, base_data,96'b0};
                        5'b00100: wr_data_selected = {864'b0, base_data,128'b0};
                        5'b00101: wr_data_selected = {832'b0, base_data,160'b0};
                        5'b00110: wr_data_selected = {800'b0, base_data,192'b0};
                        5'b00111: wr_data_selected = {768'b0, base_data,224'b0};
                        5'b01000: wr_data_selected = {736'b0, base_data,256'b0};
                        5'b01001: wr_data_selected = {704'b0, base_data,288'b0};
                        5'b01010: wr_data_selected = {672'b0, base_data,320'b0};
                        5'b01011: wr_data_selected = {640'b0, base_data,352'b0};
                        5'b01100: wr_data_selected = {608'b0, base_data,384'b0};
                        5'b01101: wr_data_selected = {576'b0, base_data,416'b0};
                        5'b01110: wr_data_selected = {544'b0, base_data,448'b0};
                        5'b01111: wr_data_selected = {512'b0, base_data,480'b0};
                        5'b10000: wr_data_selected = {480'b0, base_data,512'b0};
                        5'b10001: wr_data_selected = {448'b0, base_data,544'b0};
                        5'b10010: wr_data_selected = {416'b0, base_data,576'b0};
                        5'b10011: wr_data_selected = {384'b0, base_data,608'b0};
                        5'b10100: wr_data_selected = {352'b0, base_data,640'b0};
                        5'b10101: wr_data_selected = {320'b0, base_data,672'b0};
                        5'b10110: wr_data_selected = {288'b0, base_data,704'b0};
                        5'b10111: wr_data_selected = {256'b0, base_data,736'b0};
                        5'b11000: wr_data_selected = {224'b0, base_data,768'b0};
                        5'b11001: wr_data_selected = {192'b0, base_data,800'b0};
                        5'b11010: wr_data_selected = {160'b0, base_data,832'b0};
                        5'b11011: wr_data_selected = {128'b0, base_data,864'b0};
                        5'b11100: wr_data_selected = {96'b0 , base_data,896'b0};
                        5'b11101: wr_data_selected = {64'b0 , base_data,928'b0};
                        5'b11110: wr_data_selected = {32'b0 , base_data,960'b0};
                        5'b11111: wr_data_selected = {base_data,992'b0};
                        default:  wr_data_selected = {992'b0, base_data};
                    endcase
                end
            3'b011:
                begin
                    case(stage1_cycle_cnt[3:0])
                        4'b0000: wr_data_selected = {960'b0,base_data+1, base_data};
                        4'b0001: wr_data_selected = {896'b0,base_data+1, base_data,64'b0 };
                        4'b0010: wr_data_selected = {832'b0,base_data+1, base_data,128'b0};
                        4'b0011: wr_data_selected = {768'b0,base_data+1, base_data,192'b0};
                        4'b0100: wr_data_selected = {704'b0,base_data+1, base_data,256'b0};
                        4'b0101: wr_data_selected = {640'b0,base_data+1, base_data,320'b0};
                        4'b0110: wr_data_selected = {576'b0,base_data+1, base_data,384'b0};
                        4'b0111: wr_data_selected = {512'b0,base_data+1, base_data,448'b0};
                        4'b1000: wr_data_selected = {448'b0,base_data+1, base_data,512'b0};
                        4'b1001: wr_data_selected = {384'b0,base_data+1, base_data,576'b0};
                        4'b1010: wr_data_selected = {320'b0,base_data+1, base_data,640'b0};
                        4'b1011: wr_data_selected = {256'b0,base_data+1, base_data,704'b0};
                        4'b1100: wr_data_selected = {192'b0,base_data+1, base_data,768'b0};
                        4'b1101: wr_data_selected = {128'b0,base_data+1, base_data,832'b0};
                        4'b1110: wr_data_selected = {64'b0 ,base_data+1, base_data,896'b0};
                        4'b1111: wr_data_selected = {base_data+1, base_data,960'b0};
                        default: wr_data_selected = {960'b0,base_data+1, base_data};
                    endcase
                end
            3'b100:
                begin
                    case(stage1_cycle_cnt[2:0])
                        3'b000:
                            wr_data_selected = {896'b0,base_data+3,base_data+2,base_data+1,base_data};
                        3'b001:
                            wr_data_selected = {768'b0,base_data+3,base_data+2,base_data+1,base_data,128'b0};
                        3'b010:
                            wr_data_selected = {640'b0,base_data+3,base_data+2,base_data+1,base_data,256'b0};
                        3'b011:
                            wr_data_selected = {512'b0,base_data+3,base_data+2,base_data+1,base_data,384'b0};
                        3'b100:
                            wr_data_selected = {384'b0,base_data+3,base_data+2,base_data+1,base_data,512'b0};
                        3'b101:
                            wr_data_selected = {256'b0,base_data+3,base_data+2,base_data+1,base_data,640'b0};
                        3'b110:
                            wr_data_selected = {128'b0,base_data+3,base_data+2,base_data+1,base_data,768'b0};
                        3'b111:
                            wr_data_selected = {base_data+3,base_data+2,base_data+1,base_data,896'b0};
                        default:
                            wr_data_selected = {896'b0,base_data+3,base_data+2,base_data+1,base_data};
                    endcase
                end 
            3'b101:
                begin
                    case(stage1_cycle_cnt[1:0])
                        2'b00:
                            wr_data_selected = {768'b0,
                                                base_data+7,base_data+6,base_data+5,base_data+4,
                                                base_data+3,base_data+2,base_data+1,base_data};
                        2'b01:
                            wr_data_selected = {512'b0,
                                                base_data+7,base_data+6,base_data+5,base_data+4,
                                                base_data+3,base_data+2,base_data+1,base_data,   
                                                256'b0};
                        2'b10:
                            wr_data_selected = {256'b0,
                                                base_data+7,base_data+6,base_data+5,base_data+4,
                                                base_data+3,base_data+2,base_data+1,base_data,   
                                                512'b0};
                        2'b11:
                            wr_data_selected = {base_data+7,base_data+6,base_data+5,base_data+4,
                                                base_data+3,base_data+2,base_data+1,base_data,   
                                                768'b0};
                        default:
                            wr_data_selected = {768'b0,
                                                base_data+7,base_data+6,base_data+5,base_data+4,
                                                base_data+3,base_data+2,base_data+1,base_data   };
                    endcase
                end
            3'b110:
                begin
                    case(stage1_cycle_cnt[0])
                        1'b0:
                            wr_data_selected = {512'b0,
                                                base_data+15,base_data+14,base_data+13,base_data+12,
                                                base_data+11,base_data+10,base_data+9 ,base_data+8 ,
                                                base_data+7 ,base_data+6 ,base_data+5 ,base_data+4 ,
                                                base_data+3 ,base_data+2 ,base_data+1 ,base_data    };

                        1'b1:
                            wr_data_selected = {base_data+15,base_data+14,base_data+13,base_data+12,
                                                base_data+11,base_data+10,base_data+9 ,base_data+8 ,
                                                base_data+7 ,base_data+6 ,base_data+5 ,base_data+4 ,
                                                base_data+3 ,base_data+2 ,base_data+1 ,base_data,    
                                                512'b0};
                        default:
                            wr_data_selected = {512'b0,
                                                base_data+15,base_data+14,base_data+13,base_data+12,
                                                base_data+11,base_data+10,base_data+9,base_data+8,
                                                base_data+7,base_data+6,base_data+5,base_data+4,
                                                base_data+3,base_data+2,base_data+1,base_data};
                    endcase
                end
            3'b111:
                begin
                    wr_data_selected = {base_data+31,base_data+30,base_data+29,base_data+28,
                                        base_data+27,base_data+26,base_data+25,base_data+24,
                                        base_data+23,base_data+22,base_data+21,base_data+20,
                                        base_data+19,base_data+18,base_data+17,base_data+16,
                                        base_data+15,base_data+14,base_data+13,base_data+12,
                                        base_data+11,base_data+10,base_data+9,base_data+8,
                                        base_data+7,base_data+6,base_data+5,base_data+4,
                                        base_data+3,base_data+2,base_data+1,base_data};
                end
            default:
                begin
                    wr_data_selected = {base_data+31,base_data+30,base_data+29,base_data+28,
                                        base_data+27,base_data+26,base_data+25,base_data+24,
                                        base_data+23,base_data+22,base_data+21,base_data+20,
                                        base_data+19,base_data+18,base_data+17,base_data+16,
                                        base_data+15,base_data+14,base_data+13,base_data+12,
                                        base_data+11,base_data+10,base_data+9,base_data+8,
                                        base_data+7,base_data+6,base_data+5,base_data+4,
                                        base_data+3,base_data+2,base_data+1,base_data};
                end
        endcase
    end


    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            wr_len_counter_stage1 <= 0;
        else if(cstate == BIAS1)
            wr_len_counter_stage1 <= wr_len;
        else if(stage1_sent && (wr_len_counter_stage1 == 0))
            wr_len_counter_stage1 <= wr_len;
        else if(stage1_sent)
            wr_len_counter_stage1 <= wr_len_counter_stage1 - 1'b1;
    end

    assign stage1_wlast = stage1_sent && (wr_len_counter_stage1 == 0);

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            m_axi_wvalid <= 1'b0;
        else if(stage1_valid)
            m_axi_wvalid <= 1'b1;
        else if(m_axi_wready)
            m_axi_wvalid <= 1'b0;
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
        begin
            m_axi_wdata <= 1024'b0;
            m_axi_wlast <= 1'b0;
            m_axi_wstrb <= 128'b0;
        end
        else if(stage1_sent)
        begin
            m_axi_wdata <= wr_data_selected;
            m_axi_wlast <= stage1_wlast;
            m_axi_wstrb <= wr_strb_selected;
        end
    end

endmodule
