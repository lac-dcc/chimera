// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module mac #(parameter N)(
  input clk, reset, start,
  output ready
);
  wire  writeEnbuff, w_r_EnMem, wEnWindow, rEnConv, ldConvDone, addEn, winRst, wEnMem, wrofm;
  wire [5:0] buffCount, filterCount, winCount, convCount;
  wire [9:0] memAddress;
  wire [5:0] buffAddress;
  wire [9:0] ofmaddr;
  wire [N-1:0]wEnFilter;
  wire [31:0] Dataofm1,Dataofm2,Dataofm3,Dataofm4;

  //l2 signals
  wire writeEnbuff_l2,wEnWindow_l2,rEnConv_l2,addEN_l2,winRst_l2,wrofm_l2;
  wire [3:0]wEnFilter_l2;
  wire [5:0]filterCount_l2, convCount_l2, buffAddress_l2;
  wire [7:0] ofmaddr_l2;




//give parameter
  DataPath #(.N(N)) dp(
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
             .buffAddress(buffAddress),
             //new
             .wrofm(wrofm),
             .ofmaddr(ofmaddr),
             .Dataofm1(Dataofm1),
             .Dataofm2(Dataofm2),
             .Dataofm3(Dataofm3),
             .Dataofm4(Dataofm4)
           );
    
  DataPath_L2 dp_l2(
           .clk(clk),
           .rst(reset),
           .Dataofm1(Dataofm1),
           .Dataofm2(Dataofm2),
           .Dataofm3(Dataofm3),
           .Dataofm4(Dataofm4),

           .wEnBuff(writeEnbuff_l2),
           .wEnFilter(wEnFilter_l2),
           .writeEnwindow(wEnWindow_l2),
           .readEnmac(rEnConv_l2),
           .addEn(addEN_l2),
           .winRst(winRst_l2),
           .filterCount(filterCount_l2),
           .macCount(convCount_l2),
           .buffAddress(buffAddress_l2),
           .wrofm(wrofm_l2),
           .ofmaddr(ofmaddr_l2)
         );

           
  Controller #(.N(N)) ct(
               .clk(clk),
               .rst(reset),
               .start(start),
               .ready(ready),
               .writeEnbuff(writeEnbuff),
               .writeEnmem(wEnMem),
               .writeEnFilter(wEnFilter),
               .wEnWindow(wEnWindow),
               .rEnConv(rEnConv),
               .ldConvDone(ldConvDone),
               .addEn(addEn),
               .winRst(winRst),
               .buffCount(buffCount),
               .filtertemp(filterCount),
               .winCount(winCount),
               .convCount(convCount),
               .memAddress(memAddress),
               .buffAddress(buffAddress),
               //new
               .wrofm(wrofm),
               .ofmaddr(ofmaddr),

               //l2
               .writeEnbuff_l2(writeEnbuff_l2),
               .writeEnFilter_l2(wEnFilter_l2),
               .wEnWindow_l2(wEnWindow_l2),
               .rEnConv_l2(rEnConv_l2),
               .addEN_l2(addEN_l2),
               .winRst_l2(winRst_l2),
               .filtertemp_l2(filterCount_l2),
               .convCount_l2(convCount_l2),
               .buffAddress_l2(buffAddress_l2),
               .wrofm_l2(wrofm_l2),
               .ofmaddr_l2(ofmaddr_l2)
             );


endmodule
