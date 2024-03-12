`timescale 1ns / 1ps

module NODE_6(
input signed [35:0] A,
input [5:0] step,
input CLK,
input ENABLE,
input RST,
output reg signed [39:0] OUT //16-bit output
    );
    
reg signed [39:0] accumulator = 40'd0; //store the matrix mult here
reg signed [8:0] weights [63:0]; //store the weights here
reg signed [7:0] bias; //store node bias here

 initial begin
  weights[0]<=9'b111110111;
   weights[1]<=9'b110111100;
   weights[2]<=9'b000101000;
   weights[3]<=9'b111000110;
   weights[4]<=9'b000000011;
   weights[5]<=9'b110101011;
   weights[6]<=9'b000000110;
   weights[7]<=9'b000001001;
   weights[8]<=9'b000001110;
   weights[9]<=9'b111011010;
   weights[10]<=9'b111100101;
   weights[11]<=9'b000010010;
   weights[12]<=9'b000100100;
   weights[13]<=9'b111101001;
   weights[14]<=9'b000100001;
   weights[15]<=9'b111110111;
   weights[16]<=9'b111100110;
   weights[17]<=9'b000100101;
   weights[18]<=9'b110111010;
   weights[19]<=9'b000101111;
   weights[20]<=9'b000001010;
   weights[21]<=9'b111111111;
   weights[22]<=9'b111100011;
   weights[23]<=9'b001000000;
   weights[24]<=9'b000110101;
   weights[25]<=9'b101101011;
   weights[26]<=9'b000100001;
   weights[27]<=9'b000010110;
   weights[28]<=9'b111011101;
   weights[29]<=9'b111111111;
   weights[30]<=9'b111001101;
   weights[31]<=9'b101011010;
   weights[32]<=9'b111111010;
   weights[33]<=9'b111101000;
   weights[34]<=9'b000010001;
   weights[35]<=9'b000000111;
   weights[36]<=9'b000001100;
   weights[37]<=9'b111010001;
   weights[38]<=9'b111101110;
   weights[39]<=9'b000001110;
   weights[40]<=9'b000100000;
   weights[41]<=9'b000101001;
   weights[42]<=9'b000000011;
   weights[43]<=9'b000000011;
   weights[44]<=9'b000100000;
   weights[45]<=9'b111010101;
   weights[46]<=9'b111001011;
   weights[47]<=9'b000101010;
   weights[48]<=9'b111010101;
   weights[49]<=9'b111111010;
   weights[50]<=9'b000100010;
   weights[51]<=9'b000001010;
   weights[52]<=9'b000011101;
   weights[53]<=9'b000000011;
   weights[54]<=9'b110101000;
   weights[55]<=9'b111101100;
   weights[56]<=9'b111101000;
   weights[57]<=9'b000001001;
   weights[58]<=9'b000000011;
   weights[59]<=9'b000000101;
   weights[60]<=9'b000100001;
   weights[61]<=9'b111101111;
   weights[62]<=9'b000110101;
   weights[63]<=9'b111100010;
   bias<=8'b11111100;
 end
 
 //MAIN SYNCHRONOUS ACCUMULATION BLOCK
 always @ ( posedge CLK )
 begin
    if( ENABLE == 1 && RST == 0 )
    begin
        if ( step == 0 )
        begin
            accumulator <=  A * weights[step];
        end
        else if( step == 63 )
        begin
            OUT <= accumulator + bias + A * weights[step];
        end else accumulator <=  A * weights[step] + accumulator;
    end
 end

endmodule
