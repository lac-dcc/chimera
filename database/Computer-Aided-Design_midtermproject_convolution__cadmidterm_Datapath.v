// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module DataPath (
    input clk, rst,
    input wEnBuff, w_r_EnMem , wEnFilter, writeEnwindow, readEnmac, addEn, winRst,
    input [5:0] filterCount, macCount,
    input [9:0] memAddress,
    input [5:0] buffAddress
);

wire [7:0] macout, temp, filterOut, windowOut, outmultipl;
wire [7:0] buffOut [0:3];
wire [31:0] memOut;
wire [11:0] adder_output;

memory mem (
   .clk(clk),
   .rst(rst),
   .w_r_en(w_r_EnMem),
   .memAdr(memAddress),
   .writeData(macout),
   .readData(memOut)
);

main_buff main_buffer (
  .clk(clk),
  .rst(rst),
  .writeEn(wEnBuff),
  .address(buffAddress),
  .memory_input(memOut),
  .buff_out(buffOut)
);

buff_16 filter (
  .clk(clk),
  .rst(rst || winRst),
  .writeEn(wEnFilter),
  .readEn(readEnmac),
  .address(filterCount),
  .main_buff_in(memOut),  
  .buff_out(filterOut)
);

shift_buffer pic_buff (  
  .clk(clk),
  .rst(rst),
  .writeEn(writeEnwindow),
  .readEn(readEnmac),
  .main_input(buffOut),
  .sb_out(windowOut)
);

multiplier multplr (
  .a(filterOut),
  .b(windowOut),
  .result(outmultipl)
);

adder addr (
  .a(adder_output),
  .b(temp),
  .clk(clk),
  .rst(rst || wEnMem),
  .sum(adder_output),
  .add_en(addEn)
);

assign temp = (macCount) ? outmultipl : 8'd0;
assign macout = adder_output[11:4];
endmodule
