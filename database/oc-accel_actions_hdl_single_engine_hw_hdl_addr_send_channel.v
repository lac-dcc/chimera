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

module addr_send_channel
                      (
                       input                           clk                ,
                       input                           rst_n              , 
                                                        
                       //---- AXI bus ----               
                         // AXI read address channel       
                       output wire [063:0]             axi_addr           ,  
                       output wire [007:0]             axi_len            ,  
                       output wire                     axi_valid          ,
                       input                           axi_ready          ,

                       //---- local control ----
                       output wire                     addr_send_done     ,
                       input                           engine_start       ,
                       input                           wrap_mode          ,
                       input      [003:0]              wrap_len           ,
                       input      [063:0]              source_address     ,
                       input      [039:0]              total_beat_count   ,
                       input                           data_error         ,
                       input      [002:0]              size               ,
                       input      [007:0]              len                ,
                       input      [031:0]              number     

                       );

    parameter IDLE    = 6'h01;
    parameter INIT    = 6'h02;
    parameter CLEN    = 6'h04; 
    parameter SEND    = 6'h08;
    parameter CHECK   = 6'h10;
    parameter DONE    = 6'h20;
   
    reg  [005:0] cstate;
    reg  [005:0] nstate;

    wire         all_burst_sent;
    wire         few_beat_remain;
    wire         cross_4KB_boundry;

    reg  [012:0] normal_addr_bias_reg;
    reg  [063:0] current_burst_addr;
    reg  [012:0] normal_addr_bias;
    wire [063:0] next_4KB_boundry;
    wire [063:0] next_burst_addr;
    wire [063:0] next_burst_addr_incr;
    reg  [063:0] next_burst_addr_wrap;

    reg  [012:0] beat_number_in_4KB_reg;
    reg  [012:0] beat_number_sent_in_4KB;
    reg  [039:0] remain_beat_number;
    reg  [008:0] current_burst_len;
    reg  [012:0] init_beat_number_sent;
    reg  [012:0] beat_number_sent;
    reg  [012:0] beat_number_in_4KB;
    wire [012:0] cross_4KB_burst_len;
    wire [008:0] burst_len;
    wire [008:0] actual_axi_len;
    wire [008:0] len_plus_1;
  
    assign len_plus_1 = {1'b0, len} + 1'b1;
    assign addr_send_done = (cstate == DONE);

    //---- Burst send state machine ----
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
                if(engine_start)
                    nstate = INIT;
                else
                    nstate = IDLE;
            INIT:  // initilization, calculation normal addr bias, beat number in a 4KB range etc.
                    nstate = CLEN;
            CLEN:  // calculate burst length for axi interface
                if(data_error)
                    nstate = IDLE;
                else
                    nstate = SEND;
            SEND:  // calculate burst address and send axi burst 
                if(data_error)
                    nstate = IDLE;
                else if(axi_ready)
                    nstate = CHECK;
                else
                    nstate = SEND;
            CHECK: // check if all burst has been send
                if(data_error)
                    nstate = IDLE;
                else if(all_burst_sent)
                    nstate = DONE;
                else 
                    nstate = CLEN;
            DONE:
                nstate = IDLE;
            default:
                nstate = IDLE;
        endcase
    end

    //---- prepare values in IDLE and INIT state ----
    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
        begin
            beat_number_in_4KB_reg <= 0;
            normal_addr_bias_reg   <= 0;
        end
        else if(cstate == INIT)
        begin
            beat_number_in_4KB_reg <= beat_number_in_4KB;
            normal_addr_bias_reg   <= normal_addr_bias;
        end
    end

    always@*
    begin
        case(size)
            3'b010:  begin beat_number_in_4KB = {2'b0,1'b1,10'b0}; normal_addr_bias = {3'b0,len_plus_1,2'b0}; end
            3'b011:  begin beat_number_in_4KB = {3'b0,1'b1,9'b0};  normal_addr_bias = {2'b0,len_plus_1,3'b0}; end
            3'b100:  begin beat_number_in_4KB = {4'b0,1'b1,8'b0};  normal_addr_bias = {1'b0,len_plus_1,4'b0}; end
            3'b101:  begin beat_number_in_4KB = {5'b0,1'b1,7'b0};  normal_addr_bias = {len_plus_1,5'b0};      end
            3'b110:  begin beat_number_in_4KB = {6'b0,1'b1,6'b0};  normal_addr_bias = {len_plus_1[6:0],6'b0}; end
            3'b111:  begin beat_number_in_4KB = {7'b0,1'b1,5'b0};  normal_addr_bias = {len_plus_1[5:0],7'b0}; end
            default: begin beat_number_in_4KB = {7'b0,1'b1,5'b0};  normal_addr_bias = {len_plus_1[5:0],7'b0}; end
        endcase
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
        begin
            current_burst_addr <= 0;
            remain_beat_number <= 0;
        end
        else if (cstate == INIT)
        begin
            current_burst_addr <= source_address;
            remain_beat_number <= total_beat_count;
        end
        else if (axi_ready && (cstate == SEND))
        begin
            current_burst_addr <= next_burst_addr;
            remain_beat_number <= remain_beat_number - {31'b0,current_burst_len};
        end
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            current_burst_len <= 0;
        else if (cstate == CLEN)
            current_burst_len <= burst_len;
    end

    always@*
    begin
        case(size)
            3'b010:  begin init_beat_number_sent = {3'b0,source_address[11:2]};  beat_number_sent = {3'b0,current_burst_addr[11:2]}; end
            3'b011:  begin init_beat_number_sent = {4'b0,source_address[11:3]};  beat_number_sent = {4'b0,current_burst_addr[11:3]}; end
            3'b100:  begin init_beat_number_sent = {5'b0,source_address[11:4]};  beat_number_sent = {5'b0,current_burst_addr[11:4]}; end
            3'b101:  begin init_beat_number_sent = {6'b0,source_address[11:5]};  beat_number_sent = {6'b0,current_burst_addr[11:5]}; end
            3'b110:  begin init_beat_number_sent = {7'b0,source_address[11:6]};  beat_number_sent = {7'b0,current_burst_addr[11:6]}; end
            3'b111:  begin init_beat_number_sent = {8'b0,source_address[11:7]};  beat_number_sent = {8'b0,current_burst_addr[11:7]}; end
            default: begin init_beat_number_sent = {8'b0,source_address[11:7]};  beat_number_sent = {8'b0,current_burst_addr[11:7]}; end
        endcase
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            beat_number_sent_in_4KB <= 0;
        else if(cstate == INIT)
            beat_number_sent_in_4KB <= init_beat_number_sent;
        else if(cstate == CHECK)
            beat_number_sent_in_4KB <= beat_number_sent;
    end

    assign next_4KB_boundry = {current_burst_addr[63:12] + 52'd1, 12'd0};
    assign next_burst_addr_incr = cross_4KB_boundry ? next_4KB_boundry : current_burst_addr + {51'b0,normal_addr_bias};
    assign next_burst_addr = wrap_mode ? next_burst_addr_wrap : next_burst_addr_incr;

    always@*
    begin
        case(wrap_len)
            4'b0000: next_burst_addr_wrap = {source_address[63:12], next_burst_addr_incr[11:0]};
            4'b0001: next_burst_addr_wrap = {source_address[63:13], next_burst_addr_incr[12:0]};
            4'b0010: next_burst_addr_wrap = {source_address[63:14], next_burst_addr_incr[13:0]};
            4'b0011: next_burst_addr_wrap = {source_address[63:15], next_burst_addr_incr[14:0]};
            4'b0100: next_burst_addr_wrap = {source_address[63:16], next_burst_addr_incr[15:0]};
            4'b0101: next_burst_addr_wrap = {source_address[63:17], next_burst_addr_incr[16:0]};
            4'b0110: next_burst_addr_wrap = {source_address[63:18], next_burst_addr_incr[17:0]};
            4'b0111: next_burst_addr_wrap = {source_address[63:19], next_burst_addr_incr[18:0]};
            4'b1000: next_burst_addr_wrap = {source_address[63:20], next_burst_addr_incr[19:0]};
            4'b1001: next_burst_addr_wrap = {source_address[63:21], next_burst_addr_incr[20:0]};
            4'b1010: next_burst_addr_wrap = {source_address[63:22], next_burst_addr_incr[21:0]};
            4'b1011: next_burst_addr_wrap = {source_address[63:23], next_burst_addr_incr[22:0]};
            4'b1100: next_burst_addr_wrap = {source_address[63:24], next_burst_addr_incr[23:0]};
            4'b1101: next_burst_addr_wrap = {source_address[63:25], next_burst_addr_incr[24:0]};
            4'b1110: next_burst_addr_wrap = {source_address[63:26], next_burst_addr_incr[25:0]};
            4'b1111: next_burst_addr_wrap = {source_address[63:27], next_burst_addr_incr[26:0]};
            default: next_burst_addr_wrap = {source_address[63:12], next_burst_addr_incr[11:0]};
        endcase
    end

    assign burst_len = few_beat_remain ? remain_beat_number[8:0] : (cross_4KB_boundry ? cross_4KB_burst_len[8:0] : len_plus_1);
    assign cross_4KB_burst_len = beat_number_in_4KB - beat_number_sent_in_4KB;

    assign all_burst_sent = (remain_beat_number == 0);
    assign cross_4KB_boundry = ({4'b0,len_plus_1} > cross_4KB_burst_len);
    assign few_beat_remain = (remain_beat_number < {27'b0,cross_4KB_burst_len}) && (remain_beat_number < {31'b0,len_plus_1});
    assign actual_axi_len = current_burst_len - 1;

    //---- generate axi output signals ----
    assign axi_addr = current_burst_addr;
    assign axi_len = actual_axi_len[7:0];
    assign axi_valid = (cstate == SEND);

endmodule
