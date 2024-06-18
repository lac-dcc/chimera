// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module PE(
    clk,
    rst,
    winRst,
    wEnFilter,
    readEnmac,
    w_r_EnMem,
    addEn,
    wrofm,
    filterCount,
    macCount,
    memOut,
    windowOut,
    ofmaddr
  );

  input clk, rst;
  input winRst, wEnFilter, readEnmac, w_r_EnMem, addEn, wrofm; 
  input [5:0] filterCount, macCount;
  input [31:0] memOut;
  input [7:0] windowOut;
  input [7:0] ofmaddr;

  wire [7:0] filterOut;
  wire [7:0] outmultipl, temp, macout;
  wire [11:0] adder_output;

  buff_16 filter (
  .clk(clk),
  .rst(rst || winRst),
  .writeEn(wEnFilter),
  .readEn(readEnmac),
  .address(filterCount),
  .main_buff_in(memOut),  
  .buff_out(filterOut)
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
  .rst(rst || wrofm),
  .sum(adder_output),
  .add_en(addEn)
  );
  
  Ofm ofm(
    .clk(clk),
    .rst(rst),
    .address(ofmaddr),
    .wrData(macout),
    .wren(wrofm)
  );

  assign temp = (macCount) ? outmultipl : 8'd0;
  assign macout = adder_output[11:4];

endmodule


