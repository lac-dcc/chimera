`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2018 02:18:44 AM
// Design Name: 
// Module Name: complete
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

`define OUTPUT_NODE 10
`define DATA_SIZE 8

module complete(
    clk, rst, complete_en, result_bram_douta,
    result_bram_ena, result_bram_addra,
    result,
    complete_finish
    );
    input clk;
    input rst;
    input complete_en;
    input [`DATA_SIZE-1:0] result_bram_douta;
    output reg result_bram_ena;
    output reg [14:0] result_bram_addra;
    output reg [`DATA_SIZE*`OUTPUT_NODE-1:0] result;
    output reg complete_finish;
    
    parameter fc2_result_base = 18900;
    
    integer count = 0,
            circle = 0,
            data_begin = 0;
            
    reg [2:0] state;
    //reg [`DATA_SIZE*`OUTPUT_NODE-1:0] tempresult;
    //assign result = tempresult;
            
    parameter S_IDLE  = 3'b100,
              S_CHECK = 3'b010,
              S_LOAD  = 3'b001;
    
    always@(posedge clk)
    begin
        if(rst == 1'b1)
        begin
            result_bram_ena <= 1'b0;
            circle <= 0;
            count <= 0;
            state <= S_IDLE;
        end
        else
        begin
            if(complete_en == 1'b1)
            begin
                case(state)
                    S_IDLE:
                    begin
                        circle <= 0;
                        count <= 0;
                        complete_finish <= 1'b0;
                        state <= S_CHECK;
                    end
                    S_CHECK:
                    begin
                        if(count == `OUTPUT_NODE)
                        begin
                            count <= 0;
                            circle <= 0;
                            complete_finish <= 1'b1;
                            state <= S_IDLE;
                        end
                        else
                        begin
                            circle <= 0;
                            state <= S_LOAD;
                        end
                    end
                    S_LOAD:
                    begin
                        if(circle == 0)
                        begin
                            result_bram_ena <= 1'b1;
                            result_bram_addra <= fc2_result_base + count;
                            circle <= circle + 1;
                        end
                        else if(circle == 3)
                        begin
                            data_begin = `DATA_SIZE * (`OUTPUT_NODE - count) - 1;
                            result[data_begin-:8] <= result_bram_douta;
                            count <= count + 1;
                            circle <= 0;
                            result_bram_ena <= 1'b0;
                            state <= S_CHECK;
                        end
                        else
                        begin
                            circle <= circle + 1;
                        end
                    end
                endcase
            end
        end
    end
endmodule
