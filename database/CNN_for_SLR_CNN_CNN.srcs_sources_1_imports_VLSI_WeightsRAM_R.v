`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2018 22:48:37
// Design Name: 
// Module Name: WeightsRAM
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

module WeightsRAM_R(
    input clk,
    input enable,
    input [2:0] addr,
    output reg [127:0] weights
    );
    
    reg signed [7:0] weights1 [15:0];
    reg signed [7:0] weights2 [15:0];
    reg signed [7:0] weights3 [15:0];
    reg signed [7:0] weights4 [15:0];
    reg signed [7:0] weights5 [15:0];
    reg signed [7:0] weights6 [15:0];
    reg signed [7:0] weights7 [15:0];
    reg signed [7:0] weights8 [15:0];  
    
/*    initial
    begin
        $readmemb("C1_W1_R.txt",weights1);
        $readmemb("C1_W2_R.txt",weights2);
        $readmemb("C1_W3_R.txt",weights3);
        $readmemb("C1_W4_R.txt",weights4);
        $readmemb("C1_W5_R.txt",weights5);
        $readmemb("C1_W6_R.txt",weights6);
        $readmemb("C1_W7_R.txt",weights7);
        $readmemb("C1_W8_R.txt",weights8);
    end*/
    always@(posedge enable) //Hardcoded weights
    begin
        //weights <= 128'd0;
        weights1[0] <= 8'b00011111;
        weights1[1] <= 8'b00101010;
        weights1[2] <= 8'b00111111;
        weights1[3] <= 8'b01000110;
        weights1[4] <= 8'b00000101;
        weights1[5] <= 8'b00010110;
        weights1[6] <= 8'b00101100;
        weights1[7] <= 8'b00101101;
        weights1[8] <= 8'b10111010;
        weights1[9] <= 8'b11110010;
        weights1[10] <= 8'b11001101;
        weights1[11] <= 8'b11010100;
        weights1[12] <= 8'b11010101;
        weights1[13] <= 8'b11001010;
        weights1[14] <= 8'b11010010;
        weights1[15] <= 8'b11001100;
        
        weights2[0] <= 8'b00001101;
        weights2[1] <= 8'b11010001;
        weights2[2] <= 8'b11101011;
        weights2[3] <= 8'b11100101;
        weights2[4] <= 8'b00111000;
        weights2[5] <= 8'b11111000;
        weights2[6] <= 8'b11101000;
        weights2[7] <= 8'b11101000;
        weights2[8] <= 8'b00110011;
        weights2[9] <= 8'b11101011;
        weights2[10] <= 8'b11111000;
        weights2[11] <= 8'b11011111;
        weights2[12] <= 8'b00110101;
        weights2[13] <= 8'b00101101;
        weights2[14] <= 8'b11111000;
        weights2[15] <= 8'b11011001;
        
        weights3[0] <= 8'b00101010;
        weights3[1] <= 8'b00010110;
        weights3[2] <= 8'b00011010;
        weights3[3] <= 8'b00000110;
        weights3[4] <= 8'b00101011;
        weights3[5] <= 8'b00011010;
        weights3[6] <= 8'b11111011;
        weights3[7] <= 8'b00001001;
        weights3[8] <= 8'b00010001;
        weights3[9] <= 8'b11110110;
        weights3[10] <= 8'b00100001;
        weights3[11] <= 8'b00011101;
        weights3[12] <= 8'b00110100;
        weights3[13] <= 8'b00011100;
        weights3[14] <= 8'b00001101;
        weights3[15] <= 8'b00100111;
        
        weights4[0] <= 8'b11111100;
        weights4[1] <= 8'b00011110;
        weights4[2] <= 8'b11110101;
        weights4[3] <= 8'b11110110;
        weights4[4] <= 8'b11111100;
        weights4[5] <= 8'b00100101;
        weights4[6] <= 8'b00000100;
        weights4[7] <= 8'b11010011;
        weights4[8] <= 8'b00000101;
        weights4[9] <= 8'b11110101;
        weights4[10] <= 8'b11010100;
        weights4[11] <= 8'b11000001;
        weights4[12] <= 8'b00000010;
        weights4[13] <= 8'b11011100;
        weights4[14] <= 8'b10101110;
        weights4[15] <= 8'b10101010;
        
        weights5[0] <= 8'b11110000;
        weights5[1] <= 8'b11111010;
        weights5[2] <= 8'b00001010;
        weights5[3] <= 8'b00001001;
        weights5[4] <= 8'b00001011;
        weights5[5] <= 8'b00100110;
        weights5[6] <= 8'b00001111;
        weights5[7] <= 8'b00100000;
        weights5[8] <= 8'b00101000;
        weights5[9] <= 8'b00110000;
        weights5[10] <= 8'b00111011;
        weights5[11] <= 8'b00001111;
        weights5[12] <= 8'b00010011;
        weights5[13] <= 8'b00101011;
        weights5[14] <= 8'b00100101;
        weights5[15] <= 8'b00101111;
        
        weights6[0] <= 8'b00110100;
        weights6[1] <= 8'b11011001;
        weights6[2] <= 8'b11010001;
        weights6[3] <= 8'b00111000;
        weights6[4] <= 8'b00100001;
        weights6[5] <= 8'b00000011;
        weights6[6] <= 8'b11110101;
        weights6[7] <= 8'b01001010;
        weights6[8] <= 8'b00110110;
        weights6[9] <= 8'b11110011;
        weights6[10] <= 8'b00000101;
        weights6[11] <= 8'b00110111;
        weights6[12] <= 8'b00001010;
        weights6[13] <= 8'b11011000;
        weights6[14] <= 8'b11110111;
        weights6[15] <= 8'b00010110;
        
        weights7[0] <= 8'b10111000;
        weights7[1] <= 8'b11011110;
        weights7[2] <= 8'b00010010;
        weights7[3] <= 8'b01000000;
        weights7[4] <= 8'b11000110;
        weights7[5] <= 8'b11000001;
        weights7[6] <= 8'b00010111;
        weights7[7] <= 8'b00110111;
        weights7[8] <= 8'b11001010;
        weights7[9] <= 8'b11100010;
        weights7[10] <= 8'b01000111;
        weights7[11] <= 8'b00111101;
        weights7[12] <= 8'b11110010;
        weights7[13] <= 8'b00001001;
        weights7[14] <= 8'b00111010;
        weights7[15] <= 8'b01000011;
        
        weights8[0] <= 8'b10000000;
        weights8[1] <= 8'b10011101;
        weights8[2] <= 8'b10011100;
        weights8[3] <= 8'b00111110;
        weights8[4] <= 8'b11010111;
        weights8[5] <= 8'b11101100;
        weights8[6] <= 8'b11111000;
        weights8[7] <= 8'b10010010;
        weights8[8] <= 8'b11000000;
        weights8[9] <= 8'b11101101;
        weights8[10] <= 8'b11111111;
        weights8[11] <= 8'b10101101;
        weights8[12] <= 8'b11011101;
        weights8[13] <= 8'b11100101;
        weights8[14] <= 8'b11010110;
        weights8[15] <= 8'b00010001;
    end
    
    always@ ( posedge clk )
    begin
        case(addr)
            3'd0:
            begin
                weights <= {weights1[0],weights1[1],weights1[2],weights1[3],weights1[4],weights1[5],weights1[6],weights1[7],
                            weights1[8],weights1[9],weights1[10],weights1[11],weights1[12],weights1[13],weights1[14],weights1[15]};
            end
            3'd1:
            begin
                weights <= {weights2[0],weights2[1],weights2[2],weights2[3],weights2[4],weights2[5],weights2[6],weights2[7],
                            weights2[8],weights2[9],weights2[10],weights2[11],weights2[12],weights2[13],weights2[14],weights2[15]};
            end
            3'd2:
            begin
                weights <= {weights3[0],weights3[1],weights3[2],weights3[3],weights3[4],weights3[5],weights3[6],weights3[7],
                            weights3[8],weights3[9],weights3[10],weights3[11],weights3[12],weights3[13],weights3[14],weights3[15]};
            end
            3'd3:
            begin
                weights <= {weights4[0],weights4[1],weights4[2],weights4[3],weights4[4],weights4[5],weights4[6],weights4[7],
                            weights4[8],weights4[9],weights4[10],weights4[11],weights4[12],weights4[13],weights4[14],weights4[15]};
            end
            3'd4:
            begin
                weights <= {weights5[0],weights5[1],weights5[2],weights5[3],weights5[4],weights5[5],weights5[6],weights5[7],
                            weights5[8],weights5[9],weights5[10],weights5[11],weights5[12],weights5[13],weights5[14],weights5[15]};
            end
            3'd5:
            begin
                weights <= {weights6[0],weights6[1],weights6[2],weights6[3],weights6[4],weights6[5],weights6[6],weights6[7],
                            weights6[8],weights6[9],weights6[10],weights6[11],weights6[12],weights6[13],weights6[14],weights6[15]};
            end
            3'd6:
            begin
                weights <= {weights7[0],weights7[1],weights7[2],weights7[3],weights7[4],weights7[5],weights7[6],weights7[7],
                            weights7[8],weights7[9],weights7[10],weights7[11],weights7[12],weights7[13],weights7[14],weights7[15]};
            end
            3'd7:
            begin
                weights <= {weights8[0],weights8[1],weights8[2],weights8[3],weights8[4],weights8[5],weights8[6],weights8[7],
                            weights8[8],weights8[9],weights8[10],weights8[11],weights8[12],weights8[13],weights8[14],weights8[15]};
            end
            default:
            begin
                weights <= 128'd0;
            end
            
         endcase
    end
    
    
endmodule

/*module WeightsRAM(
    input clk,
    input [6:0] addr, //First 3 bit weight block# last 4 bit weight#
    output reg signed [7:0] data
    );
    
    reg signed [7:0] weights1 [15:0];
    reg signed [7:0] weights2 [15:0];
    reg signed [7:0] weights3 [15:0];
    reg signed [7:0] weights4 [15:0];
    reg signed [7:0] weights5 [15:0];
    reg signed [7:0] weights6 [15:0];
    reg signed [7:0] weights7 [15:0];
    reg signed [7:0] weights8 [15:0];  
    
    initial
    begin
        $readmemb("C1_W1_R.txt",weights1);
        $readmemb("C1_W2_R.txt",weights2);
        $readmemb("C1_W3_R.txt",weights3);
        $readmemb("C1_W4_R.txt",weights4);
        $readmemb("C1_W5_R.txt",weights5);
        $readmemb("C1_W6_R.txt",weights6);
        $readmemb("C1_W7_R.txt",weights7);
        $readmemb("C1_W8_R.txt",weights8);
    end
    
    always@(posedge clk)
    begin
        case(addr[6:4])
            3'd0:
            begin
                data <= weights1[addr[3:0]];
            end
            3'd1:
            begin
                data <= weights2[addr[3:0]];
            end
            3'd2:
            begin
                data <= weights3[addr[3:0]];
            end
            3'd3:
            begin
                data <= weights4[addr[3:0]];
            end
            3'd4:
            begin
                data <= weights5[addr[3:0]];
            end
            3'd5:
            begin
                data <= weights6[addr[3:0]];
            end
            3'd6:
            begin
                data <= weights7[addr[3:0]];
            end
            3'd7:
            begin
                data <= weights8[addr[3:0]];
            end
            
         endcase
    end
    
    //assign data = memory[addr];
    
endmodule*/
