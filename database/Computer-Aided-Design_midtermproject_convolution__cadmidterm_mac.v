// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module mac(
  input clk, reset, start,
  output ready
);
  wire  writeEnbuff, w_r_EnMem, wEnFilter, wEnWindow, rEnConv, ldConvDone, addEn, winRst, wEnMem;
  wire [5:0] buffCount, filterCount, winCount, convCount;
  wire [9:0] memAddress;
  wire [5:0] buffAddress;

  DataPath dp (
             .clk(clk),
             .rst(reset),
             .wEnBuff(writeEnbuff),
             .w_r_EnMem(wEnMem),
             .wEnFilter(wEnFilter),
             .writeEnwindow(wEnWindow),
             .readEnmac(rEnConv),
             .addEn(addEn),
             .winRst(winRst),
             .filterCount(filterCount),
             .macCount(convCount),
             .memAddress(memAddress),
             .buffAddress(buffAddress)
           );

           

  Controller ct (
               .clk(clk),
               .rst(reset),
               .start(start),
               .ready(ready),
               .writeEnbuff(writeEnbuff),
               .writeEnmem(wEnMem),
               .wEnFilter(wEnFilter),
               .wEnWindow(wEnWindow),
               .rEnConv(rEnConv),
               .ldConvDone(ldConvDone),
               .addEn(addEn),
               .winRst(winRst),
               .buffCount(buffCount),
               .filterCount(filterCount),
               .winCount(winCount),
               .convCount(convCount),
               .memAddress(memAddress),
               .buffAddress(buffAddress)
             );


endmodule
