module Test;
  
  reg clk, reset, end_sim;
  wire [63:0] inject [0:63];
  wire [63:0] eject [0:63];
  wire [63:0] push_j;
  wire [63:0] write_req_j;
  wire [63:0] j_e;
  wire [63:0] w_j_ack;
  wire [63:0] push_j_ack;
 
  Network n (clk, reset, inject[0], inject[1], inject[2], inject[3], inject[4], inject[5], inject[6], inject[7], inject[8], inject[9], inject[10], inject[11], inject[12], inject[13], inject[14], inject[15], 
                             inject[16], inject[17], inject[18], inject[19], inject[20], inject[21], inject[22], inject[23], inject[24], inject[25], inject[26], inject[27], inject[28], inject[29], inject[30], inject[31],
                             inject[32], inject[33], inject[34], inject[35], inject[36], inject[37], inject[38], inject[39], inject[40], inject[41], inject[42], inject[43], inject[44], inject[45], inject[46], inject[47],
                             inject[48], inject[49], inject[50], inject[51], inject[52], inject[53], inject[54], inject[55], inject[56], inject[57], inject[58], inject[59], inject[60], inject[61], inject[62], inject[63],
             eject[0], eject[1], eject[2], eject[3], eject[4], eject[5], eject[6], eject[7], eject[8], eject[9], eject[10], eject[11], eject[12], eject[13], eject[14], eject[15], 
                             eject[16], eject[17], eject[18], eject[19], eject[20], eject[21], eject[22], eject[23], eject[24], eject[25], eject[26], eject[27], eject[28], eject[29], eject[30], eject[31],
                             eject[32], eject[33], eject[34], eject[35], eject[36], eject[37], eject[38], eject[39], eject[40], eject[41], eject[42], eject[43], eject[44], eject[45], eject[46], eject[47],
                             eject[48], eject[49], eject[50], eject[51], eject[52], eject[53], eject[54], eject[55], eject[56], eject[57], eject[58], eject[59], eject[60], eject[61], eject[62], eject[63], 
                             push_j, write_req_j, j_e, w_j_ack, push_j_ack);
  
  Packet_gen pg0(end_sim, clk, reset, j_e[0], 3'b000, 3'b000, inject[0], push_j[0], push_j_ack[0]);
  Packet_rec ps0(clk, reset, end_sim, write_req_j[0], eject[0], w_j_ack[0], 3'b000, 3'b000);
  
  Packet_gen pg1(end_sim, clk, reset, j_e[1], 3'b001, 3'b000, inject[1], push_j[1], push_j_ack[1]);
  Packet_rec ps1(clk, reset, end_sim, write_req_j[1], eject[1], w_j_ack[1], 3'b001, 3'b000);
  
  Packet_gen pg2(end_sim, clk, reset, j_e[2], 3'b010, 3'b000, inject[2], push_j[2], push_j_ack[2]);
  Packet_rec ps2(clk, reset, end_sim, write_req_j[2], eject[2], w_j_ack[2], 3'b010, 3'b000);
  
  Packet_gen pg3(end_sim, clk, reset, j_e[3], 3'b011, 3'b000, inject[3], push_j[3], push_j_ack[3]);
  Packet_rec ps3(clk, reset, end_sim, write_req_j[3], eject[3], w_j_ack[3], 3'b011, 3'b000);
  
  Packet_gen pg4(end_sim, clk, reset, j_e[4], 3'b100, 3'b000, inject[4], push_j[4], push_j_ack[4]);
  Packet_rec ps4(clk, reset, end_sim, write_req_j[4], eject[4], w_j_ack[4], 3'b100, 3'b000);
  
  Packet_gen pg5(end_sim, clk, reset, j_e[5], 3'b101, 3'b000, inject[5], push_j[5], push_j_ack[5]);
  Packet_rec ps5(clk, reset, end_sim, write_req_j[5], eject[5], w_j_ack[5], 3'b101, 3'b000);
  
  Packet_gen pg6(end_sim, clk, reset, j_e[6], 3'b110, 3'b000, inject[6], push_j[6], push_j_ack[6]);
  Packet_rec ps6(clk, reset, end_sim, write_req_j[6], eject[6], w_j_ack[6], 3'b110, 3'b000);
  
  Packet_gen pg7(end_sim, clk, reset, j_e[7], 3'b111, 3'b000, inject[7], push_j[7], push_j_ack[7]);
  Packet_rec ps7(clk, reset, end_sim, write_req_j[7], eject[7], w_j_ack[7], 3'b111, 3'b000);
  
  Packet_gen pg8(end_sim, clk, reset, j_e[8], 3'b000, 3'b001, inject[8], push_j[8], push_j_ack[8]);
  Packet_rec ps8(clk, reset, end_sim, write_req_j[8], eject[8], w_j_ack[8], 3'b000, 3'b001);
  
  Packet_gen pg9(end_sim, clk, reset, j_e[9], 3'b001, 3'b001, inject[9], push_j[9], push_j_ack[9]);
  Packet_rec ps9(clk, reset, end_sim, write_req_j[9], eject[9], w_j_ack[9], 3'b001, 3'b001);
  
  Packet_gen pg10(end_sim, clk, reset, j_e[10], 3'b010, 3'b001, inject[10], push_j[10], push_j_ack[10]);
  Packet_rec ps10(clk, reset, end_sim, write_req_j[10], eject[10], w_j_ack[10], 3'b010, 3'b001);
  
  Packet_gen pg11(end_sim, clk, reset, j_e[11], 3'b011, 3'b001, inject[11], push_j[11], push_j_ack[11]);
  Packet_rec ps11(clk, reset, end_sim, write_req_j[11], eject[11], w_j_ack[11], 3'b011, 3'b001);
  
  Packet_gen pg12(end_sim, clk, reset, j_e[12], 3'b100, 3'b001, inject[12], push_j[12], push_j_ack[12]);
  Packet_rec ps12(clk, reset, end_sim, write_req_j[12], eject[12], w_j_ack[12], 3'b100, 3'b001);
  
  Packet_gen pg13(end_sim, clk, reset, j_e[13], 3'b101, 3'b001, inject[13], push_j[13], push_j_ack[13]);
  Packet_rec ps13(clk, reset, end_sim, write_req_j[13], eject[13], w_j_ack[13], 3'b101, 3'b001);
  
  Packet_gen pg14(end_sim, clk, reset, j_e[14], 3'b110, 3'b001, inject[14], push_j[14], push_j_ack[14]);
  Packet_rec ps14(clk, reset, end_sim, write_req_j[14], eject[14], w_j_ack[14], 3'b110, 3'b001);
  
  Packet_gen pg15(end_sim, clk, reset, j_e[15], 3'b111, 3'b001, inject[15], push_j[15], push_j_ack[15]);
  Packet_rec ps15(clk, reset, end_sim, write_req_j[15], eject[15], w_j_ack[15], 3'b111, 3'b001);
  
  Packet_gen pg16(end_sim, clk, reset, j_e[16], 3'b000, 3'b010, inject[16], push_j[16], push_j_ack[16]);
  Packet_rec ps16(clk, reset, end_sim, write_req_j[16], eject[16], w_j_ack[16], 3'b000, 3'b010);
  
  Packet_gen pg17(end_sim, clk, reset, j_e[17], 3'b001, 3'b010, inject[17], push_j[17], push_j_ack[17]);
  Packet_rec ps17(clk, reset, end_sim, write_req_j[17], eject[17], w_j_ack[17], 3'b001, 3'b010);
  
  Packet_gen pg18(end_sim, clk, reset, j_e[18], 3'b010, 3'b010, inject[18], push_j[18], push_j_ack[18]);
  Packet_rec ps18(clk, reset, end_sim, write_req_j[18], eject[18], w_j_ack[18], 3'b010, 3'b010);
  
  Packet_gen pg19(end_sim, clk, reset, j_e[19], 3'b011, 3'b010, inject[19], push_j[19], push_j_ack[19]);
  Packet_rec ps19(clk, reset, end_sim, write_req_j[19], eject[19], w_j_ack[19], 3'b011, 3'b010);
  
  Packet_gen pg20(end_sim, clk, reset, j_e[20], 3'b100, 3'b010, inject[20], push_j[20], push_j_ack[20]);
  Packet_rec ps20(clk, reset, end_sim, write_req_j[20], eject[20], w_j_ack[20], 3'b100, 3'b010);
  
  Packet_gen pg21(end_sim, clk, reset, j_e[21], 3'b101, 3'b010, inject[21], push_j[21], push_j_ack[21]);
  Packet_rec ps21(clk, reset, end_sim, write_req_j[21], eject[21], w_j_ack[21], 3'b101, 3'b010);
  
  Packet_gen pg22(end_sim, clk, reset, j_e[22], 3'b110, 3'b010, inject[22], push_j[22], push_j_ack[22]);
  Packet_rec ps22(clk, reset, end_sim, write_req_j[22], eject[22], w_j_ack[22], 3'b110, 3'b010);
  
  Packet_gen pg23(end_sim, clk, reset, j_e[23], 3'b111, 3'b010, inject[23], push_j[23], push_j_ack[23]);
  Packet_rec ps23(clk, reset, end_sim, write_req_j[23], eject[23], w_j_ack[23], 3'b111, 3'b010);
  
  Packet_gen pg24(end_sim, clk, reset, j_e[24], 3'b000, 3'b011, inject[24], push_j[24], push_j_ack[24]);
  Packet_rec ps24(clk, reset, end_sim, write_req_j[24], eject[24], w_j_ack[24], 3'b000, 3'b011);
  
  Packet_gen pg25(end_sim, clk, reset, j_e[25], 3'b001, 3'b011, inject[25], push_j[25], push_j_ack[25]);
  Packet_rec ps25(clk, reset, end_sim, write_req_j[25], eject[25], w_j_ack[25], 3'b001, 3'b011);
  
  Packet_gen pg26(end_sim, clk, reset, j_e[26], 3'b010, 3'b011, inject[26], push_j[26], push_j_ack[26]);
  Packet_rec ps26(clk, reset, end_sim, write_req_j[26], eject[26], w_j_ack[26], 3'b010, 3'b011);
  
  Packet_gen pg27(end_sim, clk, reset, j_e[27], 3'b011, 3'b011, inject[27], push_j[27], push_j_ack[27]);
  Packet_rec ps27(clk, reset, end_sim, write_req_j[27], eject[27], w_j_ack[27], 3'b011, 3'b011);
  
  Packet_gen pg28(end_sim, clk, reset, j_e[28], 3'b100, 3'b011, inject[28], push_j[28], push_j_ack[28]);
  Packet_rec ps28(clk, reset, end_sim, write_req_j[28], eject[28], w_j_ack[28], 3'b100, 3'b011);
  
  Packet_gen pg29(end_sim, clk, reset, j_e[29], 3'b101, 3'b011, inject[29], push_j[29], push_j_ack[29]);
  Packet_rec ps29(clk, reset, end_sim, write_req_j[29], eject[29], w_j_ack[29], 3'b101, 3'b011);
  
  Packet_gen pg30(end_sim, clk, reset, j_e[30], 3'b110, 3'b011, inject[30], push_j[30], push_j_ack[30]);
  Packet_rec ps30(clk, reset, end_sim, write_req_j[30], eject[30], w_j_ack[30], 3'b110, 3'b011);
  
  Packet_gen pg31(end_sim, clk, reset, j_e[31], 3'b111, 3'b011, inject[31], push_j[31], push_j_ack[31]);
  Packet_rec ps31(clk, reset, end_sim, write_req_j[31], eject[31], w_j_ack[31], 3'b111, 3'b011);
  
  Packet_gen pg32(end_sim, clk, reset, j_e[32], 3'b000, 3'b100, inject[32], push_j[32], push_j_ack[32]);
  Packet_rec ps32(clk, reset, end_sim, write_req_j[32], eject[32], w_j_ack[32], 3'b000, 3'b100);
  
  Packet_gen pg33(end_sim, clk, reset, j_e[33], 3'b001, 3'b100, inject[33], push_j[33], push_j_ack[33]);
  Packet_rec ps33(clk, reset, end_sim, write_req_j[33], eject[33], w_j_ack[33], 3'b001, 3'b100);
  
  Packet_gen pg34(end_sim, clk, reset, j_e[34], 3'b010, 3'b100, inject[34], push_j[34], push_j_ack[34]);
  Packet_rec ps34(clk, reset, end_sim, write_req_j[34], eject[34], w_j_ack[34], 3'b010, 3'b100);
  
  Packet_gen pg35(end_sim, clk, reset, j_e[35], 3'b011, 3'b100, inject[35], push_j[35], push_j_ack[35]);
  Packet_rec ps35(clk, reset, end_sim, write_req_j[35], eject[35], w_j_ack[35], 3'b011, 3'b100);
  
  Packet_gen pg36(end_sim, clk, reset, j_e[36], 3'b100, 3'b100, inject[36], push_j[36], push_j_ack[36]);
  Packet_rec ps36(clk, reset, end_sim, write_req_j[36], eject[36], w_j_ack[36], 3'b100, 3'b100);
  
  Packet_gen pg37(end_sim, clk, reset, j_e[37], 3'b101, 3'b100, inject[37], push_j[37], push_j_ack[37]);
  Packet_rec ps37(clk, reset, end_sim, write_req_j[37], eject[37], w_j_ack[37], 3'b101, 3'b100);
  
  Packet_gen pg38(end_sim, clk, reset, j_e[38], 3'b110, 3'b100, inject[38], push_j[38], push_j_ack[38]);
  Packet_rec ps38(clk, reset, end_sim, write_req_j[38], eject[38], w_j_ack[38], 3'b110, 3'b100);
  
  Packet_gen pg39(end_sim, clk, reset, j_e[39], 3'b111, 3'b100, inject[39], push_j[39], push_j_ack[39]);
  Packet_rec ps39(clk, reset, end_sim, write_req_j[39], eject[39], w_j_ack[39], 3'b111, 3'b100);
  
  Packet_gen pg40(end_sim, clk, reset, j_e[40], 3'b000, 3'b101, inject[40], push_j[40], push_j_ack[40]);
  Packet_rec ps40(clk, reset, end_sim, write_req_j[40], eject[40], w_j_ack[40], 3'b000, 3'b101);
  
  Packet_gen pg41(end_sim, clk, reset, j_e[41], 3'b001, 3'b101, inject[41], push_j[41], push_j_ack[41]);
  Packet_rec ps41(clk, reset, end_sim, write_req_j[41], eject[41], w_j_ack[41], 3'b001, 3'b101);
  
  Packet_gen pg42(end_sim, clk, reset, j_e[42], 3'b010, 3'b101, inject[42], push_j[42], push_j_ack[42]);
  Packet_rec ps42(clk, reset, end_sim, write_req_j[42], eject[42], w_j_ack[42], 3'b010, 3'b101);
  
  Packet_gen pg43(end_sim, clk, reset, j_e[43], 3'b011, 3'b101, inject[43], push_j[43], push_j_ack[43]);
  Packet_rec ps43(clk, reset, end_sim, write_req_j[43], eject[43], w_j_ack[43], 3'b011, 3'b101);
  
  Packet_gen pg44(end_sim, clk, reset, j_e[44], 3'b100, 3'b101, inject[44], push_j[44], push_j_ack[44]);
  Packet_rec ps44(clk, reset, end_sim, write_req_j[44], eject[44], w_j_ack[44], 3'b100, 3'b101);
  
  Packet_gen pg45(end_sim, clk, reset, j_e[45], 3'b101, 3'b101, inject[45], push_j[45], push_j_ack[45]);
  Packet_rec ps45(clk, reset, end_sim, write_req_j[45], eject[45], w_j_ack[45], 3'b101, 3'b101);
  
  Packet_gen pg46(end_sim, clk, reset, j_e[46], 3'b110, 3'b101, inject[46], push_j[46], push_j_ack[46]);
  Packet_rec ps46(clk, reset, end_sim, write_req_j[46], eject[46], w_j_ack[46], 3'b110, 3'b101);
  
  Packet_gen pg47(end_sim, clk, reset, j_e[47], 3'b111, 3'b101, inject[47], push_j[47], push_j_ack[47]);
  Packet_rec ps47(clk, reset, end_sim, write_req_j[47], eject[47], w_j_ack[47], 3'b111, 3'b101);
  
  Packet_gen pg48(end_sim, clk, reset, j_e[48], 3'b000, 3'b110, inject[48], push_j[48], push_j_ack[48]);
  Packet_rec ps48(clk, reset, end_sim, write_req_j[48], eject[48], w_j_ack[48], 3'b000, 3'b110);
  
  Packet_gen pg49(end_sim, clk, reset, j_e[49], 3'b001, 3'b110, inject[49], push_j[49], push_j_ack[49]);
  Packet_rec ps49(clk, reset, end_sim, write_req_j[49], eject[49], w_j_ack[49], 3'b001, 3'b110);
  
  Packet_gen pg50(end_sim, clk, reset, j_e[50], 3'b010, 3'b110, inject[50], push_j[50], push_j_ack[50]);
  Packet_rec ps50(clk, reset, end_sim, write_req_j[50], eject[50], w_j_ack[50], 3'b010, 3'b110);
  
  Packet_gen pg51(end_sim, clk, reset, j_e[51], 3'b011, 3'b110, inject[51], push_j[51], push_j_ack[51]);
  Packet_rec ps51(clk, reset, end_sim, write_req_j[51], eject[51], w_j_ack[51], 3'b011, 3'b110);
  
  Packet_gen pg52(end_sim, clk, reset, j_e[52], 3'b100, 3'b110, inject[52], push_j[52], push_j_ack[52]);
  Packet_rec ps52(clk, reset, end_sim, write_req_j[52], eject[52], w_j_ack[52], 3'b100, 3'b110);
  
  Packet_gen pg53(end_sim, clk, reset, j_e[53], 3'b101, 3'b110, inject[53], push_j[53], push_j_ack[53]);
  Packet_rec ps53(clk, reset, end_sim, write_req_j[53], eject[53], w_j_ack[53], 3'b101, 3'b110);
  
  Packet_gen pg54(end_sim, clk, reset, j_e[54], 3'b110, 3'b110, inject[54], push_j[54], push_j_ack[54]);
  Packet_rec ps54(clk, reset, end_sim, write_req_j[54], eject[54], w_j_ack[54], 3'b110, 3'b110);
  
  Packet_gen pg55(end_sim, clk, reset, j_e[55], 3'b111, 3'b110, inject[55], push_j[55], push_j_ack[55]);
  Packet_rec ps55(clk, reset, end_sim, write_req_j[55], eject[55], w_j_ack[55], 3'b111, 3'b110);
  
  Packet_gen pg56(end_sim, clk, reset, j_e[56], 3'b000, 3'b111, inject[56], push_j[56], push_j_ack[56]);
  Packet_rec ps56(clk, reset, end_sim, write_req_j[56], eject[56], w_j_ack[56], 3'b000, 3'b111);
  
  Packet_gen pg57(end_sim, clk, reset, j_e[57], 3'b001, 3'b111, inject[57], push_j[57], push_j_ack[57]);
  Packet_rec ps57(clk, reset, end_sim, write_req_j[57], eject[57], w_j_ack[57], 3'b001, 3'b111);
  
  Packet_gen pg58(end_sim, clk, reset, j_e[58], 3'b010, 3'b111, inject[58], push_j[58], push_j_ack[58]);
  Packet_rec ps58(clk, reset, end_sim, write_req_j[58], eject[58], w_j_ack[58], 3'b010, 3'b111);
  
  Packet_gen pg59(end_sim, clk, reset, j_e[59], 3'b011, 3'b111, inject[59], push_j[59], push_j_ack[59]);
  Packet_rec ps59(clk, reset, end_sim, write_req_j[59], eject[59], w_j_ack[59], 3'b011, 3'b111);
  
  Packet_gen pg60(end_sim, clk, reset, j_e[60], 3'b100, 3'b111, inject[60], push_j[60], push_j_ack[60]);
  Packet_rec ps60(clk, reset, end_sim, write_req_j[60], eject[60], w_j_ack[60], 3'b100, 3'b111);
  
  Packet_gen pg61(end_sim, clk, reset, j_e[61], 3'b101, 3'b111, inject[61], push_j[61], push_j_ack[61]);
  Packet_rec ps61(clk, reset, end_sim, write_req_j[61], eject[61], w_j_ack[61], 3'b101, 3'b111);
  
  Packet_gen pg62(end_sim, clk, reset, j_e[62], 3'b110, 3'b111, inject[62], push_j[62], push_j_ack[62]);
  Packet_rec ps62(clk, reset, end_sim, write_req_j[62], eject[62], w_j_ack[62], 3'b110, 3'b111);
  
  Packet_gen pg63(end_sim, clk, reset, j_e[63], 3'b111, 3'b111, inject[63], push_j[63], push_j_ack[63]);
  Packet_rec ps63(clk, reset, end_sim, write_req_j[63], eject[63], w_j_ack[63], 3'b111, 3'b111);
  
  
  initial
  begin
    reset = 1;
    end_sim = 0;
    #6
    reset = 0;
    #500000
    end_sim = 1;
    #10
    $stop();
  end

  
 
  
  always
  begin
    clk = 0;
    #5
    clk = 1;
    #5
    clk = 0;
  end
  
endmodule
