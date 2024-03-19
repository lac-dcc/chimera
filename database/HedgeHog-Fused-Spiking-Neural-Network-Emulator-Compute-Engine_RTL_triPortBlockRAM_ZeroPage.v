//triPortBlockRAM_ZeroPage.v
//
// Author:  Jerry D. Harthcock
// Version:  1.22  May 3, 2020
// Copyright (C) 2020.  All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                    //
//                                                 SYMPL Open-Source                                                  //
//                          HedgeHog Fused Spiking Neural Network Emulator/Compute Engine                             //
//                                    Evaluation and Product Development License                                      //
//                                                                                                                    //
//                                                                                                                    //
// Open-source means:  this source code and this instruction set ("this IP") may be freely downloaded, copied,        //
// modified, distributed and used in accordance with the terms and conditons of the licenses provided herein.         //
//                                                                                                                    //
// Provided that you comply with all the terms and conditions set forth herein, Jerry D. Harthcock ("licensor"),      //
// the original author and exclusive copyright owner of this HedgeHog Fused Spiking Neural Network Emulator/Compute   //
// Engine, including related development software ("this IP"), hereby grants recipient of this IP ("licensee"),       //
// a world-wide, paid-up, non-exclusive license to implement this IP within the programmable fabric of Xilinx Kintex  //
// Ultra Plus brand FPGAs--only--and used only for the purposes of evaluation, education, and development of end      //
// products and related development tools.                                                                            //
//                                                                                                                    //
// Furthermore, limited to the purposes of prototyping, evaluation, characterization and testing of implementations   //
// in a hard, custom or semi-custom ASIC, any university or institution of higher education may have their            //
// implementation of this IP produced for said limited purposes at any foundary of their choosing provided that such  //
// prototypes do not ever wind up in commercial circulation, with this license extending to such foundary and is in   //
// connection with said academic pursuit under the supervision of said university or institution of higher education. //
//                                                                                                                    //
// Any copying, distribution, customization, modification, or derivative work of this IP must include an exact copy   //
// of this license and original copyright notice at the very top of each source file and any derived netlist, and,    //
// in the case of binaries, a printed copy of this license and/or a text format copy in a separate file distributed   //
// with said netlists or binary files having the file name, "LICENSE.txt".  You, the licensee, also agree not to      //
// remove any copyright notices from any source file covered or distributed under this Evaluation and Product         //
// Development License.                                                                                               //
//                                                                                                                    //
// LICENSOR DOES NOT WARRANT OR GUARANTEE THAT YOUR USE OF THIS IP WILL NOT INFRINGE THE RIGHTS OF OTHERS OR          //
// THAT IT IS SUITABLE OR FIT FOR ANY PURPOSE AND THAT YOU, THE LICENSEE, AGREE TO HOLD LICENSOR HARMLESS FROM        //
// ANY CLAIM BROUGHT BY YOU OR ANY THIRD PARTY FOR YOUR SUCH USE.                                                     //
//                                                                                                                    //
// Licensor reserves all his rights, including, but in no way limited to, the right to change or modify the terms     //
// and conditions of this Evaluation and Product Development License anytime without notice of any kind to anyone.    //
// By using this IP for any purpose, licensee agrees to all the terms and conditions set forth in this Evaluation     //
// and Product Development License.                                                                                   //
//                                                                                                                    //
// This Evaluation and Product Development License does not include the right to sell products that incorporate       //
// this IP or any IP derived from this IP. If you would like to obtain such a license, please contact Licensor.       //
//                                                                                                                    //
// Licensor can be contacted at:  SYMPL.gpu@gmail.com or Jerry.Harthcock@gmail.com                                    //
//                                                                                                                    //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

module triPortBlockRAM_ZeroPage #(parameter ADDRS_WIDTH = 12) (
    CLK,
    wren,
    wrsize,
    wraddrs,
    wrdata,
    rdenA,
    rdAsize,
    rdaddrsA,
    rddataA,
    rdenB,
    rdBsize,
    rdaddrsB,
    rddataB);    

input  CLK;
input  wren;
input [1:0] wrsize;
input  [ADDRS_WIDTH+2:0] wraddrs; 
input  [63:0] wrdata;                                                    
input  rdenA;                                                                      
input [1:0] rdAsize;
input  [ADDRS_WIDTH+2:0] rdaddrsA;
output [63:0] rddataA;                                     
input  rdenB;    
input [1:0] rdBsize;
input  [ADDRS_WIDTH+2:0] rdaddrsB;
output [63:0] rddataB;

reg [63:0] rddataA_aligned;
reg [63:0] rddataB_aligned;

reg selZeroA;
reg selZeroB;

wire [63:0] rddataAq;                                                                                                            
wire [63:0] rddataBq;  
wire [63:0] rddataA;                                                                                                            
wire [63:0] rddataB;  
                                                                                                          
reg [7:0] byte_sel;
reg [4:0] word_rdA_sel;                                                                              
reg [4:0] word_rdB_sel;                                                                              
reg [63:0] wrdata_aligned; 

reg collisionA_q1;     
reg collisionB_q1; 

reg [63:0] wrdataCollision;    
                                                                                                     
wire [4:0] word_wr_sel;                                                                              
assign word_wr_sel = {wrsize[1:0],  wraddrs[2:0]};

wire [ADDRS_WIDTH-1:0] wraddrs_aligned;
assign wraddrs_aligned = wraddrs[13:3];
 
wire [ADDRS_WIDTH-1:0] rdaddrsA_aligned;
assign rdaddrsA_aligned = rdaddrsA[13:3];

wire [ADDRS_WIDTH-1:0] rdaddrsB_aligned;
assign rdaddrsB_aligned = rdaddrsB[13:3];

always @(posedge CLK) begin
    collisionA_q1 <= rdenA && wren && (wraddrs_aligned==rdaddrsA_aligned);
    collisionB_q1 <= rdenB && wren && (wraddrs_aligned==rdaddrsB_aligned);
    wrdataCollision <= wrdata;
end

assign rddataA = selZeroA ? 0 : (collisionA_q1 ? wrdataCollision : rddataA_aligned);                                                                                                            
assign rddataB = selZeroB ? 0 : (collisionB_q1 ? wrdataCollision : rddataB_aligned);                                                                                                            


blockRAMx64SDP  #(.ADDRS_WIDTH(ADDRS_WIDTH))
  DataRAM_A (   
    .CLK      (CLK     ),
    .wren     (wren    ),
    .bwren    (byte_sel),
    .wraddrs  (wraddrs_aligned ),
    .wrdata   (wrdata_aligned),
    .rden     (rdenA   ),
    .rdaddrs  (rdaddrsA_aligned),
    .rddata   (rddataAq)
    );    

blockRAMx64SDP  #(.ADDRS_WIDTH(ADDRS_WIDTH))
  DataRAM_B (   
    .CLK      (CLK     ),
    .wren     (wren    ),
    .bwren    (byte_sel),
    .wraddrs  (wraddrs_aligned ),
    .wrdata   (wrdata_aligned),
    .rden     (rdenB   ),
    .rdaddrs  (rdaddrsB_aligned),
    .rddata   (rddataBq)
    );    

always@(*)                                                                                           
    case(word_rdA_sel)                                                                                
        5'b00_000 : rddataA_aligned = {56'h0000_0000_0000_00, rddataAq[7:0]};       //bytes                    
        5'b00_001 : rddataA_aligned = {56'h0000_0000_0000_00, rddataAq[15:8]};                           
        5'b00_010 : rddataA_aligned = {56'h0000_0000_0000_00, rddataAq[23:16]};  
        5'b00_011 : rddataA_aligned = {56'h0000_0000_0000_00, rddataAq[31:24]};   
        5'b00_100 : rddataA_aligned = {56'h0000_0000_0000_00, rddataAq[39:32]}; 
        5'b00_101 : rddataA_aligned = {56'h0000_0000_0000_00, rddataAq[47:40]};
        5'b00_110 : rddataA_aligned = {56'h0000_0000_0000_00, rddataAq[55:48]};
        5'b00_111 : rddataA_aligned = {56'h0000_0000_0000_00, rddataAq[63:56]};
        
        5'b01_000, 
        5'b01_001 : rddataA_aligned = {48'h0000_0000_0000, rddataAq[15:0]};         //half-words
        5'b01_010,   
        5'b01_011 : rddataA_aligned = {48'h0000_0000_0000, rddataAq[31:16]};       
        5'b01_100,  
        5'b01_101 : rddataA_aligned = {48'h0000_0000_0000, rddataAq[47:32]};
        5'b01_110,
        5'b01_111 : rddataA_aligned = {48'h0000_0000_0000, rddataAq[63:48]};
        
        5'b10_000,       
        5'b10_001,
        5'b10_010,       
        5'b10_011 : rddataA_aligned = {32'h000_0000, rddataAq[31:0]};               //words
        5'b10_100,       
        5'b10_101,       
        5'b10_110,
        5'b10_111 : rddataA_aligned = {32'h000_0000, rddataAq[63:32]}; 
        
        5'b11_000,
        5'b11_001,
        5'b11_010,       
        5'b11_011,                 
        5'b11_100,
        5'b11_101,
        5'b11_110,        
        5'b11_111 : rddataA_aligned = rddataAq[63:0];                               //double-words
    endcase
    
    
always@(*)                                                                                           
    case(word_rdB_sel)                                                                                
        5'b00_000 : rddataB_aligned = {56'h0000_0000_0000_00, rddataBq[7:0]};       //bytes                    
        5'b00_001 : rddataB_aligned = {56'h0000_0000_0000_00, rddataBq[15:8]};                           
        5'b00_010 : rddataB_aligned = {56'h0000_0000_0000_00, rddataBq[23:16]};  
        5'b00_011 : rddataB_aligned = {56'h0000_0000_0000_00, rddataBq[31:24]};   
        5'b00_100 : rddataB_aligned = {56'h0000_0000_0000_00, rddataBq[39:32]}; 
        5'b00_101 : rddataB_aligned = {56'h0000_0000_0000_00, rddataBq[47:40]};
        5'b00_110 : rddataB_aligned = {56'h0000_0000_0000_00, rddataBq[55:48]};
        5'b00_111 : rddataB_aligned = {56'h0000_0000_0000_00, rddataBq[63:56]};
        
        5'b01_000, 
        5'b01_001 : rddataB_aligned = {48'h0000_0000_0000, rddataBq[15:0]};         //half-words
        5'b01_010,   
        5'b01_011 : rddataB_aligned = {48'h0000_0000_0000, rddataBq[31:16]};       
        5'b01_100,  
        5'b01_101 : rddataB_aligned = {48'h0000_0000_0000, rddataBq[47:32]};
        5'b01_110,
        5'b01_111 : rddataB_aligned = {48'h0000_0000_0000, rddataBq[63:48]};
        
        5'b10_000,       
        5'b10_001,
        5'b10_010,       
        5'b10_011 : rddataB_aligned = {32'h000_0000, rddataBq[31:0]};               //words
        5'b10_100,       
        5'b10_101,       
        5'b10_110,
        5'b10_111 : rddataB_aligned = {32'h000_0000, rddataBq[63:32]}; 
        
        5'b11_000,
        5'b11_001,
        5'b11_010,       
        5'b11_011,                 
        5'b11_100,
        5'b11_101,
        5'b11_110,        
        5'b11_111 : rddataB_aligned = rddataBq[63:0];                               //double-words
    endcase
                                                                                                     
always@(*)                                                                                           
    case(word_wr_sel)                                                                                
        5'b00_000 : wrdata_aligned = {56'h0000_0000_0000_00, wrdata[7:0]};      //bytes                    
        5'b00_001 : wrdata_aligned = {48'h0000_0000_0000, wrdata[7:0], 8'h00};                          
        5'b00_010 : wrdata_aligned = {40'h0000_0000_00, wrdata[7:0], 16'h0000}; 
        5'b00_011 : wrdata_aligned = {32'h0000_0000, wrdata[7:0], 24'h00_0000};  
        5'b00_100 : wrdata_aligned = {24'h0000_00, wrdata[7:0], 32'h0000_0000};
        5'b00_101 : wrdata_aligned = {16'h0000, wrdata[7:0], 40'h00_0000_0000};
        5'b00_110 : wrdata_aligned = {8'h00, wrdata[7:0], 48'h0000_0000_0000};
        5'b00_111 : wrdata_aligned = {wrdata[7:0], 56'h00_0000_0000_0000};         
        
        5'b01_000, 
        5'b01_001 : wrdata_aligned = {48'h0000_0000_0000, wrdata[15:0]};       //half-words
        5'b01_010, 
        5'b01_011 : wrdata_aligned = {32'h0000_0000, wrdata[15:0], 16'h0000};      
        5'b01_100, 
        5'b01_101 : wrdata_aligned = {16'h0000, wrdata[15:0], 32'h0000_0000};
        5'b01_110,
        5'b01_111 : wrdata_aligned = {wrdata[15:0], 48'h0000_0000_0000};
        
        5'b10_000,       
        5'b10_001,
        5'b10_010,       
        5'b10_011 : wrdata_aligned = {32'h000_0000_0000, wrdata[31:0]};         //words
        5'b10_100,  
        5'b10_101,  
        5'b10_110,
        5'b10_111 : wrdata_aligned = {wrdata[31:0], 32'h000_0000_0000};   
        
        5'b11_000,
        5'b11_001,
        5'b11_010,       
        5'b11_011,                 
        5'b11_100,
        5'b11_101,
        5'b11_110,        
        5'b11_111 : wrdata_aligned = wrdata[63:0];                              //double-words
    endcase

always@(*)          
        case(word_wr_sel)
            5'b00_000 : byte_sel = 8'b00000001;        //bytes
            5'b00_001 : byte_sel = 8'b00000010;
            5'b00_010 : byte_sel = 8'b00000100;
            5'b00_011 : byte_sel = 8'b00001000;
            5'b00_100 : byte_sel = 8'b00010000;
            5'b00_101 : byte_sel = 8'b00100000;
            5'b00_110 : byte_sel = 8'b01000000;
            5'b00_111 : byte_sel = 8'b10000000;
            
            5'b01_000, 
            5'b01_001 : byte_sel = 8'b00000011;        //half-words
            5'b01_010,  
            5'b01_011 : byte_sel = 8'b00001100;
            5'b01_100,  
            5'b01_101 : byte_sel = 8'b00110000;
            5'b01_110,
            5'b01_111 : byte_sel = 8'b11000000;
            
            5'b10_000,  
            5'b10_001,
            5'b10_010,  
            5'b10_011 : byte_sel = 8'b00001111;       //words
            5'b10_100,  
            5'b10_101,  
            5'b10_110,
            5'b10_111 : byte_sel = 8'b11110000;
            
            5'b11_000,
            5'b11_001,
            5'b11_010,  
            5'b11_011,   
            5'b11_100,
            5'b11_101,
            5'b11_110,  
            5'b11_111 : byte_sel = 8'b11111111;      //double words
        endcase

always @(posedge CLK) begin
     word_rdA_sel <= {rdAsize[1:0],  rdaddrsA[2:0]};
     word_rdB_sel <= {rdBsize[1:0],  rdaddrsB[2:0]};
end

always @(posedge CLK) begin
     selZeroA <= ~|rdaddrsA[ADDRS_WIDTH+2:3];
     selZeroB <= ~|rdaddrsB[ADDRS_WIDTH+2:3];
end

endmodule
