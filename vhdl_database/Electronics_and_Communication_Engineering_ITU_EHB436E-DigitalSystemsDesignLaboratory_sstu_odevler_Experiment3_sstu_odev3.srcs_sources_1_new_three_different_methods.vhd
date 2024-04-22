`timescale 1ns / 1ps
//module with_SSI(
//    input a,
//    input b,
//    input c,
//    input d,
//    output f0,
//    output f1,
//    output f2,
//    output f3);
//    //common components
//    wire x1;
//    wire x2;
//    AND_gate AND_1(b,d,x1);
//    AND_gate AND_2(a,c,x2);
    
//    //f0
//    assign f0 = x1;
    
//    //f1
//    wire w3,w4;
//    AND_gate AND_3(b,c,w3);
//    AND_gate AND_4(a,d,w4);
//    EXOR_gate XOR_1(w3,w4,f1);
    
//    //f2
//    wire w5;
//    NOT_gate NOT_1(x1,w5);
//    AND_gate AND_5(x2,w5,f2);
    
//    //f3
//    AND_gate AND_6(w3,w4,f3);
    
//    //classic style realization   
//endmodule


//module with_decoder(
//    input a,
//    input b,
//    input c,
//    input d,
//    output f0,
//    output f1,
//    output f2,
//    output f3);
    
//    wire [15:0] signal;
//    DECODER decoder1({a,b,c,d},signal);
    
//    //f0
//    wire w1,w2;
//    OR_gate U1(signal[5],signal[7],w1);
//    OR_gate U2(signal[13],signal[15],w2);
//    OR_gate U3(w1,w2,f0);
    
//    //f1
//    wire w3,w4,w5,w6;
//    OR_gate U4(signal[6],signal[7],w3);
//    OR_gate U5(signal[9],signal[11],w4);
//    OR_gate U6(signal[13],signal[14],w5);
//    OR_gate U7(w3,w4,w6);
//    OR_gate U8(w6,w5,f1);
    
//    //f2
//    wire w7;
//    OR_gate U9(signal[10],signal[11],w7);
//    OR_gate U10(signal[14],w7,f2);
    
//    //f3
//    assign f3 = signal[15];  
//endmodule


module with_MUX(
    input a,
    input b,
    input c,
    input d,
    output f0,
    output f1,
    output f2,
    output f3);
//    MUX inputs I0,I1... and select bits S1, S0 are in 
//    reverse order 
    
    // f0
    wire signal0;
    AND_gate AND1(b,d,signal0);
    MUX MUX0({4{signal0}},{a,c},f0);
    
    //f1
    wire signal1;
    EXOR_gate XOR1(b,d,signal1);
    MUX MUX1({signal1,d,b,1'b0},{a,c},f1);
    
    //f2
    wire signal2;
    NAND_gate NAND1(b,d,signal2);
    MUX MUX2({signal2,3'b000},{a,c},f2);
    
    //f3
    wire signal3;
    AND_gate AND3(b,d,signal3);
    MUX MUX3({signal3,3'b000},{a,c},f3);
      
endmodule
