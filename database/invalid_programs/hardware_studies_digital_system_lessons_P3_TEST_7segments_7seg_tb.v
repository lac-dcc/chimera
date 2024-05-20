// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

`timescale 1ms/1ms
`include "./LVL1/LVL2/7-segment/controller.v"

module SevenSegmentsDecoder_4digits_tb;

    reg [3:0] second_unit, second_tens, minute_unit, minute_tens;
    wire [6:0] out_second_unit, out_second_tens, out_minute_unit, out_minute_tens;

    SevenSegmentsDecoder_4digits sevenseg_inst (
        .second_unit(second_unit),
        .second_tens(second_tens),
        .minute_unit(minute_unit),
        .minute_tens(minute_tens),
        .out_second_unit(out_second_unit),
        .out_second_tens(out_second_tens),
        .out_minute_unit(out_minute_unit),
        .out_minute_tens(out_minute_tens)
    );

    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0, SevenSegmentsDecoder_4digits_tb);
        
        //case 0
        second_unit = 4'b1000; //8 7'b0000000 
        second_tens = 4'b0000; //0 7'b0000001 
        minute_unit = 4'b0000; //0 7'b0000001
        minute_tens = 4'b0000; //0 7'b0000001

        //case 1
        #20 second_unit = 4'b0101; //5 7'b0100100
            second_tens = 4'b0011; //3 7'b0000110
            minute_unit = 4'b1001; //9 7'b0000100
            minute_tens = 4'b0001; //1 7'b1001111

        //case 2
        #20 second_unit = 4'b0010; //2 7'b0010010
            second_tens = 4'b0111; //7 7'b0001111
            minute_unit = 4'b0100; //4 7'b1001100
            minute_tens = 4'b0110; //6 7'b1100000

        //case 3
        #20 second_unit = 4'b1110; //invalid 7'b0000000
            second_tens = 4'b1111; //invalid 7'b0000000
            minute_unit = 4'b1011; //invalid 7'b0000000
            minute_tens = 4'b1010; //invalid 7'b0000000

        #20 $finish;
    end
endmodule
