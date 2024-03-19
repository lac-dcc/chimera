//  decCharToBinFractPart.v
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

module decCharToBinFractPart (
    CLK,
    RESET,
    wren_del_1,
    decExp_del_1,
    intIsZero,
    fractIsZero,
    fractIsSubnormal,
    fractPartBin,
    fractPartMant,
    biasedBinExpOut,
    GRS_fract
    );

input CLK;
input RESET;
input wren_del_1;
input [4:0] decExp_del_1;
input intIsZero;
input fractIsZero;
input fractIsSubnormal;
input [23:0] fractPartBin;
output [8:0] fractPartMant; 
output [6:0] biasedBinExpOut;
output [2:0] GRS_fract;

wire [8:0] fractPartMant;
wire [6:0] biasedExp;
wire [6:0] biasedBinExpOut;
wire [23:0] FractWeight;

reg [23:0] fractPartBin_q2;
always @(posedge CLK)
    if (RESET) fractPartBin_q2 <= 0;
    else fractPartBin_q2 <= {fractPartBin}; 
    
wire FractWeightLTEtotal;
wire FractWeightS1LTEtotal;     
wire FractWeightS2LTEtotal; 

wire [2:0] GRS_fract;    

DecCharToBinROMweightsFract DctbRomFract(
    .CLK             (CLK             ),
    .RESET           (RESET           ),
    .rden            (wren_del_1      ),
    .decExpIn        ((intIsZero && ~|decExp_del_1) ? 5'b00001 : decExp_del_1),
    .intIsZero       (intIsZero       ),
    .fractIsZero     (fractIsZero     ),
    .fractIsSubnormal(fractIsSubnormal),
    .fractPartBin    (fractPartBin_q2),
    .FractWeightOut  (FractWeight     ),
    .binExpOut       (biasedExp       ),
    .FractWeightLTEtotal  (FractWeightLTEtotal  ),
    .FractWeightS1LTEtotal(FractWeightS1LTEtotal),
    .FractWeightS2LTEtotal(FractWeightS2LTEtotal)
    );  
    
decCharToBinHalfSystFractH8 FractHalfSys (
    .CLK            (CLK              ),
    .RESET          (RESET            ),
    .biasedExp      (biasedExp        ),
    .Weight         (FractWeight      ),
    .PartBin        (fractPartBin_q2  ),
    .PartMant       (fractPartMant    ),
    .biasedBinExpOut(biasedBinExpOut  ),
    .WeightLTEtotal  (FractWeightLTEtotal  ),
    .WeightS1LTEtotal(FractWeightS1LTEtotal),    
    .WeightS2LTEtotal(FractWeightS2LTEtotal),
    .GRS             (GRS_fract       )
        
    );              

endmodule
