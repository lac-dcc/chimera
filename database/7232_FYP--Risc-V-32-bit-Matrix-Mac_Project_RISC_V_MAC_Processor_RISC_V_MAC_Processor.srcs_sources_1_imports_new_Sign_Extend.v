// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/19/2023 05:52:29 PM
// Design Name: 
// Module Name: Sign_Extend
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Sign_Extend( //our imm values are of 12 bits, we are sign extending it to 32 bits
        input [31:0] In,//inputs bits
        input [1:0] ImmSrc,
        
        output [31:0] Imm_Ext// output bits 
    );
    
    //extending by 20 bits which are the same as the MSB of th Input, so signed value is contained
     assign Imm_Ext =  (ImmSrc == 2'b00) ? ( { { 20{ In[31] } } , { In[31:20] } } ) :                   //Instruction[31:20] => LW => immExt [11:0]
                                           ( { { 20{ In[31] } } , { In[31:25],In[11:7] }  } );          //SW => BEW = same thing
                       //(ImmSrc == 2'b10) ? ( { { 20{ In[31] } } , { In[11:7] }  } ):             //BEQ => In[12][10:1][11]
                                          // ( { { 20{ In[31] } } , { In[31:20] } } );                    //LW  same as above  
                       

endmodule
















