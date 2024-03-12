`timescale 1ns / 1ps

module CONV2(
    input [21:0] G1, G2, G3, G4, G5, G6, G7, G8,    
    input clk,
    input enable,
    input reset,
    output reg conv2_done = 1'b0,
    output reg [5:0] addr = 7'd0,
    output signed [35:0] y, // must be converted to 34 bits after adding two duplicates of the conv
    output reg write_strobe = 1'b0,
    output reg done = 1'b0
    );
    
    reg state = 1'b0; //Zero padding state if 0, image input state if 1
    //shifter  
    wire signed [22:0] G1_1, G1_2, G1_3, G1_4; 
    wire signed [22:0] G2_1, G2_2, G2_3, G2_4;
    wire signed [22:0] G3_1, G3_2, G3_3, G3_4;
    wire signed [22:0] G4_1, G4_2, G4_3, G4_4; 
    wire signed [22:0] G5_1, G5_2, G5_3, G5_4;
    wire signed [22:0] G6_1, G6_2, G6_3, G6_4;
    wire signed [22:0] G7_1, G7_2, G7_3, G7_4; 
    wire signed [22:0] G8_1, G8_2, G8_3, G8_4;
    
    reg [21:0] in_1 = 0;
    reg [21:0] in_2 = 0;
    reg [21:0] in_3 = 0;
    reg [21:0] in_4 = 0;
    reg [21:0] in_5 = 0;
    reg [21:0] in_6 = 0;
    reg [21:0] in_7 = 0;
    reg [21:0] in_8 = 0;
    
    //adder    
    //reg signed [32:0] a1, a2, a3, a4, a5, a6, a7, a8;
    reg signed [30:0] a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16;
    reg signed [30:0] a17, a18, a19, a20, a21, a22, a23, a24, a25, a26, a27, a28, a29, a30, a31, a32;
    reg signed [31:0] s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16;
    reg signed [32:0] ss1, ss2, ss3, ss4, ss5, ss6, ss7, ss8;
    reg signed [33:0] sss1, sss2, sss3, sss4;
    reg signed [34:0] ssss1, ssss2;
    reg signed [35:0] result;
    
    wire signed [35:0] w_1,w_2,w_3,w_4,w_5,w_6,w_7,w_8;
    /*reg signed [35:0] w_1_reg,w_2_reg,w_3_reg,w_4_reg,w_5_reg,w_6_reg,w_7_reg,w_8_reg;
    
    always @ (posedge clk)
    begin w_1_reg <= w_1; w_2_reg <= w_2; w_3_reg <= w_3; w_4_reg <= w_4; w_5_reg <= w_5; w_6_reg <= w_6; w_7_reg <= w_7; w_8_reg <= w_8; end*/
    //counter
    wire count_done;    //1 if the whole image is done
    wire [3:0] count1, count2;
    reg start = 0;
    reg [3:0] filter = 4'h0; 
    reg [3:0] filter_reg = 4'h0; //to delay the filter selection for 1 cycle
    //write_strobe
    reg [4:0] ws_count = 1'b0;
    reg [2:0] ws_count2 = 3'd0;
    
    ShiftReg2 shiftreg_1(.x(in_1),.clk(clk), .o1(G1_1), .o2(G1_2), .o3(G1_3), .o4(G1_4));
    ShiftReg2 shiftreg_2(.x(in_2),.clk(clk), .o1(G2_1), .o2(G2_2), .o3(G2_3), .o4(G2_4));
    ShiftReg2 shiftreg_3(.x(in_3),.clk(clk), .o1(G3_1), .o2(G3_2), .o3(G3_3), .o4(G3_4));
    ShiftReg2 shiftreg_4(.x(in_4),.clk(clk), .o1(G4_1), .o2(G4_2), .o3(G4_3), .o4(G4_4));
    ShiftReg2 shiftreg_5(.x(in_5),.clk(clk), .o1(G5_1), .o2(G5_2), .o3(G5_3), .o4(G5_4));      
    ShiftReg2 shiftreg_6(.x(in_6),.clk(clk), .o1(G6_1), .o2(G6_2), .o3(G6_3), .o4(G6_4));
    ShiftReg2 shiftreg_7(.x(in_7),.clk(clk), .o1(G7_1), .o2(G7_2), .o3(G7_3), .o4(G7_4));
    ShiftReg2 shiftreg_8(.x(in_8),.clk(clk), .o1(G8_1), .o2(G8_2), .o3(G8_3), .o4(G8_4));
    
    //AdderTree adderTree1(.a1(a1),.a2(a2),.a3(a3),.a4(a4), .a5(a5), .a6(a6),.a7(a7), .a8(a8), .clk(clk), .result(y));
    
    Counter2 counter( .clk(clk), .start(start), .reset(reset), .count1(count1), .count2(count2), .done(count_done));
    
    WeightsRAM_1 weightRAM1( .clk(clk), .addr(filter_reg), .weights(w_1), .enable(start));
    WeightsRAM_2 weightRAM2( .clk(clk), .addr(filter_reg), .weights(w_2), .enable(start));
    WeightsRAM_3 weightRAM3( .clk(clk), .addr(filter_reg), .weights(w_3), .enable(start));
    WeightsRAM_4 weightRAM4( .clk(clk), .addr(filter_reg), .weights(w_4), .enable(start));
    WeightsRAM_5 weightRAM5( .clk(clk), .addr(filter_reg), .weights(w_5), .enable(start));
    WeightsRAM_6 weightRAM6( .clk(clk), .addr(filter_reg), .weights(w_6), .enable(start));
    WeightsRAM_7 weightRAM7( .clk(clk), .addr(filter_reg), .weights(w_7), .enable(start));
    WeightsRAM_8 weightRAM8( .clk(clk), .addr(filter_reg), .weights(w_8), .enable(start));
    
    assign y = result;
    always @ ( posedge clk ) filter_reg <= filter;
    always @( posedge clk )
    begin
    if (reset)
    begin
        ws_count <= 0;
        ws_count2 <= 0;
        write_strobe <= 0;
        done <= 0;
    end
    else if (enable)
        begin
            if( ws_count2 == 7 && ws_count == 26 ) begin ws_count <= 9; ws_count2 <= 0; write_strobe <= 0;  done <= 1;end
            else if( ws_count < 18 ) begin ws_count <= ws_count + 1; write_strobe <= 0; done <= 0;end
            else if ( ws_count < 26 ) begin ws_count <= ws_count + 1; write_strobe <= 1; done <= 1;end
            else if( ws_count == 26 ) begin ws_count <= 18; ws_count2 <= ws_count2 + 1; write_strobe <= 0; done <= 1;end
        end
    end
    
    wire signed [8:0] W1_1, W1_2, W1_3, W1_4, W2_1, W2_2, W2_3, W2_4, W3_1, W3_2, W3_3, W3_4, W4_1, W4_2, W4_3, W4_4,
                      W5_1, W5_2, W5_3, W5_4, W6_1, W6_2, W6_3, W6_4, W7_1, W7_2, W7_3, W7_4, W8_1, W8_2, W8_3, W8_4;
                      
    assign W1_1 = w_1[35:27];
    assign W1_2 = w_1[26:18];
    assign W1_3 = w_1[17:9];
    assign W1_4 = w_1[8:0];
    assign W2_1 = w_2[35:27]; 
    assign W2_2 = w_2[26:18]; 
    assign W2_3 = w_2[17:9];  
    assign W2_4 = w_2[8:0];   
    assign W3_1 = w_3[35:27]; 
    assign W3_2 = w_3[26:18]; 
    assign W3_3 = w_3[17:9];  
    assign W3_4 = w_3[8:0];   
    assign W4_1 = w_4[35:27]; 
    assign W4_2 = w_4[26:18]; 
    assign W4_3 = w_4[17:9];  
    assign W4_4 = w_4[8:0];   
    assign W5_1 = w_5[35:27]; 
    assign W5_2 = w_5[26:18]; 
    assign W5_3 = w_5[17:9];  
    assign W5_4 = w_5[8:0];   
    assign W6_1 = w_6[35:27]; 
    assign W6_2 = w_6[26:18]; 
    assign W6_3 = w_6[17:9];  
    assign W6_4 = w_6[8:0];   
    assign W7_1 = w_7[35:27]; 
    assign W7_2 = w_7[26:18]; 
    assign W7_3 = w_7[17:9];  
    assign W7_4 = w_7[8:0];   
    assign W8_1 = w_8[35:27]; 
    assign W8_2 = w_8[26:18]; 
    assign W8_3 = w_8[17:9];  
    assign W8_4 = w_8[8:0];   
            
    always @(posedge clk)
    begin
        a1  <= G1_1 * W1_1;
        a2  <= G1_2 * W1_2;
        a3  <= G1_3 * W1_3;
        a4  <= G1_4 * W1_4;
        a5  <= G2_1 * W2_1;
        a6  <= G2_2 * W2_2;
        a7  <= G2_3 * W2_3;
        a8  <= G2_4 * W2_4;
        a9  <= G3_1 * W3_1;
        a10 <= G3_2 * W3_2;
        a11 <= G3_3 * W3_3;
        a12 <= G3_4 * W3_4;
        a13 <= G4_1 * W4_1;
        a14 <= G4_2 * W4_2;
        a15 <= G4_3 * W4_3;
        a16 <= G4_4 * W4_4;
        a17 <= G5_1 * W5_1;
        a18 <= G5_2 * W5_2;
        a19 <= G5_3 * W5_3;
        a20 <= G5_4 * W5_4;
        a21 <= G6_1 * W6_1;
        a22 <= G6_2 * W6_2;
        a23 <= G6_3 * W6_3;
        a24 <= G6_4 * W6_4;
        a25 <= G7_1 * W7_1;
        a26 <= G7_2 * W7_2;
        a27 <= G7_3 * W7_3;
        a28 <= G7_4 * W7_4;
        a29 <= G8_1 * W8_1;
        a30 <= G8_2 * W8_2;
        a31 <= G8_3 * W8_3;
        a32 <= G8_4 * W8_4;
        
        s1 <= a1 + a2;
        s2 <= a3 + a4;
        s3 <= a5 + a6;
        s4 <= a7 + a8;
        s5 <= a9 + a10;
        s6 <= a11 + a12;
        s7 <= a13 + a14;
        s8 <= a15 + a16;
        s9 <= a17 + a18;
        s10 <= a19 + a20;
        s11 <= a21 + a22;
        s12 <= a23 + a24;
        s13 <= a25 + a26;
        s14 <= a27 + a28;
        s15 <= a29 + a30;
        s16 <= a31 + a32;
        
        ss1 <= s1 + s2;
        ss2 <= s3 + s4;
        ss3 <= s5 + s6;
        ss4 <= s7 + s8;
        ss5 <= s9 + s10;
        ss6 <= s11 + s12;
        ss7 <= s13 + s14;
        ss8 <= s15 + s16;
        
        sss1 <= ss1 + ss2;
        sss2 <= ss3 + ss4;
        sss3 <= ss5 + ss6;
        sss4 <= ss7 + ss8;
        
        ssss1 <= sss1 + sss2;
        ssss2 <= sss3 + sss4;
        
        result <= ssss1 + ssss2;
        
        if ( reset )
        begin
            state <= 0;
            addr <= 6'd0;
            conv2_done <= 0;
        end
        else
        begin
            if (enable)
            begin
            case( state )
                0: //Zero Padding State
                begin
                    start <= 1; //Start the counter
                    if ( (count1 == 7) && (count2 == 0) )
                    begin
                        addr <= addr + 1;
                        state <= 1;
                    end
                    else if ( ((count1 == 8) || (count1 == 6)) && (count2 == 0) )
                    begin
                        //state <= 1;
                        addr <= addr + 1;
                    end
                    else
                    begin
                        in_1 <= 0;
                        in_2 <= 0;
                        in_3 <= 0;
                        in_4 <= 0;
                        in_5 <= 0;
                        in_6 <= 0;
                        in_7 <= 0;
                        in_8 <= 0;
                    end
                end
                1: //Input State
                begin
                    if ( (count1 == 8) && (count2 == 8) )
                    begin
                        state <= 0;
                        if ( filter == 4'd15 ) //convolute the image 16 times
                        begin
                            filter = 4'd0;
                            addr <= 6'd0; //Should switch to the new image
                            conv2_done <= 1'b1;
                        end
                        else
                        begin
                            filter <= filter + 1;
                            conv2_done <= 1'b0; 
                            addr <= 6'd0;
                        end
                    end
                    else if ( count1 == 5 ) //Added due to the 2 cycle delay of the BM
                    begin
                    addr <= addr;
                    in_1 <= G1;
                    in_2 <= G2;
                    in_3 <= G3;
                    in_4 <= G4;
                    in_5 <= G5;
                    in_6 <= G6;
                    in_7 <= G7;
                    in_8 <= G8;
                    end
                    else if ( count1 == 7 )
                    begin
                        addr <= addr + 1;
                        in_1 <= 0;
                        in_2 <= 0;
                        in_3 <= 0;
                        in_4 <= 0;
                        in_5 <= 0;
                        in_6 <= 0;
                        in_7 <= 0;
                        in_8 <= 0;
                    end
                    else
                    begin
                        in_1 <= G1;
                        in_2 <= G2;
                        in_3 <= G3;
                        in_4 <= G4;
                        in_5 <= G5;
                        in_6 <= G6;
                        in_7 <= G7;
                        in_8 <= G8;
                        addr <= addr + 1;
                    end
                end
            endcase
            end
        end
    end       
    endmodule