//SpiNNe.v
//
// Author:  Jerry D. Harthcock
// Version:  1.23  June 28, 2020
// Copyright (C) 2020.  All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                    //
//                                                 SYMPL Open-Source                                                  //
//                          HedgeHog Fused Spiking Neural Network Emulator/Compute Engine                             //
//                                    Evaluation and Product Development License                                      //
//                                                                                                                    //
//                                                                                                                    //
// Open-source means:  this source code and this instruction set ("this IP") may be freely downloaded, copied,        //
// modified, distributed and used in accordance with the terms and conditons of the licenses provided herein.         //
//                                                                                                                    //
// Provided that you comply with all the terms and conditions set forth herein, Jerry D. Harthcock ("licensor"),      //
// the original author and exclusive copyright owner of this HedgeHog Fused Spiking Neural Network Emulator/Compute   //
// Engine, including related development software ("this IP"), hereby grants recipient of this IP ("licensee"),       //
// a world-wide, paid-up, non-exclusive license to implement this IP within the programmable fabric of Xilinx Kintex  //
// Ultra Plus brand FPGAs--only--and used only for the purposes of evaluation, education, and development of end      //
// products and related development tools.                                                                            //
//                                                                                                                    //
// Furthermore, limited to the purposes of prototyping, evaluation, characterization and testing of implementations   //
// in a hard, custom or semi-custom ASIC, any university or institution of higher education may have their            //
// implementation of this IP produced for said limited purposes at any foundary of their choosing provided that such  //
// prototypes do not ever wind up in commercial circulation, with this license extending to such foundary and is in   //
// connection with said academic pursuit under the supervision of said university or institution of higher education. //
//                                                                                                                    //
// Any copying, distribution, customization, modification, or derivative work of this IP must include an exact copy   //
// of this license and original copyright notice at the very top of each source file and any derived netlist, and,    //
// in the case of binaries, a printed copy of this license and/or a text format copy in a separate file distributed   //
// with said netlists or binary files having the file name, "LICENSE.txt".  You, the licensee, also agree not to      //
// remove any copyright notices from any source file covered or distributed under this Evaluation and Product         //
// Development License.                                                                                               //
//                                                                                                                    //
// LICENSOR DOES NOT WARRANT OR GUARANTEE THAT YOUR USE OF THIS IP WILL NOT INFRINGE THE RIGHTS OF OTHERS OR          //
// THAT IT IS SUITABLE OR FIT FOR ANY PURPOSE AND THAT YOU, THE LICENSEE, AGREE TO HOLD LICENSOR HARMLESS FROM        //
// ANY CLAIM BROUGHT BY YOU OR ANY THIRD PARTY FOR YOUR SUCH USE.                                                     //
//                                                                                                                    //
// Licensor reserves all his rights, including, but in no way limited to, the right to change or modify the terms     //
// and conditions of this Evaluation and Product Development License anytime without notice of any kind to anyone.    //
// By using this IP for any purpose, licensee agrees to all the terms and conditions set forth in this Evaluation     //
// and Product Development License.                                                                                   //
//                                                                                                                    //
// This Evaluation and Product Development License does not include the right to sell products that incorporate       //
// this IP or any IP derived from this IP. If you would like to obtain such a license, please contact Licensor.       //
//                                                                                                                    //
// Licensor can be contacted at:  SYMPL.gpu@gmail.com or Jerry.Harthcock@gmail.com                                    //
//                                                                                                                    //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


 `timescale 1ns/100ps

module SpiNNe (
    CLK,
    RESET,
    DONE,
    ldRepeatReg,
    act,
    accum,
    rdenA,
    rdaddrsA,
    rddataA,
    rdenB,
    rdaddrsB,
    wren,       //processor global wren
    wraddrs,    //processor wraddrs[31:0]
    wrdata
    );
    
input CLK;
input RESET;
input DONE;
input ldRepeatReg;
input act;
input accum;
input rdenA;
input [31:0] rdaddrsA;
output [15:0] rddataA;
input rdenB;
input [11:0] rdaddrsB;
input wren;
input [31:0] wraddrs;
input [15:0] wrdata;

reg [11:0] wraddrs_q1;
reg [11:0] wraddrs_q2;
reg [11:0] wraddrs_q3;
reg [11:0] wraddrs_q4;
reg [11:0] wraddrs_q5;
reg [11:0] wraddrs_q6;
reg [11:0] wraddrs_q7;

reg pushSpikesIn_q1;
reg pushSpikesIn_q2;
reg pushSpikesIn_q3;
reg pushSpikesIn_q4;
reg pushSpikesIn_q5;
reg pushSpikesIn_q6;
reg pushSpikesIn_q7;

reg act_q1;

reg act_q2;
reg act_q3;
reg act_q4;
reg act_q5;

reg accum_q1;
reg accum_q2;
reg accum_q3;
reg accum_q4;

wire spikeOut0;
wire spikeOut1;
wire spikeOut2;
wire spikeOut3;
wire spikeOut4;
wire spikeOut5;
wire spikeOut6;
wire spikeOut7;

wire spikeIn0;
wire spikeIn1;
wire spikeIn2;
wire spikeIn3;
wire spikeIn4;
wire spikeIn5;
wire spikeIn6;
wire spikeIn7;

wire [127:0] errAmounts; 
wire [127:0] slopeAmounts; 

wire [127:0] membrLevels;

wire weightWren;
wire weightRden;
wire [17:0] weightsRdAddrs;
wire [15:0] oneWeight;
wire [1023:0] LayerWeights;
wire pushSpikesIn;

assign pushSpikesIn = wren && (wraddrs[31:12]==20'b0000_0000_0000_0000_0100); 

assign weightWren = wren  && (wraddrs[31:18]==14'b0000_0000_0000_01); 
assign weightRden = rdenB ? 1'b1 : rdenA && (rdaddrsA[31:18]==14'b0000_0000_0000_01);
assign weightsRdAddrs = rdenB ? {rdaddrsB[11:0], 6'b000000} : rdaddrsA[17:0];

assign spikeIn0 = wrdata[0];
assign spikeIn1 = wrdata[1];
assign spikeIn2 = wrdata[2];
assign spikeIn3 = wrdata[3];
assign spikeIn4 = wrdata[4];
assign spikeIn5 = wrdata[5];
assign spikeIn6 = wrdata[6];
assign spikeIn7 = wrdata[7];
  
weights_1024x4096 weights(    //64x4096 16-bit weights
    .CLK       (CLK          ),
    .wren      (weightWren   ), 
    .wraddrs   (wraddrs[17:0]),
    .wrdata    (wrdata[15:0] ), 
    .rden      (weightRden),
    .rdaddrs   (weightsRdAddrs[17:0]),
    .rddata    (oneWeight[15:0]),
    .weightsOut(LayerWeights )
    );

wire rateWren;
wire rateRden;
wire [17:0] ratesRdaddrs;
wire [191:0] LayerRates;
wire [7:0] oneRate;

assign rateWren = wren  && (wraddrs[31:18]==14'b0000_0000_0000_10);
assign rateRden = rdenB ? 1'b1 : rdenA && (rdaddrsA[31:18]==14'b0000_0000_0000_10);    
assign ratesRdaddrs = rdenB ? {rdaddrsB[11:0], 6'b000000} : rdaddrsA[17:0];

rates_256x4096 rates(            //64x4096 3-bit rates cast internally to 8-bits
    .CLK       (CLK          ),
    .wren      (rateWren     ),
    .wraddrs   (wraddrs[17:0]),
    .wrdata    (wrdata[3:0] ),
    .rden      (rateRden    ),
    .rdaddrs   (ratesRdaddrs ),
    .rddata    (oneRate[7:0]),
    .rates     (LayerRates   )
    );
   
wire thresholdWren;
wire thresholdRden;
wire [14:0] thresholdRdaddrs;
wire [127:0] thresholds;
wire [15:0] oneThreshold;

assign thresholdWren = wren  && (wraddrs[31:15]==17'b0000_0000_0000_0001_1);
assign thresholdRden = rdenB ? 1'b1 : rdenA && (rdaddrsA[31:15]==17'b0000_0000_0000_0001_1);
assign thresholdRdaddrs = rdenB ? {rdaddrsB[11:0], 3'b000} : rdaddrsA[14:0];

thresholds_128x4096 thresh(              //8x4096 16-bit thresholds
    .CLK       (CLK          ),
    .wren      (thresholdWren),
    .wraddrs   (wraddrs[14:0]),
    .wrdata    (wrdata[15:0] ),
    .rden      (thresholdRden),
    .rdaddrs   (thresholdRdaddrs),
    .rddata    (oneThreshold ),
    .thresholds(thresholds   )
    );
    
wire sumRden;
wire [14:0] sumRdaddrs;
wire [15:0] oneSum;
wire [127:0] sums;

wire [15:0] prevSum0;
wire [15:0] prevSum1;
wire [15:0] prevSum2;
wire [15:0] prevSum3;
wire [15:0] prevSum4;
wire [15:0] prevSum5;
wire [15:0] prevSum6;
wire [15:0] prevSum7;

//assign sumRden = (pushSpikesIn_q4 && accum_q4) || (rdenA && (rdaddrsA[31:15]==17'b0000_0000_0000_0001_0));
//assign sumRdaddrs = pushSpikesIn_q4 ? {wraddrs_q4[11:0], 3'b000} : rdaddrsA[14:0];

assign sumRden = (pushSpikesIn_q3 && accum_q3) || (rdenA && (rdaddrsA[31:15]==17'b0000_0000_0000_0001_0));
assign sumRdaddrs = pushSpikesIn_q3 ? {wraddrs_q3[11:0], 3'b000} : rdaddrsA[14:0];


assign prevSum0 = sums[15:0   ];
assign prevSum1 = sums[31:16  ];
assign prevSum2 = sums[47:32  ];
assign prevSum3 = sums[63:48  ];
assign prevSum4 = sums[79:64  ];
assign prevSum5 = sums[95:80  ];
assign prevSum6 = sums[111:96 ];
assign prevSum7 = sums[127:112];

 
SumsBuff_128x4096 sumBuff(        //8x4096 16-bit sums
    .CLK     (CLK          ),     //captures/accumulates all the sums and partial sums of all the nodes in a layer every clock cycle
    .wren    (pushSpikesIn_q6 ),
    .wraddrs (wraddrs_q6   ),
    .wrdata  (membrLevels  ),
    .rden    (sumRden      ),
    .rdaddrs (sumRdaddrs   ),
    .rddata  (oneSum       ),
    .sums    (sums         )      //presently for observation only
    );
       
wire dendRden;
wire [15:0] oneDendrite;
wire [1023:0] dendLevels;
wire [1023:0] LevelsObserv;

assign dendRden = (rdenA && (rdaddrsA[31:18]==14'b0000_0000_0000_11));

`ifdef HedgeHog_HAS_DENDRITE_TRACE
dendBuff_1024x4096 dendBuff(  //64x4096 16-bit dendrite levels
    .CLK       (CLK            ),
    .wren      (pushSpikesIn_q2),
    .wraddrs   (wraddrs_q2     ),
    .wrdata    (dendLevels     ),
    .rden      (dendRden       ),
    .rdaddrs   (rdaddrsA[17:0] ),
    .rddata    (oneDendrite    ),
    .dendLevels(LevelsObserv   )     //presently for observation only
    );
`else
assign oneDendrite = 0;
assign LevelsObserv = 0;
`endif        

wire errRden;
wire [15:0] oneErr;
wire [127:0] errsObserv;

assign errRden = (rdenA && (rdaddrsA[31:12]==20'b0000_0000_0001_0000_0000));

`ifdef HedgeHog_HAS_ERROR_TRACE
errBuff_128x4096 errBuff(  //8x4096 16-bit dendrite levels
    .CLK       (CLK            ),
    .wren      (pushSpikesIn_q7),
    .wraddrs   (wraddrs_q7     ),
    .wrdata    (errAmounts     ),
    .rden      (errRden        ),
    .rdaddrs   (rdaddrsA[14:0] ),
    .rddata    (oneErr         ),
    .errAmounts(errsObserv     )     //presently for observation only
    );
`else
assign oneErr = 0;
assign errsObserv = 0;
`endif

wire slopeRden;
wire [15:0] oneSlope;
wire [127:0] slopeObserv;

assign slopeRden = (rdenA && (rdaddrsA[31:12]==20'b0000_0000_0001_0000_1000));

`ifdef HedgeHog_HAS_SLOPE_TRACE
errBuff_128x4096 slopeBuff(  //8x4096 16-bit dendrite levels
    .CLK       (CLK            ),
    .wren      (pushSpikesIn_q7),
    .wraddrs   (wraddrs_q7     ),
    .wrdata    (slopeAmounts   ),
    .rden      (slopeRden      ),
    .rdaddrs   (rdaddrsA[14:0] ),
    .rddata    (oneSlope       ),
    .errAmounts(slopeObserv    )     //presently for observation only
    );
`else
assign oneSlope = 0;
assign slopeObserv = 0;
`endif    

wire [7:0] spikesOut;
wire spikeOutRden;
wire [7:0] SpikeTrace;

assign spikesOut = {spikeOut7, spikeOut6, spikeOut5, spikeOut4, spikeOut3, spikeOut2, spikeOut1, spikeOut0};
assign spikeOutRden = (rdenA && (rdaddrsA[31:15]==17'b0000_0000_0000_0000_1)); 

SpikeOutBuff_8x4096 spikeOutBuff(
    .CLK    (CLK            ),
    .wren   (pushSpikesIn_q6),
    .wraddrs(wraddrs_q6     ),
    .wrdata (spikesOut[7:0] ),
    .rden   (spikeOutRden   ),
    .rdaddrs(rdaddrsA[11:0] ),
    .rddata (SpikeTrace[7:0])
    );  

wire [15:0] oneExp;
wire expBufRden;
wire [4:0] expBufSel;
assign expBufSel = rdaddrsA[4:0];
assign expBufRden = (rdenA && (rdaddrsA[31:12]==20'b0000_0000_0001_0001_0000));

`ifdef HedgeHog_HAS_TIME_EXP
expTime expTime(
    .CLK            (CLK            ),
    .RESET          (RESET          ),
    .ldRepeatReg    (ldRepeatReg    ),
    .act_q5         (act_q5         ),
    .pushSpikesIn_q5(pushSpikesIn_q5),
    .spikeOut7      (spikeOut7      ),
    .spikeOut6      (spikeOut6      ),
    .spikeOut5      (spikeOut5      ),
    .spikeOut4      (spikeOut4      ),
    .spikeOut3      (spikeOut3      ),
    .spikeOut2      (spikeOut2      ),
    .spikeOut1      (spikeOut1      ),
    .spikeOut0      (spikeOut0      ),
    .rdaddrs        (rdaddrsA[4:0]  ),
    .oneExp         (oneExp         )
    );
`else
assign oneExp = 0;
`endif
                        
reg [8:0] buffSel_q1;
wire [8:0] buffSel;
assign buffSel = {expBufRden, slopeRden, errRden, dendRden, rateRden, weightRden, thresholdRden, sumRden, spikeOutRden}; 

reg [15:0] rddataA;

spikeLayer8_H7 layer0(
    .CLK   (CLK               ),
    .RESET (RESET || DONE     ),
    .pushSpikesIn(pushSpikesIn),
    .rate0 (LayerRates[2:0]  ),
    .rate1 (LayerRates[5:3]  ),
    .rate2 (LayerRates[8:6]  ),
    .rate3 (LayerRates[11:9] ),
    .rate4 (LayerRates[14:12]),
    .rate5 (LayerRates[17:15]),
    .rate6 (LayerRates[20:18]),
    .rate7 (LayerRates[23:21]),
    .rate8 (LayerRates[26:24]), 
    .rate9 (LayerRates[29:27]), 
    .rate10(LayerRates[32:30]),
    .rate11(LayerRates[35:33]),
    .rate12(LayerRates[38:36]),
    .rate13(LayerRates[41:39]),
    .rate14(LayerRates[44:42]),
    .rate15(LayerRates[47:45]),
    .rate16(LayerRates[50:48]),
    .rate17(LayerRates[53:51]),
    .rate18(LayerRates[56:54]),
    .rate19(LayerRates[59:57]),
    .rate20(LayerRates[62:60]),
    .rate21(LayerRates[65:63]),
    .rate22(LayerRates[68:66]),
    .rate23(LayerRates[71:69]),
    .rate24(LayerRates[74:72]),
    .rate25(LayerRates[77:75]),
    .rate26(LayerRates[80:78]),
    .rate27(LayerRates[83:81]),
    .rate28(LayerRates[86:84]),
    .rate29(LayerRates[89:87]),
    .rate30(LayerRates[92:90]),
    .rate31(LayerRates[95:93]),
    .rate32(LayerRates[98:96]),
    .rate33(LayerRates[101:99]),
    .rate34(LayerRates[104:102]),
    .rate35(LayerRates[107:105]),
    .rate36(LayerRates[110:108]),
    .rate37(LayerRates[113:111]),
    .rate38(LayerRates[116:114]),
    .rate39(LayerRates[119:117]),
    .rate40(LayerRates[122:120]),
    .rate41(LayerRates[125:123]),
    .rate42(LayerRates[128:126]),
    .rate43(LayerRates[131:129]),
    .rate44(LayerRates[134:132]),
    .rate45(LayerRates[137:135]),
    .rate46(LayerRates[140:138]),
    .rate47(LayerRates[143:141]),
    .rate48(LayerRates[146:144]),
    .rate49(LayerRates[149:147]),
    .rate50(LayerRates[152:150]),
    .rate51(LayerRates[155:153]),
    .rate52(LayerRates[158:156]),
    .rate53(LayerRates[161:159]),
    .rate54(LayerRates[164:162]),
    .rate55(LayerRates[167:165]),
    .rate56(LayerRates[170:168]),
    .rate57(LayerRates[173:171]),
    .rate58(LayerRates[176:174]),
    .rate59(LayerRates[179:177]),
    .rate60(LayerRates[182:180]),
    .rate61(LayerRates[185:183]),
    .rate62(LayerRates[188:186]),
    .rate63(LayerRates[191:189]),
    .spikeIn0(spikeIn0          ),
    .spikeIn1(spikeIn1          ),
    .spikeIn2(spikeIn2          ),
    .spikeIn3(spikeIn3          ),
    .spikeIn4(spikeIn4          ),
    .spikeIn5(spikeIn5          ),
    .spikeIn6(spikeIn6          ),
    .spikeIn7(spikeIn7          ),
    .threshold0(thresholds[15:0]   ),
    .threshold1(thresholds[31:16]  ),
    .threshold2(thresholds[47:32]  ),
    .threshold3(thresholds[63:48]  ),
    .threshold4(thresholds[79:64]  ),
    .threshold5(thresholds[95:80]  ),
    .threshold6(thresholds[111:96] ),
    .threshold7(thresholds[127:112]),
    .weight0 (LayerWeights[ 15 :0   ] ),
    .weight1 (LayerWeights[ 31 :16  ] ),
    .weight2 (LayerWeights[ 47 :32  ] ),
    .weight3 (LayerWeights[ 63 :48  ] ),
    .weight4 (LayerWeights[ 79 :64  ] ),
    .weight5 (LayerWeights[ 95 :80  ] ),
    .weight6 (LayerWeights[ 111:96  ] ),
    .weight7 (LayerWeights[ 127:112 ] ),
    .weight8 (LayerWeights[ 143:128 ] ),
    .weight9 (LayerWeights[ 159:144 ] ),
    .weight10(LayerWeights[ 175:160 ] ),
    .weight11(LayerWeights[ 191:176 ] ),
    .weight12(LayerWeights[ 207:192 ] ),
    .weight13(LayerWeights[ 223:208 ] ),
    .weight14(LayerWeights[ 239:224 ] ),
    .weight15(LayerWeights[ 255:240 ] ),
    .weight16(LayerWeights[ 271:256 ] ),
    .weight17(LayerWeights[ 287:272 ] ),
    .weight18(LayerWeights[ 303:288 ] ),
    .weight19(LayerWeights[ 319:304 ] ),
    .weight20(LayerWeights[ 335:320 ] ),
    .weight21(LayerWeights[ 351:336 ] ),
    .weight22(LayerWeights[ 367:352 ] ),
    .weight23(LayerWeights[ 383:368 ] ),
    .weight24(LayerWeights[ 399:384 ] ),
    .weight25(LayerWeights[ 415:400 ] ),
    .weight26(LayerWeights[ 431:416 ] ),
    .weight27(LayerWeights[ 447:432 ] ),
    .weight28(LayerWeights[ 463:448 ] ),
    .weight29(LayerWeights[ 479:464 ] ),
    .weight30(LayerWeights[ 495:480 ] ),
    .weight31(LayerWeights[ 511:496 ] ),
    .weight32(LayerWeights[ 527:512 ] ),
    .weight33(LayerWeights[ 543:528 ] ),
    .weight34(LayerWeights[ 559:544 ] ),
    .weight35(LayerWeights[ 575:560 ] ),
    .weight36(LayerWeights[ 591:576 ] ),
    .weight37(LayerWeights[ 607:592 ] ),
    .weight38(LayerWeights[ 623:608 ] ),
    .weight39(LayerWeights[ 639:624 ] ),
    .weight40(LayerWeights[ 655:640 ] ),
    .weight41(LayerWeights[ 671:656 ] ),
    .weight42(LayerWeights[ 687:672 ] ),
    .weight43(LayerWeights[ 703:688 ] ),
    .weight44(LayerWeights[ 719:704 ] ),
    .weight45(LayerWeights[ 735:720 ] ),
    .weight46(LayerWeights[ 751:736 ] ),
    .weight47(LayerWeights[ 767:752 ] ),
    .weight48(LayerWeights[ 783:768 ] ),
    .weight49(LayerWeights[ 799:784 ] ),
    .weight50(LayerWeights[ 815:800 ] ),
    .weight51(LayerWeights[ 831:816 ] ),
    .weight52(LayerWeights[ 847:832 ] ),
    .weight53(LayerWeights[ 863:848 ] ),
    .weight54(LayerWeights[ 879:864 ] ),
    .weight55(LayerWeights[ 895:880 ] ),
    .weight56(LayerWeights[ 911:896 ] ),
    .weight57(LayerWeights[ 927:912 ] ),
    .weight58(LayerWeights[ 943:928 ] ),
    .weight59(LayerWeights[ 959:944 ] ),
    .weight60(LayerWeights[ 975:960 ] ),
    .weight61(LayerWeights[ 991:976 ] ),
    .weight62(LayerWeights[1007:992 ] ),
    .weight63(LayerWeights[1023:1008] ),
    .activate(act_q5                  ),
    .accumulate(accum_q4              ),
    .prevSumNode0(prevSum0            ),
    .prevSumNode1(prevSum1            ),
    .prevSumNode2(prevSum2            ),
    .prevSumNode3(prevSum3            ),
    .prevSumNode4(prevSum4            ),
    .prevSumNode5(prevSum5            ),
    .prevSumNode6(prevSum6            ),
    .prevSumNode7(prevSum7            ),
    .levelOut0 (dendLevels[15 :0   ]),
    .levelOut1 (dendLevels[31 :16  ]),
    .levelOut2 (dendLevels[47 :32  ]),
    .levelOut3 (dendLevels[63 :48  ]),
    .levelOut4 (dendLevels[79 :64  ]),
    .levelOut5 (dendLevels[95 :80  ]),
    .levelOut6 (dendLevels[111:96  ]),
    .levelOut7 (dendLevels[127:112 ]),
    .levelOut8 (dendLevels[143:128 ]),
    .levelOut9 (dendLevels[159:144 ]),
    .levelOut10(dendLevels[175:160 ]),
    .levelOut11(dendLevels[191:176 ]),
    .levelOut12(dendLevels[207:192 ]),
    .levelOut13(dendLevels[223:208 ]),
    .levelOut14(dendLevels[239:224 ]),
    .levelOut15(dendLevels[255:240 ]),
    .levelOut16(dendLevels[271:256 ]),
    .levelOut17(dendLevels[287:272 ]),
    .levelOut18(dendLevels[303:288 ]),
    .levelOut19(dendLevels[319:304 ]),
    .levelOut20(dendLevels[335:320 ]),
    .levelOut21(dendLevels[351:336 ]),
    .levelOut22(dendLevels[367:352 ]),
    .levelOut23(dendLevels[383:368 ]),
    .levelOut24(dendLevels[399:384 ]),
    .levelOut25(dendLevels[415:400 ]),
    .levelOut26(dendLevels[431:416 ]),
    .levelOut27(dendLevels[447:432 ]),
    .levelOut28(dendLevels[463:448 ]),
    .levelOut29(dendLevels[479:464 ]),
    .levelOut30(dendLevels[495:480 ]),
    .levelOut31(dendLevels[511:496 ]),
    .levelOut32(dendLevels[527:512 ]),
    .levelOut33(dendLevels[543:528 ]),
    .levelOut34(dendLevels[559:544 ]),
    .levelOut35(dendLevels[575:560 ]),
    .levelOut36(dendLevels[591:576 ]),
    .levelOut37(dendLevels[607:592 ]),
    .levelOut38(dendLevels[623:608 ]),
    .levelOut39(dendLevels[639:624 ]),
    .levelOut40(dendLevels[655:640 ]),
    .levelOut41(dendLevels[671:656 ]),
    .levelOut42(dendLevels[687:672 ]),
    .levelOut43(dendLevels[703:688 ]),
    .levelOut44(dendLevels[719:704 ]),
    .levelOut45(dendLevels[735:720 ]),
    .levelOut46(dendLevels[751:736 ]),
    .levelOut47(dendLevels[767:752 ]),
    .levelOut48(dendLevels[783:768 ]),
    .levelOut49(dendLevels[799:784 ]),
    .levelOut50(dendLevels[815:800 ]),
    .levelOut51(dendLevels[831:816 ]),
    .levelOut52(dendLevels[847:832 ]),
    .levelOut53(dendLevels[863:848 ]),
    .levelOut54(dendLevels[879:864 ]),
    .levelOut55(dendLevels[895:880 ]),
    .levelOut56(dendLevels[911:896 ]),
    .levelOut57(dendLevels[927:912 ]),
    .levelOut58(dendLevels[943:928 ]),
    .levelOut59(dendLevels[959:944 ]),
    .levelOut60(dendLevels[975:960 ]),
    .levelOut61(dendLevels[991:976 ]),
    .levelOut62(dendLevels[1007:992]),
    .levelOut63(dendLevels[1023:1008]),
    .levelOutMembr0(membrLevels[15:0]   ),     
    .levelOutMembr1(membrLevels[31:16]  ),     
    .levelOutMembr2(membrLevels[47:32]  ),     
    .levelOutMembr3(membrLevels[63:48]  ),     
    .levelOutMembr4(membrLevels[79:64]  ),     
    .levelOutMembr5(membrLevels[95:80]  ),     
    .levelOutMembr6(membrLevels[111:96] ),
    .levelOutMembr7(membrLevels[127:112]),
    .spikeOut0(spikeOut0  ),
    .spikeOut1(spikeOut1  ),
    .spikeOut2(spikeOut2  ),
    .spikeOut3(spikeOut3  ),
    .spikeOut4(spikeOut4  ),
    .spikeOut5(spikeOut5  ),
    .spikeOut6(spikeOut6  ),
    .spikeOut7(spikeOut7  ),
    .err0     (errAmounts[15 :0   ]),
    .err1     (errAmounts[31 :16  ]),
    .err2     (errAmounts[47 :32  ]),
    .err3     (errAmounts[63 :48  ]),
    .err4     (errAmounts[79 :64  ]),
    .err5     (errAmounts[95 :80  ]),
    .err6     (errAmounts[111:96  ]),
    .err7     (errAmounts[127:112 ]),
    .slope0     (slopeAmounts[15 :0   ]),
    .slope1     (slopeAmounts[31 :16  ]),
    .slope2     (slopeAmounts[47 :32  ]),
    .slope3     (slopeAmounts[63 :48  ]),
    .slope4     (slopeAmounts[79 :64  ]),
    .slope5     (slopeAmounts[95 :80  ]),
    .slope6     (slopeAmounts[111:96  ]),
    .slope7     (slopeAmounts[127:112 ])
    );  


always @(*)
    casex(buffSel_q1)
        9'b1xxxxxxxx : rddataA = oneExp;
        9'b01xxxxxxx : rddataA = oneSlope;
        9'b001xxxxxx : rddataA = oneErr;
        9'b0001xxxxx : rddataA = oneDendrite;
        9'b00001xxxx : rddataA = {8'b0, oneRate};
        9'b000001xxx : rddataA = oneWeight;
        9'b0000001xx : rddataA = oneThreshold;
        9'b00000001x : rddataA = oneSum;
        9'b000000001 : rddataA = SpikeTrace;
           default : rddataA = 0;
    endcase
        

always @(posedge CLK) 
    if (RESET) buffSel_q1 <= 0;
    else buffSel_q1 <= buffSel;
        
always @(posedge CLK) 
    if (RESET) begin
        accum_q1 <= 0;
        accum_q2 <= 0;
        accum_q3 <= 0;
        accum_q4 <= 0;
    end
    else begin
        accum_q1 <= accum;
        accum_q2 <= accum_q1;
        accum_q3 <= accum_q2;
        accum_q4 <= accum_q3;
    end 
     
always @(posedge CLK) 
    if (RESET) begin
        act_q1 <= 0;
        act_q2 <= 0;
        act_q3 <= 0;
        act_q4 <= 0;
        act_q5 <= 0;
    end
    else begin
        act_q1 <= act;
        act_q2 <= act_q1;
        act_q3 <= act_q2;
        act_q4 <= act_q3;
        act_q5 <= act_q4;
    end                         
    
always @(posedge CLK) 
    if (RESET) begin
        pushSpikesIn_q1 <= 0;
        pushSpikesIn_q2 <= 0;
        pushSpikesIn_q3 <= 0;
        pushSpikesIn_q4 <= 0;
        pushSpikesIn_q5 <= 0;
        pushSpikesIn_q6 <= 0;
        pushSpikesIn_q7 <= 0;
    end
    else begin
        pushSpikesIn_q1 <= pushSpikesIn;
        pushSpikesIn_q2 <= pushSpikesIn_q1;
        pushSpikesIn_q3 <= pushSpikesIn_q2;
        pushSpikesIn_q4 <= pushSpikesIn_q3;
        pushSpikesIn_q5 <= pushSpikesIn_q4;
        pushSpikesIn_q6 <= pushSpikesIn_q5;
        pushSpikesIn_q7 <= pushSpikesIn_q6;
    end                         

always @(posedge CLK) 
    if (RESET) begin
        wraddrs_q1 <= 0;
        wraddrs_q2 <= 0;
        wraddrs_q3 <= 0;
        wraddrs_q4 <= 0;
        wraddrs_q5 <= 0;
        wraddrs_q6 <= 0;
        wraddrs_q7 <= 0;
    end
    else begin
        wraddrs_q1 <= wraddrs[11:0];
        wraddrs_q2 <= wraddrs_q1;
        wraddrs_q3 <= wraddrs_q2;
        wraddrs_q4 <= wraddrs_q3;
        wraddrs_q5 <= wraddrs_q4;
        wraddrs_q6 <= wraddrs_q5;
        wraddrs_q7 <= wraddrs_q6;
    end                         
    
endmodule
