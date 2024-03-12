`timescale 1ns / 1ps

module CONV1(
    input [7:0] R, G, B,     
    input clk,
    input reset,
    output reg [11:0] addr = 12'd0,
    output reg signed [22:0] conv1_output,
    output done,
    output ws //write strobe
    );
    
    parameter Z1 = 2'd0; //Padding zero for the first two lines
    parameter I = 2'd1; //Zero padding and input
    parameter Z2 = 2'd2; //Padding zero for the last line
    
    reg [2:0] filter = 3'd0; //Filter number
    reg [1:0] state = 0;
    reg start = 0;
    reg [7:0] in_R = 0;
    reg [7:0] in_G = 0;
    reg [7:0] in_B = 0;
    
    //wire [8:0] ws_count;   //write strobe counter
    wire count_done;    //1 if the whole image is done
    wire [6:0] count1, count2;
    wire signed [20:0] result_R, result_G, result_B;    //Changed from 20-bit to 21-bit
    reg signed [21:0] sumRG, regB; //Sum of RGB results, regB is to give a delay to Bs output
    reg signed [22:0] sumRGB; //Changed from 22-bit to 23-bit
    
    wire [7:0] o1_R,o2_R,o3_R,o4_R,o5_R,o6_R,o7_R,o8_R,o9_R,o10_R,o11_R,o12_R,o13_R,o14_R,o15_R,o16_R; 
    wire [7:0] o1_G,o2_G,o3_G,o4_G,o5_G,o6_G,o7_G,o8_G,o9_G,o10_G,o11_G,o12_G,o13_G,o14_G,o15_G,o16_G;
    wire [7:0] o1_B,o2_B,o3_B,o4_B,o5_B,o6_B,o7_B,o8_B,o9_B,o10_B,o11_B,o12_B,o13_B,o14_B,o15_B,o16_B;
        
    Counter counter( .clk(clk), .start(start), .reset(reset), .count1(count1), .count2(count2), .done(count_done));
    Counter_ws write_strobe( .clk(clk), .start(start), .reset(reset), .done(done), .ws(ws) );
    
    ShiftReg shiftreg_R(.x(in_R),.clk(clk), .o1(o1_R), .o2(o2_R), .o3(o3_R), .o4(o4_R), .o5(o5_R), .o6(o6_R), .o7(o7_R), .o8(o8_R),
         .o9(o9_R), .o10(o10_R), .o11(o11_R), .o12(o12_R), .o13(o13_R), .o14(o14_R), .o15(o15_R), .o16(o16_R));
    
    ShiftReg shiftreg_G(.x(in_G),.clk(clk), .o1(o1_G), .o2(o2_G), .o3(o3_G), .o4(o4_G), .o5(o5_G), .o6(o6_G), .o7(o7_G), .o8(o8_G),
         .o9(o9_G), .o10(o10_G), .o11(o11_G), .o12(o12_G), .o13(o13_G), .o14(o14_G), .o15(o15_G), .o16(o16_G));
    
    ShiftReg shiftreg_B(.x(in_B),.clk(clk), .o1(o1_B), .o2(o2_B), .o3(o3_B), .o4(o4_B), .o5(o5_B), .o6(o6_B), .o7(o7_B), .o8(o8_B),
          .o9(o9_B), .o10(o10_B), .o11(o11_B), .o12(o12_B), .o13(o13_B), .o14(o14_B), .o15(o15_B), .o16(o16_B));


    AdderTree_R addertree_R( .clk(clk), .enable(start), /*.count_done(count_done),*/ .w1(o1_R), .w2(o2_R), .w3(o3_R), .w4(o4_R),
        .w5(o5_R), .w6(o6_R), .w7(o7_R), .w8(o8_R), .w9(o9_R), .w10(o10_R), .w11(o11_R), .w12(o12_R), .w13(o13_R), 
        .w14(o14_R), .w15(o15_R), .w16(o16_R), .result(result_R), .filter(filter) );
        
    AdderTree_G addertree_G( .clk(clk), .enable(start), .w1(o1_G), .w2(o2_G), .w3(o3_G), .w4(o4_G),
        .w5(o5_G), .w6(o6_G), .w7(o7_G), .w8(o8_G), .w9(o9_G), .w10(o10_G), .w11(o11_G), .w12(o12_G), .w13(o13_G), 
        .w14(o14_G), .w15(o15_G), .w16(o16_G), .result(result_G), .filter(filter) );
        
    AdderTree_B addertree_B( .clk(clk), .enable(start), .w1(o1_B), .w2(o2_B), .w3(o3_B), .w4(o4_B),
        .w5(o5_B), .w6(o6_B), .w7(o7_B), .w8(o8_B), .w9(o9_B), .w10(o10_B), .w11(o11_B), .w12(o12_B), .w13(o13_B), 
        .w14(o14_B), .w15(o15_B), .w16(o16_B), .result(result_B), .filter(filter) );
    
    
    
    
    
    //==================================================\\
    //                Zero Padding States               \\
    //==================================================\\
    always@( posedge clk )
    begin
        if ( reset )
        begin
            state <= Z1;
            addr <= 12'd0;
        end
        else
        begin
            case( state )
                Z1:
                begin
                    start <= 1;
                    if ( (count1 == 65) && (count2 == 1) )
                    begin
                        addr <= addr + 1;
                    end
                    else if ( (count1 == 66) && (count2 == 1) )
                    begin
                        state <= I;
                        addr <= addr + 1;
                    end
                    else
                    begin
                        in_R <= 0;
                        in_G <= 0;
                        in_B <= 0;
                    end
                end
                I:
                begin
                    if ( (count1 == 65) && (count2 == 65) )
                    begin
                        state <= Z2;
                    end
                    else if ( count1 > 64 )
                    begin
                        addr <= addr + 1;
                        in_R <= 0;
                        in_G <= 0;
                        in_B <= 0;
                    end
                    else if ( count1 > 63 )
                    begin
                        in_R <= 0;
                        in_G <= 0;
                        in_B <= 0;
                    end
                    else if ( count1 > 61 )
                    begin
                        addr <= addr;
                        in_R <= R;
                        in_G <= G;
                        in_B <= B;
                    end
                    else
                    begin
                        in_R <= R;
                        in_G <= G;
                        in_B <= B;
                        addr <= addr + 1;
                    end
                end
                Z2:
                begin
                    if ( (count1 == 66) && (count2 == 66) )
                    begin
                        state <= Z1;
                        if ( filter == 3'd7 ) //convolute the image 8 times
                        begin
                            filter <= 3'd0;
                            addr <= 12'd0;//Should switch to the new image
                        end
                        else
                        begin
                            filter <= filter + 1; 
                            addr <= 12'd0;
                        end
                    end
                    else
                    begin
                        in_R <= 0;
                        in_G <= 0;
                        in_B <= 0;
                    end
                end
            endcase
            
            sumRG <= result_R + result_G;
            regB <= result_B;
            sumRGB <= sumRG + regB;
            conv1_output <= sumRGB;
        end
    end
    
endmodule