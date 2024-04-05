`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2018 09:57:07 PM
// Design Name: 
// Module Name: vgg16_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vgg16_top(
    clk, rst,
    layer, vgg16_start, addbefore, 
    loaddma_start, base_addr, num, 
    doutb_in,
    storedma_start,
    clkb_out, rstb_out, enb_out, web_out, addrb_out, dinb_out,
    loaddma_finish,
    storedma_finish,
    vgg16_finish
    );
    input clk;
    input rst;
    input [4:0] layer;
    input vgg16_start;
    input addbefore;
    input loaddma_start;
    input [19:0] base_addr;
    input [31:0] num;
    input [31:0] doutb_in;
    input storedma_start;
    output clkb_out;
    output rstb_out;
    output enb_out;
    output [3:0] web_out;
    output [31:0] addrb_out;
    output [31:0] dinb_out;
    output loaddma_finish;
    output storedma_finish;
    output reg vgg16_finish;
    
    reg vgg16_bram_ena;
    reg vgg16_bram_wea;
    reg [19:0] vgg16_bram_addra;
    reg [`DATA_SIZE-1:0] vgg16_bram_dina;
    
    wire [`DATA_SIZE:0] vgg16_bram_douta;
    
    bram_top vgg16_bram(
        .clk(clk), 
        .rst(rst),
        .loaddma_start(loaddma_start), 
        .base_addr(base_addr), 
        .num(num),
        .doutb_in(doutb_in),
        .data_ena(vgg16_bram_ena), 
        .data_wea(vgg16_bram_wea), 
        .data_addra(vgg16_bram_addra), 
        .data_dina(vgg16_bram_dina),
        .storedma_start(storedma_start), 
        .clkb_out(clkb_out), 
        .rstb_out(rstb_out), 
        .enb_out(enb_out), 
        .web_out(web_out), 
        .addrb_out(addrb_out), 
        .dinb_out(dinb_out),
        .loaddma_finish(loaddma_finish),
        .vgg16_bram_douta(vgg16_bram_douta),
        .storedma_finish(storedma_finish)
    );
    
    reg [9:0] rownum;
    reg [9:0] columnnum;
    reg [9:0] channelnum;
    reg [9:0] filternum;
    reg [19:0] weight_base_addr;
    reg [19:0] bias_base_addr;
    reg [19:0] data_base_addr;
    reg [19:0] result_base_addr;
    
    reg conv_en;
    reg [`DATA_SIZE-1:0] conv_vgg16_bram_douta;
    wire conv_vgg16_bram_ena;
    wire [0:0] conv_vgg16_bram_wea;
    wire [19:0] conv_vgg16_bram_addra;
    wire [`DATA_SIZE-1:0] conv_vgg16_bram_dina;
    wire conv_finish;
    
    conv vgg16_conv(
        .clk(clk), 
        .rst(rst), 
        .conv_en(conv_en), 
        .vgg16_bram_douta(conv_vgg16_bram_douta), 
        .weight_base_addr(weight_base_addr), 
        .bias_base_addr(bias_base_addr), 
        .data_base_addr(data_base_addr), 
        .result_base_addr(result_base_addr),
        .rownum(rownum), 
        .columnnum(columnnum), 
        .channelnum(channelnum), 
        .filternum(filternum),
        .vgg16_bram_ena(conv_vgg16_bram_ena), 
        .vgg16_bram_wea(conv_vgg16_bram_wea), 
        .vgg16_bram_addra(conv_vgg16_bram_addra), 
        .vgg16_bram_dina(conv_vgg16_bram_dina),
        .conv_finish(conv_finish)
    );
    
    reg pool_en;
    reg [`DATA_SIZE-1:0] pool_vgg16_bram_douta;
    wire pool_vgg16_bram_ena;
    wire [0:0] pool_vgg16_bram_wea;
    wire [19:0] pool_vgg16_bram_addra;
    wire [`DATA_SIZE-1:0] pool_vgg16_bram_dina;
    wire pool_finish;
    
    pool vgg16_pool(
        .clk(clk), 
        .rst(rst), 
        .pool_en(pool_en),
        .rownum(rownum), 
        .columnnum(columnnum), 
        .channelnum(channelnum),  
        .data_base_addr(data_base_addr), 
        .result_base_addr(result_base_addr), 
        .vgg16_bram_douta(pool_vgg16_bram_douta),
        .vgg16_bram_ena(pool_vgg16_bram_ena), 
        .vgg16_bram_wea(pool_vgg16_bram_wea), 
        .vgg16_bram_addra(pool_vgg16_bram_addra), 
        .vgg16_bram_dina(pool_vgg16_bram_dina), 
        .pool_finish(pool_finish)
    );
    
    reg fc_en;
    reg [`DATA_SIZE-1:0] fc_vgg16_bram_douta;
    wire fc_vgg16_bram_ena;
    wire [0:0] fc_vgg16_bram_wea;
    wire [19:0] fc_vgg16_bram_addra;
    wire [`DATA_SIZE-1:0] fc_vgg16_bram_dina;
    wire fc_finish;
    
    reg [14:0] fc_columnnum;
    
    fc vgg16_fc(
        .clk(clk), 
        .rst(rst), 
        .fc_en(fc_en), 
        .weight_base_addr(weight_base_addr), 
        .bias_base_addr(bias_base_addr), 
        .data_base_addr(data_base_addr), 
        .result_base_addr(result_base_addr), 
        .rownum(rownum), 
        .columnnum(fc_columnnum),
        .vgg16_bram_douta(fc_vgg16_bram_douta), 
        .vgg16_bram_ena(fc_vgg16_bram_ena), 
        .vgg16_bram_wea(fc_vgg16_bram_wea), 
        .vgg16_bram_addra(fc_vgg16_bram_addra), 
        .vgg16_bram_dina(fc_vgg16_bram_dina), 
        .fc_finish(fc_finish)
    );
    
    parameter conv1_1_data_base_addr   = 0,
              conv1_1_weight_base_addr = 150528,
              conv1_1_bias_base_addr   = 150636,
              conv1_1_result_base_addr = 150640;
    
    parameter conv1_2_data_base_addr   = 0,
              conv1_2_weight_base_addr = 200704,
              conv1_2_bias_base_addr   = 200848,
              conv1_2_result_base_addr = 200852;
    
    parameter conv2_data_base_addr   = 0,
              conv2_weight_base_addr = 200704,
              conv2_bias_base_addr   = 203008,
              conv2_result_base_addr = 203024;
    
    parameter conv3_data_base_addr   = 0,
              conv3_weight_base_addr = 200704,
              conv3_bias_base_addr   = 237568,
              conv3_result_base_addr = 237632;
    
    parameter conv4_data_base_addr   = 0,
              conv4_weight_base_addr = 200704,
              conv4_bias_base_addr   = 348160,
              conv4_result_base_addr = 348224;
    
    parameter conv5_data_base_addr   = 0,
              conv5_weight_base_addr = 100352,
              conv5_bias_base_addr   = 395264,
              conv5_result_base_addr = 395328;
    
    parameter pool1_data_base_addr   = 0,
              pool1_result_base_addr = 200704;
    
    parameter pool2_data_base_addr   = 0,
              pool2_result_base_addr = 200704;
    
    parameter pool3_data_base_addr   = 0,
              pool3_result_base_addr = 200704;
    
    parameter pool4_data_base_addr   = 0,
              pool4_result_base_addr = 200704;
    
    parameter pool5_data_base_addr   = 0,
              pool5_result_base_addr = 100352;
    
    parameter fc1_data_base_addr   = 0,
              fc1_weight_base_addr = 25088,
              fc1_bias_base_addr   = 426496,
              fc1_result_base_addr = 426512;
    
    parameter fc2_data_base_addr   = 0,
              fc2_weight_base_addr = 4096,
              fc2_bias_base_addr   = 528384,
              fc2_result_base_addr = 528512;
    
    parameter fc3_data_base_addr   = 0,
              fc3_weight_base_addr = 4096,
              fc3_bias_base_addr   = 516096,
              fc3_result_base_addr = 516221;
    
    reg [21:0] state;
    
    parameter S_IDLE     = 22'b1000_0000_0000_0000_0000_00,
              S_CONV1_1  = 22'b0100_0000_0000_0000_0000_00,
              S_CONV1_2  = 22'b0010_0000_0000_0000_0000_00,
              S_POOL1    = 22'b0001_0000_0000_0000_0000_00,
              S_CONV2_1  = 22'b0000_1000_0000_0000_0000_00,
              S_CONV2_2  = 22'b0000_0100_0000_0000_0000_00,
              S_POOL2    = 22'b0000_0010_0000_0000_0000_00,
              S_CONV3_1  = 22'b0000_0001_0000_0000_0000_00,
              S_CONV3_2  = 22'b0000_0000_1000_0000_0000_00,
              S_CONV3_3  = 22'b0000_0000_0100_0000_0000_00,
              S_POOL3    = 22'b0000_0000_0010_0000_0000_00,
              S_CONV4_1  = 22'b0000_0000_0001_0000_0000_00,
              S_CONV4_2  = 22'b0000_0000_0000_1000_0000_00,
              S_CONV4_3  = 22'b0000_0000_0000_0100_0000_00,
              S_POOL4    = 22'b0000_0000_0000_0010_0000_00,
              S_CONV5_1  = 22'b0000_0000_0000_0001_0000_00,
              S_CONV5_2  = 22'b0000_0000_0000_0000_1000_00,
              S_CONV5_3  = 22'b0000_0000_0000_0000_0100_00,
              S_POOL5    = 22'b0000_0000_0000_0000_0010_00,
              S_FC1      = 22'b0000_0000_0000_0000_0001_00,
              S_FC2      = 22'b0000_0000_0000_0000_0000_10,
              S_FC3      = 22'b0000_0000_0000_0000_0000_01;
              
    always@(posedge clk)
    begin
        if(rst == 1'b1)
        begin
            state <= S_IDLE;
            conv_en <= 1'b0;
            pool_en <= 1'b0;
            fc_en <= 1'b0;
        end
        else
        begin
            case (state)
                S_IDLE:
                begin
                    if(vgg16_start == 1'b1)
                    begin
                        vgg16_finish <= 1'b0;
                        case (layer)
                            5'b00000:  // 0  conv1_1
                            begin
                                conv_en <= 1'b1;
                                weight_base_addr <= conv1_1_weight_base_addr;
                                bias_base_addr <= conv1_1_bias_base_addr;
                                data_base_addr <= conv1_1_data_base_addr;
                                result_base_addr <= conv1_1_result_base_addr;
                                rownum <= 10'd224;
                                columnnum <= 10'd224;
                                channelnum <= 10'd3;
                                filternum <= 10'd4;
                                state <= S_CONV1_1;
                            end
                            5'b00001:  // 1  conv1_2
                            begin
                                conv_en <= 1'b1;    
                                weight_base_addr <= conv1_2_weight_base_addr;
                                bias_base_addr <= conv1_2_bias_base_addr;
                                data_base_addr <= conv1_2_data_base_addr;
                                result_base_addr <= conv1_2_result_base_addr;
                                rownum <= 10'd224;
                                columnnum <= 10'd224;
                                channelnum <= 10'd4;
                                filternum <= 10'd4;     
                                state <= S_CONV1_2;
                            end
                            5'b00010:  // 2  pool1
                            begin
                                pool_en <= 1'b1;
                                rownum <= 10'd112;
                                columnnum <= 10'd112;
                                channelnum <= 10'd4;
                                data_base_addr <= pool1_data_base_addr;
                                result_base_addr <= pool1_result_base_addr;
                                state <= S_POOL1;
                            end
                            5'b00011:  // 3  conv2_1
                            begin
                                conv_en <= 1'b1;
                                weight_base_addr <= conv2_weight_base_addr;
                                bias_base_addr <= conv2_bias_base_addr;
                                data_base_addr <= conv2_data_base_addr;
                                result_base_addr <= conv2_result_base_addr;
                                rownum <= 10'd112;
                                columnnum <= 10'd112;
                                channelnum <= 10'd16;
                                filternum <= 10'd16;    
                                state <= S_CONV2_1;
                            end
                            5'b00100:  // 4  conv2_2
                            begin
                                conv_en <= 1'b1;
                                weight_base_addr <= conv2_weight_base_addr;
                                bias_base_addr <= conv2_bias_base_addr;
                                data_base_addr <= conv2_data_base_addr;
                                result_base_addr <= conv2_result_base_addr;
                                rownum <= 10'd112;
                                columnnum <= 10'd112;
                                channelnum <= 10'd16;
                                filternum <= 10'd16; 
                                state <= S_CONV2_2;
                            end
                            5'b00101:  // 5  pool2
                            begin
                                pool_en <= 1'b1;
                                rownum <= 10'd56;
                                columnnum <= 10'd56;
                                channelnum <= 10'd16;
                                data_base_addr <= pool2_data_base_addr;
                                result_base_addr <= pool2_result_base_addr;
                                state <= S_POOL2;
                            end
                            5'b00110:  // 6  conv3_1
                            begin
                                conv_en <= 1'b1;
                                weight_base_addr <= conv3_weight_base_addr;
                                bias_base_addr <= conv3_bias_base_addr;
                                data_base_addr <= conv3_data_base_addr;
                                result_base_addr <= conv3_result_base_addr;
                                rownum <= 10'd56;
                                columnnum <= 10'd56;
                                channelnum <= 10'd64;
                                filternum <= 10'd64; 
                                state <= S_CONV3_1;
                            end
                            5'b00111:  // 7  conv3_2
                            begin
                                conv_en <= 1'b1;
                                weight_base_addr <= conv3_weight_base_addr;
                                bias_base_addr <= conv3_bias_base_addr;
                                data_base_addr <= conv3_data_base_addr;
                                result_base_addr <= conv3_result_base_addr;
                                rownum <= 10'd56;
                                columnnum <= 10'd56;
                                channelnum <= 10'd64;
                                filternum <= 10'd64; 
                                state <= S_CONV3_2;
                            end
                            5'b01000:  // 8  conv3_3
                            begin
                                conv_en <= 1'b1;
                                weight_base_addr <= conv3_weight_base_addr;
                                bias_base_addr <= conv3_bias_base_addr;
                                data_base_addr <= conv3_data_base_addr;
                                result_base_addr <= conv3_result_base_addr;
                                rownum <= 10'd56;
                                columnnum <= 10'd56;
                                channelnum <= 10'd64;
                                filternum <= 10'd64; 
                                state <= S_CONV3_3;
                            end
                            5'b01001:  // 9  pool3
                            begin
                                pool_en <= 1'b1;
                                rownum <= 10'd28;
                                columnnum <= 10'd28;
                                channelnum <= 10'd64;
                                data_base_addr <= pool3_data_base_addr;
                                result_base_addr <= pool3_result_base_addr;
                                state <= S_POOL3;
                            end
                            5'b01010:  // 10 conv4_1
                            begin
                                conv_en <= 1'b1;
                                weight_base_addr <= conv4_weight_base_addr;
                                bias_base_addr <= conv4_bias_base_addr;
                                data_base_addr <= conv4_data_base_addr;
                                result_base_addr <= conv4_result_base_addr;
                                rownum <= 10'd28;
                                columnnum <= 10'd28;
                                channelnum <= 10'd256;
                                filternum <= 10'd64; 
                                state <= S_CONV4_1;
                            end
                            5'b01011:  // 11 conv4_2
                            begin
                                conv_en <= 1'b1;
                                weight_base_addr <= conv4_weight_base_addr;
                                bias_base_addr <= conv4_bias_base_addr;
                                data_base_addr <= conv4_data_base_addr;
                                result_base_addr <= conv4_result_base_addr;
                                rownum <= 10'd28;
                                columnnum <= 10'd28;
                                channelnum <= 10'd256;
                                filternum <= 10'd64; 
                                state <= S_CONV4_2;
                            end
                            5'b01100:  // 12 conv4_3
                            begin
                                conv_en <= 1'b1;
                                weight_base_addr <= conv4_weight_base_addr;
                                bias_base_addr <= conv4_bias_base_addr;
                                data_base_addr <= conv4_data_base_addr;
                                result_base_addr <= conv4_result_base_addr;
                                rownum <= 10'd28;
                                columnnum <= 10'd28;
                                channelnum <= 10'd256;
                                filternum <= 10'd64; 
                                state <= S_CONV4_3;
                            end
                            5'b01101:  // 13 pool4
                            begin
                                pool_en <= 1'b1;
                                rownum <= 10'd14;
                                columnnum <= 10'd14;
                                channelnum <= 10'd256;
                                data_base_addr <= pool4_data_base_addr;
                                result_base_addr <= pool4_result_base_addr;
                                state <= S_POOL4;
                            end
                            5'b01110:  // 14 conv5_1
                            begin
                                conv_en <= 1'b1;
                                weight_base_addr <= conv5_weight_base_addr;
                                bias_base_addr <= conv5_bias_base_addr;
                                data_base_addr <= conv5_data_base_addr;
                                result_base_addr <= conv5_result_base_addr;
                                rownum <= 10'd14;
                                columnnum <= 10'd14;
                                channelnum <= 10'd512;
                                filternum <= 10'd64; 
                                state <= S_CONV5_1;
                            end
                            5'b01111:  // 15 conv5_2
                            begin
                                conv_en <= 1'b1;
                                weight_base_addr <= conv5_weight_base_addr;
                                bias_base_addr <= conv5_bias_base_addr;
                                data_base_addr <= conv5_data_base_addr;
                                result_base_addr <= conv5_result_base_addr;
                                rownum <= 10'd14;
                                columnnum <= 10'd14;
                                channelnum <= 10'd512;
                                filternum <= 10'd64; 
                                state <= S_CONV5_2;
                            end
                            5'b10000:  // 16 conv5_3
                            begin
                                conv_en <= 1'b1;
                                weight_base_addr <= conv5_weight_base_addr;
                                bias_base_addr <= conv5_bias_base_addr;
                                data_base_addr <= conv5_data_base_addr;
                                result_base_addr <= conv5_result_base_addr;
                                rownum <= 10'd14;
                                columnnum <= 10'd14;
                                channelnum <= 10'd512;
                                filternum <= 10'd64; 
                                state <= S_CONV5_3;
                            end
                            5'b10001:  // 17 pool5
                            begin
                                pool_en <= 1'b1;
                                rownum <= 10'd7;
                                columnnum <= 10'd7;
                                channelnum <= 10'd512;
                                data_base_addr <= pool5_data_base_addr;
                                result_base_addr <= pool5_result_base_addr;
                                state <= S_POOL5;
                            end
                            5'b10010:  // 18 fc1
                            begin
                                fc_en <= 1'b1;
                                weight_base_addr <= fc1_weight_base_addr;
                                bias_base_addr <= fc1_bias_base_addr;
                                data_base_addr <= fc1_data_base_addr;
                                result_base_addr <= fc1_result_base_addr;
                                rownum <= 10'd16;
                                fc_columnnum <= 15'd25088;
                                state <= S_FC1;
                            end
                            5'b10011:  // 19 fc2
                            begin
                                fc_en <= 1'b1;
                                weight_base_addr <= fc2_weight_base_addr;
                                bias_base_addr <= fc2_bias_base_addr;
                                data_base_addr <= fc2_data_base_addr;
                                result_base_addr <= fc2_result_base_addr;
                                rownum <= 10'd128;
                                fc_columnnum <= 15'd4096;
                                state <= S_FC2;
                            end
                            5'b10100:  // 20 fc3
                            begin
                                fc_en <= 1'b1;
                                weight_base_addr <= fc3_weight_base_addr;
                                bias_base_addr <= fc3_bias_base_addr;
                                data_base_addr <= fc3_data_base_addr;
                                result_base_addr <= fc3_result_base_addr;
                                rownum <= 10'd125;
                                fc_columnnum <= 15'd4096;
                                state <= S_FC3;
                            end
                            default:
                            begin
                                conv_en <= 1'b0;
                                pool_en <= 1'b0;
                                fc_en <= 1'b0;
                                state <= S_IDLE;
                            end
                        endcase
                    end
                    else
                    begin
                        vgg16_finish <= 1'b0;
                        state <= S_IDLE;
                    end
                end
                S_CONV1_1:
                begin
                    if(conv_finish == 1'b1)
                    begin
                        conv_en <= 1'b0;
                        vgg16_finish <= 1'b1;
                        state <= S_IDLE;
                    end
                end
                S_CONV1_2:
                begin
                    if(conv_finish == 1'b1)
                    begin
                        conv_en <= 1'b0;
                        vgg16_finish <= 1'b1;
                        state <= S_IDLE;
                    end
                end
                S_POOL1:
                begin
                    if(pool_finish == 1'b1)
                    begin
                        pool_en <= 1'b0;
                        vgg16_finish <= 1'b1;
                        state <= S_IDLE;
                    end
                end
                S_CONV2_1:
                begin
                    if(conv_finish == 1'b1)
                    begin
                        conv_en <= 1'b0;
                        vgg16_finish <= 1'b1;
                        state <= S_IDLE;
                    end
                end
                S_CONV2_2:
                begin
                    if(conv_finish == 1'b1)
                    begin
                        conv_en <= 1'b0;
                        vgg16_finish <= 1'b1;
                        state <= S_IDLE;
                    end
                end
                S_POOL2:
                begin
                    if(pool_finish == 1'b1)
                    begin
                        pool_en <= 1'b0;
                        vgg16_finish <= 1'b1;
                        state <= S_IDLE;
                    end
                end
                S_CONV3_1:
                begin
                    if(conv_finish == 1'b1)
                    begin
                        conv_en <= 1'b0;
                        vgg16_finish <= 1'b1;
                        state <= S_IDLE;
                    end
                end
                S_CONV3_2:
                begin
                    if(conv_finish == 1'b1)
                    begin
                        conv_en <= 1'b0;
                        vgg16_finish <= 1'b1;
                        state <= S_IDLE;
                    end
                end
                S_CONV3_3:
                begin
                    if(conv_finish == 1'b1)
                    begin
                        conv_en <= 1'b0;
                        vgg16_finish <= 1'b1;
                        state <= S_IDLE;
                    end
                end
                S_POOL3:
                begin
                    if(pool_finish == 1'b1)
                    begin
                        pool_en <= 1'b0;
                        vgg16_finish <= 1'b1;
                        state <= S_IDLE;
                    end
                end
                S_CONV4_1:
                begin
                    if(conv_finish == 1'b1)
                    begin
                        conv_en <= 1'b0;
                        vgg16_finish <= 1'b1;
                        state <= S_IDLE;
                    end
                end
                S_CONV4_2:
                begin
                    if(conv_finish == 1'b1)
                    begin
                        conv_en <= 1'b0;
                        vgg16_finish <= 1'b1;
                        state <= S_IDLE;
                    end
                end
                S_CONV4_3:
                begin
                    if(conv_finish == 1'b1)
                    begin
                        conv_en <= 1'b0;
                        vgg16_finish <= 1'b1;
                        state <= S_IDLE;
                    end
                end
                S_POOL4:
                begin
                    if(pool_finish == 1'b1)
                    begin
                        pool_en <= 1'b0;
                        vgg16_finish <= 1'b1;
                        state <= S_IDLE;
                    end
                end
                S_CONV5_1:
                begin
                    if(conv_finish == 1'b1)
                    begin
                        conv_en <= 1'b0;
                        vgg16_finish <= 1'b1;
                        state <= S_IDLE;
                    end
                end
                S_CONV5_2:
                begin
                    if(conv_finish == 1'b1)
                    begin
                        conv_en <= 1'b0;
                        vgg16_finish <= 1'b1;
                        state <= S_IDLE;
                    end
                end
                S_CONV5_3:
                begin
                    if(conv_finish == 1'b1)
                    begin
                        conv_en <= 1'b0;
                        vgg16_finish <= 1'b1;
                        state <= S_IDLE;
                    end
                end
                S_POOL5:
                begin
                    if(pool_finish == 1'b1)
                    begin
                        pool_en <= 1'b0;
                        vgg16_finish <= 1'b1;
                        state <= S_IDLE;
                    end
                end
                S_FC1:
                begin
                    if(fc_finish == 1'b1)
                    begin
                        fc_en <= 1'b0;
                        vgg16_finish <= 1'b1;
                        state <= S_IDLE;
                    end
                end
                S_FC2:
                begin
                    if(fc_finish == 1'b1)
                    begin
                        fc_en <= 1'b0;
                        vgg16_finish <= 1'b1;
                        state <= S_IDLE;
                    end
                end
                S_FC3:
                begin
                    if(fc_finish == 1'b1)
                    begin
                        fc_en <= 1'b0;
                        vgg16_finish <= 1'b1;
                        state <= S_IDLE;
                    end
                end
                default:
                begin
                    state <= S_IDLE;
                    conv_en <= 1'b0;
                    pool_en <= 1'b0;
                    fc_en <= 1'b0;
                end
            endcase
        end
    end
    
    // vgg16_bram
    always@(posedge clk)
    begin
        if(rst == 1'b1)
        begin
            vgg16_bram_ena <= 1'b0;
            vgg16_bram_wea <= 1'b0;
        end
        else
        begin
            if(state == S_CONV1_1 || state == S_CONV1_2 || 
               state == S_CONV2_1 || state == S_CONV2_2 || 
               state == S_CONV3_1 || state == S_CONV3_2 || state == S_CONV3_3 || 
               state == S_CONV4_1 || state == S_CONV4_2 || state == S_CONV4_3 || 
               state == S_CONV5_1 || state == S_CONV5_2 || state == S_CONV5_3)
            begin
                vgg16_bram_ena = conv_vgg16_bram_ena;
                vgg16_bram_wea = conv_vgg16_bram_wea;
                vgg16_bram_addra = conv_vgg16_bram_addra;
                vgg16_bram_dina = conv_vgg16_bram_dina;
                conv_vgg16_bram_douta = vgg16_bram_douta;
            end
            else if(state == S_POOL1 || state == S_POOL2 || state == S_POOL3 || state == S_POOL4 || state == S_POOL5)
            begin
                vgg16_bram_ena = pool_vgg16_bram_ena;
                vgg16_bram_wea = pool_vgg16_bram_wea;
                vgg16_bram_addra = pool_vgg16_bram_addra;
                vgg16_bram_dina = pool_vgg16_bram_dina;
                pool_vgg16_bram_douta = vgg16_bram_douta;
            end
            else if(state == S_FC1 || state == S_FC2 || state == S_FC3)
            begin
                vgg16_bram_ena = fc_vgg16_bram_ena;
                vgg16_bram_wea = fc_vgg16_bram_wea;
                vgg16_bram_addra = fc_vgg16_bram_addra;
                vgg16_bram_dina = fc_vgg16_bram_dina;
                fc_vgg16_bram_douta = vgg16_bram_douta;
            end
            else
            begin
                vgg16_bram_ena <= 1'b0;
                vgg16_bram_wea <= 1'b0;
            end
        end
    end
    
endmodule
