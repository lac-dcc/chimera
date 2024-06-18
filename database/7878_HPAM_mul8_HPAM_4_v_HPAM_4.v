// This program was cloned from: https://github.com/clowdur/HPAM_mul8
// License: MIT License

// Oliver Huang & Jared Yoder: We use wallace tree design as our
// reference benchmark. We modify the Wallace Tree multiplier
// over several iterations into an HPAM approximate multiplier

////////////////////////////////////////////////////////////////////////
//
// Referenced "wallaceTreeMultiplier8Bit.v" by Akilesh Kannan <akileshkannan@gmail.com>
// Modified to have HPAM_4 approximation & optimization
//
// License: MIT
//
////////////////////////////////////////////////////////////////////////

//`default_nettype None

`timescale 1ns/1ps

module HPAM_4 (output[15:0] result, input[7:0] a, input[7:0] b);

    reg[7:0] wallaceTree[7:0];
    integer i, j;

    always @(a, b) begin
        for(i = 0;i < 8;i = i+1)
            for(j = 0;j < 8;j = j+1)
                wallaceTree[i][j] = a[i] & b[j];
    end

    //////////////////////////////////////////////////
    // TRUNCATION START (approximation used by HPAM)
    assign result[0] = 0;

    // result[1]
    assign result[1] = 0;

    // result[2]
    assign result[2] = 0;

    // result[3]
    assign result[3] = 0;
    // TRUNCATION STOP
    //////////////////////////

    
    // REGULAR START & SRCA

    // result[4]
    wire result4_c;
    wire result4_c_temp_f1, result4_c_temp_h1, result4_temp_f1, result4_temp_h1; // layer 1
    // L1
    FA result4_FA_1(result4_c_temp_f1, result4_temp_f1, wallaceTree[0][4], wallaceTree[1][3], wallaceTree[2][2]);
    HA result4_HA_1(result4_c_temp_h1, result4_temp_h1, wallaceTree[3][1], wallaceTree[4][0]);
    // LF RCA Start Node
    //HA result4_HA_F (result4_c, result[4], result4_temp_f1, result4_temp_h1); // LF RCA Start Node
    
    // result[5]
    wire result5_c;
    wire result5_c_temp_f1, result5_c_temp_f2, result5_temp_f1, result5_temp_f2; // layer 1
    wire result5_c_temp_f3, result5_temp_f3; // layer 2
    // L1
    FA result5_FA_1(result5_c_temp_f1, result5_temp_f1, wallaceTree[0][5], wallaceTree[1][4], wallaceTree[2][3]);
    FA result5_FA_2(result5_c_temp_f2, result5_temp_f2, wallaceTree[3][2], wallaceTree[4][1], wallaceTree[5][0]);
    // L2
    FA result5_FA_3(result5_c_temp_f3, result5_temp_f3, result5_temp_f1, result5_temp_f2, result4_c_temp_f1);
    // LF RCA Node
    //FA result5_FA_F(result5_c, result[5], result5_temp_f3, result4_c_temp_h1, result4_c);
    
    // result[6]
    wire result6_c;
    wire result6_c_temp_f1, result6_c_temp_f2, result6_temp_f1, result6_temp_f2; // layer 1
    wire result6_c_temp_f3, result6_temp_f3; // layer 2
    wire result6_c_temp_f4, result6_temp_f4; // layer 3
    // L1
    FA result6_FA_1(result6_c_temp_f1, result6_temp_f1, wallaceTree[0][6], wallaceTree[1][5], wallaceTree[2][4]);
    FA result6_FA_2(result6_c_temp_f2, result6_temp_f2, wallaceTree[3][3], wallaceTree[4][2], wallaceTree[5][1]);
    // L2
    FA result6_FA_3(result6_c_temp_f3, result6_temp_f3, result6_temp_f1, result6_temp_f2, wallaceTree[6][0]);
    // L3
    FA result6_FA_4(result6_c_temp_f4, result6_temp_f4, result6_temp_f3, result5_c_temp_f1, result5_c_temp_f2);
    // LF RCA Node
    // FA result6_FA_F(result6_c, result[6], result6_temp_f4, result5_c_temp_f3, result5_c);


    // result[7]
    wire result7_c;
    wire result7_c_temp_f1, result7_c_temp_f2, result7_c_temp_h1, result7_temp_f1, result7_temp_f2, result7_temp_h1; // layer 1
    wire result7_c_temp_f3, result7_temp_f3; // layer 2
    wire result7_c_temp_f4, result7_temp_f4; // layer 3
    wire result7_c_temp_h4, result7_temp_h4; // layer 4
    // L1
    FA result7_FA_1(result7_c_temp_f1, result7_temp_f1, wallaceTree[0][7], wallaceTree[1][6], wallaceTree[2][5]);
    FA result7_FA_2(result7_c_temp_f2, result7_temp_f2, wallaceTree[3][4], wallaceTree[4][3], wallaceTree[5][2]);
    HA result7_HA_1(result7_c_temp_h1, result7_temp_h1, wallaceTree[6][1], wallaceTree[7][0]); // OLIVER BUG FIXED: DECLARED as FA instead of HA: i love verdi
    // L2
    FA result7_FA_3(result7_c_temp_f3, result7_temp_f3, result7_temp_f1, result7_temp_f2, result7_temp_h1); 
    // L3
    FA result7_FA_4(result7_c_temp_f4, result7_temp_f4, result7_temp_f3, result6_c_temp_f1, result6_c_temp_f2); 
    // L4
    HA result7_HA_4(result7_c_temp_h4, result7_temp_h4, result7_temp_f4, result6_c_temp_f3); // OLIVER BUG FIXED: DECLARED as FA instead of HA: i love verdi
    // LF RCA Node
    // FA result7_FA_F(result7_c, result[7], result7_temp_h4, result6_c_temp_f4, result6_c);
    
    // REGULAR STOP
    ///////////////////////////////////
    
    ///////////////////////////////////
    // INVERSION START

    // result[8]
    wire result8_c;
    wire result8_c_temp_f1, result8_c_temp_f2, result8_temp_f1, result8_temp_f2; // layer 1
    wire result8_c_temp_f3, result8_c_temp_h2, result8_temp_f3, result8_temp_h2; // layer 2
    wire result8_c_temp_f4, result8_temp_f4; // layer 3
    wire result8_c_temp_f5, result8_temp_f5; // layer 4
    // L1
    FA result8_FA_1(result8_c_temp_f1, result8_temp_f1, wallaceTree[2][6], wallaceTree[3][5], wallaceTree[4][4]);
    FA result8_FA_2(result8_c_temp_f2, result8_temp_f2, wallaceTree[5][3], wallaceTree[6][2], wallaceTree[7][1]);
    // L2
    HA result8_HA_2(result8_c_temp_h2, result8_temp_h2, result8_temp_f1, result8_temp_f2);
    FA result8_FA_3(result8_c_temp_f3, result8_temp_f3, result7_c_temp_f1, result7_c_temp_f2, result7_c_temp_h1);
    // L3
    FA result8_FA_4(result8_c_temp_f4, result8_temp_f4, result8_temp_h2, result8_temp_f3, result7_c_temp_f3);
    // L4
    FA result8_FA_5(result8_c_temp_f5, result8_temp_f5, wallaceTree[1][7], result8_temp_f4, result7_c_temp_f4);
    // LF RCA Node
    // FA result8_FA_F(result8_c, result[8], result8_temp_f5, result7_c_temp_h4, result7_c);
    

    // result[9]
    wire result9_c;
    wire result9_c_temp_f1, result9_c_temp_f2, result9_temp_f1, result9_temp_f2; // layer 1
    wire result9_c_temp_f3, result9_temp_f3; // layer 2
    wire result9_c_temp_f4, result9_temp_f4; // layer 3
    wire result9_c_temp_f5, result9_temp_f5; // layer 4
    // L1
    FA result9_FA_1(result9_c_temp_f1, result9_temp_f1, wallaceTree[2][7], wallaceTree[3][6], wallaceTree[4][5]);
    FA result9_FA_2(result9_c_temp_f2, result9_temp_f2, wallaceTree[5][4], wallaceTree[6][3], wallaceTree[7][2]);
    // L2
    FA result9_FA_3(result9_c_temp_f3, result9_temp_f3, result9_temp_f1, result9_temp_f2, result8_c_temp_f1);
    // L3
    FA result9_FA_4(result9_c_temp_f4, result9_temp_f4, result9_temp_f3, result8_c_temp_f2, result8_c_temp_h2);
    // L4
    FA result9_FA_5(result9_c_temp_f5, result9_temp_f5, result9_temp_f4, result8_c_temp_f3, result8_c_temp_f4);
    // LF RCA Node
    // FA result9_FA_F(result9_c, result[9], result9_temp_f5, result8_c_temp_f5, result8_c);
    
    // result[10]
    wire result10_c;
    wire result10_c_temp_f1, result10_c_temp_h1, result10_temp_f1, result10_temp_h1; // layer 1
    wire result10_c_temp_f2, result10_temp_f2; // layer 2
    wire result10_c_temp_f3, result10_temp_f3; // layer 3
    wire result10_c_temp_h4, result10_temp_h4; // layer 4
    // L1
    HA result10_HA_1(result10_c_temp_h1, result10_temp_h1, wallaceTree[3][7], wallaceTree[4][6]);
    FA result10_FA_1(result10_c_temp_f1, result10_temp_f1, wallaceTree[5][5], wallaceTree[6][4], wallaceTree[7][3]);
    // L2
    FA result10_FA_2(result10_c_temp_f2, result10_temp_f2, result10_temp_h1, result10_temp_f1, result9_c_temp_f1); 
    // L3
    FA result10_FA_3(result10_c_temp_f3, result10_temp_f3, result10_temp_f2, result9_c_temp_f2, result9_c_temp_f3);
    // L4
    HA result10_HA_4(result10_c_temp_h4, result10_temp_h4, result10_temp_f3, result9_c_temp_f4);
    // LF RCA Node
    // FA result10_FA_F(result10_c, result[10], result10_temp_h4, result9_c_temp_f5, result9_c);
    
    // result[11]
    wire result11_c;
    wire result11_c_temp_f1, result11_temp_f1; // layer 1
    wire result11_c_temp_f2, result11_temp_f2; // layer 2
    wire result11_c_temp_f3, result11_temp_f3; // layer 3
    wire result11_c_temp_h4, result11_temp_h4; // layer 4
    // L1
    FA result11_FA_1(result11_c_temp_f1, result11_temp_f1, wallaceTree[5][6], wallaceTree[6][5], wallaceTree[7][4]);
    // L2
    FA result11_FA_2(result11_c_temp_f2, result11_temp_f2, result11_temp_f1, result10_c_temp_h1, result10_c_temp_f1); 
    // L3
    FA result11_FA_3(result11_c_temp_f3, result11_temp_f3, wallaceTree[4][7], result11_temp_f2, result10_c_temp_f2);
    // L4
    HA result11_HA_4(result11_c_temp_h4, result11_temp_h4, result11_temp_f3, result10_c_temp_f3);
    // LF RCA Node
    // FA result11_FA_F(result11_c, result[11], result11_temp_h4, result10_c_temp_h4, result10_c);
    
    // SCRA ACCUMULATION
    wire SRCA_Cout;
    SRCA84 accumulate (.A({result11_temp_h4, result10_temp_h4, result9_temp_f5, result8_temp_f5, result7_temp_h4, result6_temp_f3, result5_temp_f1, result4_temp_f1}), 
                       .B({result10_c_temp_h4, result9_c_temp_f5, result8_c_temp_f5, result7_c_temp_h4, result6_c_temp_f4, result5_c_temp_f3, result5_temp_f2, result4_temp_h1}), 
                       .Cin(1'b0), .Sum(result[11:4]), .Cout(SRCA_Cout));
    ///////////////////////////////////
    // END SRCA; START RCA

    // result[12]
    wire result12_c;
    wire result12_c_temp_f1, result12_temp_f1; // layer 1
    wire result12_c_temp_h2, result12_temp_h2; // layer 2
    wire result12_c_temp_h3, result12_temp_h3; // layer 3
    wire result12_c_temp_h4, result12_temp_h4; // layer 4
    // L1
    FA result12_FA_1(result12_c_temp_f1, result12_temp_f1, wallaceTree[5][7], wallaceTree[6][6], wallaceTree[7][5]);
    // L2
    HA result12_HA_2(result12_c_temp_h2, result12_temp_h2, result12_temp_f1, result11_c_temp_f1); 
    // L3
    HA result12_HA_3(result12_c_temp_h3, result12_temp_h3, result12_temp_h2, result11_c_temp_f2);
    // L4
    HA result12_HA_4(result12_c_temp_h4, result12_temp_h4, result12_temp_h3, result11_c_temp_f3);
    // LF RCA Node
    // FA result12_FA_F(result12_c, result[12], result12_temp_h4, result11_c_temp_h4, result11_c);
    FA result12_FA_F(result12_c, result[12], result12_temp_h4, result11_c_temp_h4, SRCA_Cout);

    // result[13]
    wire result13_c;
    wire result13_c_temp_f1, result13_temp_f1;
    wire result13_c_temp_h2, result13_temp_h2;
    wire result13_c_temp_h3, result13_temp_h3;
    // L1
    FA result13_FA_1(result13_c_temp_f1, result13_temp_f1, wallaceTree[6][7], wallaceTree[7][6], result12_c_temp_f1);
    // L2
    HA result13_HA_2(result13_c_temp_h2, result13_temp_h2, result13_temp_f1, result12_c_temp_h2);
    // L3
    HA result13_HA_3(result13_c_temp_h3, result13_temp_h3, result13_temp_h2, result12_c_temp_h3);
    // LF 
    FA result13_FA_F(result13_c, result[13], result13_temp_h3, result12_c_temp_h4, result12_c);

    // result[14]
    wire result14_c;
    wire result14_c_temp_h1, result14_temp_h1;
    wire result14_c_temp_h2, result14_temp_h2;
    // L1
    HA result14_HA_1(result14_c_temp_h1, result14_temp_h1, wallaceTree[7][7], result13_c_temp_f1);
    // L2
    HA result14_HA_2(result14_c_temp_h2, result14_temp_h2, result14_temp_h1, result13_c_temp_h2);
    // LF
    FA result14_FA_F(result14_c, result[14], result14_temp_h2, result13_c_temp_h3, result13_c);

    // result[15]
    wire result15_c;
    FA result15_FA_1(result15_c, result[15], result14_c_temp_h1, result14_c_temp_h2, result14_c);

endmodule