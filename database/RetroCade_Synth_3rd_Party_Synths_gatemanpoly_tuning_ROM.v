// dual tuning ROM.  
// 12 notes represented.  Used with interpolator for variable NCO tuning
// addr is the scale note number from 0 to 11

module tuning_ROM (addr, out_hi, out_lo);
  input [3:0] addr;
  output [17:0] out_hi;
  output [17:0] out_lo;
  wire [3:0] addr;
  wire [17:0] out_hi;
  wire [17:0] out_lo;

  assign out_hi[17] = 1'b0;
  assign out_lo[17] = 1'b0;

  LUT4 #(.INIT(16'b0000000011110110)) tunROMhi05 ( .O(out_hi[0]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000100011000100)) tunROMhi06 ( .O(out_hi[1]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000100111010010)) tunROMhi07 ( .O(out_hi[2]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000000100010011)) tunROMhi08 ( .O(out_hi[3]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000100011001011)) tunROMhi09 ( .O(out_hi[4]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000010101011001)) tunROMhi10 ( .O(out_hi[5]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000000000011000)) tunROMhi11 ( .O(out_hi[6]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000111011111110)) tunROMhi12 ( .O(out_hi[7]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000011011011011)) tunROMhi13 ( .O(out_hi[8]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000110011001100)) tunROMhi14 ( .O(out_hi[9]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000001001101111)) tunROMhi15 ( .O(out_hi[10]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000111000100101)) tunROMhi16 ( .O(out_hi[11]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000010010110110)) tunROMhi17 ( .O(out_hi[12]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000011100111000)) tunROMhi18 ( .O(out_hi[13]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000011111000000)) tunROMhi19 ( .O(out_hi[14]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000011111111111)) tunROMhi20 ( .O(out_hi[15]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000100000000000)) tunROMhi21 ( .O(out_hi[16]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );

  LUT4 #(.INIT(16'b0000100000100011)) tunROMlo05 ( .O(out_lo[0]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000011110110110)) tunROMlo06 ( .O(out_lo[1]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000011100111011)) tunROMlo07 ( .O(out_lo[2]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000111100101101)) tunROMlo08 ( .O(out_lo[3]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000001010010001)) tunROMlo09 ( .O(out_lo[4]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000010010110100)) tunROMlo10 ( .O(out_lo[5]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000101111001100)) tunROMlo11 ( .O(out_lo[6]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000001000110000)) tunROMlo12 ( .O(out_lo[7]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000111110110111)) tunROMlo13 ( .O(out_lo[8]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000101110011000)) tunROMlo14 ( .O(out_lo[9]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000011011011111)) tunROMlo15 ( .O(out_lo[10]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000111001001010)) tunROMlo16 ( .O(out_lo[11]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000101101101100)) tunROMlo17 ( .O(out_lo[12]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000110001110000)) tunROMlo18 ( .O(out_lo[13]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000111110000000)) tunROMlo19 ( .O(out_lo[14]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000111111111111)) tunROMlo20 ( .O(out_lo[15]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );
  LUT4 #(.INIT(16'b0000000000000000)) tunROMlo21 ( .O(out_lo[16]), .I0(addr[0]), .I1(addr[1]), .I2(addr[2]), .I3(addr[3]) );

endmodule

