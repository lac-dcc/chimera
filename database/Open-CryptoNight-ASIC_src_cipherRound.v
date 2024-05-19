// This program was cloned from: https://github.com/altASIC/Open-CryptoNight-ASIC
// License: Apache License 2.0

`timescale 1 ns / 1 ns

module cipherRound_mod (
   last_cipher_iteration,
   StateIn,
   Roundkey,
   StateOut);

parameter UNROLL = 1;
localparam  RKW = UNROLL * 128;

input   last_cipher_iteration;
input   [127:0] StateIn;
input   [RKW-1:0] Roundkey;
output  [127:0] StateOut;

function [7:0] SBOXf;
input[7:0] i;
case (i) // case is inferred as a lookup table
'h00: SBOXf = 8'h63; 'h01: SBOXf = 8'h7c; 'h02: SBOXf = 8'h77; 'h03: SBOXf = 8'h7b;
'h04: SBOXf = 8'hf2; 'h05: SBOXf = 8'h6b; 'h06: SBOXf = 8'h6f; 'h07: SBOXf = 8'hc5;
'h08: SBOXf = 8'h30; 'h09: SBOXf = 8'h01; 'h0a: SBOXf = 8'h67; 'h0b: SBOXf = 8'h2b;
'h0c: SBOXf = 8'hfe; 'h0d: SBOXf = 8'hd7; 'h0e: SBOXf = 8'hab; 'h0f: SBOXf = 8'h76;
'h10: SBOXf = 8'hca; 'h11: SBOXf = 8'h82; 'h12: SBOXf = 8'hc9; 'h13: SBOXf = 8'h7d;
'h14: SBOXf = 8'hfa; 'h15: SBOXf = 8'h59; 'h16: SBOXf = 8'h47; 'h17: SBOXf = 8'hf0;
'h18: SBOXf = 8'had; 'h19: SBOXf = 8'hd4; 'h1a: SBOXf = 8'ha2; 'h1b: SBOXf = 8'haf;
'h1c: SBOXf = 8'h9c; 'h1d: SBOXf = 8'ha4; 'h1e: SBOXf = 8'h72; 'h1f: SBOXf = 8'hc0;
'h20: SBOXf = 8'hb7; 'h21: SBOXf = 8'hfd; 'h22: SBOXf = 8'h93; 'h23: SBOXf = 8'h26;
'h24: SBOXf = 8'h36; 'h25: SBOXf = 8'h3f; 'h26: SBOXf = 8'hf7; 'h27: SBOXf = 8'hcc;
'h28: SBOXf = 8'h34; 'h29: SBOXf = 8'ha5; 'h2a: SBOXf = 8'he5; 'h2b: SBOXf = 8'hf1;
'h2c: SBOXf = 8'h71; 'h2d: SBOXf = 8'hd8; 'h2e: SBOXf = 8'h31; 'h2f: SBOXf = 8'h15;
'h30: SBOXf = 8'h04; 'h31: SBOXf = 8'hc7; 'h32: SBOXf = 8'h23; 'h33: SBOXf = 8'hc3;
'h34: SBOXf = 8'h18; 'h35: SBOXf = 8'h96; 'h36: SBOXf = 8'h05; 'h37: SBOXf = 8'h9a;
'h38: SBOXf = 8'h07; 'h39: SBOXf = 8'h12; 'h3a: SBOXf = 8'h80; 'h3b: SBOXf = 8'he2;
'h3c: SBOXf = 8'heb; 'h3d: SBOXf = 8'h27; 'h3e: SBOXf = 8'hb2; 'h3f: SBOXf = 8'h75;
'h40: SBOXf = 8'h09; 'h41: SBOXf = 8'h83; 'h42: SBOXf = 8'h2c; 'h43: SBOXf = 8'h1a;
'h44: SBOXf = 8'h1b; 'h45: SBOXf = 8'h6e; 'h46: SBOXf = 8'h5a; 'h47: SBOXf = 8'ha0;
'h48: SBOXf = 8'h52; 'h49: SBOXf = 8'h3b; 'h4a: SBOXf = 8'hd6; 'h4b: SBOXf = 8'hb3;
'h4c: SBOXf = 8'h29; 'h4d: SBOXf = 8'he3; 'h4e: SBOXf = 8'h2f; 'h4f: SBOXf = 8'h84;
'h50: SBOXf = 8'h53; 'h51: SBOXf = 8'hd1; 'h52: SBOXf = 8'h00; 'h53: SBOXf = 8'hed;
'h54: SBOXf = 8'h20; 'h55: SBOXf = 8'hfc; 'h56: SBOXf = 8'hb1; 'h57: SBOXf = 8'h5b;
'h58: SBOXf = 8'h6a; 'h59: SBOXf = 8'hcb; 'h5a: SBOXf = 8'hbe; 'h5b: SBOXf = 8'h39;
'h5c: SBOXf = 8'h4a; 'h5d: SBOXf = 8'h4c; 'h5e: SBOXf = 8'h58; 'h5f: SBOXf = 8'hcf;
'h60: SBOXf = 8'hd0; 'h61: SBOXf = 8'hef; 'h62: SBOXf = 8'haa; 'h63: SBOXf = 8'hfb;
'h64: SBOXf = 8'h43; 'h65: SBOXf = 8'h4d; 'h66: SBOXf = 8'h33; 'h67: SBOXf = 8'h85;
'h68: SBOXf = 8'h45; 'h69: SBOXf = 8'hf9; 'h6a: SBOXf = 8'h02; 'h6b: SBOXf = 8'h7f;
'h6c: SBOXf = 8'h50; 'h6d: SBOXf = 8'h3c; 'h6e: SBOXf = 8'h9f; 'h6f: SBOXf = 8'ha8;
'h70: SBOXf = 8'h51; 'h71: SBOXf = 8'ha3; 'h72: SBOXf = 8'h40; 'h73: SBOXf = 8'h8f;
'h74: SBOXf = 8'h92; 'h75: SBOXf = 8'h9d; 'h76: SBOXf = 8'h38; 'h77: SBOXf = 8'hf5;
'h78: SBOXf = 8'hbc; 'h79: SBOXf = 8'hb6; 'h7a: SBOXf = 8'hda; 'h7b: SBOXf = 8'h21;
'h7c: SBOXf = 8'h10; 'h7d: SBOXf = 8'hff; 'h7e: SBOXf = 8'hf3; 'h7f: SBOXf = 8'hd2;
'h80: SBOXf = 8'hcd; 'h81: SBOXf = 8'h0c; 'h82: SBOXf = 8'h13; 'h83: SBOXf = 8'hec;
'h84: SBOXf = 8'h5f; 'h85: SBOXf = 8'h97; 'h86: SBOXf = 8'h44; 'h87: SBOXf = 8'h17;
'h88: SBOXf = 8'hc4; 'h89: SBOXf = 8'ha7; 'h8a: SBOXf = 8'h7e; 'h8b: SBOXf = 8'h3d;
'h8c: SBOXf = 8'h64; 'h8d: SBOXf = 8'h5d; 'h8e: SBOXf = 8'h19; 'h8f: SBOXf = 8'h73;
'h90: SBOXf = 8'h60; 'h91: SBOXf = 8'h81; 'h92: SBOXf = 8'h4f; 'h93: SBOXf = 8'hdc;
'h94: SBOXf = 8'h22; 'h95: SBOXf = 8'h2a; 'h96: SBOXf = 8'h90; 'h97: SBOXf = 8'h88;
'h98: SBOXf = 8'h46; 'h99: SBOXf = 8'hee; 'h9a: SBOXf = 8'hb8; 'h9b: SBOXf = 8'h14;
'h9c: SBOXf = 8'hde; 'h9d: SBOXf = 8'h5e; 'h9e: SBOXf = 8'h0b; 'h9f: SBOXf = 8'hdb;
'ha0: SBOXf = 8'he0; 'ha1: SBOXf = 8'h32; 'ha2: SBOXf = 8'h3a; 'ha3: SBOXf = 8'h0a;
'ha4: SBOXf = 8'h49; 'ha5: SBOXf = 8'h06; 'ha6: SBOXf = 8'h24; 'ha7: SBOXf = 8'h5c;
'ha8: SBOXf = 8'hc2; 'ha9: SBOXf = 8'hd3; 'haa: SBOXf = 8'hac; 'hab: SBOXf = 8'h62;
'hac: SBOXf = 8'h91; 'had: SBOXf = 8'h95; 'hae: SBOXf = 8'he4; 'haf: SBOXf = 8'h79;
'hb0: SBOXf = 8'he7; 'hb1: SBOXf = 8'hc8; 'hb2: SBOXf = 8'h37; 'hb3: SBOXf = 8'h6d;
'hb4: SBOXf = 8'h8d; 'hb5: SBOXf = 8'hd5; 'hb6: SBOXf = 8'h4e; 'hb7: SBOXf = 8'ha9;
'hb8: SBOXf = 8'h6c; 'hb9: SBOXf = 8'h56; 'hba: SBOXf = 8'hf4; 'hbb: SBOXf = 8'hea;
'hbc: SBOXf = 8'h65; 'hbd: SBOXf = 8'h7a; 'hbe: SBOXf = 8'hae; 'hbf: SBOXf = 8'h08;
'hc0: SBOXf = 8'hba; 'hc1: SBOXf = 8'h78; 'hc2: SBOXf = 8'h25; 'hc3: SBOXf = 8'h2e;
'hc4: SBOXf = 8'h1c; 'hc5: SBOXf = 8'ha6; 'hc6: SBOXf = 8'hb4; 'hc7: SBOXf = 8'hc6;
'hc8: SBOXf = 8'he8; 'hc9: SBOXf = 8'hdd; 'hca: SBOXf = 8'h74; 'hcb: SBOXf = 8'h1f;
'hcc: SBOXf = 8'h4b; 'hcd: SBOXf = 8'hbd; 'hce: SBOXf = 8'h8b; 'hcf: SBOXf = 8'h8a;
'hd0: SBOXf = 8'h70; 'hd1: SBOXf = 8'h3e; 'hd2: SBOXf = 8'hb5; 'hd3: SBOXf = 8'h66;
'hd4: SBOXf = 8'h48; 'hd5: SBOXf = 8'h03; 'hd6: SBOXf = 8'hf6; 'hd7: SBOXf = 8'h0e;
'hd8: SBOXf = 8'h61; 'hd9: SBOXf = 8'h35; 'hda: SBOXf = 8'h57; 'hdb: SBOXf = 8'hb9;
'hdc: SBOXf = 8'h86; 'hdd: SBOXf = 8'hc1; 'hde: SBOXf = 8'h1d; 'hdf: SBOXf = 8'h9e;
'he0: SBOXf = 8'he1; 'he1: SBOXf = 8'hf8; 'he2: SBOXf = 8'h98; 'he3: SBOXf = 8'h11;
'he4: SBOXf = 8'h69; 'he5: SBOXf = 8'hd9; 'he6: SBOXf = 8'h8e; 'he7: SBOXf = 8'h94;
'he8: SBOXf = 8'h9b; 'he9: SBOXf = 8'h1e; 'hea: SBOXf = 8'h87; 'heb: SBOXf = 8'he9;
'hec: SBOXf = 8'hce; 'hed: SBOXf = 8'h55; 'hee: SBOXf = 8'h28; 'hef: SBOXf = 8'hdf;
'hf0: SBOXf = 8'h8c; 'hf1: SBOXf = 8'ha1; 'hf2: SBOXf = 8'h89; 'hf3: SBOXf = 8'h0d;
'hf4: SBOXf = 8'hbf; 'hf5: SBOXf = 8'he6; 'hf6: SBOXf = 8'h42; 'hf7: SBOXf = 8'h68;
'hf8: SBOXf = 8'h41; 'hf9: SBOXf = 8'h99; 'hfa: SBOXf = 8'h2d; 'hfb: SBOXf = 8'h0f;
'hfc: SBOXf = 8'hb0; 'hfd: SBOXf = 8'h54; 'hfe: SBOXf = 8'hbb; 'hff: SBOXf = 8'h16;
default: SBOXf = 0;
endcase
endfunction

function [127:0] Sbox16;
input   [127:0] In;
integer i;
reg[7:0] sbox;
begin
Sbox16 = 0;
  for (i=15;i>=0;i=i-1) begin
    sbox = In >> 8*i;
    // sbox = SBOX  >> 8*sbox;
    sbox = SBOXf(sbox);
    Sbox16 = {Sbox16, sbox};
  end
end
endfunction

// Shift

function [127:0] shift_rows;
  input [127:0] input_v;
  reg [7:0] inreg [15:0];
  reg [7:0] result [15:0];
  integer i,j;
  begin
    shift_rows = 0; // eliminate warning
    for (i=0;i<4;i=i+1) // Vector to array
      for (j=0;j<4;j=j+1)
        inreg[4*i+j] = input_v >> (i*32+j*8);
    for (i=0;i<4;i=i+1) // Shift
      for (j=0;j<4;j=j+1)
        result[4*i+j] = inreg[4*((i+j)&3)+j];
    for (i=0;i<4;i=i+1) // Array to vector
      for (j=0;j<4;j=j+1)
        shift_rows = {result[4*i+j], shift_rows} >> 8;
  end
endfunction

// Mix

function [23:0] MultByte;
input [7:0] Byte;
reg [7:0] Byte_2x;
reg [7:0] Byte_3x;
begin
  Byte_2x = Byte[7] ? (Byte << 1)^8'h1B : Byte << 1;
  Byte_3x = Byte_2x ^ Byte;
  MultByte = {Byte_3x, Byte_2x, Byte};
end
endfunction

function [31:0] MixBytes;
  input [31:0] In;
  reg [7:0] Byte0, Byte0_2x, Byte0_3x;
  reg [7:0] Byte1, Byte1_2x, Byte1_3x;
  reg [7:0] Byte2, Byte2_2x, Byte2_3x;
  reg [7:0] Byte3, Byte3_2x, Byte3_3x;
  // reg [7:0] Out [0:3];
begin
  {Byte0_3x, Byte0_2x, Byte0} = MultByte(In[7:0]);
  {Byte1_3x, Byte1_2x, Byte1} = MultByte(In[15:8]);
  {Byte2_3x, Byte2_2x, Byte2} = MultByte(In[23:16]);
  {Byte3_3x, Byte3_2x, Byte3} = MultByte(In[31:24]);
  MixBytes[7:0]   = Byte0_2x ^ Byte1_3x ^ Byte2    ^ Byte3;
  MixBytes[15:8]  = Byte0    ^ Byte1_2x ^ Byte2_3x ^ Byte3;
  MixBytes[23:16] = Byte0    ^ Byte1    ^ Byte2_2x ^ Byte3_3x;
  MixBytes[31:24] = Byte0_3x ^ Byte1    ^ Byte2    ^ Byte3_2x;
end
endfunction

function [127:0] Mix16Bytes;
input [127:0] In;
integer i;
begin
Mix16Bytes = 0;
  for (i=3;i>=0;i=i-1)
    Mix16Bytes = {Mix16Bytes, MixBytes(In >> 32*i)};
end
endfunction

// Swap

function [127:0] byteswap;
input [127:0] indata;
reg [127:0] data;
begin
  byteswap = 0; // eliminate warnings
  data = indata;
  repeat (16) begin
    byteswap = {byteswap, data[7:0]};
    data = data >> 8;
  end
end
endfunction

// Apply all transformations

function [127:0] cipherRound;
input [127:0] State;
input [127:0] Roundkey;
cipherRound = byteswap(Roundkey) ^
    Mix16Bytes(
      shift_rows(
        Sbox16(State)
    ));
endfunction

localparam N_last_iterations = 10 % UNROLL;

reg [127:0] StateOut;
integer i;
always @(*) begin
  StateOut = StateIn;
  for (i=0;i<UNROLL;i=i+1)
    if (!last_cipher_iteration || !N_last_iterations || i < N_last_iterations) begin
      // $display("%0d  i: %0d last_cipher_iteration: %b", $stime, i, last_cipher_iteration);
      StateOut = cipherRound(StateOut, Roundkey >> 128*i);
      end
  end

endmodule
