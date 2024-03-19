/****************************************************************************************************/
/*  SHA 256 module  - 512bit input version                              	   				        */
/*  Original Source: Aishwarya Nagarajan, UW-Madison, ERCBench Researcher 							*/	
/*	Edited and cleaned by: Sebastian Herzberg, TU Dresden                  	    					*/
/*																									*/
/*	Inputs: clk, rst, valid,first, last, msg_in (512bits)                   	       				*/
/*  Outputs: ready, msg_out (256 bits)                                      	    				*/
/*  The output is delivered 65 cycles after the last valid input chunk is provided	 				*/
/*								                    												*/
/*																									*/
/*	This program is free software: you can redistribute it and/or modify							*/	
/*	it under the terms of the GNU General Public License as published by							*/
/*	the Free Software Foundation, either version 3 of the License, or								*/
/*	(at your option) any later version.																*/
/*																									*/
/*	This program is distributed in the hope that it will be useful,									*/
/*	but WITHOUT ANY WARRANTY; without even the implied warranty of									*/
/*	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the									*/	
/*	GNU General Public License for more details.													*/
/*																									*/
/*	You should have received a copy of the GNU General Public License								*/
/*	along with this program.  If not, see <http://www.gnu.org/licenses/>.							*/		
/*																									*/
/****************************************************************************************************/ 


module sha_multi_chunks2(
	clk,
	rst,
	valid,
	first,
	last,
	msg_in,
	msg_out,
	ready
);
	
	input clk, rst, valid, first, last;
	input [511:0]msg_in;
	
	output [255:0]msg_out;
 	output reg ready;
    
           // defining hash localparams
           localparam H0 = 32'h6a09e667;
           localparam H1 = 32'hbb67ae85;
           localparam H2 = 32'h3c6ef372;
           localparam H3 = 32'ha54ff53a;
           localparam H4 = 32'h510e527f;
           localparam H5 = 32'h9b05688c;
           localparam H6 = 32'h1f83d9ab;
           localparam H7 = 32'h5be0cd19;
           // defining round constants
           localparam K00 = 32'h428a2f98;
           localparam K01 = 32'h71374491;
           localparam K02 = 32'hb5c0fbcf;
           localparam K03 = 32'he9b5dba5;
           localparam K04 = 32'h3956c25b;
           localparam K05 = 32'h59f111f1;
           localparam K06 = 32'h923f82a4;
           localparam K07 = 32'hab1c5ed5;
           localparam K08 = 32'hd807aa98;
           localparam K09 = 32'h12835b01;
           localparam K10 = 32'h243185be;
           localparam K11 = 32'h550c7dc3;
           localparam K12 = 32'h72be5d74;
           localparam K13 = 32'h80deb1fe;
           localparam K14 = 32'h9bdc06a7;
           localparam K15 = 32'hc19bf174;
           localparam K16 = 32'he49b69c1;
           localparam K17 = 32'hefbe4786;
           localparam K18 = 32'h0fc19dc6;
           localparam K19 = 32'h240ca1cc;
           localparam K20 = 32'h2de92c6f;
           localparam K21 = 32'h4a7484aa;
           localparam K22 = 32'h5cb0a9dc;
           localparam K23 = 32'h76f988da;
           localparam K24 = 32'h983e5152;
           localparam K25 = 32'ha831c66d;
           localparam K26 = 32'hb00327c8;
           localparam K27 = 32'hbf597fc7;
           localparam K28 = 32'hc6e00bf3;
           localparam K29 = 32'hd5a79147;
           localparam K30 = 32'h06ca6351;
           localparam K31 = 32'h14292967;
           localparam K32 = 32'h27b70a85;
           localparam K33 = 32'h2e1b2138;
           localparam K34 = 32'h4d2c6dfc;
           localparam K35 = 32'h53380d13;
           localparam K36 = 32'h650a7354;
           localparam K37 = 32'h766a0abb;
           localparam K38 = 32'h81c2c92e;
           localparam K39 = 32'h92722c85;
           localparam K40 = 32'ha2bfe8a1;
           localparam K41 = 32'ha81a664b;
           localparam K42 = 32'hc24b8b70;
           localparam K43 = 32'hc76c51a3;
           localparam K44 = 32'hd192e819;
           localparam K45 = 32'hd6990624;
           localparam K46 = 32'hf40e3585;
           localparam K47 = 32'h106aa070;
           localparam K48 = 32'h19a4c116;
           localparam K49 = 32'h1e376c08;
           localparam K50 = 32'h2748774c;
           localparam K51 = 32'h34b0bcb5;
           localparam K52 = 32'h391c0cb3;
           localparam K53 = 32'h4ed8aa4a;
           localparam K54 = 32'h5b9cca4f;
           localparam K55 = 32'h682e6ff3;
           localparam K56 = 32'h748f82ee;
           localparam K57 = 32'h78a5636f;
           localparam K58 = 32'h84c87814;
           localparam K59 = 32'h8cc70208;
           localparam K60 = 32'h90befffa;
           localparam K61 = 32'ha4506ceb;
           localparam K62 = 32'hbef9a3f7;
           localparam K63 = 32'hc67178f2;
        
	   // declaring input and output regs and wires	
           reg [6:0] cycle;
           wire [6:0] next_cycle; 
           reg [31:0] a_reg, b_reg, c_reg, d_reg, e_reg, f_reg, g_reg, h_reg; 
           wire [31:0] w_ex,a_out,b_out,c_out,d_out,e_out,f_out,g_out,h_out ;
           reg [31:0] w_16,w_15,w_7,w_2;
           reg [31:0] w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27,w28,w29,w30,w31,w32,w33,w34,w35,w36,w37,w38,w39,w40,w41,w42,w43,w44,w45,w46,w47,w48,w49,w50,w51,w52,w53,w54,w55,w56,w57,w58,w59,w60,w61,w62,w63;
           reg [31:0] k,w_in,a_in,b_in,c_in,d_in,e_in,f_in,g_in,h_in;
           
	   //instatiating submodules	
           extension E (clk, rst, w_16,w_15,w_7,w_2, w_ex);
           main_loop M (clk, rst, k,w_in,a_in,b_in,c_in,d_in,e_in,f_in,g_in,h_in, a_out,b_out,c_out,d_out,e_out,f_out,g_out,h_out);          
           
	   //combinational - assigning next cycle value
           assign next_cycle = (cycle == 7'd64)? 7'd0:(cycle+1'b1);
           
	   //combinational - assigning value of output message 
           assign msg_out = {(H0+a_reg+a_out),(H1+b_reg+b_out),(H2+c_reg+c_out),(H3+d_reg+d_out),(H4+e_reg+e_out),(H5+f_reg+f_out),(H6+g_reg+g_out),(H7+h_reg+h_out)};
           
	   //combinational - assigning words 0-15
           always @(*)begin
               if (rst|(!valid)) begin
                w0 = 32'b0;
                w1 = 32'b0;
                w2 = 32'b0;
                w3 = 32'b0;                        
                w4 = 32'b0;
                w5 = 32'b0;
                w6 = 32'b0;
                w7 = 32'b0;
                w8 = 32'b0;
                w9 = 32'b0;                                                                        
                w10 = 32'b0;
                w11 = 32'b0;
                w12 = 32'b0;
                w13 = 32'b0;                                                
                w14 = 32'b0;
                w15 = 32'b0;                        
               end
               else begin
                w0 = msg_in[511:480];
                w1 = msg_in[479:448];
                w2 = msg_in[447:416];
                w3 = msg_in[415:384];                        
                w4 = msg_in[383:352];
                w5 = msg_in[351:320];
                w6 = msg_in[319:288];
                w7 = msg_in[287:256];
                w8 = msg_in[255:224];
                w9 = msg_in[223:192];                                                                        
                w10 = msg_in[191:160];
                w11 = msg_in[159:128];
                w12 = msg_in[127:96];
                w13 = msg_in[95:64];                                                
                w14 = msg_in[63:32];
                w15 = msg_in[31:0];               
               end
           end
           
	   //synchronous - assigning words 16-63, updates the hash values at the beginning of every new chunk of words
           always@(posedge clk)begin
              if (rst|(!valid)) begin
                  cycle <= 7'd0;
              end
              else begin
                  cycle <= next_cycle; 
                  case (next_cycle)
                      'd0: begin // updating the hash values from previous round
                             a_reg <= a_out;
                             b_reg <= b_out;
                             c_reg <= c_out;
                             d_reg <= d_out;
                             e_reg <= e_out;
                             f_reg <= f_out;
                             g_reg <= g_out;
                             h_reg <= h_out; 
                           end
                      'd2: w16 <= w_ex;
                      'd3: w17 <= w_ex;
                      'd4: w18 <= w_ex;
                      'd5: w19 <= w_ex;
                      'd6: w20 <= w_ex;
                      'd7: w21 <= w_ex;
                      'd8: w22 <= w_ex;
                      'd9: w23 <= w_ex;
                      'd10: w24 <= w_ex;
                      'd11: w25 <= w_ex;
                      'd12: w26 <= w_ex;
                      'd13: w27 <= w_ex;
                      'd14: w28 <= w_ex;
                      'd15: w29 <= w_ex;
                      'd16: w30 <= w_ex;
                      'd17: w31 <= w_ex;
                      'd18: w32 <= w_ex;
                      'd19: w33 <= w_ex;
                      'd20: w34 <= w_ex;
                      'd21: w35 <= w_ex;
                      'd22: w36 <= w_ex;
                      'd23: w37 <= w_ex;
                      'd24: w38 <= w_ex;
                      'd25: w39 <= w_ex;
                      'd26: w40 <= w_ex;
                      'd27: w41 <= w_ex;
                      'd28: w42 <= w_ex;
                      'd29: w43 <= w_ex;
                      'd30: w44 <= w_ex;
                      'd31: w45 <= w_ex;
                      'd32: w46 <= w_ex;
                      'd33: w47 <= w_ex;
                      'd34: w48 <= w_ex;
                      'd35: w49 <= w_ex;
                      'd36: w50 <= w_ex;
                      'd37: w51 <= w_ex;
                      'd38: w52 <= w_ex;
                      'd39: w53 <= w_ex;
                      'd40: w54 <= w_ex;
                      'd41: w55 <= w_ex;
                      'd42: w56 <= w_ex;
                      'd43: w57 <= w_ex;
                      'd44: w58 <= w_ex;
                      'd45: w59 <= w_ex;
                      'd46: w60 <= w_ex;
                      'd47: w61 <= w_ex;
                      'd48: w62 <= w_ex;
                      'd49: w63 <= w_ex;
                                        
                 endcase
              end
           end
           
	   //combinational - assigning inputs for main_loop and extension module. If last chunk, asserts ready at cycle 65
           always@(*)begin
 
               case (cycle)
                   'd0:begin
                          if(first) begin
                             w_16 = w0;
                             w_15 = w1;
                             w_7 = w9;
                             w_2 = w14;  
                             k = K00;
                             w_in = w0;            
                             a_in = H0;
                             b_in = H1;
                             c_in = H2;
                             d_in = H3;
                             e_in = H4; 
                             f_in = H5;
                             g_in = H6;
                             h_in = H7;
                             ready = 1'b0;
                         end
                         else begin
                              w_16 = w0;
                              w_15 = w1;
                              w_7 = w9;
                              w_2 = w14;  
                              k = K00;
                              w_in = w0;            
                              a_in = H0+a_reg;
                              b_in = H1+b_reg;
                              c_in = H2+c_reg;
                              d_in = H3+d_reg;
                              e_in = H4+e_reg; 
                              f_in = H5+f_reg;
                              g_in = H6+g_reg;
                              h_in = H7+h_reg;
                              ready = 1'b0;
                         end
                       end
                   'd1:begin
                          w_16 = w1;
                          w_15 = w2;
                          w_7 = w10;
                          w_2 = w15;   
                          k = K01;
                          w_in = w1;            
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;
                          ready = 1'b0;                                                    
                       end
                   'd2:begin
                          w_16 = w2;
                          w_15 = w3;
                          w_7 = w11;
                          w_2 = w16; 
                          k = K02;
                          w_in = w2;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;                                   
                       end
                   'd3:begin
                          w_16 = w3;
                          w_15 = w4;
                          w_7 = w12;
                          w_2 = w17; 
                          k = K03;
                          w_in = w3;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;          
                       end
                   'd4:begin
                          w_16 = w4;
                          w_15 = w5;
                          w_7 = w13;
                          w_2 = w18;
                          k = K04;
                          w_in = w4;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;              
                       end
                   'd5:begin
                          w_16 = w5;
                          w_15 = w6;
                          w_7 = w14;
                          w_2 = w19;
                          k = K05;
                          w_in = w5;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;              
                       end
                       
                   'd6:begin
                          w_16 = w6;
                          w_15 = w7;
                          w_7 = w15;
                          w_2 = w20;
                          k = K06;
                          w_in = w6;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;              
                       end
                   'd7:begin
                          w_16 = w7;
                          w_15 = w8;
                          w_7 = w16;
                          w_2 = w21;
                          k = K07;
                          w_in = w7;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;  
                          ready = 1'b0;             
                       end
                   'd8:begin
                          w_16 = w8;
                          w_15 = w9;
                          w_7 = w17;
                          w_2 = w22;
                          k = K08;
                          w_in = w8; 
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;             
                       end
                   'd9:begin
                          w_16 = w9;
                          w_15 = w10;
                          w_7 = w18;
                          w_2 = w23; 
                          k = K09;
                          w_in = w9;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;    
                          ready = 1'b0;          
                       end
                   'd10:begin
                          w_16 = w10;
                          w_15 = w11;
                          w_7 = w19;
                          w_2 = w24; 
                          k = K10;
                          w_in = w10;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;   
                          ready = 1'b0;           
                       end
                   'd11:begin
                          w_16 = w11;
                          w_15 = w12;
                          w_7 = w20;
                          w_2 = w25;
                          k = K11;
                          w_in = w11;   
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;  
                          ready = 1'b0;          
                       end
                   'd12:begin
                          w_16 = w12;
                          w_15 = w13;
                          w_7 = w21;
                          w_2 = w26;
                          k = K12;
                          w_in = w12; 
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;  
                          ready = 1'b0;            
                       end
                   'd13:begin
                          w_16 = w13;
                          w_15 = w14;
                          w_7 = w22;
                          w_2 = w27;
                          k = K13;
                          w_in = w13; 
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;  
                          ready = 1'b0;            
                       end
                   'd14:begin
                          w_16 = w14;
                          w_15 = w15;
                          w_7 = w23;
                          w_2 = w28;
                          k = K14;
                          w_in = w14; 
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;  
                          ready = 1'b0;            
                       end
                   'd15:begin
                          w_16 = w15;
                          w_15 = w16;
                          w_7 = w24;
                          w_2 = w29;
                          k = K15;
                          w_in = w15; 
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;             
                       end
                   'd16:begin
                          w_16 = w16;
                          w_15 = w17;
                          w_7 = w25;
                          w_2 = w30; 
                          k = K16;
                          w_in = w16;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;   
                          ready = 1'b0;           
                       end
                   'd17:begin
                          w_16 = w17;
                          w_15 = w18;
                          w_7 = w26;
                          w_2 = w31;
                          k = K17;
                          w_in = w17; 
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;  
                          ready = 1'b0;            
                       end
                   'd18:begin
                          w_16 = w18;
                          w_15 = w19;
                          w_7 = w27;
                          w_2 = w32;
                          k = K18;
                          w_in = w18; 
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;   
                          ready = 1'b0;           
                       end
                   'd19:begin
                          w_16 = w19;
                          w_15 = w20;
                          w_7 = w28;
                          w_2 = w33;
                          k = K19;
                          w_in = w19;  
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;    
                          ready = 1'b0;         
                       end
                   'd20:begin
                          w_16 = w20;
                          w_15 = w21;
                          w_7 = w29;
                          w_2 = w34;
                          k = K20;
                          w_in = w20;  
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;   
                          ready = 1'b0;          
                       end
                   'd21:begin
                          w_16 = w21;
                          w_15 = w22;
                          w_7 = w30;
                          w_2 = w35; 
                          k = K21;
                          w_in = w21; 
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;  
                          ready = 1'b0;            
                       end
                   'd22:begin
                          w_16 = w22;
                          w_15 = w23;
                          w_7 = w31;
                          w_2 = w36;
                          k = K22;
                          w_in = w22;  
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;    
                          ready = 1'b0;          
                       end
                   'd23:begin
                          w_16 = w23;
                          w_15 = w24;
                          w_7 = w32;
                          w_2 = w37; 
                          k = K23;
                          w_in = w23;  
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;   
                          ready = 1'b0;          
                       end
                   'd24:begin
                          w_16 = w24;
                          w_15 = w25;
                          w_7 = w33;
                          w_2 = w38; 
                          k = K24;
                          w_in = w24; 
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;    
                          ready = 1'b0;         
                       end
                   'd25:begin
                          w_16 = w25;
                          w_15 = w26;
                          w_7 = w34;
                          w_2 = w39;
                          k = K25;
                          w_in = w25;    
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;   
                          ready = 1'b0;         
                       end
                   'd26:begin
                          w_16 = w26;
                          w_15 = w27;
                          w_7 = w35;
                          w_2 = w40;
                          k = K26;
                          w_in = w26;   
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;    
                          ready = 1'b0;         
                       end
                   'd27:begin
                          w_16 = w27;
                          w_15 = w28;
                          w_7 = w36;
                          w_2 = w41;
                          k = K27;
                          w_in = w27;  
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;   
                          ready = 1'b0;           
                       end
                   'd28:begin
                          w_16 = w28;
                          w_15 = w29;
                          w_7 = w37;
                          w_2 = w42;
                          k = K28;
                          w_in = w28;   
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;     
                          ready = 1'b0;        
                       end
                   'd29:begin
                          w_16 = w29;
                          w_15 = w30;
                          w_7 = w38;
                          w_2 = w43;
                          k = K29;
                          w_in = w29; 
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;  
                          ready = 1'b0;             
                       end
                   'd30:begin
                          w_16 = w30;
                          w_15 = w31;
                          w_7 = w39;
                          w_2 = w44;
                          k = K30;
                          w_in = w30; 
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;   
                          ready = 1'b0;            
                       end
                   'd31:begin
                          w_16 = w31;
                          w_15 = w32;
                          w_7 = w40;
                          w_2 = w45;
                          k = K31;
                          w_in = w31; 
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;              
                       end
                   'd32:begin
                          w_16 = w32;
                          w_15 = w33;
                          w_7 = w41;
                          w_2 = w46;
                          k = K32;
                          w_in = w32; 
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;              
                       end
                   'd33:begin
                          w_16 = w33;
                          w_15 = w34;
                          w_7 = w42;
                          w_2 = w47; 
                          k = K33;
                          w_in = w33; 
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;  
                          ready = 1'b0;            
                       end
                   'd34:begin
                          w_16 = w34;
                          w_15 = w35;
                          w_7 = w43;
                          w_2 = w48;
                          k = K34;
                          w_in = w34;   
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;            
                       end
                   'd35:begin
                          w_16 = w35;
                          w_15 = w36;
                          w_7 = w44;
                          w_2 = w49;
                          k = K35;
                          w_in = w35;    
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;           
                       end
                   'd36:begin
                          w_16 = w36;
                          w_15 = w37;
                          w_7 = w45;
                          w_2 = w50;
                          k = K36;
                          w_in = w36; 
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;              
                       end
                   'd37:begin
                          w_16 = w37;
                          w_15 = w38;
                          w_7 = w46;
                          w_2 = w51;
                          k = K37;
                          w_in = w37; 
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;              
                       end
                   'd38:begin
                          w_16 = w38;
                          w_15 = w39;
                          w_7 = w47;
                          w_2 = w52;
                          k = K38;
                          w_in = w38;    
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;
                          ready = 1'b0;            
                       end
                   'd39:begin
                          w_16 = w39;
                          w_15 = w40;
                          w_7 = w48;
                          w_2 = w53;
                          k = K39;
                          w_in = w39;    
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;           
                       end
                   'd40:begin
                          w_16 = w40;
                          w_15 = w41;
                          w_7 = w49;
                          w_2 = w54; 
                          k = K40;
                          w_in = w40; 
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;            
                       end
                   'd41:begin
                          w_16 = w41;
                          w_15 = w42;
                          w_7 = w50;
                          w_2 = w55;
                          k = K41;
                          w_in = w41;   
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;            
                       end
                   'd42:begin
                          w_16 = w42;
                          w_15 = w43;
                          w_7 = w51;
                          w_2 = w56;
                          k = K42;
                          w_in = w42;  
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;            
                       end
                   'd43:begin
                          w_16 = w43;
                          w_15 = w44;
                          w_7 = w52;
                          w_2 = w57;
                          k = K43;
                          w_in = w43; 
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;  
                          ready = 1'b0;            
                       end
                   'd44:begin
                          w_16 = w44;
                          w_15 = w45;
                          w_7 = w53;
                          w_2 = w58;
                          k = K44;
                          w_in = w44; 
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;
                          ready = 1'b0;              
                       end
                   'd45:begin
                          w_16 = w45;
                          w_15 = w46;
                          w_7 = w54;
                          w_2 = w59;
                          k = K45;
                          w_in = w45;   
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;
                          ready = 1'b0;            
                       end
                   'd46:begin
                          w_16 = w46;
                          w_15 = w47;
                          w_7 = w55;
                          w_2 = w60;
                          k = K46;
                          w_in = w46;  
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;   
                          ready = 1'b0;          
                       end
                   'd47:begin
                          w_16 = w47;
                          w_15 = w48;
                          w_7 = w56;
                          w_2 = w61;
                          k = K47;
                          w_in = w47;  
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;  
                          ready = 1'b0;
                      end
                   'd48:begin
                          w_16 = 32'b0;
                          w_15 = 32'b0;
                          w_7 = 32'b0;
                          w_2 = 32'b0;
                          k = K48;
                          w_in = w48;  
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;  
                          ready = 1'b0;                                
                       end
                   'd49:begin
                          w_16 = 32'b0;
                          w_15 = 32'b0;
                          w_7 = 32'b0;
                          w_2 = 32'b0;  
                          k = K49;
                          w_in = w49;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;                                 
                       end
                   'd50:begin
                          w_16 = 32'b0;
                          w_15 = 32'b0;
                          w_7 = 32'b0;
                          w_2 = 32'b0;  
                          k = K50;
                          w_in = w50;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;                                 
                       end
                   'd51:begin
                          w_16 = 32'b0;
                          w_15 = 32'b0;
                          w_7 = 32'b0;
                          w_2 = 32'b0; 
                          k = K51;
                          w_in = w51; 
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;                                 
                       end
                   'd52:begin
                          w_16 = 32'b0;
                          w_15 = 32'b0;
                          w_7 = 32'b0;
                          w_2 = 32'b0;  
                          k = K52;
                          w_in = w52;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;
                          ready = 1'b0;                                  
                       end
                   'd53:begin
                          w_16 = 32'b0;
                          w_15 = 32'b0;
                          w_7 = 32'b0;
                          w_2 = 32'b0;  
                          k = K53;
                          w_in = w53;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;
                          ready = 1'b0;                                  
                       end
                   'd54:begin
                          w_16 = 32'b0;
                          w_15 = 32'b0;
                          w_7 = 32'b0;
                          w_2 = 32'b0;  
                          k = K54;
                          w_in = w54;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;                                 
                       end
                   'd55:begin
                          w_16 = 32'b0;
                          w_15 = 32'b0;
                          w_7 = 32'b0;
                          w_2 = 32'b0;  
                          k = K55;
                          w_in = w55;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;  
                          ready = 1'b0;                                
                       end
                   'd56:begin
                          w_16 = 32'b0;
                          w_15 = 32'b0;
                          w_7 = 32'b0;
                          w_2 = 32'b0;  
                          k = K56;
                          w_in = w56;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;  
                          ready = 1'b0;                                
                       end
                   'd57:begin
                          w_16 = 32'b0;
                          w_15 = 32'b0;
                          w_7 = 32'b0;
                          w_2 = 32'b0;
                          k = K57;
                          w_in = w57;  
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;  
                          ready = 1'b0;                                
                       end
                   'd58:begin
                          w_16 = 32'b0;
                          w_15 = 32'b0;
                          w_7 = 32'b0;
                          w_2 = 32'b0;  
                          k = K58;
                          w_in = w58;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;                                 
                       end
                   'd59:begin
                          w_16 = 32'b0;
                          w_15 = 32'b0;
                          w_7 = 32'b0;
                          w_2 = 32'b0;  
                          k = K59;
                          w_in = w59;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out;  
                          ready = 1'b0;                                
                       end
                   'd60:begin
                          w_16 = 32'b0;
                          w_15 = 32'b0;
                          w_7 = 32'b0;
                          w_2 = 32'b0;  
                          k = K60;
                          w_in = w60;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;                                 
                       end
                   'd61:begin
                          w_16 = 32'b0;
                          w_15 = 32'b0;
                          w_7 = 32'b0;
                          w_2 = 32'b0;  
                          k = K61;
                          w_in = w61;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;                                 
                       end
                   'd62:begin
                          w_16 = 32'b0;
                          w_15 = 32'b0;
                          w_7 = 32'b0;
                          w_2 = 32'b0;  
                          k = K62;
                          w_in = w62;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;                                 
                       end
                   'd63:begin
                          w_16 = 32'b0;
                          w_15 = 32'b0;
                          w_7 = 32'b0;
                          w_2 = 32'b0;  
                          k = K63;
                          w_in = w63;
                          a_in = a_out;
                          b_in = b_out;
                          c_in = c_out;
                          d_in = d_out;
                          e_in = e_out; 
                          f_in = f_out;
                          g_in = g_out;
                          h_in = h_out; 
                          ready = 1'b0;                                                    
                       end  
                    'd64:begin
                           if (last) begin
                             ready = 1'b1;
                           end   
                           else begin
                             ready = 1'b0;
                           end                                            
			end                                                                                                                                                                                                                                                                                     
                   default:begin
                          w_16 = 32'b0;
                          w_15 = 32'b0;
                          w_7 = 32'b0;
                          w_2 = 32'b0; 
                          ready = 1'b0;              
                       end
                   //end
               endcase
           end
           
    
    
    
endmodule




