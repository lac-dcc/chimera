//spikeLayer8_H7.v
//
// Author:  Jerry D. Harthcock
// Version:  1.22  May 3, 2020
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

module spikeLayer8_H7 (
    CLK   ,
    RESET ,
    pushSpikesIn,
    activate,
    accumulate, 
    rate0 ,
    rate1 ,
    rate2 ,
    rate3 ,
    rate4 ,
    rate5 ,
    rate6 ,
    rate7 ,
    rate8 , 
    rate9 , 
    rate10,
    rate11,
    rate12,
    rate13,
    rate14,
    rate15,
    rate16,
    rate17,
    rate18,
    rate19,
    rate20,
    rate21,
    rate22,
    rate23,
    rate24,
    rate25,
    rate26,
    rate27,
    rate28,
    rate29,
    rate30,
    rate31,
    rate32,
    rate33,
    rate34,
    rate35,
    rate36,
    rate37,
    rate38,
    rate39,
    rate40,
    rate41,
    rate42,
    rate43,
    rate44,
    rate45,
    rate46,
    rate47,
    rate48,
    rate49,
    rate50,
    rate51,
    rate52,
    rate53,
    rate54,
    rate55,
    rate56,
    rate57,
    rate58,
    rate59,
    rate60,
    rate61,
    rate62,
    rate63,
    spikeIn0,
    spikeIn1,
    spikeIn2,
    spikeIn3,
    spikeIn4,
    spikeIn5,
    spikeIn6,
    spikeIn7,
    prevSumNode0,
    prevSumNode1,
    prevSumNode2,
    prevSumNode3,
    prevSumNode4,
    prevSumNode5,
    prevSumNode6,
    prevSumNode7,
    threshold0,
    threshold1,
    threshold2,
    threshold3,
    threshold4,
    threshold5,
    threshold6,
    threshold7,
    weight0 ,
    weight1 ,
    weight2 ,
    weight3 ,
    weight4 ,
    weight5 ,
    weight6 ,
    weight7 ,
    weight8 ,
    weight9 ,
    weight10,
    weight11,
    weight12,
    weight13,
    weight14,
    weight15,
    weight16,
    weight17,
    weight18,
    weight19,
    weight20,
    weight21,
    weight22,
    weight23,
    weight24,
    weight25,
    weight26,
    weight27,
    weight28,
    weight29,
    weight30,
    weight31,
    weight32,
    weight33,
    weight34,
    weight35,
    weight36,
    weight37,
    weight38,
    weight39,
    weight40,
    weight41,
    weight42,
    weight43,
    weight44,
    weight45,
    weight46,
    weight47,
    weight48,
    weight49,
    weight50,
    weight51,
    weight52,
    weight53,
    weight54,
    weight55,
    weight56,
    weight57,
    weight58,
    weight59,
    weight60,
    weight61,
    weight62,
    weight63,
    levelOut0 ,
    levelOut1 ,
    levelOut2 ,
    levelOut3 ,
    levelOut4 ,
    levelOut5 ,
    levelOut6 ,
    levelOut7 ,
    levelOut8 ,
    levelOut9 ,
    levelOut10,
    levelOut11,
    levelOut12,
    levelOut13,
    levelOut14,
    levelOut15,
    levelOut16,
    levelOut17,
    levelOut18,
    levelOut19,
    levelOut20,
    levelOut21,
    levelOut22,
    levelOut23,
    levelOut24,
    levelOut25,
    levelOut26,
    levelOut27,
    levelOut28,
    levelOut29,
    levelOut30,
    levelOut31,
    levelOut32,
    levelOut33,
    levelOut34,
    levelOut35,
    levelOut36,
    levelOut37,
    levelOut38,
    levelOut39,
    levelOut40,
    levelOut41,
    levelOut42,
    levelOut43,
    levelOut44,
    levelOut45,
    levelOut46,
    levelOut47,
    levelOut48,
    levelOut49,
    levelOut50,
    levelOut51,
    levelOut52,
    levelOut53,
    levelOut54,
    levelOut55,
    levelOut56,
    levelOut57,
    levelOut58,
    levelOut59,
    levelOut60,
    levelOut61,
    levelOut62,
    levelOut63,
    levelOutMembr0,
    levelOutMembr1,
    levelOutMembr2,
    levelOutMembr3,
    levelOutMembr4,
    levelOutMembr5,
    levelOutMembr6,
    levelOutMembr7,
    spikeOut0,
    spikeOut1,
    spikeOut2,
    spikeOut3,
    spikeOut4,
    spikeOut5,
    spikeOut6,
    spikeOut7,
    err0,
    err1,
    err2,
    err3,
    err4,
    err5,
    err6,
    err7, 
    slope0,
    slope1,
    slope2,
    slope3,
    slope4,
    slope5,
    slope6,
    slope7 
    );

input CLK   ;
input RESET ;
input pushSpikesIn;
input activate    ;
input accumulate  ;
input [2:0] rate0 ;
input [2:0] rate1 ;
input [2:0] rate2 ;
input [2:0] rate3 ;
input [2:0] rate4 ;
input [2:0] rate5 ;
input [2:0] rate6 ;
input [2:0] rate7 ;
input [2:0] rate8 ; 
input [2:0] rate9 ; 
input [2:0] rate10;
input [2:0] rate11;
input [2:0] rate12;
input [2:0] rate13;
input [2:0] rate14;
input [2:0] rate15;
input [2:0] rate16;
input [2:0] rate17;
input [2:0] rate18;
input [2:0] rate19;
input [2:0] rate20;
input [2:0] rate21;
input [2:0] rate22;
input [2:0] rate23;
input [2:0] rate24;
input [2:0] rate25;
input [2:0] rate26;
input [2:0] rate27;
input [2:0] rate28;
input [2:0] rate29;
input [2:0] rate30;
input [2:0] rate31;
input [2:0] rate32;
input [2:0] rate33;
input [2:0] rate34;
input [2:0] rate35;
input [2:0] rate36;
input [2:0] rate37;
input [2:0] rate38;
input [2:0] rate39;
input [2:0] rate40;
input [2:0] rate41;
input [2:0] rate42;
input [2:0] rate43;
input [2:0] rate44;
input [2:0] rate45;
input [2:0] rate46;
input [2:0] rate47;
input [2:0] rate48;
input [2:0] rate49;
input [2:0] rate50;
input [2:0] rate51;
input [2:0] rate52;
input [2:0] rate53;
input [2:0] rate54;
input [2:0] rate55;
input [2:0] rate56;
input [2:0] rate57;
input [2:0] rate58;
input [2:0] rate59;
input [2:0] rate60;
input [2:0] rate61;
input [2:0] rate62;
input [2:0] rate63;
input spikeIn0;
input spikeIn1;
input spikeIn2;
input spikeIn3;
input spikeIn4;
input spikeIn5;
input spikeIn6;
input spikeIn7;
input [15:0] prevSumNode0;
input [15:0] prevSumNode1;
input [15:0] prevSumNode2;
input [15:0] prevSumNode3;
input [15:0] prevSumNode4;
input [15:0] prevSumNode5;
input [15:0] prevSumNode6;
input [15:0] prevSumNode7;
input [15:0] threshold0;
input [15:0] threshold1;
input [15:0] threshold2;
input [15:0] threshold3;
input [15:0] threshold4;
input [15:0] threshold5;
input [15:0] threshold6;
input [15:0] threshold7;
input [15:0] weight0 ;
input [15:0] weight1 ;
input [15:0] weight2 ;
input [15:0] weight3 ;
input [15:0] weight4 ;
input [15:0] weight5 ;
input [15:0] weight6 ;
input [15:0] weight7 ;
input [15:0] weight8 ;
input [15:0] weight9 ;
input [15:0] weight10;
input [15:0] weight11;
input [15:0] weight12;
input [15:0] weight13;
input [15:0] weight14;
input [15:0] weight15;
input [15:0] weight16;
input [15:0] weight17;
input [15:0] weight18;
input [15:0] weight19;
input [15:0] weight20;
input [15:0] weight21;
input [15:0] weight22;
input [15:0] weight23;
input [15:0] weight24;
input [15:0] weight25;
input [15:0] weight26;
input [15:0] weight27;
input [15:0] weight28;
input [15:0] weight29;
input [15:0] weight30;
input [15:0] weight31;
input [15:0] weight32;
input [15:0] weight33;
input [15:0] weight34;
input [15:0] weight35;
input [15:0] weight36;
input [15:0] weight37;
input [15:0] weight38;
input [15:0] weight39;
input [15:0] weight40;
input [15:0] weight41;
input [15:0] weight42;
input [15:0] weight43;
input [15:0] weight44;
input [15:0] weight45;
input [15:0] weight46;
input [15:0] weight47;
input [15:0] weight48;
input [15:0] weight49;
input [15:0] weight50;
input [15:0] weight51;
input [15:0] weight52;
input [15:0] weight53;
input [15:0] weight54;
input [15:0] weight55;
input [15:0] weight56;
input [15:0] weight57;
input [15:0] weight58;
input [15:0] weight59;
input [15:0] weight60;
input [15:0] weight61;
input [15:0] weight62;
input [15:0] weight63;
output [15:0] levelOut0 ;
output [15:0] levelOut1 ;
output [15:0] levelOut2 ;
output [15:0] levelOut3 ;
output [15:0] levelOut4 ;
output [15:0] levelOut5 ;
output [15:0] levelOut6 ;
output [15:0] levelOut7 ;
output [15:0] levelOut8 ;
output [15:0] levelOut9 ;
output [15:0] levelOut10;
output [15:0] levelOut11;
output [15:0] levelOut12;
output [15:0] levelOut13;
output [15:0] levelOut14;
output [15:0] levelOut15;
output [15:0] levelOut16;
output [15:0] levelOut17;
output [15:0] levelOut18;
output [15:0] levelOut19;
output [15:0] levelOut20;
output [15:0] levelOut21;
output [15:0] levelOut22;
output [15:0] levelOut23;
output [15:0] levelOut24;
output [15:0] levelOut25;
output [15:0] levelOut26;
output [15:0] levelOut27;
output [15:0] levelOut28;
output [15:0] levelOut29;
output [15:0] levelOut30;
output [15:0] levelOut31;
output [15:0] levelOut32;
output [15:0] levelOut33;
output [15:0] levelOut34;
output [15:0] levelOut35;
output [15:0] levelOut36;
output [15:0] levelOut37;
output [15:0] levelOut38;
output [15:0] levelOut39;
output [15:0] levelOut40;
output [15:0] levelOut41;
output [15:0] levelOut42;
output [15:0] levelOut43;
output [15:0] levelOut44;
output [15:0] levelOut45;
output [15:0] levelOut46;
output [15:0] levelOut47;
output [15:0] levelOut48;
output [15:0] levelOut49;
output [15:0] levelOut50;
output [15:0] levelOut51;
output [15:0] levelOut52;
output [15:0] levelOut53;
output [15:0] levelOut54;
output [15:0] levelOut55;
output [15:0] levelOut56;
output [15:0] levelOut57;
output [15:0] levelOut58;
output [15:0] levelOut59;
output [15:0] levelOut60;
output [15:0] levelOut61;
output [15:0] levelOut62;
output [15:0] levelOut63;
output [15:0] levelOutMembr0;
output [15:0] levelOutMembr1;
output [15:0] levelOutMembr2;
output [15:0] levelOutMembr3;
output [15:0] levelOutMembr4;
output [15:0] levelOutMembr5;
output [15:0] levelOutMembr6;
output [15:0] levelOutMembr7;
output spikeOut0;
output spikeOut1;
output spikeOut2;
output spikeOut3;
output spikeOut4;
output spikeOut5;
output spikeOut6;
output spikeOut7;
output [15:0] err0;
output [15:0] err1;
output [15:0] err2;
output [15:0] err3;
output [15:0] err4;
output [15:0] err5;
output [15:0] err6;
output [15:0] err7;
output [15:0] slope0;
output [15:0] slope1;
output [15:0] slope2;
output [15:0] slope3;
output [15:0] slope4;
output [15:0] slope5;
output [15:0] slope6;
output [15:0] slope7;

wire [15:0] levelOut0 ;
wire [15:0] levelOut1 ;
wire [15:0] levelOut2 ;
wire [15:0] levelOut3 ;
wire [15:0] levelOut4 ;
wire [15:0] levelOut5 ;
wire [15:0] levelOut6 ;
wire [15:0] levelOut7 ;
wire [15:0] levelOut8 ;
wire [15:0] levelOut9 ;
wire [15:0] levelOut10;
wire [15:0] levelOut11;
wire [15:0] levelOut12;
wire [15:0] levelOut13;
wire [15:0] levelOut14;
wire [15:0] levelOut15;
wire [15:0] levelOut16;
wire [15:0] levelOut17;
wire [15:0] levelOut18;
wire [15:0] levelOut19;
wire [15:0] levelOut20;
wire [15:0] levelOut21;
wire [15:0] levelOut22;
wire [15:0] levelOut23;
wire [15:0] levelOut24;
wire [15:0] levelOut25;
wire [15:0] levelOut26;
wire [15:0] levelOut27;
wire [15:0] levelOut28;
wire [15:0] levelOut29;
wire [15:0] levelOut30;
wire [15:0] levelOut31;
wire [15:0] levelOut32;
wire [15:0] levelOut33;
wire [15:0] levelOut34;
wire [15:0] levelOut35;
wire [15:0] levelOut36;
wire [15:0] levelOut37;
wire [15:0] levelOut38;
wire [15:0] levelOut39;
wire [15:0] levelOut40;
wire [15:0] levelOut41;
wire [15:0] levelOut42;
wire [15:0] levelOut43;
wire [15:0] levelOut44;
wire [15:0] levelOut45;
wire [15:0] levelOut46;
wire [15:0] levelOut47;
wire [15:0] levelOut48;
wire [15:0] levelOut49;
wire [15:0] levelOut50;
wire [15:0] levelOut51;
wire [15:0] levelOut52;
wire [15:0] levelOut53;
wire [15:0] levelOut54;
wire [15:0] levelOut55;
wire [15:0] levelOut56;
wire [15:0] levelOut57;
wire [15:0] levelOut58;
wire [15:0] levelOut59;
wire [15:0] levelOut60;
wire [15:0] levelOut61;
wire [15:0] levelOut62;
wire [15:0] levelOut63;
wire [15:0] levelOutMembr0;
wire [15:0] levelOutMembr1;
wire [15:0] levelOutMembr2;
wire [15:0] levelOutMembr3;
wire [15:0] levelOutMembr4;
wire [15:0] levelOutMembr5;
wire [15:0] levelOutMembr6;
wire [15:0] levelOutMembr7;
wire spikeOut0;
wire spikeOut1;
wire spikeOut2;
wire spikeOut3;
wire spikeOut4;
wire spikeOut5;
wire spikeOut6;
wire spikeOut7;
wire [15:0] err0;
wire [15:0] err1;
wire [15:0] err2;
wire [15:0] err3;
wire [15:0] err4;
wire [15:0] err5;
wire [15:0] err6;
wire [15:0] err7;
wire [15:0] slope0;
wire [15:0] slope1;
wire [15:0] slope2;
wire [15:0] slope3;
wire [15:0] slope4;
wire [15:0] slope5;
wire [15:0] slope6;
wire [15:0] slope7;

spikeNeuron8_H7 node0(
    .CLK          (CLK           ),
    .RESET        (RESET         ),
    .pushSpikesIn (pushSpikesIn  ),
    .rate0        (rate0         ),
    .rate1        (rate1         ),
    .rate2        (rate2         ),
    .rate3        (rate3         ),
    .rate4        (rate4         ),
    .rate5        (rate5         ),
    .rate6        (rate6         ),
    .rate7        (rate7         ),
    .spikeIn0     (spikeIn0      ),
    .spikeIn1     (spikeIn1      ),
    .spikeIn2     (spikeIn2      ),
    .spikeIn3     (spikeIn3      ),
    .spikeIn4     (spikeIn4      ),
    .spikeIn5     (spikeIn5      ),
    .spikeIn6     (spikeIn6      ),
    .spikeIn7     (spikeIn7      ),
    .threshold    (threshold0    ),
    .weight0      (weight0       ),
    .weight1      (weight1       ),
    .weight2      (weight2       ),
    .weight3      (weight3       ),
    .weight4      (weight4       ),
    .weight5      (weight5       ),
    .weight6      (weight6       ),
    .weight7      (weight7       ),
    .activate     (activate      ),
    .accumulate   (accumulate    ),
    .prevSum      (prevSumNode0  ),
    .levelOut0    (levelOut0     ),
    .levelOut1    (levelOut1     ),
    .levelOut2    (levelOut2     ),
    .levelOut3    (levelOut3     ),
    .levelOut4    (levelOut4     ),
    .levelOut5    (levelOut5     ),
    .levelOut6    (levelOut6     ),
    .levelOut7    (levelOut7     ),
    .levelOutMembr(levelOutMembr0),
    .spikeOut     (spikeOut0     ),
    .err          (err0          ),
    .slope        (slope0        )
    );                          


spikeNeuron8_H7 node1(
    .CLK          (CLK           ),
    .RESET        (RESET         ),
    .pushSpikesIn (pushSpikesIn  ),
    .rate0        (rate8         ),
    .rate1        (rate9         ),
    .rate2        (rate10        ),
    .rate3        (rate11        ),
    .rate4        (rate12        ),
    .rate5        (rate13        ),
    .rate6        (rate14        ),
    .rate7        (rate15        ),
    .spikeIn0     (spikeIn0      ),
    .spikeIn1     (spikeIn1      ),
    .spikeIn2     (spikeIn2      ),
    .spikeIn3     (spikeIn3      ),
    .spikeIn4     (spikeIn4      ),
    .spikeIn5     (spikeIn5      ),
    .spikeIn6     (spikeIn6      ),
    .spikeIn7     (spikeIn7      ),
    .threshold    (threshold1    ),
    .weight0      (weight8       ),
    .weight1      (weight9       ),
    .weight2      (weight10      ),
    .weight3      (weight11      ),
    .weight4      (weight12      ),
    .weight5      (weight13      ),
    .weight6      (weight14      ),
    .weight7      (weight15      ),
    .activate     (activate      ),
    .accumulate   (accumulate    ),
    .prevSum      (prevSumNode1  ),
    .levelOut0    (levelOut8     ),
    .levelOut1    (levelOut9     ),
    .levelOut2    (levelOut10    ),
    .levelOut3    (levelOut11    ),
    .levelOut4    (levelOut12    ),
    .levelOut5    (levelOut13    ),
    .levelOut6    (levelOut14    ),
    .levelOut7    (levelOut15    ),
    .levelOutMembr(levelOutMembr1),
    .spikeOut     (spikeOut1     ),
    .err          (err1          ),
    .slope        (slope1        )
    );                          

spikeNeuron8_H7 node2(
    .CLK          (CLK           ),
    .RESET        (RESET         ),
    .pushSpikesIn (pushSpikesIn  ),
    .rate0        (rate16        ),
    .rate1        (rate17        ),
    .rate2        (rate18        ),
    .rate3        (rate19        ),
    .rate4        (rate20        ),
    .rate5        (rate21        ),
    .rate6        (rate22        ),
    .rate7        (rate23        ),
    .spikeIn0     (spikeIn0      ),
    .spikeIn1     (spikeIn1      ),
    .spikeIn2     (spikeIn2      ),
    .spikeIn3     (spikeIn3      ),
    .spikeIn4     (spikeIn4      ),
    .spikeIn5     (spikeIn5      ),
    .spikeIn6     (spikeIn6      ),
    .spikeIn7     (spikeIn7      ),
    .threshold    (threshold2    ),
    .weight0      (weight16      ),
    .weight1      (weight17      ),
    .weight2      (weight18      ),
    .weight3      (weight19      ),
    .weight4      (weight20      ),
    .weight5      (weight21      ),
    .weight6      (weight22      ),
    .weight7      (weight23      ),
    .activate     (activate      ),
    .accumulate   (accumulate    ),
    .prevSum      (prevSumNode2  ),
    .levelOut0    (levelOut16    ),
    .levelOut1    (levelOut17    ),
    .levelOut2    (levelOut18    ),
    .levelOut3    (levelOut19    ),
    .levelOut4    (levelOut20    ),
    .levelOut5    (levelOut21    ),
    .levelOut6    (levelOut22    ),
    .levelOut7    (levelOut23    ),
    .levelOutMembr(levelOutMembr2),
    .spikeOut     (spikeOut2     ),
    .err          (err2          ),
    .slope        (slope2        )
    );                          

spikeNeuron8_H7 node3(
    .CLK          (CLK           ),
    .RESET        (RESET         ),
    .pushSpikesIn (pushSpikesIn  ),
    .rate0        (rate24        ),
    .rate1        (rate25        ),
    .rate2        (rate26        ),
    .rate3        (rate27        ),
    .rate4        (rate28        ),
    .rate5        (rate29        ),
    .rate6        (rate30        ),
    .rate7        (rate31        ),
    .spikeIn0     (spikeIn0      ),
    .spikeIn1     (spikeIn1      ),
    .spikeIn2     (spikeIn2      ),
    .spikeIn3     (spikeIn3      ),
    .spikeIn4     (spikeIn4      ),
    .spikeIn5     (spikeIn5      ),
    .spikeIn6     (spikeIn6      ),
    .spikeIn7     (spikeIn7      ),
    .threshold    (threshold3    ),
    .weight0      (weight24      ),
    .weight1      (weight25      ),
    .weight2      (weight26      ),
    .weight3      (weight27      ),
    .weight4      (weight28      ),
    .weight5      (weight29      ),
    .weight6      (weight30      ),
    .weight7      (weight31      ),
    .activate     (activate      ),
    .accumulate   (accumulate    ),
    .prevSum      (prevSumNode3  ),
    .levelOut0    (levelOut24    ),
    .levelOut1    (levelOut25    ),
    .levelOut2    (levelOut26    ),
    .levelOut3    (levelOut27    ),
    .levelOut4    (levelOut28    ),
    .levelOut5    (levelOut29    ),
    .levelOut6    (levelOut30    ),
    .levelOut7    (levelOut31    ),
    .levelOutMembr(levelOutMembr3),
    .spikeOut     (spikeOut3     ),
    .err          (err3          ),
    .slope        (slope3        )
    );                          

spikeNeuron8_H7 node4(
    .CLK          (CLK           ),
    .RESET        (RESET         ),
    .pushSpikesIn (pushSpikesIn  ),
    .rate0        (rate32        ),
    .rate1        (rate33        ),
    .rate2        (rate34        ),
    .rate3        (rate35        ),
    .rate4        (rate36        ),
    .rate5        (rate37        ),
    .rate6        (rate38        ),
    .rate7        (rate39        ),
    .spikeIn0     (spikeIn0      ),
    .spikeIn1     (spikeIn1      ),
    .spikeIn2     (spikeIn2      ),
    .spikeIn3     (spikeIn3      ),
    .spikeIn4     (spikeIn4      ),
    .spikeIn5     (spikeIn5      ),
    .spikeIn6     (spikeIn6      ),
    .spikeIn7     (spikeIn7      ),
    .threshold    (threshold4    ),
    .weight0      (weight32      ),
    .weight1      (weight33      ),
    .weight2      (weight34      ),
    .weight3      (weight35      ),
    .weight4      (weight36      ),
    .weight5      (weight37      ),
    .weight6      (weight38      ),
    .weight7      (weight39      ),
    .activate     (activate      ),
    .accumulate   (accumulate    ),
    .prevSum      (prevSumNode4  ),
    .levelOut0    (levelOut32    ),
    .levelOut1    (levelOut33    ),
    .levelOut2    (levelOut34    ),
    .levelOut3    (levelOut35    ),
    .levelOut4    (levelOut36    ),
    .levelOut5    (levelOut37    ),
    .levelOut6    (levelOut38    ),
    .levelOut7    (levelOut39    ),
    .levelOutMembr(levelOutMembr4),
    .spikeOut     (spikeOut4     ),
    .err          (err4          ),
    .slope        (slope4        )
    );                          

spikeNeuron8_H7 node5(
    .CLK          (CLK           ),
    .RESET        (RESET         ),
    .pushSpikesIn (pushSpikesIn  ),
    .rate0        (rate40        ),
    .rate1        (rate41        ),
    .rate2        (rate42        ),
    .rate3        (rate43        ),
    .rate4        (rate44        ),
    .rate5        (rate45        ),
    .rate6        (rate46        ),
    .rate7        (rate47        ),
    .spikeIn0     (spikeIn0      ),
    .spikeIn1     (spikeIn1      ),
    .spikeIn2     (spikeIn2      ),
    .spikeIn3     (spikeIn3      ),
    .spikeIn4     (spikeIn4      ),
    .spikeIn5     (spikeIn5      ),
    .spikeIn6     (spikeIn6      ),
    .spikeIn7     (spikeIn7      ),
    .threshold    (threshold5    ),
    .weight0      (weight40      ),
    .weight1      (weight41      ),
    .weight2      (weight42      ),
    .weight3      (weight43      ),
    .weight4      (weight44      ),
    .weight5      (weight45      ),
    .weight6      (weight46      ),
    .weight7      (weight47      ),
    .activate     (activate      ),
    .accumulate   (accumulate    ),
    .prevSum      (prevSumNode5  ),
    .levelOut0    (levelOut40    ),
    .levelOut1    (levelOut41    ),
    .levelOut2    (levelOut42    ),
    .levelOut3    (levelOut43    ),
    .levelOut4    (levelOut44    ),
    .levelOut5    (levelOut45    ),
    .levelOut6    (levelOut46    ),
    .levelOut7    (levelOut47    ),
    .levelOutMembr(levelOutMembr5),
    .spikeOut     (spikeOut5     ),
    .err          (err5          ),
    .slope        (slope5        )
    );                          

spikeNeuron8_H7 node6(
    .CLK          (CLK           ),
    .RESET        (RESET         ),
    .pushSpikesIn (pushSpikesIn  ),
    .rate0        (rate48        ),
    .rate1        (rate49        ),
    .rate2        (rate50        ),
    .rate3        (rate51        ),
    .rate4        (rate52        ),
    .rate5        (rate53        ),
    .rate6        (rate54        ),
    .rate7        (rate55        ),
    .spikeIn0     (spikeIn0      ),
    .spikeIn1     (spikeIn1      ),
    .spikeIn2     (spikeIn2      ),
    .spikeIn3     (spikeIn3      ),
    .spikeIn4     (spikeIn4      ),
    .spikeIn5     (spikeIn5      ),
    .spikeIn6     (spikeIn6      ),
    .spikeIn7     (spikeIn7      ),
    .threshold    (threshold6    ),
    .weight0      (weight48      ),
    .weight1      (weight49      ),
    .weight2      (weight50      ),
    .weight3      (weight51      ),
    .weight4      (weight52      ),
    .weight5      (weight53      ),
    .weight6      (weight54      ),
    .weight7      (weight55      ),
    .activate     (activate      ),
    .accumulate   (accumulate    ),
    .prevSum      (prevSumNode6  ),
    .levelOut0    (levelOut48    ),
    .levelOut1    (levelOut49    ),
    .levelOut2    (levelOut50    ),
    .levelOut3    (levelOut51    ),
    .levelOut4    (levelOut52    ),
    .levelOut5    (levelOut53    ),
    .levelOut6    (levelOut54    ),
    .levelOut7    (levelOut55    ),
    .levelOutMembr(levelOutMembr6),
    .spikeOut     (spikeOut6     ),
    .err          (err6          ),
    .slope        (slope6        )
    );                          

spikeNeuron8_H7 node7(
    .CLK          (CLK           ),
    .RESET        (RESET         ),
    .pushSpikesIn (pushSpikesIn  ),
    .rate0        (rate56        ),
    .rate1        (rate57        ),
    .rate2        (rate58        ),
    .rate3        (rate59        ),
    .rate4        (rate60        ),
    .rate5        (rate61        ),
    .rate6        (rate62        ),
    .rate7        (rate63        ),
    .spikeIn0     (spikeIn0      ),
    .spikeIn1     (spikeIn1      ),
    .spikeIn2     (spikeIn2      ),
    .spikeIn3     (spikeIn3      ),
    .spikeIn4     (spikeIn4      ),
    .spikeIn5     (spikeIn5      ),
    .spikeIn6     (spikeIn6      ),
    .spikeIn7     (spikeIn7      ),
    .threshold    (threshold7    ),
    .weight0      (weight56      ),
    .weight1      (weight57      ),
    .weight2      (weight58      ),
    .weight3      (weight59      ),
    .weight4      (weight60      ),
    .weight5      (weight61      ),
    .weight6      (weight62      ),
    .weight7      (weight63      ),
    .activate     (activate      ),
    .accumulate   (accumulate    ),
    .prevSum      (prevSumNode7  ),
    .levelOut0    (levelOut56    ),
    .levelOut1    (levelOut57    ),
    .levelOut2    (levelOut58    ),
    .levelOut3    (levelOut59    ),
    .levelOut4    (levelOut60    ),
    .levelOut5    (levelOut61    ),
    .levelOut6    (levelOut62    ),
    .levelOut7    (levelOut63    ),
    .levelOutMembr(levelOutMembr7),
    .spikeOut     (spikeOut7     ),
    .err          (err7          ),
    .slope        (slope7        )
    );                          

endmodule
