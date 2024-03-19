`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Yigit Suoglu
// 
// Create Date: 07/06/2017 03:21:44 PM
// Design Name: Fixed-Floating-Point-Adder-Multiplier
// Module Name: operatorCore_sim
// Target Devices: Basys 3
// Tool Versions: Vivado 2017.2
// Description: Simulation for all adder subtructor modules in the desing
// 
// Dependencies: adder-mutiplier.v
//////////////////////////////////////////////////////////////////////////////////


module operatorCore_sim();

    reg [15:0] num1, num2;
    wire [15:0] floA, floM, fixA, fixM;
    wire [3:0] overflow;
    wire [7:0] num1_int, num1_flo, num2_int, num2_flo, fixA_int, fixA_flo, fixM_int, fixM_flo;
    wire num1_sign, num2_sign, floM_sign, floA_sign;
    wire [4:0] num1_exp, num2_exp, floM_exp, floA_exp;
    wire [9:0] num1_frac, num2_frac, floM_frac, floA_frac;
    wire precisionLost;
    
    fixed_adder uut0(num1, num2, fixA, overflow[0]);
    fixed_multi uut1(num1, num2, fixM, overflow[1], precisionLost,);
    float_multi uut2(num1, num2, floM, overflow[2]);
    float_adder uut3(num1, num2, floA, overflow[3]);

    assign {num1_int, num1_flo} = num1;
    assign {num2_int, num2_flo} = num2;
    assign {fixA_int, fixA_flo} = fixA;
    assign {fixM_int, fixM_flo} = fixM;
    assign {num1_sign, num1_exp, num1_frac} = num1;
    assign {num2_sign, num2_exp, num2_frac} = num2;
    assign {floM_sign, floM_exp, floM_frac} = floM;
    assign {floA_sign, floA_exp, floA_frac} = floA;
    
    
    initial //test cases here
        begin
            num1 <= 16'd27;
            num2 <= 16'd42;
            #250
            num1 <= 16'd561;
            num2 <= 16'd158;
            #250
            num1 <=  16'b1010101010001110;
            num2 <= 16'b0101011100100110;
            #250
            num1 <= 16'b1111110110111010;
            num2 <= 16'b0100111001001111;
            //#250
            //$finish;
        end
    initial 
        begin  
            $dumpfile("output_waveform.vcd"); 
            $dumpvars(0, num1);
            $dumpvars(1, num2);
            $dumpvars(2, fixA);
            $dumpvars(3, fixM);
            $dumpvars(4, floM);
            $dumpvars(5, floA);
            $dumpvars(6, overflow);
            $dumpvars(7, num1_int);
            $dumpvars(8, num1_flo);
            $dumpvars(9, num2_int);
            $dumpvars(10, num2_flo);
            $dumpvars(11, num1_sign);
            $dumpvars(12, num1_exp);
            $dumpvars(13, num1_frac);
            $dumpvars(14, num2_sign);
            $dumpvars(15, num2_exp);
            $dumpvars(16, num2_frac);
            $dumpvars(17, floA_sign);
            $dumpvars(18, floA_exp);
            $dumpvars(19, floA_frac);
            $dumpvars(20, floM_sign);
            $dumpvars(21, floM_exp);
            $dumpvars(22, floM_frac);
            $dumpvars(23, fixA_int);
            $dumpvars(24, fixA_flo);
            $dumpvars(25, fixM_int);
            $dumpvars(26, fixM_flo);
        end
endmodule
