module UsbCrc5 (
      input  [4:0] io_crc_i,
      input  [10:0] io_data_i,
      output reg [4:0] io_crc_o);
  always @ (*) begin
    io_crc_o[0] = ((((((((io_data_i[10] ^ io_data_i[9]) ^ io_data_i[6]) ^ io_data_i[5]) ^ io_data_i[3]) ^ io_data_i[0]) ^ io_crc_i[0]) ^ io_crc_i[3]) ^ io_crc_i[4]);
    io_crc_o[1] = (((((((io_data_i[10] ^ io_data_i[7]) ^ io_data_i[6]) ^ io_data_i[4]) ^ io_data_i[1]) ^ io_crc_i[0]) ^ io_crc_i[1]) ^ io_crc_i[4]);
    io_crc_o[2] = ((((((((((((io_data_i[10] ^ io_data_i[9]) ^ io_data_i[8]) ^ io_data_i[7]) ^ io_data_i[6]) ^ io_data_i[3]) ^ io_data_i[2]) ^ io_data_i[0]) ^ io_crc_i[0]) ^ io_crc_i[1]) ^ io_crc_i[2]) ^ io_crc_i[3]) ^ io_crc_i[4]);
    io_crc_o[3] = ((((((((((io_data_i[10] ^ io_data_i[9]) ^ io_data_i[8]) ^ io_data_i[7]) ^ io_data_i[4]) ^ io_data_i[3]) ^ io_data_i[1]) ^ io_crc_i[1]) ^ io_crc_i[2]) ^ io_crc_i[3]) ^ io_crc_i[4]);
    io_crc_o[4] = ((((((((io_data_i[10] ^ io_data_i[9]) ^ io_data_i[8]) ^ io_data_i[5]) ^ io_data_i[4]) ^ io_data_i[2]) ^ io_crc_i[2]) ^ io_crc_i[3]) ^ io_crc_i[4]);
  end

endmodule

