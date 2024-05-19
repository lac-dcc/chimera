// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenHBMC
 *  Filename: rom128xN.v
 *  Purpose:  Single port variable width 128-deep ROM based on Xilinx
 *            ROM128X1 primitive.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020-2021, Vaagn Oganesyan <ovgn@protonmail.com>
 *  
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  
 *      http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 * ----------------------------------------------------------------------------
 */

 
`timescale 1 ps / 1 ps
`default_nettype none

 
module rom128xN #
(
    parameter           OUTPUT_REG = "NOT_SELECTED",
    parameter   integer DATA_WIDTH = 128,
    
    parameter   [DATA_WIDTH - 1:0]  INIT_ROM_00 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_01 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_02 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_03 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_04 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_05 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_06 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_07 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_08 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_09 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_0A = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_0B = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_0C = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_0D = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_0E = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_0F = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_10 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_11 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_12 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_13 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_14 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_15 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_16 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_17 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_18 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_19 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_1A = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_1B = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_1C = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_1D = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_1E = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_1F = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_20 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_21 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_22 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_23 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_24 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_25 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_26 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_27 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_28 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_29 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_2A = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_2B = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_2C = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_2D = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_2E = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_2F = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_30 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_31 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_32 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_33 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_34 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_35 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_36 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_37 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_38 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_39 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_3A = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_3B = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_3C = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_3D = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_3E = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_3F = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_40 = {DATA_WIDTH{1'b0}},
                                    INIT_ROM_41 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_42 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_43 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_44 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_45 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_46 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_47 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_48 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_49 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_4A = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_4B = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_4C = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_4D = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_4E = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_4F = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_50 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_51 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_52 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_53 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_54 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_55 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_56 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_57 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_58 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_59 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_5A = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_5B = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_5C = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_5D = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_5E = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_5F = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_60 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_61 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_62 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_63 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_64 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_65 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_66 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_67 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_68 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_69 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_6A = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_6B = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_6C = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_6D = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_6E = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_6F = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_70 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_71 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_72 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_73 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_74 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_75 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_76 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_77 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_78 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_79 = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_7A = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_7B = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_7C = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_7D = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_7E = {DATA_WIDTH{1'b0}},    
                                    INIT_ROM_7F = {DATA_WIDTH{1'b0}}
)
(
    input   wire                        clk,
    input   wire                        cen,
    input   wire    [6:0]               addr,
    output  wire    [DATA_WIDTH - 1:0]  dout
);
    
/*----------------------------------------------------------------------------------*/
    
    /* Checking input parameters */
    
    generate
        if ((OUTPUT_REG != "TRUE") && (OUTPUT_REG != "FALSE")) begin
            //INVALID_PARAMETER invalid_parameter_msg();
            initial begin
                $error("Invalid parameter!");
            end
        end
    endgenerate

/*----------------------------------------------------------------------------------*/
    
    wire    [DATA_WIDTH - 1:0]  imm_out;
    
    generate
        if (OUTPUT_REG == "TRUE") begin
            reg     [DATA_WIDTH - 1:0]  dout_reg = {DATA_WIDTH{1'b0}};
        
            always @(posedge clk) begin
                if (cen) begin
                    dout_reg <= imm_out;
                end
            end
            
            assign dout = dout_reg;
        end else begin
            assign dout = imm_out;
        end
    endgenerate
    
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
    
    genvar i;
    
    generate
        for (i = 0; i < DATA_WIDTH; i = i + 1) begin : rom_array
            ROM128X1 #
            (
                .INIT   // Initial contents of ROM
                (
                    {
                        INIT_ROM_7F[i], INIT_ROM_7E[i], INIT_ROM_7D[i], INIT_ROM_7C[i], INIT_ROM_7B[i], INIT_ROM_7A[i], INIT_ROM_79[i], INIT_ROM_78[i],
                        INIT_ROM_77[i], INIT_ROM_76[i], INIT_ROM_75[i], INIT_ROM_74[i], INIT_ROM_73[i], INIT_ROM_72[i], INIT_ROM_71[i], INIT_ROM_70[i],
                        
                        INIT_ROM_6F[i], INIT_ROM_6E[i], INIT_ROM_6D[i], INIT_ROM_6C[i], INIT_ROM_6B[i], INIT_ROM_6A[i], INIT_ROM_69[i], INIT_ROM_68[i],
                        INIT_ROM_67[i], INIT_ROM_66[i], INIT_ROM_65[i], INIT_ROM_64[i], INIT_ROM_63[i], INIT_ROM_62[i], INIT_ROM_61[i], INIT_ROM_60[i],
                    
                        INIT_ROM_5F[i], INIT_ROM_5E[i], INIT_ROM_5D[i], INIT_ROM_5C[i], INIT_ROM_5B[i], INIT_ROM_5A[i], INIT_ROM_59[i], INIT_ROM_58[i],
                        INIT_ROM_57[i], INIT_ROM_56[i], INIT_ROM_55[i], INIT_ROM_54[i], INIT_ROM_53[i], INIT_ROM_52[i], INIT_ROM_51[i], INIT_ROM_50[i],
                        
                        INIT_ROM_4F[i], INIT_ROM_4E[i], INIT_ROM_4D[i], INIT_ROM_4C[i], INIT_ROM_4B[i], INIT_ROM_4A[i], INIT_ROM_49[i], INIT_ROM_48[i],
                        INIT_ROM_47[i], INIT_ROM_46[i], INIT_ROM_45[i], INIT_ROM_44[i], INIT_ROM_43[i], INIT_ROM_42[i], INIT_ROM_41[i], INIT_ROM_40[i],
                        
                        INIT_ROM_3F[i], INIT_ROM_3E[i], INIT_ROM_3D[i], INIT_ROM_3C[i], INIT_ROM_3B[i], INIT_ROM_3A[i], INIT_ROM_39[i], INIT_ROM_38[i],
                        INIT_ROM_37[i], INIT_ROM_36[i], INIT_ROM_35[i], INIT_ROM_34[i], INIT_ROM_33[i], INIT_ROM_32[i], INIT_ROM_31[i], INIT_ROM_30[i],
                        
                        INIT_ROM_2F[i], INIT_ROM_2E[i], INIT_ROM_2D[i], INIT_ROM_2C[i], INIT_ROM_2B[i], INIT_ROM_2A[i], INIT_ROM_29[i], INIT_ROM_28[i],
                        INIT_ROM_27[i], INIT_ROM_26[i], INIT_ROM_25[i], INIT_ROM_24[i], INIT_ROM_23[i], INIT_ROM_22[i], INIT_ROM_21[i], INIT_ROM_20[i],
                        
                        INIT_ROM_1F[i], INIT_ROM_1E[i], INIT_ROM_1D[i], INIT_ROM_1C[i], INIT_ROM_1B[i], INIT_ROM_1A[i], INIT_ROM_19[i], INIT_ROM_18[i],
                        INIT_ROM_17[i], INIT_ROM_16[i], INIT_ROM_15[i], INIT_ROM_14[i], INIT_ROM_13[i], INIT_ROM_12[i], INIT_ROM_11[i], INIT_ROM_10[i],
                        
                        INIT_ROM_0F[i], INIT_ROM_0E[i], INIT_ROM_0D[i], INIT_ROM_0C[i], INIT_ROM_0B[i], INIT_ROM_0A[i], INIT_ROM_09[i], INIT_ROM_08[i],
                        INIT_ROM_07[i], INIT_ROM_06[i], INIT_ROM_05[i], INIT_ROM_04[i], INIT_ROM_03[i], INIT_ROM_02[i], INIT_ROM_01[i], INIT_ROM_00[i]
                    }
                )
            )
            ROM128X1_inst 
            (
                .O  ( imm_out[i] ),     // ROM immediate output
                .A0 ( addr[0]    ),     // ROM address[0]
                .A1 ( addr[1]    ),     // ROM address[1]
                .A2 ( addr[2]    ),     // ROM address[2]
                .A3 ( addr[3]    ),     // ROM address[3]
                .A4 ( addr[4]    ),     // ROM address[4]
                .A5 ( addr[5]    ),     // ROM address[5]
                .A6 ( addr[6]    )      // ROM address[6]
            );
        end
    endgenerate
    
endmodule

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
