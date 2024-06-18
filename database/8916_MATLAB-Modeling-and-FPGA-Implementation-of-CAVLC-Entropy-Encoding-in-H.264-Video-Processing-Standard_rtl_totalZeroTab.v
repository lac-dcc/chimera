// This program was cloned from: https://github.com/Anas-Salah/MATLAB-Modeling-and-FPGA-Implementation-of-CAVLC-Entropy-Encoding-in-H.264-Video-Processing-Standard
// License: MIT License

`timescale 1ns / 1ps



module totalZeroTab(
input					addr,
output 	reg	        	TotalZeroCode
);


// Note he made the same idea like I thought but the number @ the right and the value at the left 
/*
 From 0 to 15 row and 15 columbs 
 15 rows because the NZQs whether one non zero or fifteen non-zero the
 NZQs may reach 16 but it will not be recognized in this stage.

TotalZeroCode = 7 bits {3 bits MSB , 4 bits LSB} 
The LSB represents the total number length code and it will decoded using the module named  Z_word_decoder
The 3 bits MSB represents the value
*/

always @(*)begin
	case(addr)
	//Total NZQs =  1                    
    8'h00: TotalZeroCode = 7'h11 ; /* str=1 */
    8'h01: TotalZeroCode = 7'h33 ; /* str=011 */
    8'h02: TotalZeroCode = 7'h23 ; /* str=010 */
    8'h03: TotalZeroCode = 7'h34 ; /* str=0011 */
    8'h04: TotalZeroCode = 7'h24 ; /* str=0010 */
    8'h05: TotalZeroCode = 7'h35 ; /* str=00011 */
    8'h06: TotalZeroCode = 7'h25 ; /* str=00010 */
    8'h07: TotalZeroCode = 7'h36 ; /* str=000011 */
    8'h08: TotalZeroCode = 7'h26 ; /* str=000010 */
    8'h09: TotalZeroCode = 7'h37 ; /* str=0000011 */
    8'h0a: TotalZeroCode = 7'h27 ; /* str=0000010 */
    8'h0b: TotalZeroCode = 7'h38 ; /* str=00000011 */
    8'h0c: TotalZeroCode = 7'h28 ; /* str=00000010 */
    8'h0d: TotalZeroCode = 7'h39 ; /* str=000000011 */
    8'h0e: TotalZeroCode = 7'h29 ; /* str=000000010 */
    8'h0f: TotalZeroCode = 7'h19 ; /* str=000000001 */

	//Total NZQs =  2                    
    8'h10: TotalZeroCode = 7'h73 ; /* str=111 */
    8'h11: TotalZeroCode = 7'h63 ; /* str=110 */
    8'h12: TotalZeroCode = 7'h53 ; /* str=101 */
    8'h13: TotalZeroCode = 7'h43 ; /* str=100 */
    8'h14: TotalZeroCode = 7'h33 ; /* str=011 */
    8'h15: TotalZeroCode = 7'h54 ; /* str=0101 */
    8'h16: TotalZeroCode = 7'h44 ; /* str=0100 */
    8'h17: TotalZeroCode = 7'h34 ; /* str=0011 */
    8'h18: TotalZeroCode = 7'h24 ; /* str=0010 */
    8'h19: TotalZeroCode = 7'h35 ; /* str=00011 */
    8'h1a: TotalZeroCode = 7'h25 ; /* str=00010 */
    8'h1b: TotalZeroCode = 7'h36 ; /* str=000011 */
    8'h1c: TotalZeroCode = 7'h26 ; /* str=000010 */
    8'h1d: TotalZeroCode = 7'h16 ; /* str=000001 */
    8'h1e: TotalZeroCode = 7'h06 ; /* str=000000 */
    8'h1f: TotalZeroCode = 7'h00 ; /* str= */
                                 
	//Total NZQs =  3                    
    8'h20: TotalZeroCode = 7'h54 ; /* str=0101 */
    8'h21: TotalZeroCode = 7'h73 ; /* str=111 */
    8'h22: TotalZeroCode = 7'h63 ; /* str=110 */
    8'h23: TotalZeroCode = 7'h53 ; /* str=101 */
    8'h24: TotalZeroCode = 7'h44 ; /* str=0100 */
    8'h25: TotalZeroCode = 7'h34 ; /* str=0011 */
    8'h26: TotalZeroCode = 7'h43 ; /* str=100 */
    8'h27: TotalZeroCode = 7'h33 ; /* str=011 */
    8'h28: TotalZeroCode = 7'h24 ; /* str=0010 */
    8'h29: TotalZeroCode = 7'h35 ; /* str=00011 */
    8'h2a: TotalZeroCode = 7'h25 ; /* str=00010 */
    8'h2b: TotalZeroCode = 7'h16 ; /* str=000001 */
    8'h2c: TotalZeroCode = 7'h15 ; /* str=00001 */
    8'h2d: TotalZeroCode = 7'h06 ; /* str=000000 */
    8'h2e: TotalZeroCode = 7'h00 ; /* str= */
    8'h2f: TotalZeroCode = 7'h00 ; /* str= */
                                
	//Total NZQs =  4                    
    8'h30: TotalZeroCode = 7'h35 ; /* str=00011 */
    8'h31: TotalZeroCode = 7'h73 ; /* str=111 */
    8'h32: TotalZeroCode = 7'h54 ; /* str=0101 */
    8'h33: TotalZeroCode = 7'h44 ; /* str=0100 */
    8'h34: TotalZeroCode = 7'h63 ; /* str=110 */
    8'h35: TotalZeroCode = 7'h53 ; /* str=101 */
    8'h36: TotalZeroCode = 7'h43 ; /* str=100 */
    8'h37: TotalZeroCode = 7'h34 ; /* str=0011 */
    8'h38: TotalZeroCode = 7'h33 ; /* str=011 */
    8'h39: TotalZeroCode = 7'h24 ; /* str=0010 */
    8'h3a: TotalZeroCode = 7'h25 ; /* str=00010 */
    8'h3b: TotalZeroCode = 7'h15 ; /* str=00001 */
    8'h3c: TotalZeroCode = 7'h05 ; /* str=00000 */
    8'h3d: TotalZeroCode = 7'h00 ; /* str= */
 //
    8'h3e: TotalZeroCode = 7'h11 ; /* str= */
    8'h3f: TotalZeroCode = 7'h01 ; /* str= */
                                
	//Total NZQs =  5                    
    8'h40: TotalZeroCode = 7'h54 ; /* str=0101 */
    8'h41: TotalZeroCode = 7'h44 ; /* str=0100 */
    8'h42: TotalZeroCode = 7'h34 ; /* str=0011 */
    8'h43: TotalZeroCode = 7'h73 ; /* str=111 */
    8'h44: TotalZeroCode = 7'h63 ; /* str=110 */
    8'h45: TotalZeroCode = 7'h53 ; /* str=101 */
    8'h46: TotalZeroCode = 7'h43 ; /* str=100 */
    8'h47: TotalZeroCode = 7'h33 ; /* str=011 */
    8'h48: TotalZeroCode = 7'h24 ; /* str=0010 */
    8'h49: TotalZeroCode = 7'h15 ; /* str=00001 */
    8'h4a: TotalZeroCode = 7'h14 ; /* str=0001 */
    8'h4b: TotalZeroCode = 7'h05 ; /* str=00000 */
    8'h4c: TotalZeroCode = 7'h00 ; /* str= */
 //
    8'h4d: TotalZeroCode = 7'h00 ; /* str= */
    8'h4e: TotalZeroCode = 7'h00 ; /* str= */
    8'h4f: TotalZeroCode = 7'h00 ; /* str= */
                                 
	//Total NZQs =  6                    
    8'h50: TotalZeroCode = 7'h16 ; /* str=000001 */
    8'h51: TotalZeroCode = 7'h15 ; /* str=00001 */
    8'h52: TotalZeroCode = 7'h73 ; /* str=111 */
    8'h53: TotalZeroCode = 7'h63 ; /* str=110 */
    8'h54: TotalZeroCode = 7'h53 ; /* str=101 */
    8'h55: TotalZeroCode = 7'h43 ; /* str=100 */
    8'h56: TotalZeroCode = 7'h33 ; /* str=011 */
    8'h57: TotalZeroCode = 7'h23 ; /* str=010 */
    8'h58: TotalZeroCode = 7'h14 ; /* str=0001 */
    8'h59: TotalZeroCode = 7'h13 ; /* str=001 */
    8'h5a: TotalZeroCode = 7'h06 ; /* str=000000 */
    8'h5b: TotalZeroCode = 7'h00 ; /* str= */
  //
    8'h5c: TotalZeroCode = 7'h00 ; /* str= */
    8'h5d: TotalZeroCode = 7'h00 ; /* str= */
    8'h5e: TotalZeroCode = 7'h00 ; /* str= */
    8'h5f: TotalZeroCode = 7'h00 ; /* str= */
                                
	//Total NZQs =  7                    
    8'h60: TotalZeroCode = 7'h16 ; /* str=000001 */
    8'h61: TotalZeroCode = 7'h15 ; /* str=00001 */
    8'h62: TotalZeroCode = 7'h53 ; /* str=101 */
    8'h63: TotalZeroCode = 7'h43 ; /* str=100 */
    8'h64: TotalZeroCode = 7'h33 ; /* str=011 */
    8'h65: TotalZeroCode = 7'h32 ; /* str=11 */
    8'h66: TotalZeroCode = 7'h23 ; /* str=010 */
    8'h67: TotalZeroCode = 7'h14 ; /* str=0001 */
    8'h68: TotalZeroCode = 7'h13 ; /* str=001 */
    8'h69: TotalZeroCode = 7'h06 ; /* str=000000 */
    8'h6a: TotalZeroCode = 7'h00 ; /* str= */
//
    8'h6b: TotalZeroCode = 7'h00 ; /* str= */
    8'h6c: TotalZeroCode = 7'h00 ; /* str= */
    8'h6d: TotalZeroCode = 7'h00 ; /* str= */
    8'h6e: TotalZeroCode = 7'h00 ; /* str= */
    8'h6f: TotalZeroCode = 7'h00 ; /* str= */
                                
	//Total NZQs =  8                    
    8'h70: TotalZeroCode = 7'h16 ; /* str=000001 */
    8'h71: TotalZeroCode = 7'h14 ; /* str=0001 */
    8'h72: TotalZeroCode = 7'h15 ; /* str=00001 */
    8'h73: TotalZeroCode = 7'h33 ; /* str=011 */
    8'h74: TotalZeroCode = 7'h32 ; /* str=11 */
    8'h75: TotalZeroCode = 7'h22 ; /* str=10 */
    8'h76: TotalZeroCode = 7'h23 ; /* str=010 */
    8'h77: TotalZeroCode = 7'h13 ; /* str=001 */
    8'h78: TotalZeroCode = 7'h06 ; /* str=000000 */
    8'h79: TotalZeroCode = 7'h00 ; /* str= */
//
    8'h7a: TotalZeroCode = 7'h00 ; /* str= */
    8'h7b: TotalZeroCode = 7'h00 ; /* str= */
    8'h7c: TotalZeroCode = 7'h00 ; /* str= */
    8'h7d: TotalZeroCode = 7'h00 ; /* str= */
    8'h7e: TotalZeroCode = 7'h00 ; /* str= */
    8'h7f: TotalZeroCode = 7'h00 ; /* str= */
                                 
	//Total NZQs =  9                    
    8'h80: TotalZeroCode = 7'h16 ; /* str=000001 */
    8'h81: TotalZeroCode = 7'h06 ; /* str=000000 */
    8'h82: TotalZeroCode = 7'h14 ; /* str=0001 */
    8'h83: TotalZeroCode = 7'h32 ; /* str=11 */
    8'h84: TotalZeroCode = 7'h22 ; /* str=10 */
    8'h85: TotalZeroCode = 7'h13 ; /* str=001 */
    8'h86: TotalZeroCode = 7'h12 ; /* str=01 */
    8'h87: TotalZeroCode = 7'h15 ; /* str=00001 */
    8'h88: TotalZeroCode = 7'h00 ; /* str= */
//
    8'h89: TotalZeroCode = 7'h00 ; /* str= */
    8'h8a: TotalZeroCode = 7'h00 ; /* str= */
    8'h8b: TotalZeroCode = 7'h00 ; /* str= */
    8'h8c: TotalZeroCode = 7'h00 ; /* str= */
    8'h8d: TotalZeroCode = 7'h00 ; /* str= */
    8'h8e: TotalZeroCode = 7'h00 ; /* str= */
    8'h8f: TotalZeroCode = 7'h00 ; /* str= */
    
    
	//Total NZQs =  10                    
    
    8'h90: TotalZeroCode = 7'h15 ; /* str=00001 */
    8'h91: TotalZeroCode = 7'h05 ; /* str=00000 */
    8'h92: TotalZeroCode = 7'h13 ; /* str=001 */
    8'h93: TotalZeroCode = 7'h32 ; /* str=11 */
    8'h94: TotalZeroCode = 7'h22 ; /* str=10 */
    8'h95: TotalZeroCode = 7'h12 ; /* str=01 */
    8'h96: TotalZeroCode = 7'h14 ; /* str=0001 */
    8'h97: TotalZeroCode = 7'h00 ; /* str= */
    8'h98: TotalZeroCode = 7'h00 ; /* str= */
//
    8'h99: TotalZeroCode = 7'h00 ; /* str= */
    8'h9a: TotalZeroCode = 7'h00 ; /* str= */
    8'h9b: TotalZeroCode = 7'h00 ; /* str= */
    8'h9c: TotalZeroCode = 7'h00 ; /* str= */
    8'h9d: TotalZeroCode = 7'h00 ; /* str= */
    8'h9e: TotalZeroCode = 7'h00 ; /* str= */
    8'h9f: TotalZeroCode = 7'h00 ; /* str= */
        
	//Total NZQs =  11                    

    8'ha0: TotalZeroCode = 7'h04 ; /* str=0000 */
    8'ha1: TotalZeroCode = 7'h14 ; /* str=0001 */
    8'ha2: TotalZeroCode = 7'h13 ; /* str=001 */
    8'ha3: TotalZeroCode = 7'h23 ; /* str=010 */
    8'ha4: TotalZeroCode = 7'h11 ; /* str=1 */
    8'ha5: TotalZeroCode = 7'h33 ; /* str=011 */
    8'ha6: TotalZeroCode = 7'h00 ; /* str= */
    8'ha7: TotalZeroCode = 7'h00 ; /* str= */
    8'ha8: TotalZeroCode = 7'h00 ; /* str= */
//
    8'ha9: TotalZeroCode = 7'h00 ; /* str= */
    8'haa: TotalZeroCode = 7'h00 ; /* str= */
    8'hab: TotalZeroCode = 7'h00 ; /* str= */
    8'hac: TotalZeroCode = 7'h00 ; /* str= */
    8'had: TotalZeroCode = 7'h00 ; /* str= */
    8'hae: TotalZeroCode = 7'h00 ; /* str= */
    8'haf: TotalZeroCode = 7'h00 ; /* str= */

	//Total NZQs =  12                    

    8'hb0: TotalZeroCode = 7'h04 ; /* str=0000 */
    8'hb1: TotalZeroCode = 7'h14 ; /* str=0001 */
    8'hb2: TotalZeroCode = 7'h12 ; /* str=01 */
    8'hb3: TotalZeroCode = 7'h11 ; /* str=1 */
    8'hb4: TotalZeroCode = 7'h13 ; /* str=001 */
    8'hb5: TotalZeroCode = 7'h00 ; /* str= */
    8'hb6: TotalZeroCode = 7'h00 ; /* str= */
    8'hb7: TotalZeroCode = 7'h00 ; /* str= */
    8'hb8: TotalZeroCode = 7'h00 ; /* str= */
//
    8'hb9: TotalZeroCode = 7'h00 ; /* str= */
    8'hba: TotalZeroCode = 7'h00 ; /* str= */
    8'hbb: TotalZeroCode = 7'h22 ; /* str= */
    8'hbc: TotalZeroCode = 7'h00 ; /* str= */
    8'hbd: TotalZeroCode = 7'h00 ; /* str= */
    8'hbe: TotalZeroCode = 7'h00 ; /* str= */
    8'hbf: TotalZeroCode = 7'h00 ; /* str= */

	//Total NZQs =  13                    


    8'hc0: TotalZeroCode = 7'h03 ; /* str=000 */
    8'hc1: TotalZeroCode = 7'h13 ; /* str=001 */
    8'hc2: TotalZeroCode = 7'h11 ; /* str=1 */
    8'hc3: TotalZeroCode = 7'h12 ; /* str=01 */
    8'hc4: TotalZeroCode = 7'h00 ; /* str= */
    8'hc5: TotalZeroCode = 7'h00 ; /* str= */
    8'hc6: TotalZeroCode = 7'h00 ; /* str= */
    8'hc7: TotalZeroCode = 7'h00 ; /* str= */
    8'hc8: TotalZeroCode = 7'h00 ; /* str= */
//
    8'hc9: TotalZeroCode = 7'h00 ; /* str= */
    8'hca: TotalZeroCode = 7'h00 ; /* str= */
    8'hcb: TotalZeroCode = 7'h00 ; /* str= */
    8'hcc: TotalZeroCode = 7'h00 ; /* str= */
    8'hcd: TotalZeroCode = 7'h00 ; /* str= */
    8'hce: TotalZeroCode = 7'h00 ; /* str= */
    8'hcf: TotalZeroCode = 7'h00 ; /* str= */
	//Total NZQs =  14                    

    8'hd0: TotalZeroCode = 7'h02; /* str=00 */
    8'hd1: TotalZeroCode = 7'h12 ; /* str=01 */
    8'hd2: TotalZeroCode = 7'h11 ; /* str=1 */
    8'hd3: TotalZeroCode = 7'h00 ; /* str= */
    8'hd4: TotalZeroCode = 7'h00 ; /* str= */
    8'hd5: TotalZeroCode = 7'h00 ; /* str= */
    8'hd6: TotalZeroCode = 7'h00 ; /* str= */
    8'hd7: TotalZeroCode = 7'h00 ; /* str= */
    8'hd8: TotalZeroCode = 7'h00 ; /* str= */
//
    8'hd9: TotalZeroCode = 7'h00 ; /* str= */
    8'hda: TotalZeroCode = 7'h00 ; /* str= */
    8'hdb: TotalZeroCode = 7'h00 ; /* str= */
    8'hdc: TotalZeroCode = 7'h00 ; /* str= */
    8'hdd: TotalZeroCode = 7'h00 ; /* str= */
    8'hde: TotalZeroCode = 7'h00 ; /* str= */
    8'hdf: TotalZeroCode = 7'h00 ; /* str= */


	//Total NZQs =  15         
    
    8'he0: TotalZeroCode = 7'h01 ; /* str=0 */
    8'he1: TotalZeroCode = 7'h11 ; /* str=1*/
    8'he2: TotalZeroCode = 7'h00 ; /* str= */
    8'he3: TotalZeroCode = 7'h00 ; /* str= */
    8'he4: TotalZeroCode = 7'h00 ; /* str= */
    8'he5: TotalZeroCode = 7'h00 ; /* str= */
    8'he6: TotalZeroCode = 7'h00 ; /* str= */
    8'he7: TotalZeroCode = 7'h00 ; /* str= */
    8'he8: TotalZeroCode = 7'h00 ; /* str= */
//
    8'he9: TotalZeroCode = 7'h00 ; /* str= */
    8'hea: TotalZeroCode = 7'h00 ; /* str= */
    8'heb: TotalZeroCode = 7'h00 ; /* str= */
    8'hec: TotalZeroCode = 7'h00 ; /* str= */
    8'hed: TotalZeroCode = 7'h00 ; /* str= */
    8'hee: TotalZeroCode = 7'h00 ; /* str= */
    8'hef: TotalZeroCode = 7'h00 ; /* str= */
    default:  TotalZeroCode = 7'h0 ;
  endcase
end
	
endmodule

