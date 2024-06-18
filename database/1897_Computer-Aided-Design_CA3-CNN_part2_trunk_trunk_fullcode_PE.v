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
    macout
  );

  input clk, rst;
  input winRst, wEnFilter, readEnmac, w_r_EnMem, addEn, wrofm; 
  input [5:0] filterCount, macCount;
  input [31:0] memOut;
  input [7:0] windowOut;
  output [7:0] macout;

  wire [7:0] filterOut;
  wire [7:0] outmultipl, temp;
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
  
  assign temp = (macCount) ? outmultipl : 8'd0;
  assign macout = adder_output[11:4];

endmodule



module PE_l2(
    clk,
    rst,
    winRst,
    wEnFilter,
    readEnmac,
    addEn,
    wrofm,
    filterCount,
    macCount,
    kernel,//
    pic, //
    macout,
    wEnBuff,
    writeEnwindow,
    buffAddress
  );

  input clk, rst;
  input winRst, readEnmac, addEn, wrofm,wEnBuff, writeEnwindow; 
  input [5:0]buffAddress;
  input [3:0] wEnFilter;
  input [5:0] filterCount, macCount;
  input [31:0] kernel;
  input [127:0] pic;
  output [7:0] macout;

  wire [7:0] filterOut1;
  wire [7:0] filterOut2;
  wire [7:0] filterOut3;
  wire [7:0] filterOut4;

  wire [7:0] outmultipl1, temp1;
  wire [7:0] outmultipl2, temp2;
  wire [7:0] outmultipl3, temp3;
  wire [7:0] outmultipl4, temp4;

  wire [11:0] adder_output1;
  wire [11:0] adder_output2;
  wire [11:0] adder_output3;
  wire [11:0] adder_output4;

  wire [7:0] buffOut1 [0:3];
  wire [7:0] buffOut2 [0:3];
  wire [7:0] buffOut3 [0:3];
  wire [7:0] buffOut4 [0:3];

  wire [7:0]  windowOut1;
  wire [7:0]  windowOut2;
  wire [7:0]  windowOut3;
  wire [7:0]  windowOut4;


  main_buff main_buffer1 (
  .clk(clk),
  .rst(rst),
  .writeEn(wEnBuff),
  .address(buffAddress),
  .memory_input(pic[31:0]),
  .buff_out(buffOut1)
);

  main_buff main_buffer2 (
  .clk(clk),
  .rst(rst),
  .writeEn(wEnBuff),
  .address(buffAddress),
  .memory_input(pic[63:32]),
  .buff_out(buffOut2)
);

  main_buff main_buffer3 (
  .clk(clk),
  .rst(rst),
  .writeEn(wEnBuff),
  .address(buffAddress),
  .memory_input(pic[95:64]),
  .buff_out(buffOut3)
);

  main_buff main_buffer4 (
  .clk(clk),
  .rst(rst),
  .writeEn(wEnBuff),
  .address(buffAddress),
  .memory_input(pic[127:96]),
  .buff_out(buffOut4)
);

shift_buffer pic_buff1 (  
  .clk(clk),
  .rst(rst),
  .writeEn(writeEnwindow),
  .readEn(readEnmac),
  .main_input(buffOut1),
  .sb_out(windowOut1)
);

shift_buffer pic_buff2 (  
  .clk(clk),
  .rst(rst),
  .writeEn(writeEnwindow),
  .readEn(readEnmac),
  .main_input(buffOut2),
  .sb_out(windowOut2)
);

shift_buffer pic_buff3 (  
  .clk(clk),
  .rst(rst),
  .writeEn(writeEnwindow),
  .readEn(readEnmac),
  .main_input(buffOut3),
  .sb_out(windowOut3)
);

shift_buffer pic_buff4 (  
  .clk(clk),
  .rst(rst),
  .writeEn(writeEnwindow),
  .readEn(readEnmac),
  .main_input(buffOut4),
  .sb_out(windowOut4)
);

  buff_16 filter1 (
  .clk(clk),
  .rst(rst || winRst),
  .writeEn(wEnFilter[0]),
  .readEn(readEnmac),
  .address(filterCount),
  .main_buff_in(kernel),  
  .buff_out(filterOut1)
    );

  buff_16 filter2 (
  .clk(clk),
  .rst(rst || winRst),
  .writeEn(wEnFilter[1]),
  .readEn(readEnmac),
  .address(filterCount),
  .main_buff_in(kernel),  
  .buff_out(filterOut2)
    );
  
  buff_16 filter3 (
  .clk(clk),
  .rst(rst || winRst),
  .writeEn(wEnFilter[2]),
  .readEn(readEnmac),
  .address(filterCount),
  .main_buff_in(kernel),  
  .buff_out(filterOut3)
    );

  buff_16 filter4 (
  .clk(clk),
  .rst(rst || winRst),
  .writeEn(wEnFilter[3]),
  .readEn(readEnmac),
  .address(filterCount),
  .main_buff_in(kernel),  
  .buff_out(filterOut4)
    );

  multiplier multplr1 (
  .a(filterOut1),
  .b(windowOut1),
  .result(outmultipl1)
  );

  multiplier multplr2 (
  .a(filterOut2),
  .b(windowOut2),
  .result(outmultipl2)
  );

  multiplier multplr3 (
  .a(filterOut3),
  .b(windowOut3),
  .result(outmultipl3)
  );

  multiplier multplr4 (
  .a(filterOut4),
  .b(windowOut4),
  .result(outmultipl4)
  );

  adder addr1 (
  .a(adder_output1),
  .b(temp1),
  .clk(clk),
  .rst(rst || wrofm),
  .sum(adder_output1),
  .add_en(addEn)
  );

  adder addr2 (
  .a(adder_output2),
  .b(temp2),
  .clk(clk),
  .rst(rst || wrofm),
  .sum(adder_output2),
  .add_en(addEn)
  );
  adder addr3 (
  .a(adder_output3),
  .b(temp3),
  .clk(clk),
  .rst(rst || wrofm),
  .sum(adder_output3),
  .add_en(addEn)
  );
  adder addr4 (
  .a(adder_output4),
  .b(temp4),
  .clk(clk),
  .rst(rst || wrofm),
  .sum(adder_output4),
  .add_en(addEn)
  );
  
  assign temp1 = (macCount) ? outmultipl1 : 8'd0;
  assign temp2 = (macCount) ? outmultipl2 : 8'd0;
  assign temp3 = (macCount) ? outmultipl3 : 8'd0;
  assign temp4 = (macCount) ? outmultipl4 : 8'd0;

  adder_l2 addrl2(
    .a(adder_output1),
    .b(adder_output2),
    .c(adder_output3),
    .d(adder_output4),
    .sum(macout)
  );

  // assign macout = adder_output[11:4];

endmodule






