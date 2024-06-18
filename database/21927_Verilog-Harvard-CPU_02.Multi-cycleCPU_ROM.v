// This program was cloned from: https://github.com/jaywonchung/Verilog-Harvard-CPU
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
// Organization: SNUECE
// Student: Jaewon Chung
// 
// Module Name: ROM
// Project Name: Computer organization Project 5
//////////////////////////////////////////////////////////////////////////////////

`define NUM_CTRL 16
`define NUM_RT 14

module ROM(
    input [3:0] one,
    input [3:0] two,
    output [`NUM_CTRL-1:0] CTRL
    );
    
    /*
    Input:
    There are at maximum two register transfers in a single state (cycle). 'one' and 'two' represent each of their RT codes.
    For states with only one RT, 'one' is 13.
    
    Output:
    CTRL = elementwise-OR( control_signal of 'one', control_signal of 'two' )
    
    Output CTRL signal bits correspond to:
    PCWriteCond, PCWrite, IorD, ReadM, WriteM, RegSrc[2], IRWrite, RegWrite, RegDst[2], PCSrc[2], ALUSrcA, ALUSrcB[2]
    */
    
    parameter [`NUM_CTRL*(`NUM_RT+1)-1:0] memory = { 
                                                    `NUM_CTRL'b0_0_0_0_0_00_0_0_00_00_0_00,     // 14: All zero. Does nothing when performed OR with something else.
                                                    `NUM_CTRL'b0_0_0_0_0_01_0_1_00_00_0_00,     // 13
                                                    `NUM_CTRL'b0_0_1_0_1_00_0_0_00_00_0_00,     // 12
                                                    `NUM_CTRL'b0_0_1_1_0_00_0_0_00_00_0_00,     // 11
                                                    `NUM_CTRL'b0_0_0_0_0_00_0_1_01_00_0_00,     // 10
                                                    `NUM_CTRL'b0_0_0_0_0_00_0_1_00_00_0_00,     //  9
                                                    `NUM_CTRL'b1_0_0_0_0_00_0_0_00_01_1_00,     //  8
                                                    `NUM_CTRL'b0_0_0_0_0_00_0_0_00_00_1_00,     //  7
                                                    `NUM_CTRL'b0_0_0_0_0_00_0_0_00_00_1_10,     //  6
                                                    `NUM_CTRL'b0_1_0_0_0_00_0_0_00_11_0_00,     //  5
                                                    `NUM_CTRL'b0_0_0_0_0_10_0_1_10_00_0_00,     //  4
                                                    `NUM_CTRL'b0_1_0_0_0_00_0_0_00_10_0_00,     //  3
                                                    `NUM_CTRL'b0_0_0_0_0_00_0_0_00_00_0_10,     //  2
                                                    `NUM_CTRL'b0_1_0_0_0_00_0_0_00_00_0_01,     //  1
                                                    `NUM_CTRL'b0_0_0_1_0_00_1_0_00_00_0_00      //  0
                                              };
    
    assign CTRL = memory[`NUM_CTRL*one+:`NUM_CTRL] | memory[`NUM_CTRL*two+:`NUM_CTRL];
    
endmodule
