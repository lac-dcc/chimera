// random-bit generator from Thomas and Luk
// translated from rng_n2048_r64_t5_k32_sbfbaac.vhdl omitting the serial-seeding mode
// see http://cas.ee.ic.ac.uk/people/dt10/research/rngs-fpga-lut_sr.html

module rng_n2048_r64_t5_k32_sbfbaac_SR #(
  parameter K = 32,
  parameter INIT = 32'h00000000
) (
  input clk,
  input ce,
  input din,
  output dout
);

  wire [4:0] A = K-1;

  SRLC32E #(.INIT(INIT)) _srl32(.CLK(clk), .CE(ce), .A(A), .D(din), .Q(dout));

endmodule

module rng_n2048_r64_t5_k32_sbfbaac(
  input clk,
  input ce,
  output [63:0] rng
);

  wire [63:0] fifo_out;
  reg [63:0] r_out;

  assign rng[0] = r_out[42];
  assign rng[1] = r_out[7];
  assign rng[2] = r_out[56];
  assign rng[3] = r_out[5];
  assign rng[4] = r_out[60];
  assign rng[5] = r_out[1];
  assign rng[6] = r_out[48];
  assign rng[7] = r_out[2];
  assign rng[8] = r_out[12];
  assign rng[9] = r_out[61];
  assign rng[10] = r_out[8];
  assign rng[11] = r_out[62];
  assign rng[12] = r_out[16];
  assign rng[13] = r_out[50];
  assign rng[14] = r_out[40];
  assign rng[15] = r_out[63];
  assign rng[16] = r_out[32];
  assign rng[17] = r_out[33];
  assign rng[18] = r_out[19];
  assign rng[19] = r_out[57];
  assign rng[20] = r_out[34];
  assign rng[21] = r_out[49];
  assign rng[22] = r_out[21];
  assign rng[23] = r_out[11];
  assign rng[24] = r_out[15];
  assign rng[25] = r_out[43];
  assign rng[26] = r_out[20];
  assign rng[27] = r_out[47];
  assign rng[28] = r_out[31];
  assign rng[29] = r_out[30];
  assign rng[30] = r_out[9];
  assign rng[31] = r_out[26];
  assign rng[32] = r_out[13];
  assign rng[33] = r_out[35];
  assign rng[34] = r_out[59];
  assign rng[35] = r_out[0];
  assign rng[36] = r_out[6];
  assign rng[37] = r_out[55];
  assign rng[38] = r_out[36];
  assign rng[39] = r_out[54];
  assign rng[40] = r_out[27];
  assign rng[41] = r_out[53];
  assign rng[42] = r_out[24];
  assign rng[43] = r_out[22];
  assign rng[44] = r_out[58];
  assign rng[45] = r_out[39];
  assign rng[46] = r_out[18];
  assign rng[47] = r_out[3];
  assign rng[48] = r_out[37];
  assign rng[49] = r_out[4];
  assign rng[50] = r_out[17];
  assign rng[51] = r_out[23];
  assign rng[52] = r_out[28];
  assign rng[53] = r_out[46];
  assign rng[54] = r_out[41];
  assign rng[55] = r_out[29];
  assign rng[56] = r_out[25];
  assign rng[57] = r_out[45];
  assign rng[58] = r_out[44];
  assign rng[59] = r_out[14];
  assign rng[60] = r_out[52];
  assign rng[61] = r_out[10];
  assign rng[62] = r_out[51];
  assign rng[63] = r_out[38];

  always @(posedge clk)
    if (ce) begin
      r_out[0] <= fifo_out[59] ^ fifo_out[5] ^ fifo_out[0] ^ fifo_out[58] ^ fifo_out[39];
      r_out[1] <= fifo_out[1] ^ fifo_out[24] ^ fifo_out[22] ^ fifo_out[16] ^ fifo_out[18];
      r_out[2] <= fifo_out[30] ^ fifo_out[35] ^ fifo_out[2] ^ fifo_out[4] ^ fifo_out[60];
      r_out[3] <= fifo_out[3] ^ fifo_out[46] ^ fifo_out[55] ^ fifo_out[9] ^ fifo_out[13];
      r_out[4] <= fifo_out[30] ^ fifo_out[10] ^ fifo_out[4] ^ fifo_out[32] ^ fifo_out[61];
      r_out[5] <= fifo_out[62] ^ fifo_out[11] ^ fifo_out[5] ^ fifo_out[53] ^ fifo_out[35];
      r_out[6] <= fifo_out[21] ^ fifo_out[6] ^ fifo_out[14] ^ fifo_out[8];
      r_out[7] <= fifo_out[63] ^ fifo_out[4] ^ fifo_out[9] ^ fifo_out[7];
      r_out[8] <= fifo_out[59] ^ fifo_out[18] ^ fifo_out[52] ^ fifo_out[23] ^ fifo_out[8];
      r_out[9] <= fifo_out[24] ^ fifo_out[54] ^ fifo_out[32] ^ fifo_out[9] ^ fifo_out[39];
      r_out[10] <= fifo_out[10] ^ fifo_out[41] ^ fifo_out[38] ^ fifo_out[23] ^ fifo_out[13];
      r_out[11] <= fifo_out[11] ^ fifo_out[51] ^ fifo_out[54] ^ fifo_out[12] ^ fifo_out[6];
      r_out[12] <= fifo_out[44] ^ fifo_out[1] ^ fifo_out[49] ^ fifo_out[33] ^ fifo_out[12];
      r_out[13] <= fifo_out[1] ^ fifo_out[62] ^ fifo_out[12] ^ fifo_out[13];
      r_out[14] <= fifo_out[5] ^ fifo_out[35] ^ fifo_out[43] ^ fifo_out[42] ^ fifo_out[14];
      r_out[15] <= fifo_out[15] ^ fifo_out[28] ^ fifo_out[63] ^ fifo_out[6] ^ fifo_out[9];
      r_out[16] <= fifo_out[19] ^ fifo_out[57] ^ fifo_out[25] ^ fifo_out[16] ^ fifo_out[50];
      r_out[17] <= fifo_out[3] ^ fifo_out[28] ^ fifo_out[0] ^ fifo_out[33] ^ fifo_out[17];
      r_out[18] <= fifo_out[44] ^ fifo_out[20] ^ fifo_out[18] ^ fifo_out[45] ^ fifo_out[23];
      r_out[19] <= fifo_out[31] ^ fifo_out[19] ^ fifo_out[58] ^ fifo_out[32] ^ fifo_out[61];
      r_out[20] <= fifo_out[31] ^ fifo_out[20] ^ fifo_out[2] ^ fifo_out[17] ^ fifo_out[39];
      r_out[21] <= fifo_out[25] ^ fifo_out[21] ^ fifo_out[56] ^ fifo_out[55] ^ fifo_out[18];
      r_out[22] <= fifo_out[11] ^ fifo_out[22] ^ fifo_out[42] ^ fifo_out[48] ^ fifo_out[7];
      r_out[23] <= fifo_out[26] ^ fifo_out[11] ^ fifo_out[52] ^ fifo_out[23];
      r_out[24] <= fifo_out[24] ^ fifo_out[36] ^ fifo_out[52] ^ fifo_out[48] ^ fifo_out[60];
      r_out[25] <= fifo_out[3] ^ fifo_out[57] ^ fifo_out[25] ^ fifo_out[38] ^ fifo_out[50];
      r_out[26] <= fifo_out[19] ^ fifo_out[25] ^ fifo_out[26] ^ fifo_out[27] ^ fifo_out[34];
      r_out[27] <= fifo_out[3] ^ fifo_out[27] ^ fifo_out[53] ^ fifo_out[61] ^ fifo_out[7];
      r_out[28] <= fifo_out[30] ^ fifo_out[62] ^ fifo_out[28] ^ fifo_out[33] ^ fifo_out[37];
      r_out[29] <= fifo_out[15] ^ fifo_out[57] ^ fifo_out[40] ^ fifo_out[10] ^ fifo_out[29];
      r_out[30] <= fifo_out[30] ^ fifo_out[21] ^ fifo_out[49] ^ fifo_out[27] ^ fifo_out[58];
      r_out[31] <= fifo_out[31] ^ fifo_out[15] ^ fifo_out[46] ^ fifo_out[5] ^ fifo_out[20];
      r_out[32] <= fifo_out[16] ^ fifo_out[0] ^ fifo_out[32] ^ fifo_out[34] ^ fifo_out[45];
      r_out[33] <= fifo_out[21] ^ fifo_out[33] ^ fifo_out[2] ^ fifo_out[37] ^ fifo_out[17];
      r_out[34] <= fifo_out[58] ^ fifo_out[43] ^ fifo_out[42] ^ fifo_out[34];
      r_out[35] <= fifo_out[51] ^ fifo_out[55] ^ fifo_out[35] ^ fifo_out[47] ^ fifo_out[8];
      r_out[36] <= fifo_out[31] ^ fifo_out[46] ^ fifo_out[11] ^ fifo_out[36] ^ fifo_out[34];
      r_out[37] <= fifo_out[0] ^ fifo_out[41] ^ fifo_out[52] ^ fifo_out[37] ^ fifo_out[61];
      r_out[38] <= fifo_out[40] ^ fifo_out[24] ^ fifo_out[38] ^ fifo_out[37] ^ fifo_out[39];
      r_out[39] <= fifo_out[10] ^ fifo_out[27] ^ fifo_out[20] ^ fifo_out[14] ^ fifo_out[39];
      r_out[40] <= fifo_out[1] ^ fifo_out[40] ^ fifo_out[51] ^ fifo_out[54] ^ fifo_out[45];
      r_out[41] <= fifo_out[15] ^ fifo_out[41] ^ fifo_out[35] ^ fifo_out[63] ^ fifo_out[29];
      r_out[42] <= fifo_out[30] ^ fifo_out[16] ^ fifo_out[42] ^ fifo_out[6] ^ fifo_out[13];
      r_out[43] <= fifo_out[62] ^ fifo_out[43] ^ fifo_out[48] ^ fifo_out[60] ^ fifo_out[47];
      r_out[44] <= fifo_out[31] ^ fifo_out[44] ^ fifo_out[21] ^ fifo_out[53] ^ fifo_out[29];
      r_out[45] <= fifo_out[19] ^ fifo_out[27] ^ fifo_out[55] ^ fifo_out[14] ^ fifo_out[45];
      r_out[46] <= fifo_out[46] ^ fifo_out[32] ^ fifo_out[14] ^ fifo_out[47] ^ fifo_out[7];
      r_out[47] <= fifo_out[3] ^ fifo_out[12] ^ fifo_out[2] ^ fifo_out[47] ^ fifo_out[37];
      r_out[48] <= fifo_out[56] ^ fifo_out[54] ^ fifo_out[18] ^ fifo_out[48] ^ fifo_out[8];
      r_out[49] <= fifo_out[28] ^ fifo_out[59] ^ fifo_out[26] ^ fifo_out[49] ^ fifo_out[48];
      r_out[50] <= fifo_out[41] ^ fifo_out[42] ^ fifo_out[23] ^ fifo_out[50] ^ fifo_out[13];
      r_out[51] <= fifo_out[59] ^ fifo_out[25] ^ fifo_out[16] ^ fifo_out[51] ^ fifo_out[56];
      r_out[52] <= fifo_out[51] ^ fifo_out[52] ^ fifo_out[4] ^ fifo_out[29];
      r_out[53] <= fifo_out[22] ^ fifo_out[36] ^ fifo_out[53] ^ fifo_out[60] ^ fifo_out[7];
      r_out[54] <= fifo_out[57] ^ fifo_out[22] ^ fifo_out[54] ^ fifo_out[41] ^ fifo_out[33];
      r_out[55] <= fifo_out[46] ^ fifo_out[28] ^ fifo_out[55] ^ fifo_out[43] ^ fifo_out[50];
      r_out[56] <= fifo_out[44] ^ fifo_out[24] ^ fifo_out[22] ^ fifo_out[56];
      r_out[57] <= fifo_out[19] ^ fifo_out[57] ^ fifo_out[0] ^ fifo_out[43] ^ fifo_out[4];
      r_out[58] <= fifo_out[36] ^ fifo_out[58] ^ fifo_out[53] ^ fifo_out[47] ^ fifo_out[8];
      r_out[59] <= fifo_out[59] ^ fifo_out[5] ^ fifo_out[38] ^ fifo_out[17] ^ fifo_out[50];
      r_out[60] <= fifo_out[15] ^ fifo_out[10] ^ fifo_out[56] ^ fifo_out[63] ^ fifo_out[60];
      r_out[61] <= fifo_out[40] ^ fifo_out[36] ^ fifo_out[61] ^ fifo_out[45];
      r_out[62] <= fifo_out[62] ^ fifo_out[26] ^ fifo_out[49] ^ fifo_out[38] ^ fifo_out[17];
      r_out[63] <= fifo_out[1] ^ fifo_out[49] ^ fifo_out[20] ^ fifo_out[63] ^ fifo_out[2];
    end

  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h22520005)) fifo_0(clk, ce, r_out[1], fifo_out[0]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'hde5a87ed)) fifo_1(clk, ce, r_out[2], fifo_out[1]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(27),.INIT(32'h655421c1)) fifo_2(clk, ce, r_out[3], fifo_out[2]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h73515980)) fifo_3(clk, ce, r_out[4], fifo_out[3]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(30),.INIT(32'h301670f2)) fifo_4(clk, ce, r_out[5], fifo_out[4]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h7b215dc9)) fifo_5(clk, ce, r_out[6], fifo_out[5]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'he7770f59)) fifo_6(clk, ce, r_out[7], fifo_out[6]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h82081d5c)) fifo_7(clk, ce, r_out[8], fifo_out[7]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(31),.INIT(32'hd69e0401)) fifo_8(clk, ce, r_out[9], fifo_out[8]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h379fd8af)) fifo_9(clk, ce, r_out[10], fifo_out[9]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h2a8ea4df)) fifo_10(clk, ce, r_out[11], fifo_out[10]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'hc46a9858)) fifo_11(clk, ce, r_out[12], fifo_out[11]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(31),.INIT(32'h782cfffb)) fifo_12(clk, ce, r_out[13], fifo_out[12]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(30),.INIT(32'h954a7479)) fifo_13(clk, ce, r_out[14], fifo_out[13]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(27),.INIT(32'h07a3c184)) fifo_14(clk, ce, r_out[15], fifo_out[14]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h6fcf926c)) fifo_15(clk, ce, r_out[16], fifo_out[15]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h41664a6b)) fifo_16(clk, ce, r_out[17], fifo_out[16]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(29),.INIT(32'h080c2e8f)) fifo_17(clk, ce, r_out[18], fifo_out[17]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(31),.INIT(32'h52680d8b)) fifo_18(clk, ce, r_out[19], fifo_out[18]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h04edb8cb)) fifo_19(clk, ce, r_out[20], fifo_out[19]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(28),.INIT(32'h5097be70)) fifo_20(clk, ce, r_out[21], fifo_out[20]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h3064e84b)) fifo_21(clk, ce, r_out[22], fifo_out[21]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h24f65970)) fifo_22(clk, ce, r_out[23], fifo_out[22]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h691a6eec)) fifo_23(clk, ce, r_out[24], fifo_out[23]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'hb90de28e)) fifo_24(clk, ce, r_out[25], fifo_out[24]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'hb3746e14)) fifo_25(clk, ce, r_out[26], fifo_out[25]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'he2fb8b25)) fifo_26(clk, ce, r_out[27], fifo_out[26]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h797a816a)) fifo_27(clk, ce, r_out[28], fifo_out[27]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'hbb9311ca)) fifo_28(clk, ce, r_out[29], fifo_out[28]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(31),.INIT(32'h327ca771)) fifo_29(clk, ce, r_out[30], fifo_out[29]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'heb6c06ce)) fifo_30(clk, ce, r_out[31], fifo_out[30]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'hc063cccb)) fifo_31(clk, ce, r_out[32], fifo_out[31]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h2194081c)) fifo_32(clk, ce, r_out[33], fifo_out[32]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'hc7ffddff)) fifo_33(clk, ce, r_out[34], fifo_out[33]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(29),.INIT(32'h3123cd28)) fifo_34(clk, ce, r_out[35], fifo_out[34]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(31),.INIT(32'hc9272585)) fifo_35(clk, ce, r_out[36], fifo_out[35]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h90f759a2)) fifo_36(clk, ce, r_out[37], fifo_out[36]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h0efa2b80)) fifo_37(clk, ce, r_out[38], fifo_out[37]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(29),.INIT(32'hc59ce3b7)) fifo_38(clk, ce, r_out[39], fifo_out[38]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(30),.INIT(32'h88032805)) fifo_39(clk, ce, r_out[40], fifo_out[39]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h01e85974)) fifo_40(clk, ce, r_out[41], fifo_out[40]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h4f93b9f7)) fifo_41(clk, ce, r_out[42], fifo_out[41]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(27),.INIT(32'h0a6202ce)) fifo_42(clk, ce, r_out[43], fifo_out[42]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(28),.INIT(32'h5d43c00b)) fifo_43(clk, ce, r_out[44], fifo_out[43]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h8703d28b)) fifo_44(clk, ce, r_out[45], fifo_out[44]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(28),.INIT(32'h842f1e83)) fifo_45(clk, ce, r_out[46], fifo_out[45]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h4b73bdae)) fifo_46(clk, ce, r_out[47], fifo_out[46]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(31),.INIT(32'h26b3c612)) fifo_47(clk, ce, r_out[48], fifo_out[47]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(30),.INIT(32'hcccd0fc0)) fifo_48(clk, ce, r_out[49], fifo_out[48]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(30),.INIT(32'h2fdbfdfb)) fifo_49(clk, ce, r_out[50], fifo_out[49]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'ha12c649e)) fifo_50(clk, ce, r_out[51], fifo_out[50]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'hdecde209)) fifo_51(clk, ce, r_out[52], fifo_out[51]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h3f89ab4d)) fifo_52(clk, ce, r_out[53], fifo_out[52]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h677a6a8d)) fifo_53(clk, ce, r_out[54], fifo_out[53]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(28),.INIT(32'hf21a464a)) fifo_54(clk, ce, r_out[55], fifo_out[54]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(30),.INIT(32'h2eefed84)) fifo_55(clk, ce, r_out[56], fifo_out[55]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h8da3d9ab)) fifo_56(clk, ce, r_out[57], fifo_out[56]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'hd28d418d)) fifo_57(clk, ce, r_out[58], fifo_out[57]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h146876a4)) fifo_58(clk, ce, r_out[59], fifo_out[58]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'hcc5a5bef)) fifo_59(clk, ce, r_out[60], fifo_out[59]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(26),.INIT(32'h8feeee2f)) fifo_60(clk, ce, r_out[61], fifo_out[60]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h653e5c67)) fifo_61(clk, ce, r_out[62], fifo_out[61]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h71d3de20)) fifo_62(clk, ce, r_out[63], fifo_out[62]);
  rng_n2048_r64_t5_k32_sbfbaac_SR #(.K(32),.INIT(32'h2ddb9f82)) fifo_63(clk, ce, r_out[0], fifo_out[63]);

endmodule
