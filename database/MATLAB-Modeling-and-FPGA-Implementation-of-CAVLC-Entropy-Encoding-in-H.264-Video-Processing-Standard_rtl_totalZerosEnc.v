// This program was cloned from: https://github.com/Anas-Salah/MATLAB-Modeling-and-FPGA-Implementation-of-CAVLC-Entropy-Encoding-in-H.264-Video-Processing-Standard
// License: MIT License

`timescale 1ns / 1ps



module totalZerosEnc #(parameter aWIDTH= 8 , tzcWIDTH= 7 ) (
input			[aWIDTH-1 :0]       addr,
output 	reg	    [tzcWIDTH-1 :0]    	TotalZeroCode
);
// aWIDTH is the address width 
// tzcWIDTH is the width of total zeros code
  
// Note he made the same idea like I thought but the number @ the right and the value at the left 
/*
 From 0 to 15 row and 15 columbs 
 15 rows because the NZQs whether one non zero or fifteen non-zero the
 NZQs may reach 16 but it will not be recognized in this stage.

TotalZeroCode = 7 bits {3 bits MSB , 4 bits LSB} 
The LSB represent the total number length code and it will decoded using the module named  Z_word_decoder

*/

always @(*)begin
	case(addr)
	  //Total NZQs =  1                    
    'h00: TotalZeroCode = 'h11 ; /* str=1 */
    'h01: TotalZeroCode = 'h33 ; /* str=011 */
    'h02: TotalZeroCode = 'h23 ; /* str=010 */
    'h03: TotalZeroCode = 'h34 ; /* str=0011 */
    'h04: TotalZeroCode = 'h24 ; /* str=0010 */
    'h05: TotalZeroCode = 'h35 ; /* str=00011 */
    'h06: TotalZeroCode = 'h25 ; /* str=00010 */
    'h07: TotalZeroCode = 'h36 ; /* str=000011 */
    'h08: TotalZeroCode = 'h26 ; /* str=000010 */
    'h09: TotalZeroCode = 'h37 ; /* str=0000011 */
    'h0a: TotalZeroCode = 'h27 ; /* str=0000010 */
    'h0b: TotalZeroCode = 'h38 ; /* str=00000011 */
    'h0c: TotalZeroCode = 'h28 ; /* str=00000010 */
    'h0d: TotalZeroCode = 'h39 ; /* str=000000011 */
    'h0e: TotalZeroCode = 'h29 ; /* str=000000010 */
    'h0f: TotalZeroCode = 'h19 ; /* str=000000001 */

	 //Total NZQs =  2                   
    'h10: TotalZeroCode = 'h73 ; /* str=111 */
    'h11: TotalZeroCode = 'h63 ; /* str=110 */
    'h12: TotalZeroCode = 'h53 ; /* str=101 */
    'h13: TotalZeroCode = 'h43 ; /* str=100 */
    'h14: TotalZeroCode = 'h33 ; /* str=011 */
    'h15: TotalZeroCode = 'h54 ; /* str=0101 */
    'h16: TotalZeroCode = 'h44 ; /* str=0100 */
    'h17: TotalZeroCode = 'h34 ; /* str=0011 */
    'h18: TotalZeroCode = 'h24 ; /* str=0010 */
    'h19: TotalZeroCode = 'h35 ; /* str=00011 */
    'h1a: TotalZeroCode = 'h25 ; /* str=00010 */
    'h1b: TotalZeroCode = 'h36 ; /* str=000011 */
    'h1c: TotalZeroCode = 'h26 ; /* str=000010 */
    'h1d: TotalZeroCode = 'h16 ; /* str=000001 */
    'h1e: TotalZeroCode = 'h06 ; /* str=000000 */
    'h1f: TotalZeroCode = 'h00 ; /* str= */
                               
	 //Total NZQs =  3                   
    'h20: TotalZeroCode = 'h54 ; /* str=0101 */
    'h21: TotalZeroCode = 'h73 ; /* str=111 */
    'h22: TotalZeroCode = 'h63 ; /* str=110 */
    'h23: TotalZeroCode = 'h53 ; /* str=101 */
    'h24: TotalZeroCode = 'h44 ; /* str=0100 */
    'h25: TotalZeroCode = 'h34 ; /* str=0011 */
    'h26: TotalZeroCode = 'h43 ; /* str=100 */
    'h27: TotalZeroCode = 'h33 ; /* str=011 */
    'h28: TotalZeroCode = 'h24 ; /* str=0010 */
    'h29: TotalZeroCode = 'h35 ; /* str=00011 */
    'h2a: TotalZeroCode = 'h25 ; /* str=00010 */
    'h2b: TotalZeroCode = 'h16 ; /* str=000001 */
    'h2c: TotalZeroCode = 'h15 ; /* str=00001 */
    'h2d: TotalZeroCode = 'h06 ; /* str=000000 */
    'h2e: TotalZeroCode = 'h00 ; /* str= */
    'h2f: TotalZeroCode = 'h00 ; /* str= */
                              
	 //Total NZQs =  4                   
    'h30: TotalZeroCode = 'h35 ; /* str=00011 */
    'h31: TotalZeroCode = 'h73 ; /* str=111 */
    'h32: TotalZeroCode = 'h54 ; /* str=0101 */
    'h33: TotalZeroCode = 'h44 ; /* str=0100 */
    'h34: TotalZeroCode = 'h63 ; /* str=110 */
    'h35: TotalZeroCode = 'h53 ; /* str=101 */
    'h36: TotalZeroCode = 'h43 ; /* str=100 */
    'h37: TotalZeroCode = 'h34 ; /* str=0011 */
    'h38: TotalZeroCode = 'h33 ; /* str=011 */
    'h39: TotalZeroCode = 'h24 ; /* str=0010 */
    'h3a: TotalZeroCode = 'h25 ; /* str=00010 */
    'h3b: TotalZeroCode = 'h15 ; /* str=00001 */
    'h3c: TotalZeroCode = 'h05 ; /* str=00000 */
    'h3d: TotalZeroCode = 'h00 ; /* str= */

    'h3e: TotalZeroCode = 'h11 ; /* str= */
    'h3f: TotalZeroCode = 'h01 ; /* str= */
                              
	 //Total NZQs =  5                   
    'h40: TotalZeroCode = 'h54 ; /* str=0101 */
    'h41: TotalZeroCode = 'h44 ; /* str=0100 */
    'h42: TotalZeroCode = 'h34 ; /* str=0011 */
    'h43: TotalZeroCode = 'h73 ; /* str=111 */
    'h44: TotalZeroCode = 'h63 ; /* str=110 */
    'h45: TotalZeroCode = 'h53 ; /* str=101 */
    'h46: TotalZeroCode = 'h43 ; /* str=100 */
    'h47: TotalZeroCode = 'h33 ; /* str=011 */
    'h48: TotalZeroCode = 'h24 ; /* str=0010 */
    'h49: TotalZeroCode = 'h15 ; /* str=00001 */
    'h4a: TotalZeroCode = 'h14 ; /* str=0001 */
    'h4b: TotalZeroCode = 'h05 ; /* str=00000 */
    'h4c: TotalZeroCode = 'h00 ; /* str= */

    'h4d: TotalZeroCode = 'h00 ; /* str= */
    'h4e: TotalZeroCode = 'h00 ; /* str= */
    'h4f: TotalZeroCode = 'h00 ; /* str= */
                               
	 //Total NZQs =  6                   
    'h50: TotalZeroCode = 'h16 ; /* str=000001 */
    'h51: TotalZeroCode = 'h15 ; /* str=00001 */
    'h52: TotalZeroCode = 'h73 ; /* str=111 */
    'h53: TotalZeroCode = 'h63 ; /* str=110 */
    'h54: TotalZeroCode = 'h53 ; /* str=101 */
    'h55: TotalZeroCode = 'h43 ; /* str=100 */
    'h56: TotalZeroCode = 'h33 ; /* str=011 */
    'h57: TotalZeroCode = 'h23 ; /* str=010 */
    'h58: TotalZeroCode = 'h14 ; /* str=0001 */
    'h59: TotalZeroCode = 'h13 ; /* str=001 */
    'h5a: TotalZeroCode = 'h06 ; /* str=000000 */
    'h5b: TotalZeroCode = 'h00 ; /* str= */

    'h5c: TotalZeroCode = 'h00 ; /* str= */
    'h5d: TotalZeroCode = 'h00 ; /* str= */
    'h5e: TotalZeroCode = 'h00 ; /* str= */
    'h5f: TotalZeroCode = 'h00 ; /* str= */
                              
	 //Total NZQs =  7                   
    'h60: TotalZeroCode = 'h16 ; /* str=000001 */
    'h61: TotalZeroCode = 'h15 ; /* str=00001 */
    'h62: TotalZeroCode = 'h53 ; /* str=101 */
    'h63: TotalZeroCode = 'h43 ; /* str=100 */
    'h64: TotalZeroCode = 'h33 ; /* str=011 */
    'h65: TotalZeroCode = 'h32 ; /* str=11 */
    'h66: TotalZeroCode = 'h23 ; /* str=010 */
    'h67: TotalZeroCode = 'h14 ; /* str=0001 */
    'h68: TotalZeroCode = 'h13 ; /* str=001 */
    'h69: TotalZeroCode = 'h06 ; /* str=000000 */
    'h6a: TotalZeroCode = 'h00 ; /* str= */

    'h6b: TotalZeroCode = 'h00 ; /* str= */
    'h6c: TotalZeroCode = 'h00 ; /* str= */
    'h6d: TotalZeroCode = 'h00 ; /* str= */
    'h6e: TotalZeroCode = 'h00 ; /* str= */
    'h6f: TotalZeroCode = 'h00 ; /* str= */
                              
	 //Total NZQs =  8                   
    'h70: TotalZeroCode = 'h16 ; /* str=000001 */
    'h71: TotalZeroCode = 'h14 ; /* str=0001 */
    'h72: TotalZeroCode = 'h15 ; /* str=00001 */
    'h73: TotalZeroCode = 'h33 ; /* str=011 */
    'h74: TotalZeroCode = 'h32 ; /* str=11 */
    'h75: TotalZeroCode = 'h22 ; /* str=10 */
    'h76: TotalZeroCode = 'h23 ; /* str=010 */
    'h77: TotalZeroCode = 'h13 ; /* str=001 */
    'h78: TotalZeroCode = 'h06 ; /* str=000000 */
    'h79: TotalZeroCode = 'h00 ; /* str= */

    'h7a: TotalZeroCode = 'h00 ; /* str= */
    'h7b: TotalZeroCode = 'h00 ; /* str= */
    'h7c: TotalZeroCode = 'h00 ; /* str= */
    'h7d: TotalZeroCode = 'h00 ; /* str= */
    'h7e: TotalZeroCode = 'h00 ; /* str= */
    'h7f: TotalZeroCode = 'h00 ; /* str= */
                               
	 //Total NZQs =  9                   
    'h80: TotalZeroCode = 'h16 ; /* str=000001 */
    'h81: TotalZeroCode = 'h06 ; /* str=000000 */
    'h82: TotalZeroCode = 'h14 ; /* str=0001 */
    'h83: TotalZeroCode = 'h32 ; /* str=11 */
    'h84: TotalZeroCode = 'h22 ; /* str=10 */
    'h85: TotalZeroCode = 'h13 ; /* str=001 */
    'h86: TotalZeroCode = 'h12 ; /* str=01 */
    'h87: TotalZeroCode = 'h15 ; /* str=00001 */
    'h88: TotalZeroCode = 'h00 ; /* str= */

    'h89: TotalZeroCode = 'h00 ; /* str= */
    'h8a: TotalZeroCode = 'h00 ; /* str= */
    'h8b: TotalZeroCode = 'h00 ; /* str= */
    'h8c: TotalZeroCode = 'h00 ; /* str= */
    'h8d: TotalZeroCode = 'h00 ; /* str= */
    'h8e: TotalZeroCode = 'h00 ; /* str= */
    'h8f: TotalZeroCode = 'h00 ; /* str= */
  
  
	 //Total NZQs =  10                   
  
    'h90: TotalZeroCode = 'h15 ; /* str=00001 */
    'h91: TotalZeroCode = 'h05 ; /* str=00000 */
    'h92: TotalZeroCode = 'h13 ; /* str=001 */
    'h93: TotalZeroCode = 'h32 ; /* str=11 */
    'h94: TotalZeroCode = 'h22 ; /* str=10 */
    'h95: TotalZeroCode = 'h12 ; /* str=01 */
    'h96: TotalZeroCode = 'h14 ; /* str=0001 */
    'h97: TotalZeroCode = 'h00 ; /* str= */
    'h98: TotalZeroCode = 'h00 ; /* str= */

    'h99: TotalZeroCode = 'h00 ; /* str= */
    'h9a: TotalZeroCode = 'h00 ; /* str= */
    'h9b: TotalZeroCode = 'h00 ; /* str= */
    'h9c: TotalZeroCode = 'h00 ; /* str= */
    'h9d: TotalZeroCode = 'h00 ; /* str= */
    'h9e: TotalZeroCode = 'h00 ; /* str= */
    'h9f: TotalZeroCode = 'h00 ; /* str= */
      
	 //Total NZQs =  11                   

    'ha0: TotalZeroCode = 'h04 ; /* str=0000 */
    'ha1: TotalZeroCode = 'h14 ; /* str=0001 */
    'ha2: TotalZeroCode = 'h13 ; /* str=001 */
    'ha3: TotalZeroCode = 'h23 ; /* str=010 */
    'ha4: TotalZeroCode = 'h11 ; /* str=1 */
    'ha5: TotalZeroCode = 'h33 ; /* str=011 */
    'ha6: TotalZeroCode = 'h00 ; /* str= */
    'ha7: TotalZeroCode = 'h00 ; /* str= */
    'ha8: TotalZeroCode = 'h00 ; /* str= */

    'ha9: TotalZeroCode = 'h00 ; /* str= */
    'haa: TotalZeroCode = 'h00 ; /* str= */
    'hab: TotalZeroCode = 'h00 ; /* str= */
    'hac: TotalZeroCode = 'h00 ; /* str= */
    'had: TotalZeroCode = 'h00 ; /* str= */
    'hae: TotalZeroCode = 'h00 ; /* str= */
    'haf: TotalZeroCode = 'h00 ; /* str= */

	 //Total NZQs =  12                   

    'hb0: TotalZeroCode = 'h04 ; /* str=0000 */
    'hb1: TotalZeroCode = 'h14 ; /* str=0001 */
    'hb2: TotalZeroCode = 'h12 ; /* str=01 */
    'hb3: TotalZeroCode = 'h11 ; /* str=1 */
    'hb4: TotalZeroCode = 'h13 ; /* str=001 */
    'hb5: TotalZeroCode = 'h00 ; /* str= */
    'hb6: TotalZeroCode = 'h00 ; /* str= */
    'hb7: TotalZeroCode = 'h00 ; /* str= */
    'hb8: TotalZeroCode = 'h00 ; /* str= */

    'hb9: TotalZeroCode = 'h00 ; /* str= */
    'hba: TotalZeroCode = 'h00 ; /* str= */
    'hbb: TotalZeroCode = 'h22 ; /* str= */
    'hbc: TotalZeroCode = 'h00 ; /* str= */
    'hbd: TotalZeroCode = 'h00 ; /* str= */
    'hbe: TotalZeroCode = 'h00 ; /* str= */
    'hbf: TotalZeroCode = 'h00 ; /* str= */

	 //Total NZQs =  13                   


    'hc0: TotalZeroCode = 'h03 ; /* str=000 */
    'hc1: TotalZeroCode = 'h13 ; /* str=001 */
    'hc2: TotalZeroCode = 'h11 ; /* str=1 */
    'hc3: TotalZeroCode = 'h12 ; /* str=01 */
    'hc4: TotalZeroCode = 'h00 ; /* str= */
    'hc5: TotalZeroCode = 'h00 ; /* str= */
    'hc6: TotalZeroCode = 'h00 ; /* str= */
    'hc7: TotalZeroCode = 'h00 ; /* str= */
    'hc8: TotalZeroCode = 'h00 ; /* str= */

    'hc9: TotalZeroCode = 'h00 ; /* str= */
    'hca: TotalZeroCode = 'h00 ; /* str= */
    'hcb: TotalZeroCode = 'h00 ; /* str= */
    'hcc: TotalZeroCode = 'h00 ; /* str= */
    'hcd: TotalZeroCode = 'h00 ; /* str= */
    'hce: TotalZeroCode = 'h00 ; /* str= */
    'hcf: TotalZeroCode = 'h00 ; /* str= */
	 //Total NZQs =  14                   

    'hd0: TotalZeroCode = 'h02; /* str=00 */
    'hd1: TotalZeroCode = 'h12 ; /* str=01 */
    'hd2: TotalZeroCode = 'h11 ; /* str=1 */
    'hd3: TotalZeroCode = 'h00 ; /* str= */
    'hd4: TotalZeroCode = 'h00 ; /* str= */
    'hd5: TotalZeroCode = 'h00 ; /* str= */
    'hd6: TotalZeroCode = 'h00 ; /* str= */
    'hd7: TotalZeroCode = 'h00 ; /* str= */
    'hd8: TotalZeroCode = 'h00 ; /* str= */

    'hd9: TotalZeroCode = 'h00 ; /* str= */
    'hda: TotalZeroCode = 'h00 ; /* str= */
    'hdb: TotalZeroCode = 'h00 ; /* str= */
    'hdc: TotalZeroCode = 'h00 ; /* str= */
    'hdd: TotalZeroCode = 'h00 ; /* str= */
    'hde: TotalZeroCode = 'h00 ; /* str= */
    'hdf: TotalZeroCode = 'h00 ; /* str= */


	 //Total NZQs =  15        
  
    'he0: TotalZeroCode = 'h01 ; /* str=0 */
    'he1: TotalZeroCode = 'h11 ; /* str=1*/
    'he2: TotalZeroCode = 'h00 ; /* str= */
    'he3: TotalZeroCode = 'h00 ; /* str= */
    'he4: TotalZeroCode = 'h00 ; /* str= */
    'he5: TotalZeroCode = 'h00 ; /* str= */
    'he6: TotalZeroCode = 'h00 ; /* str= */
    'he7: TotalZeroCode = 'h00 ; /* str= */
    'he8: TotalZeroCode = 'h00 ; /* str= */

    'he9: TotalZeroCode = 'h00 ; /* str= */
    'hea: TotalZeroCode = 'h00 ; /* str= */
    'heb: TotalZeroCode = 'h00 ; /* str= */
    'hec: TotalZeroCode = 'h00 ; /* str= */
    'hed: TotalZeroCode = 'h00 ; /* str= */
    'hee: TotalZeroCode = 'h00 ; /* str= */
    'hef: TotalZeroCode = 'h00 ; /* str= */
    default:  TotalZeroCode = 'h0 ;
  endcase
end
	
endmodule





















