// This program was cloned from: https://github.com/LiamOswald/IMPACT_Custom_SRAM_03
// License: Apache License 2.0

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2023 12:09:42 PM
// Design Name: 
// Module Name: OneBankMux
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


module OutBankMux(
    input clk,
    input rst,
    input read_enable,
    input [31:0] Bank00_Reading,
    input [9:0] Bank01_Reading,
    input [1:0] byte_sel,
    input [1:0] proj_sel,
    output reg [7:0] data_out
);

    always@(posedge clk) begin
        if (rst) data_out <= 0;
        else if (read_enable) begin
            case(proj_sel)
                2'b00:     
                    case (byte_sel)
                        2'b00: data_out <= Bank00_Reading[7:0];
                        2'b01: data_out <= Bank00_Reading[15:8];
                        2'b10: data_out <= Bank00_Reading[23:16];
                        2'b11: data_out <= Bank00_Reading[31:24];
                    endcase
                2'b10:
                    case (byte_sel)
                        2'b00: data_out <= Bank01_Reading[7:0];
                        2'b01: data_out <= {6'b000000, Bank01_Reading[9:8]};
                        default:  ;
                    endcase
                default: ;                
            endcase
        end
    end
endmodule
