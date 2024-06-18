// This program was cloned from: https://github.com/cis5710/cis5710-homework
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: DigilentInc
// Engineer: Arthur Brown
// 
// Create Date: 10/08/2016 02:05:52 PM
// Module Name: debouncer
// Project Name: OLED Demo
// Description: Debounces an input signal. When input transitions, only transition output if input is stable for COUNT_MAX clock cycles.
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module debouncer(
    input wire clk,
    input wire A,
    output wire B
);
    parameter COUNT_MAX   = 15, // number of clock cycles the input must be stable for before the output will transition.
			  COUNT_WIDTH = 4;  // ceil(log2(COUNT_MAX)) suggested, number of bits for the delay counter.
			  
    localparam Idle = 2'b00, // state encoded as bit1: output, bit0: count enable.
               Tran = 2'b01,
               Off  = 2'b00,
               On   = 2'b10;
	
    reg [1:0] state = Off|Idle; // initialize state to zero, if input initially one, may cause an unnecessary transition on startup.
	reg [COUNT_WIDTH-1:0] count;
			   
    assign B = state[1];
	
    always@(posedge clk)
        if (state[0] == 1'b0)
            count <= 0; // Only count during a transition state, Idle state should prepare count to begin transition.
        else
            count <= count + 1'b1;
			
    always@(posedge clk)
        case (state)
        Off|Idle:
            if (A == 1'b1)
                state <= Off|Tran; // Begin low to high transition.
        Off|Tran:
            if (A == 0)
                state <= Off|Idle; // Input has failed to stay high, return to Off and Idle.
            else if (count == COUNT_MAX)
                state <= On|Idle; // Timer has completed, turn output on.
        On|Tran:
            if (A == 1)
                state <= On|Idle; // Input has failed to stay off, return to On and Idle.
            else if (count == COUNT_MAX)
                state <= Off|Idle; // Timer has completed, turn output off.
        On|Idle:
            if (A == 0)
                state <= On|Tran; // Begin high to low transition.
        endcase
endmodule
