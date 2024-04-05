//
//          mips_start_of_legal_notice
//          **********************************************************************
//        
//    Copyright (c) 2019 MIPS Tech, LLC, 300 Orchard City Dr., Suite 170, 
//    Campbell, CA 95008 USA.  All rights reserved.
//    This document contains information and code that is proprietary to 
//    MIPS Tech, LLC and MIPS' affiliates, as applicable, ("MIPS").  If this 
//    document is obtained pursuant to a MIPS Open license, the sole 
//    licensor under such license is MIPS Tech, LLC. This document and any 
//    information or code therein are protected by patent, copyright, 
//    trademarks and unfair competition laws, among others, and are 
//    distributed under a license restricting their use. MIPS has 
//    intellectual property rights, including patents or pending patent 
//    applications in the U.S. and in other countries, relating to the 
//    technology embodied in the product that is described in this document. 
//    Any distribution release of this document may include or be 
//    accompanied by materials developed by third parties. Any copying, 
//    reproducing, modifying or use of this information (in whole or in part) 
//    that is not expressly permitted in writing by MIPS or an authorized 
//    third party is strictly prohibited.  Any document provided in source 
//    format (i.e., in a modifiable form such as in FrameMaker or 
//    Microsoft Word format) may be subject to separate use and distribution 
//    restrictions applicable to such document. UNDER NO CIRCUMSTANCES MAY A 
//    DOCUMENT PROVIDED IN SOURCE FORMAT BE DISTRIBUTED TO A THIRD PARTY IN 
//    SOURCE FORMAT WITHOUT THE EXPRESS WRITTEN PERMISSION OF, OR LICENSED 
//    FROM, MIPS.  MIPS reserves the right to change the information or code 
//    contained in this document to improve function, design or otherwise.  
//    MIPS does not assume any liability arising out of the application or 
//    use of this information, or of any error or omission in such 
//    information. DOCUMENTATION AND CODE ARE PROVIDED "AS IS" AND ANY 
//    WARRANTIES, WHETHER EXPRESS, STATUTORY, IMPLIED OR OTHERWISE, 
//    INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY, 
//    FITNESS FOR A PARTICULAR PURPOSE OR NON-INFRINGEMENT, ARE EXCLUDED, 
//    EXCEPT TO THE EXTENT THAT SUCH DISCLAIMERS ARE HELD TO BE LEGALLY 
//    INVALID IN A COMPETENT JURISDICTION. Except as expressly provided in 
//    any written license agreement from MIPS or an authorized third party, 
//    the furnishing or distribution of this document does not give recipient 
//    any license to any intellectual property rights, including any patent 
//    rights, that cover the information in this document.  
//    Products covered by, and information or code, contained this document 
//    are controlled by U.S. export control laws and may be subject to the 
//    expert or import laws in other countries. The information contained 
//    in this document shall not be exported, reexported, transferred, or 
//    released, directly or indirectly, in violation of the law of any 
//    country or international law, regulation, treaty, executive order, 
//    statute, amendments or supplements thereto. Nuclear, missile, chemical 
//    weapons, biological weapons or nuclear maritime end uses, whether 
//    direct or indirect, are strictly prohibited.  Should a conflict arise 
//    regarding the export, reexport, transfer, or release of the information 
//    contained in this document, the laws of the United States of America 
//    shall be the governing law.  
//    U.S Government Rights - Commercial software.  Government users are 
//    subject to the MIPS Tech, LLC standard license agreement and applicable 
//    provisions of the FAR and its supplements.
//    MIPS and MIPS Open are trademarks or registered trademarks of MIPS in 
//    the United States and other countries.  All other trademarks referred 
//    to herein are the property of their respective owners.  
//      
//      
//    **********************************************************************
//    mips_end_of_legal_notice
//

`include "m14k_const.vh"

module m14k_udi_mipsfpga_ai
(
    input         UDI_gclk,         // Clock
    input         UDI_greset,       // Reset
    input         UDI_gscanenable,  // Scan enable

    // Static signals
    
    input         UDI_endianb_e,    // Endian : 0 = little , 1 = big
    input         UDI_kd_mode_e,    // Mode   : 0 = user   , 1 = kernel or debug
    output        UDI_present,      // UDI module is present

    // E-stage signals (in the order of their timing)

    input  [31:0] UDI_ir_e,         // Instruction register
    input         UDI_irvalid_e,    // Instruction register valid

    output        UDI_ri_e,         // The instruction is illegal

    input  [31:0] UDI_rs_e,         // Value of register RS from register file
    input  [31:0] UDI_rt_e,         // Value of register RT from register file

    output [ 4:0] UDI_wrreg_e,      // Register file index to write the result
                                    // Zero index indicates don't write

    input         UDI_start_e,      // Values of RS and RT valid

    // M-stage signals (in the order of their timing)

    output        UDI_stall_m,      // Stall the pipeline
    output [31:0] UDI_rd_m,         // Result to write back

    input         UDI_run_m,        // Qualify UDI_kill_m
    input         UDI_kill_m,       // Kill the instruction

    // Other signals

    output        UDI_honor_cee,    // UDI module has local state

    input  [`M14K_UDI_EXT_TOUDI_WIDTH   - 1:0]  UDI_toudi,   // External input to UDI module
    output [`M14K_UDI_EXT_FROMUDI_WIDTH - 1:0]  UDI_fromudi  // Output from UDI module to external system
);

    assign UDI_present    = 1'b1;
    assign UDI_wrreg_e    = UDI_ir_e [25:21];  // RS register
    assign UDI_stall_m    = 1'b0;
    assign UDI_honor_cee  = 1'b0;
    assign UDI_fromudi    = { `M14K_UDI_EXT_FROMUDI_WIDTH { 1'b0 } };

    wire   spc2           = ( UDI_ir_e [31:26] == 6'b011100 );
    wire   udi            = ( UDI_ir_e [ 5: 4] == 2'b01     );
    wire   usr_udi_vld    = ( UDI_ir_e [ 3: 1] == 3'b000    );

    wire   ir_ok          = spc2 & udi & usr_udi_vld & UDI_irvalid_e;
    assign UDI_ri_e       = ! ir_ok;

    wire   run_instr      = ir_ok & UDI_start_e;

    wire [15:0] imm16 = { UDI_ir_e [0], UDI_ir_e [20:6] };

    wire [31:0] e_res, e_res_q;

    assign e_res [ 7: 0] = UDI_rs_e [ 7: 0] * imm16 [ 3: 0];
    assign e_res [15: 8] = UDI_rs_e [15: 8] * imm16 [ 7: 4];
    assign e_res [23:16] = UDI_rs_e [23:16] * imm16 [11: 8];
    assign e_res [31:24] = UDI_rs_e [31:24] * imm16 [15:12];

    mvp_cregister_wide # (32) e_res_r
    (
        .q          ( e_res_q         ),
        .scanenable ( UDI_gscanenable ),
        .cond       ( run_instr       ),
        .clk        ( UDI_gclk        ),
        .d          ( e_res           )
    );

    wire [7:0] m_res_01 = e_res_q [15: 8] + e_res_q [ 7:0];
    wire [7:0] m_res_23 = e_res_q [31:24] + e_res_q [23:16];
    wire [7:0] m_res    = m_res_01 + m_res_23;

    assign UDI_rd_m = { 24'b0, m_res };

endmodule
