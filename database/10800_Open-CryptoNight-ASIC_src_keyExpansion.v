// This program was cloned from: https://github.com/altASIC/Open-CryptoNight-ASIC
// License: Apache License 2.0

`timescale 1 ns / 1 ns // timescale for following modules

module keyExpansion (
   clk,
   reset_l,
   run,
   Cipherkey,
   Roundkeys);

parameter OUT_WIDTH = 4; // width in 32-bit words

input         clk;
input         reset_l;
input [1:0]   run; // 1 == load 1st key, 2 = load 2nd key, 3 = iterate, 0 = don't change state
input [127:0] Cipherkey;
output reg    [OUT_WIDTH*32-1:0] Roundkeys;

// ---------------------------------------------------------------------------
//  Constants
// ---------------------------------------------------------------------------

function [7:0] RCON;
  input[3:0] i;
  begin
    case (i)
      'h0: RCON = 8'h01; 'h1: RCON = 8'h02; 'h2: RCON = 8'h04;  'h3: RCON = 8'h08; 'h4: RCON = 8'h10;
      'h5: RCON = 8'h20; 'h6: RCON = 8'h40; 'h7: RCON = 8'h80; 'h8: RCON = 8'h1B; 'h9: RCON = 8'h36;
      default: RCON = 0;
    endcase
  end
endfunction

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

//-----------------------------------------------------------------------------
//-- Calculation of round key words.
//-----------------------------------------------------------------------------
// Since the "RotWord" function only performs a byte-wise rotation of a word,
// we can perform it either before or after the "SubWord" substitution.

// reg [31:0] next_state [0:11];
reg [31:0] next_state [7:0];
reg [31:0] state [7:0];
reg [3:0] R; // Support up to 16 keys

always @(*) begin : gen_roundKeys
  reg [31:0] T;
  integer j;

  // Dispose one key

  for (j=0;j<4;j=j+1)
    next_state[j] = state[j+4];

  // SBOX

  for (j=24;j>=0;j=j-8)
    T = {T, SBOXf(state[7]>>j)};

  // Rotate and RCON

  if ((R % 2) == 0 ) begin
    T = {T, T} >> 24; // Rotate left
    T = T ^ {RCON(R/2), 24'b0};
  end

  // XORs

  for (j=0;j<4;j=j+1) begin
    T = T ^ state[j];
    next_state[4+j] = T;
  end

end

//-----------------------------------------------------------------------------
// State
//-----------------------------------------------------------------------------

always @(posedge clk or negedge reset_l) begin : flops
  integer n;
  if (!reset_l) begin
    for (n=0; n<8; n=n+1) state[n] <= 0;
    R <= 0;
  end else if (run == 1) begin
    for (n=4; n<8; n=n+1)
      state[7-n] <= Cipherkey >> (n-4) * 32;
    R <= 0;
    // $display("%0d  CipherKey0 <= %h", $stime, Cipherkey);
  end else if (run == 2) begin
    for (n=0; n<4; n=n+1)
      state[7-n] <= Cipherkey >> n * 32;
  end else if (run) begin
    for (n=0; n<8; n=n+1)
      state[n] <= next_state[n];
    R <= R + 1;
  end
end

integer j;
always @(*) begin
  Roundkeys = 0;
  for (j=0; j<OUT_WIDTH; j=j+1)
    Roundkeys = {Roundkeys, state[j]};
end

endmodule // module keyExpansion
