`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/21/2018 10:25:44 PM
// Design Name: 
// Module Name: conv
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

`define DATA_SIZE 8
`define CONV_SIZE 3

module conv(
    clk, rst, conv_en, addbefore, vgg16_bram_douta, 
    weight_base_addr, bias_base_addr, data_base_addr, result_base_addr,
    rownum, columnnum, channelnum, filternum,
    vgg16_bram_ena, vgg16_bram_wea, vgg16_bram_addra, vgg16_bram_dina,
    conv_finish
    );
    input clk;
    input rst;
    input conv_en;
    input addbefore;
    input [7:0] vgg16_bram_douta;
    input [19:0] weight_base_addr;
    input [19:0] bias_base_addr;
    input [19:0] data_base_addr;
    input [19:0] result_base_addr;
    input [9:0] rownum;
    input [9:0] columnnum;
    input [9:0] channelnum;
    input [9:0] filternum;
    output reg vgg16_bram_ena;
    output reg [0:0] vgg16_bram_wea;
    output reg [19:0] vgg16_bram_addra;
    output reg [7:0] vgg16_bram_dina;
    output reg conv_finish;
    
    reg [`DATA_SIZE*`CONV_SIZE*`CONV_SIZE-1:0] matrix1;
    reg [`DATA_SIZE*`CONV_SIZE*`CONV_SIZE-1:0] matrix2;
    reg [`DATA_SIZE-1:0] bias;
    reg relu_en;
    wire [`DATA_SIZE-1:0] dout;
    
    mult_add conv_ma(
        .matrix1(matrix1), 
        .matrix2(matrix2), 
        .bias(bias), 
        .relu_en(relu_en), 
        .dout(dout)
    );
    
    // reg [9:0] row;
    // reg [9:0] column;
    // reg [9:0] channel;
    // reg [9:0] filter;
    integer row = 0,
            column = 0,
            channel = 0,
            filter = 0,
            count = 0,
            circle = 0,
            databegin = 0;
            
    reg [`DATA_SIZE-1:0] result;
    
    reg [6:0] state;  
    parameter S_IDLE         = 7'b1000000,
              S_CHECK        = 7'b0100000,
              S_LOAD_WEIGHTS = 7'b0010000,
              S_LOAD_BIAS    = 7'b0001000,
              S_LOAD_DATA    = 7'b0000100,
              S_CONVOLUTE    = 7'b0000010,
              S_STORE_RESULT = 7'b0000001;
    
    always@(posedge clk)
    begin
        if(rst == 1'b1)
        begin
            state <= S_IDLE;
            vgg16_bram_ena <= 1'b0;
            vgg16_bram_wea <= 1'b0;
            row <= 0;
            column <= 0;
            channel <= 0;
            filter <= 0;
            count <= 0;
            circle <= 0;
        end
        else
        begin
            if(conv_en == 1'b1)
                begin
                case (state)
                    S_IDLE:
                    begin
                        row <= 0;
                        column <= 0;
                        channel <= 0;
                        filter <= 0;
                        count <= 0;
                        circle <= 0;
                        matrix1 <= 0;
                        matrix2 <= 0;
                        bias <= 0;
                        relu_en <= 0;
                        result <= 0;
                        conv_finish <= 1'b0;
                        state <= S_CHECK;
                    end
                    S_CHECK:
                    begin
                        if(filter == filternum)
                        begin
                            vgg16_bram_ena <= 1'b0;
                            vgg16_bram_wea <= 1'b0;
                            conv_finish <= 1'b1;
                            state <= S_IDLE;
                        end
                        else
                        begin
                            circle <= 0;
                            count <= 0;
                            state <= S_LOAD_WEIGHTS;
                        end
                    end
                    S_LOAD_WEIGHTS:
                    begin
                        if(count < `CONV_SIZE * `CONV_SIZE)
                        begin
                            if(circle == 0)
                            begin
                                vgg16_bram_ena <= 1'b1;
                                vgg16_bram_addra <= weight_base_addr + filter * `CONV_SIZE * `CONV_SIZE * {10'b0, channelnum} + channel * `CONV_SIZE * `CONV_SIZE + count;
                                circle <= circle + 1;
                            end
                            else if(circle == 2)
                            begin
                                databegin = `DATA_SIZE * (`CONV_SIZE * `CONV_SIZE - count) - 1;
                                matrix2[databegin-:8] <= vgg16_bram_douta;
                                count <= count + 1;
                                circle <= 0;
                            end
                            else
                            begin
                                circle <= circle + 1;
                            end
                        end
                        else
                        begin
                            circle <= 0;
                            count <= 0;
                            vgg16_bram_ena <= 1'b0;
                            state <= S_LOAD_BIAS;
                        end
                    end
                    S_LOAD_BIAS:
                    begin
                        if(channel == 0)
                        begin
                            if(circle == 0)
                            begin
                                vgg16_bram_ena <= 1'b1;
                                vgg16_bram_addra <= bias_base_addr + filter;
                                circle <= circle + 1;
                            end
                            else if(circle == 2)
                            begin
                                bias <= vgg16_bram_douta;
                                circle <= 0;
                                count <= 0;
                                vgg16_bram_ena <= 1'b0;
                                state <= S_LOAD_DATA;
                            end
                            else
                            begin
                                circle <= circle + 1;
                            end
                        end
                        else
                        begin
                            bias <= result;
                            state <= S_LOAD_DATA;
                        end
                    end
                    S_LOAD_DATA:
                    begin
                        if(row > 0 && row < rownum - 10'b1 && column > 0 && column < columnnum - 10'b1)
                        begin
                            if(count < `CONV_SIZE * `CONV_SIZE)
                            begin
                                if(circle == 0)
                                begin
                                    vgg16_bram_ena <= 1'b1;
                                    vgg16_bram_addra <= data_base_addr + channel * rownum * columnnum + ((row-1) + count / `CONV_SIZE) * rownum + (column-1) + count % `CONV_SIZE;
                                    circle <= circle + 1;
                                end
                                else if(circle == 2)
                                begin
                                    databegin = `DATA_SIZE * (`CONV_SIZE * `CONV_SIZE - count) - 1;
                                    matrix1[databegin-:8] <= vgg16_bram_douta;
                                    count <= count + 1;
                                    circle <= 0;
                                end
                                else
                                begin
                                    circle <= circle + 1;
                                end
                            end
                            else
                            begin
                                circle <= 0;
                                count <= 0;
                                vgg16_bram_ena <= 1'b0;
                                relu_en <= 1'b1;
                                state <= S_CONVOLUTE;
                            end
                        end
                        else if(row == 0)
                        begin
                            if(column == 0)
                            begin
                                if(count < (`CONV_SIZE - 1) * (`CONV_SIZE - 1))
                                begin
                                    if(circle == 0)
                                    begin
                                        vgg16_bram_ena <= 1'b1;
                                        vgg16_bram_addra <= data_base_addr + channel * rownum * columnnum + (count / (`CONV_SIZE-1)) * rownum + column + count % (`CONV_SIZE-1);
                                        circle <= circle + 1;
                                    end
                                    else if(circle == 2)
                                    begin
                                        databegin = `DATA_SIZE * (`CONV_SIZE * (`CONV_SIZE - 1) - (count/(`CONV_SIZE-1)+1) - count) - 1;
                                        matrix1[databegin-:8] <= vgg16_bram_douta;
                                        count <= count + 1;
                                        circle <= 0;
                                    end
                                    else
                                    begin
                                        circle <= circle + 1;
                                    end
                                end
                                else
                                begin
                                    matrix1[71:40] <= 32'b0;
                                    matrix1[23:16] <= 8'b0;
                                    circle <= 0;
                                    count <= 0;
                                    vgg16_bram_ena <= 1'b0;
                                    relu_en <= 1'b1;
                                    state <= S_CONVOLUTE;
                                end
                            end
                            else if(column == columnnum - 10'b1)
                            begin
                                if(count < (`CONV_SIZE - 1) * (`CONV_SIZE - 1))
                                begin
                                    if(circle == 0)
                                    begin
                                        vgg16_bram_ena <= 1'b1;
                                        vgg16_bram_addra <= data_base_addr + channel * rownum * columnnum + (count / (`CONV_SIZE-1)) * rownum + (column-1) + count % (`CONV_SIZE-1);
                                        circle <= circle + 1;
                                    end
                                    else if(circle == 2)
                                    begin
                                        databegin = `DATA_SIZE * (`CONV_SIZE * (`CONV_SIZE - 1) - count/(`CONV_SIZE-1) - count) - 1;
                                        matrix1[databegin-:8] <= vgg16_bram_douta;
                                        count <= count + 1;
                                        circle <= 0;
                                    end
                                    else
                                    begin
                                        circle <= circle + 1;
                                    end
                                end
                                else
                                begin
                                    matrix1[71:48] <= 24'b0;
                                    matrix1[31:24] <= 8'b0;
                                    matrix1[7:0] <= 8'b0;
                                    circle <= 0;
                                    count <= 0;
                                    vgg16_bram_ena <= 1'b0;
                                    relu_en <= 1'b1;
                                    state <= S_CONVOLUTE;
                                end
                            end
                            else
                            begin
                                if(count < `CONV_SIZE * (`CONV_SIZE - 1))
                                begin
                                    if(circle == 0)
                                    begin
                                        vgg16_bram_ena <= 1'b1;
                                        vgg16_bram_addra <= data_base_addr + channel * rownum * columnnum + (count / `CONV_SIZE) * rownum + (column-1) + count % `CONV_SIZE;
                                        circle <= circle + 1;
                                    end
                                    else if(circle == 2)
                                    begin
                                        databegin = `DATA_SIZE * (`CONV_SIZE * (`CONV_SIZE - 1) - count) - 1;
                                        matrix1[databegin-:8] <= vgg16_bram_douta;
                                        count <= count + 1;
                                        circle <= 0;
                                    end
                                    else
                                    begin
                                        circle <= circle + 1;
                                    end
                                end
                                else
                                begin
                                    matrix1[71:48] <= 24'b0;
                                    circle <= 0;
                                    count <= 0;
                                    vgg16_bram_ena <= 1'b0;
                                    relu_en <= 1'b1;
                                    state <= S_CONVOLUTE;
                                end
                            end
                        end
                        else if(row == rownum - 10'b1)
                        begin
                            if(column == 0)
                            begin
                                if(count < (`CONV_SIZE - 1) * (`CONV_SIZE - 1))
                                begin
                                    if(circle == 0)
                                    begin
                                        vgg16_bram_ena <= 1'b1;
                                        vgg16_bram_addra <= data_base_addr + channel * rownum * columnnum + ((row-1) + count / (`CONV_SIZE-1)) * rownum + column + count % (`CONV_SIZE-1);
                                        circle <= circle + 1;
                                    end
                                    else if(circle == 2)
                                    begin
                                        databegin = `DATA_SIZE * (`CONV_SIZE * `CONV_SIZE - (count/(`CONV_SIZE-1)+1) - count) - 1;
                                        matrix1[databegin-:8] <= vgg16_bram_douta;
                                        count <= count + 1;
                                        circle <= 0;
                                    end
                                    else
                                    begin
                                        circle <= circle + 1;
                                    end
                                end
                                else
                                begin
                                    matrix1[71:64] <= 8'b0;
                                    matrix1[47:40] <= 8'b0;
                                    matrix1[23:0] <= 24'b0;
                                    circle <= 0;
                                    count <= 0;
                                    vgg16_bram_ena <= 1'b0;
                                    relu_en <= 1'b1;
                                    state <= S_CONVOLUTE;
                                end
                            end
                            else if(column == columnnum - 10'b1)
                            begin
                                if(count < (`CONV_SIZE - 1) * (`CONV_SIZE - 1))
                                begin
                                    if(circle == 0)
                                    begin
                                        vgg16_bram_ena <= 1'b1;
                                        vgg16_bram_addra <= data_base_addr + channel * rownum * columnnum + ((row-1) + count / (`CONV_SIZE-1)) * rownum + (column-1) + count % (`CONV_SIZE-1);
                                        circle <= circle + 1;
                                    end
                                    else if(circle == 2)
                                    begin
                                        databegin = `DATA_SIZE * (`CONV_SIZE * `CONV_SIZE - count/(`CONV_SIZE-1) - count) - 1;
                                        matrix1[databegin-:8] <= vgg16_bram_douta;
                                        count <= count + 1;
                                        circle <= 0;
                                    end
                                    else
                                    begin
                                        circle <= circle + 1;
                                    end
                                end
                                else
                                begin
                                    matrix1[55:48] <= 8'b0;
                                    matrix1[31:0] <= 32'b0;
                                    circle <= 0;
                                    count <= 0;
                                    vgg16_bram_ena <= 1'b0;
                                    relu_en <= 1'b1;
                                    state <= S_CONVOLUTE;
                                end
                            end
                            else
                            begin
                                if(count < `CONV_SIZE * (`CONV_SIZE - 1))
                                begin
                                    if(circle == 0)
                                    begin
                                        vgg16_bram_ena <= 1'b1;
                                        vgg16_bram_addra <= data_base_addr + channel * rownum * columnnum + ((row-1) + count / `CONV_SIZE) * rownum + (column-1) + count % `CONV_SIZE;
                                        circle <= circle + 1;
                                    end
                                    else if(circle == 2)
                                    begin
                                        databegin = `DATA_SIZE * (`CONV_SIZE * `CONV_SIZE - count) - 1;
                                        matrix1[databegin-:8] <= vgg16_bram_douta;
                                        count <= count + 1;
                                        circle <= 0;
                                    end
                                    else
                                    begin
                                        circle <= circle + 1;
                                    end
                                end
                                else
                                begin
                                    matrix1[23:0] <= 24'b0;
                                    circle <= 0;
                                    count <= 0;
                                    vgg16_bram_ena <= 1'b0;
                                    relu_en <= 1'b1;
                                    state <= S_CONVOLUTE;
                                end
                            end
                        end
                    end
                    S_CONVOLUTE:
                    begin
                        result <= dout;
                        circle <= 0;
                        state <= S_STORE_RESULT;
                    end
                    S_STORE_RESULT:
                    begin
                        if(addbefore == 1'b1)
                        begin
                            if(circle == 0)
                            begin
                                vgg16_bram_ena <= 1'b1;
                                vgg16_bram_addra <= result_base_addr + filter * rownum * columnnum + row * rownum + column;
                                circle <= circle + 1;
                            end
                            else if(circle == 2)
                            begin
                                vgg16_bram_dina <= result + vgg16_bram_douta;
                                vgg16_bram_wea <= 1'b1;
                                vgg16_bram_addra <= result_base_addr + filter * rownum * columnnum + row * rownum + column;
                                circle <= circle + 1;
                            end
                            else if(circle == 3)
                            begin
                                vgg16_bram_ena <= 1'b0;
                                vgg16_bram_wea <= 1'b0;
                                circle <= 0;
                                if(column == columnnum - 10'b1)
                                begin
                                    if(row == rownum - 10'b1)
                                    begin
                                        if(channel == channelnum - 10'b1)
                                        begin
                                            filter <= filter + 1;
                                            channel <= 0;
                                        end
                                        else
                                        begin
                                            channel <= channel + 1;
                                        end
                                        row <= 0;
                                    end
                                    else
                                    begin
                                        row <= row + 1;
                                    end
                                    column <= 0;
                                end
                                else
                                begin
                                    column <= column + 1;
                                end
                                state <= S_CHECK;
                            end
                            else
                            begin
                                circle <= circle + 1;
                            end
                        end
                        else
                        begin
                            if(circle == 0)
                            begin
                                vgg16_bram_ena <= 1'b1;
                                vgg16_bram_wea <= 1'b1;
                                vgg16_bram_addra <= result_base_addr + filter * rownum * columnnum + row * rownum + column;
                                vgg16_bram_dina <= result;
                                circle <= circle + 1;
                            end
                            else if(circle == 2)
                            begin
                                vgg16_bram_ena <= 1'b0;
                                vgg16_bram_wea <= 1'b0;
                                circle <= 0;
                                if(column == columnnum - 10'b1)
                                begin
                                    if(row == rownum - 10'b1)
                                    begin
                                        if(channel == channelnum - 10'b1)
                                        begin
                                            filter <= filter + 1;
                                            channel <= 0;
                                        end
                                        else
                                        begin
                                            channel <= channel + 1;
                                        end
                                        row <= 0;
                                    end
                                    else
                                    begin
                                        row <= row + 1;
                                    end
                                    column <= 0;
                                end
                                else
                                begin
                                    column <= column + 1;
                                end
                                state <= S_CHECK;
                            end
                            else
                            begin
                                circle <= circle + 1;
                            end
                        end
                    end
                    default:
                    begin
                        state <= S_IDLE;
                        vgg16_bram_ena <= 1'b0;
                        vgg16_bram_wea <= 1'b0;
                    end
                endcase
            end
        end
    end
    
endmodule
