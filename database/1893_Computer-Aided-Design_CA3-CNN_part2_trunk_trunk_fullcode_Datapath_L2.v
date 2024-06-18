// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module DataPath_L2 (
    input clk, rst,
    input [31:0] Dataofm1,Dataofm2,Dataofm3,Dataofm4,

    input wEnBuff , writeEnwindow, readEnmac, addEn, winRst,wrofm, //new
    input [5:0] filterCount, macCount,
    input [5:0] buffAddress,
    input [7:0] ofmaddr, 
    input [3:0] wEnFilter
); 

wire [7:0] macout1;
wire [7:0] macout2;
wire [7:0] macout3;
wire [7:0] macout4;
wire [127:0] pic;

assign pic = {Dataofm4,Dataofm3,Dataofm2,Dataofm1};


PE_l2 p1(
    .clk(clk),
    .rst(rst),
    .winRst(winRst),
    .wEnFilter(wEnFilter),
    .readEnmac(readEnmac),
    .addEn(addEn),
    .wrofm(wrofm),
    .filterCount(filterCount),
    .macCount(macCount),
    .kernel(Dataofm1),
    .pic(pic),
    .macout(macout1),
    .wEnBuff(wEnBuff),
    .writeEnwindow(writeEnwindow),
    .buffAddress(buffAddress)
    );

    PE_l2 p2(
    .clk(clk),
    .rst(rst),
    .winRst(winRst),
    .wEnFilter(wEnFilter),
    .readEnmac(readEnmac),
    .addEn(addEn),
    .wrofm(wrofm),
    .filterCount(filterCount),
    .macCount(macCount),
    .kernel(Dataofm2),
    .pic(pic),
    .macout(macout2),
    .wEnBuff(wEnBuff),
    .writeEnwindow(writeEnwindow),
    .buffAddress(buffAddress)
    );

    PE_l2 p3(
    .clk(clk),
    .rst(rst),
    .winRst(winRst),
    .wEnFilter(wEnFilter),
    .readEnmac(readEnmac),
    .addEn(addEn),
    .wrofm(wrofm),
    .filterCount(filterCount),
    .macCount(macCount),
    .kernel(Dataofm3),
    .pic(pic),
    .macout(macout3),
    .wEnBuff(wEnBuff),
    .writeEnwindow(writeEnwindow),
    .buffAddress(buffAddress)
    );

    PE_l2 p4(
    .clk(clk),
    .rst(rst),
    .winRst(winRst),
    .wEnFilter(wEnFilter),
    .readEnmac(readEnmac),
    .addEn(addEn),
    .wrofm(wrofm),
    .filterCount(filterCount),
    .macCount(macCount),
    .kernel(Dataofm4),
    .pic(pic),
    .macout(macout4),
    .wEnBuff(wEnBuff),
    .writeEnwindow(writeEnwindow),
    .buffAddress(buffAddress)
    );


  Ofm ofml2_1(
    .clk(clk),
    .rst(rst),
    .address(ofmaddr),
    .wrData(macout1),
    .wren(wrofm)
  );


  Ofm ofml2_2(
    .clk(clk),
    .rst(rst),
    .address(ofmaddr),
    .wrData(macout2),
    .wren(wrofm)
  );

  Ofm ofml2_3(
    .clk(clk),
    .rst(rst),
    .address(ofmaddr),
    .wrData(macout3),
    .wren(wrofm)
  );

  Ofm ofml2_4(
    .clk(clk),
    .rst(rst),
    .address(ofmaddr),
    .wrData(macout4),
    .wren(wrofm)
  );


endmodule



