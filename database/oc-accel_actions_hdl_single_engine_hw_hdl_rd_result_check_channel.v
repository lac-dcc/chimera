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

module rd_result_check_channel #(
                       parameter ID_WIDTH      = 2
                       )
                      (
                       input                           clk                ,
                       input                           rst_n              , 
                                                        
                       //---- AXI bus ----               
                         // AXI read address channel       
                       input      [1023:0]             m_axi_rdata        ,  
                       input [ID_WIDTH-1:0]            m_axi_rid          ,  
                       input                           m_axi_rlast        , 
                       input                           m_axi_rvalid       ,
                       input      [001:0]              m_axi_rresp        ,
                       output wire                     m_axi_rready       , 

                       //---- local control ----
                       input                           rd_engine_start    ,
                       input                           wrap_mode          ,
                       input      [003:0]              wrap_len           ,
                       input      [039:0]              total_rd_beat_count,
                       output wire                     rd_done            ,
                       output reg [001:0]              rd_error           ,
                       output reg [063:0]              rd_error_info      ,
                       input      [031:0]              rd_init_data       ,
                       input      [002:0]              rd_size            ,
                       input      [007:0]              rd_len             ,
                       input      [ID_WIDTH-1:0]       rd_id_num    

                       );

    parameter IDLE    = 7'h1;
    parameter BIAS1   = 7'h2;  //calculate bias stage 1
    parameter BIAS2   = 7'h4;  //calculate bias stage 2
    parameter BIAS3   = 7'h8;  //calculate bias stage 2
    parameter INIT    = 7'h10;  //calculate init base data
    parameter WAIT    = 7'h20;
    parameter DONE    = 7'h40;

    genvar i;

    reg  [039:0]              beat_counter;
    reg  [004:0]              init_counter;
    wire [31:0]               data_valid_for_idx;
    wire [31:0]               last_data_valid_for_idx;
    wire                      axi_data_valid;

    reg  [5:0]                beat_bias;
    reg  [ID_WIDTH+8:0]       beat_gap_for_id;
    reg  [ID_WIDTH+9:0]       beat_gap_for_id_init;
    reg  [ID_WIDTH+13:0]      id_bias_pre;
    reg  [ID_WIDTH+14:0]      init_id_bias_pre;
    reg  [ID_WIDTH+14:0]      id_bias;
    reg  [ID_WIDTH+13:0]      id_bias_selected;
    reg  [ID_WIDTH+14:0]      init_id_bias_selected;
    reg  [5:0]                beat_bias_selected;
    reg  [1023:0]             expect_data_selected;
    reg  [1023:0]             data_mask_selected;


    reg  [31:0]               base_data[31:0];
    wire  [31:0]              base_data_incr[31:0];
    reg  [31:0]               base_data_wrap[31:0];
    reg  [4:0]                cycle_cnt[31:0];
    reg  [31:0]               init_bias_for_idx;
    wire  [31:0]              init_bias_for_idx_incr;
    reg  [31:0]               init_bias_for_idx_wrap;
    reg                       stage1_valid;
    reg                       stage2_valid;
    reg  [1023:0]             stage1_actual_data;
    reg  [1023:0]             stage2_actual_data;
    reg  [31:0]               stage1_base_data;
    reg  [4:0]                stage1_cycle_cnt;
    reg  [1023:0]             stage2_expect_data;
    reg  [1023:0]             stage2_data_mask;
    reg  [063:0]              stage1_addr;
    reg  [063:0]              stage2_addr;
    reg  [063:0]              error_info;
    reg                       done;

    wire [008:0]              rd_len_plus_1;
    wire [ID_WIDTH:0]         rd_id_num_plus_1;
    wire                      data_error;

    reg  [006:0]              cstate;
    reg  [006:0]              nstate;

    assign m_axi_rready = (cstate == WAIT);
    assign rd_len_plus_1 = {1'b0, rd_len} + 1'b1;
    assign rd_id_num_plus_1 = {1'b0, rd_id_num} + 1'b1;
    assign axi_data_valid = m_axi_rvalid && m_axi_rready;

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            init_counter <= 5'b0;
        else if(cstate == INIT)
            init_counter <= init_counter + 1'b1;
    end

    //---- read result state machine ----
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
                if(rd_engine_start)
                    nstate = BIAS1;
                else
                    nstate = IDLE;
            BIAS1:
                nstate = BIAS2;
            BIAS2:
                nstate = BIAS3;
            BIAS3:
                nstate = INIT;
            INIT:
                if(&init_counter)
                    nstate = WAIT;
                else
                    nstate = INIT;
            WAIT:
                if(beat_counter == 0)
                    nstate = DONE;
                //else if (rd_error[1])
                //    nstate = IDLE;
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
            beat_counter <= 0;
        else if (cstate == BIAS1)
            beat_counter <= total_rd_beat_count;
        else if (stage2_valid)
            beat_counter <= beat_counter - 1'b1;
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
        begin
            beat_bias <= 0;
            beat_gap_for_id <= 0;
            beat_gap_for_id_init <= 0;
        end
        else if(cstate == BIAS1)
        begin
            beat_bias <= beat_bias_selected;
            beat_gap_for_id <= {9'b0,rd_id_num} * {{(ID_WIDTH+1){1'b0}},rd_len_plus_1};
            beat_gap_for_id_init <= {{(ID_WIDTH+1){1'b0}},rd_len_plus_1};
        end
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
        begin
            id_bias_pre <= 0;
            init_id_bias_pre <= 0;
        end
        else if(cstate == BIAS2)
        begin
            id_bias_pre <= id_bias_selected;
            init_id_bias_pre <= init_id_bias_selected;
        end
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            id_bias <= 0;
        else if(cstate == BIAS3)
            id_bias <= {1'b0, id_bias_pre} + {{(ID_WIDTH+9){1'b0}},beat_bias};
    end

    always@*
    begin
        case(rd_size)
            3'b010:  begin beat_bias_selected = 6'd1;   id_bias_selected = {5'b0,beat_gap_for_id     };  init_id_bias_selected = {5'b0,beat_gap_for_id_init     };end
            3'b011:  begin beat_bias_selected = 6'd2;   id_bias_selected = {4'b0,beat_gap_for_id,1'b0};  init_id_bias_selected = {4'b0,beat_gap_for_id_init,1'b0};end
            3'b100:  begin beat_bias_selected = 6'd4;   id_bias_selected = {3'b0,beat_gap_for_id,2'b0};  init_id_bias_selected = {3'b0,beat_gap_for_id_init,2'b0};end
            3'b101:  begin beat_bias_selected = 6'd8;   id_bias_selected = {2'b0,beat_gap_for_id,3'b0};  init_id_bias_selected = {2'b0,beat_gap_for_id_init,3'b0};end
            3'b110:  begin beat_bias_selected = 6'd16;  id_bias_selected = {1'b0,beat_gap_for_id,4'b0};  init_id_bias_selected = {1'b0,beat_gap_for_id_init,4'b0};end
            3'b111:  begin beat_bias_selected = 6'd32;  id_bias_selected = {beat_gap_for_id,5'b0     };  init_id_bias_selected = {beat_gap_for_id_init,5'b0     };end
            default: begin beat_bias_selected = 6'd32;  id_bias_selected = {beat_gap_for_id,5'b0     };  init_id_bias_selected = {beat_gap_for_id_init,5'b0     };end
        endcase
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            init_bias_for_idx <= 0;
        else if(cstate == BIAS3)
            init_bias_for_idx <= rd_init_data;
        else if(cstate == INIT)
            init_bias_for_idx <= wrap_mode ? init_bias_for_idx_wrap : init_bias_for_idx_incr;
    end

    assign init_bias_for_idx_incr = init_bias_for_idx + {{(17-ID_WIDTH){1'b0}},init_id_bias_pre};
    always@*
    begin
        case(wrap_len)
            4'b0000: init_bias_for_idx_wrap = {init_bias_for_idx[31:10], init_bias_for_idx_incr[9:0]};
            4'b0001: init_bias_for_idx_wrap = {init_bias_for_idx[31:11], init_bias_for_idx_incr[10:0]};
            4'b0010: init_bias_for_idx_wrap = {init_bias_for_idx[31:12], init_bias_for_idx_incr[11:0]};
            4'b0011: init_bias_for_idx_wrap = {init_bias_for_idx[31:13], init_bias_for_idx_incr[12:0]};
            4'b0100: init_bias_for_idx_wrap = {init_bias_for_idx[31:14], init_bias_for_idx_incr[13:0]};
            4'b0101: init_bias_for_idx_wrap = {init_bias_for_idx[31:15], init_bias_for_idx_incr[14:0]};
            4'b0110: init_bias_for_idx_wrap = {init_bias_for_idx[31:16], init_bias_for_idx_incr[15:0]};
            4'b0111: init_bias_for_idx_wrap = {init_bias_for_idx[31:17], init_bias_for_idx_incr[16:0]};
            4'b1000: init_bias_for_idx_wrap = {init_bias_for_idx[31:18], init_bias_for_idx_incr[17:0]};
            4'b1001: init_bias_for_idx_wrap = {init_bias_for_idx[31:19], init_bias_for_idx_incr[18:0]};
            4'b1010: init_bias_for_idx_wrap = {init_bias_for_idx[31:20], init_bias_for_idx_incr[19:0]};
            4'b1011: init_bias_for_idx_wrap = {init_bias_for_idx[31:21], init_bias_for_idx_incr[20:0]};
            4'b1100: init_bias_for_idx_wrap = {init_bias_for_idx[31:22], init_bias_for_idx_incr[21:0]};
            4'b1101: init_bias_for_idx_wrap = {init_bias_for_idx[31:23], init_bias_for_idx_incr[22:0]};
            4'b1110: init_bias_for_idx_wrap = {init_bias_for_idx[31:24], init_bias_for_idx_incr[23:0]};
            4'b1111: init_bias_for_idx_wrap = {init_bias_for_idx[31:25], init_bias_for_idx_incr[24:0]};
            default: init_bias_for_idx_wrap = {init_bias_for_idx[31:10], init_bias_for_idx_incr[9:0]};
        endcase                                                        
    end                                                                

    generate 
        for(i=0; i<32; i=i+1)
        begin:id_base_data_gen
            assign data_valid_for_idx[i] = axi_data_valid && (m_axi_rid == i);
            assign last_data_valid_for_idx[i] = data_valid_for_idx[i] && m_axi_rlast;

            always@(posedge clk or negedge rst_n)
            begin
                if(~rst_n)
                    cycle_cnt[i] <= 0;
                else if(last_data_valid_for_idx[i])
                    cycle_cnt[i] <= 0;
                else if(data_valid_for_idx[i])
                    cycle_cnt[i] <= cycle_cnt[i] + 1;
            end
               
            always@(posedge clk or negedge rst_n)
            begin
                if(~rst_n)
                    base_data[i] <= 0;
                else if(cstate == INIT && (init_counter == i))
                    base_data[i] <= init_bias_for_idx;
                else if(last_data_valid_for_idx[i] || data_valid_for_idx[i])
                    base_data[i] <= wrap_mode ? base_data_wrap[i] : base_data_incr[i]; 
            end

            assign base_data_incr[i] = last_data_valid_for_idx[i] ? base_data[i] + {{(17-ID_WIDTH){1'b0}},id_bias} : base_data[i] + {26'b0,beat_bias};

            always@*
            begin
                case(wrap_len)
                    4'b0000: base_data_wrap[i] = {base_data[i][31:10], base_data_incr[i][9:0]};
                    4'b0001: base_data_wrap[i] = {base_data[i][31:11], base_data_incr[i][10:0]};
                    4'b0010: base_data_wrap[i] = {base_data[i][31:12], base_data_incr[i][11:0]};
                    4'b0011: base_data_wrap[i] = {base_data[i][31:13], base_data_incr[i][12:0]};
                    4'b0100: base_data_wrap[i] = {base_data[i][31:14], base_data_incr[i][13:0]};
                    4'b0101: base_data_wrap[i] = {base_data[i][31:15], base_data_incr[i][14:0]};
                    4'b0110: base_data_wrap[i] = {base_data[i][31:16], base_data_incr[i][15:0]};
                    4'b0111: base_data_wrap[i] = {base_data[i][31:17], base_data_incr[i][16:0]};
                    4'b1000: base_data_wrap[i] = {base_data[i][31:18], base_data_incr[i][17:0]};
                    4'b1001: base_data_wrap[i] = {base_data[i][31:19], base_data_incr[i][18:0]};
                    4'b1010: base_data_wrap[i] = {base_data[i][31:20], base_data_incr[i][19:0]};
                    4'b1011: base_data_wrap[i] = {base_data[i][31:21], base_data_incr[i][20:0]};
                    4'b1100: base_data_wrap[i] = {base_data[i][31:22], base_data_incr[i][21:0]};
                    4'b1101: base_data_wrap[i] = {base_data[i][31:23], base_data_incr[i][22:0]};
                    4'b1110: base_data_wrap[i] = {base_data[i][31:24], base_data_incr[i][23:0]};
                    4'b1111: base_data_wrap[i] = {base_data[i][31:25], base_data_incr[i][24:0]};
                    default: base_data_wrap[i] = {base_data[i][31:10], base_data_incr[i][9:0]};
                endcase                                                        
            end                                                                
        end

        
    endgenerate


    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            stage1_valid <= 0;
        else
            stage1_valid <= axi_data_valid;
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            stage1_addr <= 0;
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
        begin
            stage1_base_data <= 0;
            stage1_cycle_cnt <= 0;
            stage1_actual_data <= 0;
        end
        else if(axi_data_valid)
        begin
            stage1_base_data <= base_data[m_axi_rid];
            stage1_cycle_cnt <= cycle_cnt[m_axi_rid];
            stage1_actual_data <= m_axi_rdata;
        end
    end

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
        begin  
            stage2_valid       <= 0;
            stage2_addr        <= 0;
            stage2_actual_data <= 0;
            stage2_expect_data <= 0;
            stage2_data_mask   <= 0;
        end
        else
        begin
            stage2_valid       <= stage1_valid;
            stage2_addr        <= stage1_addr;
            stage2_actual_data <= stage1_actual_data;
            stage2_expect_data <= expect_data_selected;
            stage2_data_mask   <= data_mask_selected;
        end
    end

    always@*
    begin
        case(rd_size)
            3'b010:
                begin
                    case(stage1_cycle_cnt[4:0])
                        5'b00000: data_mask_selected = {992'b0, 32'hffffffff};
                        5'b00001: data_mask_selected = {960'b0, 32'hffffffff,32'b0};
                        5'b00010: data_mask_selected = {928'b0, 32'hffffffff,64'b0};
                        5'b00011: data_mask_selected = {896'b0, 32'hffffffff,96'b0};
                        5'b00100: data_mask_selected = {864'b0, 32'hffffffff,128'b0};
                        5'b00101: data_mask_selected = {832'b0, 32'hffffffff,160'b0};
                        5'b00110: data_mask_selected = {800'b0, 32'hffffffff,192'b0};
                        5'b00111: data_mask_selected = {768'b0, 32'hffffffff,224'b0};
                        5'b01000: data_mask_selected = {736'b0, 32'hffffffff,256'b0};
                        5'b01001: data_mask_selected = {704'b0, 32'hffffffff,288'b0};
                        5'b01010: data_mask_selected = {672'b0, 32'hffffffff,320'b0};
                        5'b01011: data_mask_selected = {640'b0, 32'hffffffff,352'b0};
                        5'b01100: data_mask_selected = {608'b0, 32'hffffffff,384'b0};
                        5'b01101: data_mask_selected = {576'b0, 32'hffffffff,416'b0};
                        5'b01110: data_mask_selected = {544'b0, 32'hffffffff,448'b0};
                        5'b01111: data_mask_selected = {512'b0, 32'hffffffff,480'b0};
                        5'b10000: data_mask_selected = {480'b0, 32'hffffffff,512'b0};
                        5'b10001: data_mask_selected = {448'b0, 32'hffffffff,544'b0};
                        5'b10010: data_mask_selected = {416'b0, 32'hffffffff,576'b0};
                        5'b10011: data_mask_selected = {384'b0, 32'hffffffff,608'b0};
                        5'b10100: data_mask_selected = {352'b0, 32'hffffffff,640'b0};
                        5'b10101: data_mask_selected = {320'b0, 32'hffffffff,672'b0};
                        5'b10110: data_mask_selected = {288'b0, 32'hffffffff,704'b0};
                        5'b10111: data_mask_selected = {256'b0, 32'hffffffff,736'b0};
                        5'b11000: data_mask_selected = {224'b0, 32'hffffffff,768'b0};
                        5'b11001: data_mask_selected = {192'b0, 32'hffffffff,800'b0};
                        5'b11010: data_mask_selected = {160'b0, 32'hffffffff,832'b0};
                        5'b11011: data_mask_selected = {128'b0, 32'hffffffff,864'b0};
                        5'b11100: data_mask_selected = {96'b0 , 32'hffffffff,896'b0};
                        5'b11101: data_mask_selected = {64'b0 , 32'hffffffff,928'b0};
                        5'b11110: data_mask_selected = {32'b0 , 32'hffffffff,960'b0};
                        5'b11111: data_mask_selected = {32'hffffffff,992'b0};
                        default:  data_mask_selected = {992'b0, 32'hffffffff};
                    endcase
                end
            3'b011:
                begin
                    case(stage1_cycle_cnt[3:0])
                        4'b0000: data_mask_selected = {960'b0,32'hffffffff, 32'hffffffff};
                        4'b0001: data_mask_selected = {896'b0,32'hffffffff, 32'hffffffff,64'b0 };
                        4'b0010: data_mask_selected = {832'b0,32'hffffffff, 32'hffffffff,128'b0};
                        4'b0011: data_mask_selected = {768'b0,32'hffffffff, 32'hffffffff,192'b0};
                        4'b0100: data_mask_selected = {704'b0,32'hffffffff, 32'hffffffff,256'b0};
                        4'b0101: data_mask_selected = {640'b0,32'hffffffff, 32'hffffffff,320'b0};
                        4'b0110: data_mask_selected = {576'b0,32'hffffffff, 32'hffffffff,384'b0};
                        4'b0111: data_mask_selected = {512'b0,32'hffffffff, 32'hffffffff,448'b0};
                        4'b1000: data_mask_selected = {448'b0,32'hffffffff, 32'hffffffff,512'b0};
                        4'b1001: data_mask_selected = {384'b0,32'hffffffff, 32'hffffffff,576'b0};
                        4'b1010: data_mask_selected = {320'b0,32'hffffffff, 32'hffffffff,640'b0};
                        4'b1011: data_mask_selected = {256'b0,32'hffffffff, 32'hffffffff,704'b0};
                        4'b1100: data_mask_selected = {192'b0,32'hffffffff, 32'hffffffff,768'b0};
                        4'b1101: data_mask_selected = {128'b0,32'hffffffff, 32'hffffffff,832'b0};
                        4'b1110: data_mask_selected = {64'b0 ,32'hffffffff, 32'hffffffff,896'b0};
                        4'b1111: data_mask_selected = {32'hffffffff, 32'hffffffff,960'b0};
                        default: data_mask_selected = {960'b0,32'hffffffff, 32'hffffffff};
                    endcase
                end
            3'b100:
                begin
                    case(stage1_cycle_cnt[2:0])
                        3'b000:
                            data_mask_selected = {896'b0,32'hffffffff,32'hffffffff,32'hffffffff,32'hffffffff};
                        3'b001:
                            data_mask_selected = {768'b0,32'hffffffff,32'hffffffff,32'hffffffff,32'hffffffff,128'b0};
                        3'b010:
                            data_mask_selected = {640'b0,32'hffffffff,32'hffffffff,32'hffffffff,32'hffffffff,256'b0};
                        3'b011:
                            data_mask_selected = {512'b0,32'hffffffff,32'hffffffff,32'hffffffff,32'hffffffff,384'b0};
                        3'b100:
                            data_mask_selected = {384'b0,32'hffffffff,32'hffffffff,32'hffffffff,32'hffffffff,512'b0};
                        3'b101:
                            data_mask_selected = {256'b0,32'hffffffff,32'hffffffff,32'hffffffff,32'hffffffff,640'b0};
                        3'b110:
                            data_mask_selected = {128'b0,32'hffffffff,32'hffffffff,32'hffffffff,32'hffffffff,768'b0};
                        3'b111:
                            data_mask_selected = {32'hffffffff,32'hffffffff,32'hffffffff,32'hffffffff,896'b0};
                        default:
                            data_mask_selected = {896'b0,32'hffffffff,32'hffffffff,32'hffffffff,32'hffffffff};
                    endcase
                end 
            3'b101:
                begin
                    case(stage1_cycle_cnt[1:0])
                        2'b00:
                            data_mask_selected = {768'b0,{256{1'b1}}};
                        2'b01:
                            data_mask_selected = {512'b0,{256{1'b1}},256'b0};
                        2'b10:
                            data_mask_selected = {256'b0,{256{1'b1}},512'b0};
                        2'b11:
                            data_mask_selected = {{256{1'b1}},768'b0};
                        default:
                            data_mask_selected = {768'b0,{256{1'b1}}};
                    endcase
                end
            3'b110:
                begin
                    case(stage1_cycle_cnt[0])
                        1'b0:
                            data_mask_selected = {512'b0,{512{1'b1}}};

                        1'b1:
                            data_mask_selected = {{512{1'b1}},512'b0};
                        default:
                            data_mask_selected = {512'b0,{512{1'b1}}};
                    endcase
                end
            3'b111:
                begin
                    data_mask_selected = {1024{1'b1}};
                end
            default:
                begin
                    data_mask_selected = {1024{1'b1}};

                end
        endcase
    end

    always@*
    begin
        case(rd_size)
            3'b010:
                begin
                    case(stage1_cycle_cnt[4:0])
                        5'b00000: expect_data_selected = {992'b0, stage1_base_data};
                        5'b00001: expect_data_selected = {960'b0, stage1_base_data,32'b0};
                        5'b00010: expect_data_selected = {928'b0, stage1_base_data,64'b0};
                        5'b00011: expect_data_selected = {896'b0, stage1_base_data,96'b0};
                        5'b00100: expect_data_selected = {864'b0, stage1_base_data,128'b0};
                        5'b00101: expect_data_selected = {832'b0, stage1_base_data,160'b0};
                        5'b00110: expect_data_selected = {800'b0, stage1_base_data,192'b0};
                        5'b00111: expect_data_selected = {768'b0, stage1_base_data,224'b0};
                        5'b01000: expect_data_selected = {736'b0, stage1_base_data,256'b0};
                        5'b01001: expect_data_selected = {704'b0, stage1_base_data,288'b0};
                        5'b01010: expect_data_selected = {672'b0, stage1_base_data,320'b0};
                        5'b01011: expect_data_selected = {640'b0, stage1_base_data,352'b0};
                        5'b01100: expect_data_selected = {608'b0, stage1_base_data,384'b0};
                        5'b01101: expect_data_selected = {576'b0, stage1_base_data,416'b0};
                        5'b01110: expect_data_selected = {544'b0, stage1_base_data,448'b0};
                        5'b01111: expect_data_selected = {512'b0, stage1_base_data,480'b0};
                        5'b10000: expect_data_selected = {480'b0, stage1_base_data,512'b0};
                        5'b10001: expect_data_selected = {448'b0, stage1_base_data,544'b0};
                        5'b10010: expect_data_selected = {416'b0, stage1_base_data,576'b0};
                        5'b10011: expect_data_selected = {384'b0, stage1_base_data,608'b0};
                        5'b10100: expect_data_selected = {352'b0, stage1_base_data,640'b0};
                        5'b10101: expect_data_selected = {320'b0, stage1_base_data,672'b0};
                        5'b10110: expect_data_selected = {288'b0, stage1_base_data,704'b0};
                        5'b10111: expect_data_selected = {256'b0, stage1_base_data,736'b0};
                        5'b11000: expect_data_selected = {224'b0, stage1_base_data,768'b0};
                        5'b11001: expect_data_selected = {192'b0, stage1_base_data,800'b0};
                        5'b11010: expect_data_selected = {160'b0, stage1_base_data,832'b0};
                        5'b11011: expect_data_selected = {128'b0, stage1_base_data,864'b0};
                        5'b11100: expect_data_selected = {96'b0 , stage1_base_data,896'b0};
                        5'b11101: expect_data_selected = {64'b0 , stage1_base_data,928'b0};
                        5'b11110: expect_data_selected = {32'b0 , stage1_base_data,960'b0};
                        5'b11111: expect_data_selected = {stage1_base_data,992'b0};
                        default:  expect_data_selected = {992'b0, stage1_base_data};
                    endcase
                end
            3'b011:
                begin
                    case(stage1_cycle_cnt[3:0])
                        4'b0000: expect_data_selected = {960'b0,stage1_base_data+1, stage1_base_data};
                        4'b0001: expect_data_selected = {896'b0,stage1_base_data+1, stage1_base_data,64'b0 };
                        4'b0010: expect_data_selected = {832'b0,stage1_base_data+1, stage1_base_data,128'b0};
                        4'b0011: expect_data_selected = {768'b0,stage1_base_data+1, stage1_base_data,192'b0};
                        4'b0100: expect_data_selected = {704'b0,stage1_base_data+1, stage1_base_data,256'b0};
                        4'b0101: expect_data_selected = {640'b0,stage1_base_data+1, stage1_base_data,320'b0};
                        4'b0110: expect_data_selected = {576'b0,stage1_base_data+1, stage1_base_data,384'b0};
                        4'b0111: expect_data_selected = {512'b0,stage1_base_data+1, stage1_base_data,448'b0};
                        4'b1000: expect_data_selected = {448'b0,stage1_base_data+1, stage1_base_data,512'b0};
                        4'b1001: expect_data_selected = {384'b0,stage1_base_data+1, stage1_base_data,576'b0};
                        4'b1010: expect_data_selected = {320'b0,stage1_base_data+1, stage1_base_data,640'b0};
                        4'b1011: expect_data_selected = {256'b0,stage1_base_data+1, stage1_base_data,704'b0};
                        4'b1100: expect_data_selected = {192'b0,stage1_base_data+1, stage1_base_data,768'b0};
                        4'b1101: expect_data_selected = {128'b0,stage1_base_data+1, stage1_base_data,832'b0};
                        4'b1110: expect_data_selected = {64'b0 ,stage1_base_data+1, stage1_base_data,896'b0};
                        4'b1111: expect_data_selected = {stage1_base_data+1, stage1_base_data,960'b0};
                        default: expect_data_selected = {960'b0,stage1_base_data+1, stage1_base_data};
                    endcase
                end
            3'b100:
                begin
                    case(stage1_cycle_cnt[2:0])
                        3'b000:
                            expect_data_selected = {896'b0,stage1_base_data+3,stage1_base_data+2,stage1_base_data+1,stage1_base_data};
                        3'b001:
                            expect_data_selected = {768'b0,stage1_base_data+3,stage1_base_data+2,stage1_base_data+1,stage1_base_data,128'b0};
                        3'b010:
                            expect_data_selected = {640'b0,stage1_base_data+3,stage1_base_data+2,stage1_base_data+1,stage1_base_data,256'b0};
                        3'b011:
                            expect_data_selected = {512'b0,stage1_base_data+3,stage1_base_data+2,stage1_base_data+1,stage1_base_data,384'b0};
                        3'b100:
                            expect_data_selected = {384'b0,stage1_base_data+3,stage1_base_data+2,stage1_base_data+1,stage1_base_data,512'b0};
                        3'b101:
                            expect_data_selected = {256'b0,stage1_base_data+3,stage1_base_data+2,stage1_base_data+1,stage1_base_data,640'b0};
                        3'b110:
                            expect_data_selected = {128'b0,stage1_base_data+3,stage1_base_data+2,stage1_base_data+1,stage1_base_data,768'b0};
                        3'b111:
                            expect_data_selected = {stage1_base_data+3,stage1_base_data+2,stage1_base_data+1,stage1_base_data,896'b0};
                        default:
                            expect_data_selected = {896'b0,stage1_base_data+3,stage1_base_data+2,stage1_base_data+1,stage1_base_data};
                    endcase
                end 
            3'b101:
                begin
                    case(stage1_cycle_cnt[1:0])
                        2'b00:
                            expect_data_selected = {768'b0,
                                                    stage1_base_data+7,stage1_base_data+6,stage1_base_data+5,stage1_base_data+4,
                                                    stage1_base_data+3,stage1_base_data+2,stage1_base_data+1,stage1_base_data};
                        2'b01:
                            expect_data_selected = {512'b0,
                                                    stage1_base_data+7,stage1_base_data+6,stage1_base_data+5,stage1_base_data+4,
                                                    stage1_base_data+3,stage1_base_data+2,stage1_base_data+1,stage1_base_data,   
                                                    256'b0};
                        2'b10:
                            expect_data_selected = {256'b0,
                                                    stage1_base_data+7,stage1_base_data+6,stage1_base_data+5,stage1_base_data+4,
                                                    stage1_base_data+3,stage1_base_data+2,stage1_base_data+1,stage1_base_data,   
                                                    512'b0};
                        2'b11:
                            expect_data_selected = {stage1_base_data+7,stage1_base_data+6,stage1_base_data+5,stage1_base_data+4,
                                                    stage1_base_data+3,stage1_base_data+2,stage1_base_data+1,stage1_base_data,   
                                                    768'b0};
                        default:
                            expect_data_selected = {768'b0,
                                                    stage1_base_data+7,stage1_base_data+6,stage1_base_data+5,stage1_base_data+4,
                                                    stage1_base_data+3,stage1_base_data+2,stage1_base_data+1,stage1_base_data   };
                    endcase
                end
            3'b110:
                begin
                    case(stage1_cycle_cnt[0])
                        1'b0:
                            expect_data_selected = {512'b0,
                                                    stage1_base_data+15,stage1_base_data+14,stage1_base_data+13,stage1_base_data+12,
                                                    stage1_base_data+11,stage1_base_data+10,stage1_base_data+9 ,stage1_base_data+8 ,
                                                    stage1_base_data+7 ,stage1_base_data+6 ,stage1_base_data+5 ,stage1_base_data+4 ,
                                                    stage1_base_data+3 ,stage1_base_data+2 ,stage1_base_data+1 ,stage1_base_data    };

                        1'b1:
                            expect_data_selected = {stage1_base_data+15,stage1_base_data+14,stage1_base_data+13,stage1_base_data+12,
                                                    stage1_base_data+11,stage1_base_data+10,stage1_base_data+9 ,stage1_base_data+8 ,
                                                    stage1_base_data+7 ,stage1_base_data+6 ,stage1_base_data+5 ,stage1_base_data+4 ,
                                                    stage1_base_data+3 ,stage1_base_data+2 ,stage1_base_data+1 ,stage1_base_data,    
                                                    512'b0};
                        default:
                            expect_data_selected = {512'b0,
                                                    stage1_base_data+15,stage1_base_data+14,stage1_base_data+13,stage1_base_data+12,
                                                    stage1_base_data+11,stage1_base_data+10,stage1_base_data+9,stage1_base_data+8,
                                                    stage1_base_data+7,stage1_base_data+6,stage1_base_data+5,stage1_base_data+4,
                                                    stage1_base_data+3,stage1_base_data+2,stage1_base_data+1,stage1_base_data};
                    endcase
                end
            3'b111:
                begin
                    expect_data_selected = {stage1_base_data+31,stage1_base_data+30,stage1_base_data+29,stage1_base_data+28,
                                            stage1_base_data+27,stage1_base_data+26,stage1_base_data+25,stage1_base_data+24,
                                            stage1_base_data+23,stage1_base_data+22,stage1_base_data+21,stage1_base_data+20,
                                            stage1_base_data+19,stage1_base_data+18,stage1_base_data+17,stage1_base_data+16,
                                            stage1_base_data+15,stage1_base_data+14,stage1_base_data+13,stage1_base_data+12,
                                            stage1_base_data+11,stage1_base_data+10,stage1_base_data+9,stage1_base_data+8,
                                            stage1_base_data+7,stage1_base_data+6,stage1_base_data+5,stage1_base_data+4,
                                            stage1_base_data+3,stage1_base_data+2,stage1_base_data+1,stage1_base_data};
                end
            default:
                begin
                    expect_data_selected = {stage1_base_data+31,stage1_base_data+30,stage1_base_data+29,stage1_base_data+28,
                                            stage1_base_data+27,stage1_base_data+26,stage1_base_data+25,stage1_base_data+24,
                                            stage1_base_data+23,stage1_base_data+22,stage1_base_data+21,stage1_base_data+20,
                                            stage1_base_data+19,stage1_base_data+18,stage1_base_data+17,stage1_base_data+16,
                                            stage1_base_data+15,stage1_base_data+14,stage1_base_data+13,stage1_base_data+12,
                                            stage1_base_data+11,stage1_base_data+10,stage1_base_data+9,stage1_base_data+8,
                                            stage1_base_data+7,stage1_base_data+6,stage1_base_data+5,stage1_base_data+4,
                                            stage1_base_data+3,stage1_base_data+2,stage1_base_data+1,stage1_base_data};
                end
        endcase
    end

    // read data error
    assign data_error = ((stage2_actual_data & stage2_data_mask) != stage2_expect_data);
    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            rd_error[1] <= 0;
        else if(stage2_valid)
            rd_error[1] <= data_error;
        else if(rd_error[1])
            rd_error[1] <= 0;
    end

    // read response error
    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            rd_error[0] <= 0;
        else if(axi_data_valid)
            rd_error[0] <= (m_axi_rresp != 0);
        else if(rd_error[0])
            rd_error[0] <= 0;
    end

    assign rd_done = (cstate == DONE);

    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n)
            rd_error_info <= 0;
        else if(stage2_valid && data_error)
            rd_error_info <= {stage2_actual_data[31:0], stage2_expect_data[31:0]};
    end

    //reg         wrap_mode_sync1;
    //reg [3:0]   wrap_len_sync1;
    //reg [39:0]  total_rd_beat_count_sync1;
    //reg [1:0]   rd_error_sync1;
    //reg [39:0]  beat_counter_sync1;
    //reg [31:0]  stage1_base_data_sync1;
    //reg [4:0]   stage1_cycle_cnt_sync1;
    //reg [31:0]  stage1_actual_data_sync1;

    //reg         wrap_mode_sync2;
    //reg [3:0]   wrap_len_sync2;
    //reg [39:0]  total_rd_beat_count_sync2;
    //reg [1:0]   rd_error_sync2;
    //reg [39:0]  beat_counter_sync2;
    //reg [31:0]  stage1_base_data_sync2;
    //reg [4:0]   stage1_cycle_cnt_sync2;
    //reg [31:0]  stage1_actual_data_sync2;

    //reg         wrap_mode_sync3;
    //reg [3:0]   wrap_len_sync3;
    //reg [39:0]  total_rd_beat_count_sync3;
    //reg [1:0]   rd_error_sync3;
    //reg [39:0]  beat_counter_sync3;
    //reg [31:0]  stage1_base_data_sync3;
    //reg [4:0]   stage1_cycle_cnt_sync3;
    //reg [31:0]  stage1_actual_data_sync3;

    //reg         wrap_mode_sync4;
    //reg [3:0]   wrap_len_sync4;
    //reg [39:0]  total_rd_beat_count_sync4;
    //reg [1:0]   rd_error_sync4;
    //reg [39:0]  beat_counter_sync4;
    //reg [31:0]  stage1_base_data_sync4;
    //reg [4:0]   stage1_cycle_cnt_sync4;
    //reg [31:0]  stage1_actual_data_sync4;

    //always@(posedge clk or negedge rst_n)
    //begin
    //    if(~rst_n)
    //    begin
    //        wrap_mode_sync1           <= 0;
    //        wrap_len_sync1            <= 0;
    //        total_rd_beat_count_sync1 <= 0;
    //        rd_error_sync1            <= 0;
    //        beat_counter_sync1        <= 0;
    //        stage1_base_data_sync1    <= 0;
    //        stage1_cycle_cnt_sync1    <= 0;
    //        stage1_actual_data_sync1  <= 0;

    //        wrap_mode_sync2           <= 0;
    //        wrap_len_sync2            <= 0;
    //        total_rd_beat_count_sync2 <= 0;
    //        rd_error_sync2            <= 0;
    //        beat_counter_sync2        <= 0;
    //        stage1_base_data_sync2    <= 0;
    //        stage1_cycle_cnt_sync2    <= 0;
    //        stage1_actual_data_sync2  <= 0;

    //        wrap_mode_sync3           <= 0;
    //        wrap_len_sync3            <= 0;
    //        total_rd_beat_count_sync3 <= 0;
    //        rd_error_sync3            <= 0;
    //        beat_counter_sync3        <= 0;
    //        stage1_base_data_sync3    <= 0;
    //        stage1_cycle_cnt_sync3    <= 0;
    //        stage1_actual_data_sync3  <= 0;

    //        wrap_mode_sync4           <= 0;
    //        wrap_len_sync4            <= 0;
    //        total_rd_beat_count_sync4 <= 0;
    //        rd_error_sync4            <= 0;
    //        beat_counter_sync4        <= 0;
    //        stage1_base_data_sync4    <= 0;
    //        stage1_cycle_cnt_sync4    <= 0;
    //        stage1_actual_data_sync4  <= 0;
    //    end
    //    else
    //        wrap_mode_sync1           <= wrap_mode          ;
    //        wrap_len_sync1            <= wrap_len           ;
    //        total_rd_beat_count_sync1 <= total_rd_beat_count;
    //        rd_error_sync1            <= rd_error           ;
    //        beat_counter_sync1        <= beat_counter       ;
    //        stage1_base_data_sync1    <= stage1_base_data   ;
    //        stage1_cycle_cnt_sync1    <= stage1_cycle_cnt   ;
    //        stage1_actual_data_sync1  <= stage1_actual_data ;

    //        wrap_mode_sync2           <= wrap_mode_sync1          ;
    //        wrap_len_sync2            <= wrap_len_sync1           ;
    //        total_rd_beat_count_sync2 <= total_rd_beat_count_sync1;
    //        rd_error_sync2            <= rd_error_sync1           ;
    //        beat_counter_sync2        <= beat_counter_sync1       ;
    //        stage1_base_data_sync2    <= stage1_base_data_sync1   ;
    //        stage1_cycle_cnt_sync2    <= stage1_cycle_cnt_sync1   ;
    //        stage1_actual_data_sync2  <= stage1_actual_data_sync1 ;

    //        wrap_mode_sync3           <= wrap_mode_sync2          ;
    //        wrap_len_sync3            <= wrap_len_sync2           ;
    //        total_rd_beat_count_sync3 <= total_rd_beat_count_sync2;
    //        rd_error_sync3            <= rd_error_sync2           ;
    //        beat_counter_sync3        <= beat_counter_sync2       ;
    //        stage1_base_data_sync3    <= stage1_base_data_sync2   ;
    //        stage1_cycle_cnt_sync3    <= stage1_cycle_cnt_sync2   ;
    //        stage1_actual_data_sync3  <= stage1_actual_data_sync2 ;

    //        wrap_mode_sync4           <= wrap_mode_sync3          ;
    //        wrap_len_sync4            <= wrap_len_sync3           ;
    //        total_rd_beat_count_sync4 <= total_rd_beat_count_sync3;
    //        rd_error_sync4            <= rd_error_sync3           ;
    //        beat_counter_sync4        <= beat_counter_sync3       ;
    //        stage1_base_data_sync4    <= stage1_base_data_sync3   ;
    //        stage1_cycle_cnt_sync4    <= stage1_cycle_cnt_sync3   ;
    //        stage1_actual_data_sync4  <= stage1_actual_data_sync3 ;
    //    begin
    //    end
    //end

    //ila_p157 mila_rd_checker
    //(
    //    .clk(clk),
    //    .probe0(
    //    {
    //        rst_n               , //1b
    //        wrap_mode_sync4           , //1b
    //        wrap_len_sync4            , //4b
    //        total_rd_beat_count_sync4 , //40b
    //        rd_error_sync4            , //2b
    //        beat_counter_sync4        , //40b
    //        stage1_base_data_sync4    , //32b
    //        stage1_cycle_cnt_sync4    , //5b
    //        stage1_actual_data_sync4    //32b
    //    
    //    }    
    //    )
    //);

endmodule
