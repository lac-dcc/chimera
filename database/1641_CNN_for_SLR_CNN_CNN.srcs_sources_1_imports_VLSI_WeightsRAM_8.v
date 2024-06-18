// This program was cloned from: https://github.com/ilaydayaman/CNN_for_SLR
// License: BSD 2-Clause "Simplified" License

`timescale 1ns / 1ps

module WeightsRAM_8(
    input clk,
    input enable,
    input [3:0] addr, //filter number from 0 to 15
    output reg [35:0] weights
    );
    
    reg [8:0] weight [0:63];
    
    always@(posedge enable)
    begin
        weight[0] <= 9'b111111010;
        weight[1] <= 9'b000011010;
        weight[2] <= 9'b111100100;
        weight[3] <= 9'b111110011;
        weight[4] <= 9'b111100100;
        weight[5] <= 9'b111101001;
        weight[6] <= 9'b111010100;
        weight[7] <= 9'b111110000;
        weight[8] <= 9'b111110010;
        weight[9] <= 9'b000110000;
        weight[10] <= 9'b001011000;
        weight[11] <= 9'b111101110;
        weight[12] <= 9'b110110011;
        weight[13] <= 9'b111111101;
        weight[14] <= 9'b000010011;
        weight[15] <= 9'b000001110;
        weight[16] <= 9'b000110110;
        weight[17] <= 9'b111111110;
        weight[18] <= 9'b001000010;
        weight[19] <= 9'b110110100;
        weight[20] <= 9'b101100110;
        weight[21] <= 9'b000110011;
        weight[22] <= 9'b101100101;
        weight[23] <= 9'b001001011;
        weight[24] <= 9'b111011001;
        weight[25] <= 9'b001001001;
        weight[26] <= 9'b001000001;
        weight[27] <= 9'b111101111;
        weight[28] <= 9'b000010101;
        weight[29] <= 9'b000001111;
        weight[30] <= 9'b000110010;
        weight[31] <= 9'b110101010;
        weight[32] <= 9'b111011101;
        weight[33] <= 9'b111110010;
        weight[34] <= 9'b111100100;
        weight[35] <= 9'b110111110;
        weight[36] <= 9'b111110011;
        weight[37] <= 9'b111110011;
        weight[38] <= 9'b110110011;
        weight[39] <= 9'b110010000;
        weight[40] <= 9'b001110110;
        weight[41] <= 9'b000100000;
        weight[42] <= 9'b000100110;
        weight[43] <= 9'b001111010;
        weight[44] <= 9'b000000010;
        weight[45] <= 9'b110110111;
        weight[46] <= 9'b111100001;
        weight[47] <= 9'b110101001;
        weight[48] <= 9'b110110110;
        weight[49] <= 9'b000100000;
        weight[50] <= 9'b000100000;
        weight[51] <= 9'b111100000;
        weight[52] <= 9'b000001111;
        weight[53] <= 9'b111010000;
        weight[54] <= 9'b000110110;
        weight[55] <= 9'b111011101;
        weight[56] <= 9'b000010110;
        weight[57] <= 9'b000011000;
        weight[58] <= 9'b000101101;
        weight[59] <= 9'b110111110;
        weight[60] <= 9'b111111011;
        weight[61] <= 9'b111101111;
        weight[62] <= 9'b110101110;
        weight[63] <= 9'b111011001;

    end
    
    always@(posedge clk)
    begin
        case(addr)
            0:
            begin
                weights <= { weight[0], weight[1], weight[2], weight[3]};
            end
            1:
            begin
                weights <= { weight[4], weight[5], weight[6], weight[7]};
            end
            2:
            begin
                weights <= { weight[8], weight[9], weight[10], weight[11]};
            end
            3:
            begin
                weights <= { weight[12], weight[13], weight[14], weight[15]};
            end
            4:
            begin
                weights <= { weight[16], weight[17], weight[18], weight[19]};
            end
            5:
            begin
                weights <= { weight[20], weight[21], weight[22], weight[23]};
            end
            6:
            begin
                weights <= { weight[24], weight[25], weight[26], weight[27]};
            end
            7:
            begin
                weights <= { weight[28], weight[29], weight[30], weight[31]};
            end
            8:
            begin
                weights <= { weight[32], weight[33], weight[34], weight[35]};
            end
            9:
            begin
                weights <= { weight[36], weight[37], weight[38], weight[39]};
            end
            10:
            begin
                weights <= { weight[40], weight[41], weight[42], weight[43]};
            end
            11:
            begin
                weights <= { weight[44], weight[45], weight[46], weight[47]};
            end
            12:
            begin
                weights <= { weight[48], weight[49], weight[50], weight[51]};
            end
            13:
            begin
                weights <= { weight[52], weight[53], weight[54], weight[55]};
            end
            14:
            begin
                weights <= { weight[56], weight[57], weight[58], weight[59]};
            end
            15:
            begin
                weights <= { weight[60], weight[61], weight[62], weight[63]};
            end
            default:
            begin
                weights <= 36'd0;
            end
        endcase
        
    end
endmodule
