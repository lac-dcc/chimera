// This program was cloned from: https://github.com/LiamOswald/IMPACT_Custom_SRAM_03
// License: Apache License 2.0

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2023 12:10:49 PM
// Design Name: 
// Module Name: data_in_decoder
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
module data_in_reg(
    input clk,
    input rst,
    input data_in_enable,
    input [7:0] data_in,
    input [1:0] byte_sel,
    input [1:0] in_sel,
    output reg [31:0] sram_trunc_out,
    output reg [4:0] trunc_sel_out,
    output reg [9:0] sram_priv_out,
    output reg [9:0] word_sel_out
);
    always @(posedge clk) begin
        if(rst) begin 
            sram_trunc_out <= 0;
            trunc_sel_out <= 0;
            sram_priv_out <= 0;            
            word_sel_out <= 0;            
        end       
        else if(data_in_enable) begin
            case (in_sel)
                2'b00: 
                    case (byte_sel)
                        2'b00: sram_trunc_out[7:0] <= data_in;
                        2'b01: sram_trunc_out[15:8] <= data_in;
                        2'b10: sram_trunc_out[23:16] <= data_in;
                        2'b11: sram_trunc_out[31:24] <= data_in;
                    endcase    
                2'b01: trunc_sel_out <= data_in[5:0];
                2'b10: 
                    case (byte_sel)
                        2'b00: sram_priv_out[7:0] <= data_in;
                        2'b01: sram_priv_out[9:8] <= data_in[1:0];
                    endcase
                2'b11: 
                    case (byte_sel)
                        2'b00: word_sel_out[7:0] <= data_in;
                        2'b01: word_sel_out[9:8] <= data_in[1:0];
                    endcase
            endcase
        end
    end
endmodule
