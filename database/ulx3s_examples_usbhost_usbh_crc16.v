module UsbCrc16 (
      input  [15:0] io_crc_i,
      input  [7:0] io_data_i,
      output reg [15:0] io_crc_o);
  wire  _zz_1_;
  wire  _zz_2_;
  assign _zz_1_ = io_data_i[0];
  assign _zz_2_ = io_data_i[1];
  always @ (*) begin
    io_crc_o[15] = (((((((((((((((io_data_i[0] ^ io_data_i[1]) ^ io_data_i[2]) ^ io_data_i[3]) ^ io_data_i[4]) ^ io_data_i[5]) ^ io_data_i[6]) ^ io_data_i[7]) ^ io_crc_i[7]) ^ io_crc_i[6]) ^ io_crc_i[5]) ^ io_crc_i[4]) ^ io_crc_i[3]) ^ io_crc_i[2]) ^ io_crc_i[1]) ^ io_crc_i[0]);
    io_crc_o[14] = (((((((((((((io_data_i[0] ^ io_data_i[1]) ^ io_data_i[2]) ^ io_data_i[3]) ^ io_data_i[4]) ^ io_data_i[5]) ^ io_data_i[6]) ^ io_crc_i[6]) ^ io_crc_i[5]) ^ io_crc_i[4]) ^ io_crc_i[3]) ^ io_crc_i[2]) ^ io_crc_i[1]) ^ io_crc_i[0]);
    io_crc_o[13] = (((io_data_i[6] ^ io_data_i[7]) ^ io_crc_i[7]) ^ io_crc_i[6]);
    io_crc_o[12] = (((io_data_i[5] ^ io_data_i[6]) ^ io_crc_i[6]) ^ io_crc_i[5]);
    io_crc_o[11] = (((io_data_i[4] ^ io_data_i[5]) ^ io_crc_i[5]) ^ io_crc_i[4]);
    io_crc_o[10] = (((io_data_i[3] ^ io_data_i[4]) ^ io_crc_i[4]) ^ io_crc_i[3]);
    io_crc_o[9] = (((io_data_i[2] ^ io_data_i[3]) ^ io_crc_i[3]) ^ io_crc_i[2]);
    io_crc_o[8] = (((io_data_i[1] ^ io_data_i[2]) ^ io_crc_i[2]) ^ io_crc_i[1]);
    io_crc_o[7] = ((((io_data_i[0] ^ io_data_i[1]) ^ io_crc_i[15]) ^ io_crc_i[1]) ^ io_crc_i[0]);
    io_crc_o[6] = ((io_data_i[0] ^ io_crc_i[14]) ^ io_crc_i[0]);
    io_crc_o[5] = io_crc_i[13];
    io_crc_o[4] = io_crc_i[12];
    io_crc_o[3] = io_crc_i[11];
    io_crc_o[2] = io_crc_i[10];
    io_crc_o[1] = io_crc_i[9];
    io_crc_o[0] = ((((((((((((((((_zz_1_ ^ _zz_2_) ^ io_data_i[2]) ^ io_data_i[3]) ^ io_data_i[4]) ^ io_data_i[5]) ^ io_data_i[6]) ^ io_data_i[7]) ^ io_crc_i[8]) ^ io_crc_i[7]) ^ io_crc_i[6]) ^ io_crc_i[5]) ^ io_crc_i[4]) ^ io_crc_i[3]) ^ io_crc_i[2]) ^ io_crc_i[1]) ^ io_crc_i[0]);
  end

endmodule

