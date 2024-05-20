// This program was cloned from: https://github.com/thefranciscoflores/Traffic-Intersection-Simulator
// License: GNU General Public License v2.0

`timescale 1ns / 1ps

module seg7_control(
 input clk,
 input reset,
 input [3:0] digit1, // Rename 'ones' to 'digit1'
 input [3:0] digit2, // Rename 'tens' to 'digit2'
 input [3:0] digit3, // Rename 'hundreds' to 'digit3'
 input [3:0] digit4, // Rename 'thousands' to 'digit4'
 input [3:0] digit5,
 input [3:0] digit6,
 input [3:0] digit7,
 input [3:0] digit8,
 output reg [0:6] seg, // segment pattern 0-9
 output reg [7:0] digit // digit select signals
    );
    
    parameter OFF = 7'b111_1111; //OFF
    parameter ZERO = 7'b000_0001; // 0
    parameter ONE = 7'b100_1111; // 1
    parameter TWO = 7'b001_0010; // 2
    parameter THREE = 7'b000_0110; // 3
    parameter FOUR = 7'b100_1100; // 4
    parameter FIVE = 7'b010_0100; // 5
    parameter SIX = 7'b010_0000; // 6
    parameter SEVEN = 7'b000_1111; //7
    parameter EIGHT = 7'b000_0000; //8
    parameter NINE = 7'b000_0100; // 9
    
    reg [2:0] digit_select;
    reg [23:0] digit_timer;
    
    //Logic for controlic digit select and timer
    always @ (posedge clk or posedge reset) begin
        if(reset) begin
        digit_select <= 0;
        digit_timer <= 0;
        end
      else
         if(digit_timer == 99_999) begin 
            digit_timer <= 0; // 10ns x 100,000 =
            digit_select <= digit_select + 1;
            end
      else
            digit_timer <= digit_timer + 1;
    end
// Logic for driving the 8-bit anode output based on digit select
always @(digit_select) begin
case (digit_select)
3'b000 : digit = 8'b1111_1110; // Turn on digit1
3'b001 : digit = 8'b1111_1101; // Turn on digit2
3'b010 : digit = 8'b1111_1011; // Turn on digit3
3'b011 : digit = 8'b1111_0111; // Turn on digit4
3'b100 : digit = 8'b1110_1111; // Turn on digit5
3'b101 : digit = 8'b1101_1111; // Turn on digit6
3'b110 : digit = 8'b1011_1111; // Turn on digit7
3'b111 : digit = 8'b0111_1111; // Turn on digit8
endcase
end
    
    
// Logic for driving segments based on which digit is selected and the value of each digit
always @*
case (digit_select)
3'b000:begin // ONES DIGIT
case (digit1)
4'b0000: seg = ZERO;
4'b0001: seg = ONE;
4'b0010: seg = TWO;
4'b0011: seg = THREE;
4'b0100: seg = FOUR;
4'b0101: seg = FIVE;
4'b0110: seg = SIX;
4'b0111: seg = SEVEN;
4'b1000: seg = EIGHT;
4'b1001: seg = NINE;
4'hA: seg = 7'b0001000;
4'hB: seg = 7'b1100000;
4'hC: seg = 7'b0110001;
4'hD: seg = 7'b1000010;
4'hE: seg = 7'b0110000;
4'hF: seg = 7'b1111111;
default: seg = OFF;
endcase
end
3'b001:begin // TENS DIGIT
case (digit2)
4'b0000: seg = ZERO;
4'b0001: seg = ONE;
4'b0010: seg = TWO;
4'b0011: seg = THREE;
4'b0100: seg = FOUR;
4'b0101: seg = FIVE;
4'b0110: seg = SIX;
4'b0111: seg = SEVEN;
4'b1000: seg = EIGHT;
4'b1001: seg = NINE;
4'hA: seg = 7'b0001000;
4'hB: seg = 7'b1100000;
4'hC: seg = 7'b0110001;
4'hD: seg = 7'b1000010;
4'hE: seg = 7'b0110000;
4'hF: seg = 7'b1111111;
default: seg = OFF;
endcase
end
3'b010:begin // HUNDREDS DIGIT
case (digit3)
4'b0000: seg = ZERO;
4'b0001: seg = ONE;
4'b0010: seg = TWO;
4'b0011: seg = THREE;
4'b0100: seg = FOUR;
4'b0101: seg = FIVE;
4'b0110: seg = SIX;
4'b0111: seg = SEVEN;
4'b1000: seg = EIGHT;
4'b1001: seg = NINE;
4'hA: seg = 7'b0001000;
4'hB: seg = 7'b1100000;
4'hC: seg = 7'b0110001;
4'hD: seg = 7'b1000010;
4'hE: seg = 7'b0110000;
4'hF: seg = 7'b1111111;
default: seg = OFF;
endcase
end
3'b011:begin // THOUSANDS DIGIT
case (digit4)
4'b0000: seg = ZERO;
4'b0001: seg = ONE;
4'b0010: seg = TWO;
4'b0011: seg = THREE;
4'b0100: seg = FOUR;
4'b0101: seg = FIVE;
4'b0110: seg = SIX;
4'b0111: seg = SEVEN;
4'b1000: seg = EIGHT;
4'b1001: seg = NINE;
4'hA: seg = 7'b0001000;
4'hB: seg = 7'b1100000;
4'hC: seg = 7'b0110001;
4'hD: seg = 7'b1000010;
4'hE: seg = 7'b0110000;
4'hF: seg = 7'b1111111;
default: seg = OFF;
endcase
end
3'b100:begin // DIGIT 5
case (digit5)
4'b0000: seg = ZERO;
4'b0001: seg = ONE;
4'b0010: seg = TWO;
4'b0011: seg = THREE;
4'b0100: seg = FOUR;
4'b0101: seg = FIVE;
4'b0110: seg = SIX;
4'b0111: seg = SEVEN;
4'b1000: seg = EIGHT;
4'b1001: seg = NINE;
4'hA: seg = 7'b0001000;
4'hB: seg = 7'b1100000;
4'hC: seg = 7'b0110001;
4'hD: seg = 7'b1000010;
4'hE: seg = 7'b0110000;
4'hF: seg = 7'b1111111;
default: seg = OFF;
endcase
end
3'b101:begin // DIGIT 6
case (digit6)
4'b0000: seg = ZERO;
4'b0001: seg = ONE;
4'b0010: seg = TWO;
4'b0011: seg = THREE;
4'b0100: seg = FOUR;
4'b0101: seg = FIVE;
4'b0110: seg = SIX;
4'b0111: seg = SEVEN;
4'b1000: seg = EIGHT;
4'b1001: seg = NINE;
4'hA: seg = 7'b0001000;
4'hB: seg = 7'b1100000;
4'hC: seg = 7'b0110001;
4'hD: seg = 7'b1000010;
4'hE: seg = 7'b0110000;
4'hF: seg = 7'b1111111;
default: seg = OFF;
endcase
end
3'b110:begin // DIGIT 7
case (digit7)
4'b0000: seg = ZERO;
4'b0001: seg = ONE;
4'b0010: seg = TWO;
4'b0011: seg = THREE;
4'b0100: seg = FOUR;
4'b0101: seg = FIVE;
4'b0110: seg = SIX;
4'b0111: seg = SEVEN;
4'b1000: seg = EIGHT;
4'b1001: seg = NINE;
4'hA: seg = 7'b0001000;
4'hB: seg = 7'b1100000;
4'hC: seg = 7'b0110001;
4'hD: seg = 7'b1000010;
4'hE: seg = 7'b0110000;
4'hF: seg = 7'b1111111;
default: seg = OFF;
endcase
end
3'b111:begin // DIGIT 8
case (digit8)
4'b0000: seg = ZERO;
4'b0001: seg = ONE;
4'b0010: seg = TWO;
4'b0011: seg = THREE;
4'b0100: seg = FOUR;
4'b0101: seg = FIVE;
4'b0110: seg = SIX;
4'b0111: seg = SEVEN;
4'b1000: seg = EIGHT;
4'b1001: seg = NINE;
4'hA: seg = 7'b0001000;
4'hB: seg = 7'b1100000;
4'hC: seg = 7'b0110001;
4'hD: seg = 7'b1000010;
4'hE: seg = 7'b0110000;
4'hF: seg = 7'b1111111;
default: seg = OFF;
endcase
end
endcase
endmodule
