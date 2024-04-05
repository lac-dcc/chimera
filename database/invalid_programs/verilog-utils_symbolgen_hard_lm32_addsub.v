// =============================================================================
//                           COPYRIGHT NOTICE
// Copyright 2006 (c) Lattice Semiconductor Corporation
// ALL RIGHTS RESERVED
// This confidential and proprietary software may be used only as authorised by
// a licensing agreement from Lattice Semiconductor Corporation.
// The entire notice above must be reproduced on all authorized copies and
// copies may only be made to the extent permitted by a licensing agreement from
// Lattice Semiconductor Corporation.
//
// Lattice Semiconductor Corporation        TEL : 1-800-Lattice (USA and Canada)
// 5555 NE Moore Court                            408-826-6000 (other locations)
// Hillsboro, OR 97124                     web  : http://www.latticesemi.com/
// U.S.A                                   email: techsupport@latticesemi.com
// =============================================================================/
//                         FILE DETAILS
// Project          : LatticeMico32
// File             : lm32_addsub.v
// Title            : PMI adder/subtractor.
// Version          : 6.1.17
//                  : Initial Release
// Version          : 7.0SP2, 3.0
//                  : No Change
// Version          : 3.1
//                  : No Change
// =============================================================================

`include "lm32_include.v"

/////////////////////////////////////////////////////
// Module interface
/////////////////////////////////////////////////////

module lm32_addsub (
    // ----- Inputs -------
    DataA, 
    DataB, 
    Cin, 
    Add_Sub, 
    // ----- Outputs -------
    Result, 
    Cout
    );

/////////////////////////////////////////////////////
// Inputs
/////////////////////////////////////////////////////

input [31:0] DataA;
input [31:0] DataB;
input Cin;
input Add_Sub;

/////////////////////////////////////////////////////
// Outputs
/////////////////////////////////////////////////////

output [31:0] Result;
wire   [31:0] Result;
output Cout;
wire   Cout;

/////////////////////////////////////////////////////
// Instantiations
///////////////////////////////////////////////////// 

       generate
	  if (`LATTICE_FAMILY == "SC" || `LATTICE_FAMILY == "SCM") begin
	     wire [32:0] tmp_addResult = DataA + DataB + Cin;
	     wire [32:0] tmp_subResult = DataA - DataB - !Cin;   
   
	     assign  Result = (Add_Sub == 1) ? tmp_addResult[31:0] : tmp_subResult[31:0];
	     assign  Cout = (Add_Sub == 1) ? tmp_addResult[32] : !tmp_subResult[32];
	  end else begin
	    pmi_addsub #(// ----- Parameters -------
			 .pmi_data_width     (32),
			 .pmi_result_width   (32),
			 .pmi_sign           ("off"),
			 .pmi_family         (`LATTICE_FAMILY),
			 .module_type        ("pmi_addsub")) 
	      addsub    (// ----- Inputs -------
			 .DataA              (DataA),
			 .DataB              (DataB),
			 .Cin                (Cin),
			 .Add_Sub            (Add_Sub),
			 // ----- Outputs -------
			 .Result             (Result),
			 .Cout               (Cout),
			 .Overflow           ());
	  end
       endgenerate 

endmodule
