// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

`include "./LVL1/LVL2/input_control/LVL3/BCD.v"
`timescale 1ms/1ms

module encoderBCD_tb;

    reg [9:0] keypad;
    reg enablen;
    wire [3:0] BCD;
    wire valid_data;

    encoder_BCD bcd_inst (
        .keypad(keypad),
        .enablen(enablen),
        .BCD(BCD),
        .valid_data(valid_data)
    );

    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0, encoderBCD_tb);

        keypad = 10'b0000000000;
        enablen = 1'b0;

        #10
        // case 0: magnetron on 
            enablen = 1'b1;
        #20 keypad = 10'b0000000001;

        #40
        // case 1: magnetron off and input 3
            enablen = 1'b0;
            keypad = 10'b0000001000;

        #40
        // case 2: invalid data 
            keypad = 10'b0000001011;

        #40 $finish;
    end
endmodule
