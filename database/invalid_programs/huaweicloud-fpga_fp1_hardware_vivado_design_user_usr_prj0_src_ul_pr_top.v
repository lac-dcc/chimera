//
//------------------------------------------------------------------------------
//     Copyright (c) 2017 Huawei Technologies Co., Ltd. All Rights Reserved.
//
//     This program is free software; you can redistribute it and/or modify
//     it under the terms of the Huawei Software License (the "License").
//     A copy of the License is located in the "LICENSE" file accompanying 
//     this file.
//
//     This program is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
//     Huawei Software License for more details. 
//------------------------------------------------------------------------------

`resetall
`timescale 1ns/1ns
module ul_pr_top
#(
   `include "ul_basic_para_defines.h"
   `include "ul_ddr_para_defines.h"
   `include "ul_user_para_defines.h"
)
(
   `include "ul_sh_port_list.h"           
);
//--------------------------------------------
//  unused Interfaces set to 0
//--------------------------------------------
`include "unused_ddr_c_inst.h"
`include "unused_ddr_a_inst.h"
`include "unused_ddr_b_inst.h"
`include "unused_ddr_d_inst.h"
`include "unused_dmam_inst.h"
`include "unused_dmas_inst.h"
`include "unused_sh_bar5_inst.h"
//-------------------------------------------------
// cpu config signal
//-------------------------------------------------
wire                            cpu_wr           ;
wire    [ADDR_WIDTH-1:0]        cpu_addr         ;
wire    [DATA_WIDTH-1:0]        cpu_data_in      ;
wire                            cpu_rd           ;
wire    [DATA_WIDTH-1:0]        cpu_data_out     ;  

//-------------------------------------------------
// axi acess to bar 
//-------------------------------------------------
axi4l2hpis_adp 
    #(
     .ADDR_WIDTH         (ADDR_WIDTH             ),
     .DATA_WIDTH         (DATA_WIDTH             ),
     .DATA_BYTE_NUM      (DATA_BYTE_NUM          )	
     )
u_bar1_axi4l2hpi
   (
    
    .aclk                (clk_200m               ),
    .areset              (rst_200m               ),  
                                 
    .awvalid             (sh2bar1_awvalid        ),
    .awaddr              (sh2bar1_awaddr         ),
    .awready             (bar12sh_awready        ),
                                 
    .wvalid              (sh2bar1_wvalid         ),
    .wdata               (sh2bar1_wdata          ),
    .wstrb               (sh2bar1_wstrb          ),
    .wready              (bar12sh_wready         ),
                                 
    .bvalid              (bar12sh_bvalid         ),
    .bresp               (bar12sh_bresp          ),
    .bready              (sh2bar1_bready         ),
                                 
    .arvalid             (sh2bar1_arvalid        ),
    .araddr              (sh2bar1_araddr         ),
    .arready             (bar12sh_arready        ),

    .rvalid              (bar12sh_rvalid         ),
    .rdata               (bar12sh_rdata          ),
    .rresp               (bar12sh_rresp          ),
    .rready              (sh2bar1_rready         ),
                                  
    .cpu_wr              (cpu_wr                 ),
    .cpu_wr_addr         (cpu_addr               ),
    .cpu_wr_strb         (                       ),
    .cpu_data_in         (cpu_data_in            ),
    .cpu_rd              (cpu_rd                 ),
    .cpu_data_out        (cpu_data_out           )
   ); 

//-----------------------------------------------
// reg base
//-----------------------------------------------
reg_ul_access
    #(
     .CPU_ADDR_WIDTH      (12                     ),
     .CPU_DATA_WIDTH      (DATA_WIDTH             )	
     )
u_reg_ul_access
   (
    .clks                 (clk_200m               ),  
    .reset                (rst_200m               ),                            	    
    .ul2sh_vled           (ul2sh_vled             ),
    .cpu_wr               (cpu_wr                 ),
    .cpu_wr_addr          (cpu_addr[13:2]         ),
    .cpu_data_in          (cpu_data_in            ),
    .cpu_rd               (cpu_rd                 ),
    .cpu_data_out         (cpu_data_out           )
                 
   );      

//-----------------------------------------------
//ILA
//-----------------------------------------------
ila_0 u_ul_ila_0 (
    .clk                  ( clk_200m             ),
    .probe0               ( cpu_wr               ),
    .probe1               ( cpu_data_in[0]       ),
    .probe2               ( 1'b0                 ),
    .probe3               ( 1'b0                 ),
    .probe4               ( cpu_data_out[0]      ),
    .probe5               ( cpu_rd               )
);

//-----------------------------------------------
//bridge for XVC.
//-----------------------------------------------
debug_bridge_0 u_debug_bridge_0(
    .clk                  (clk_200m              ) ,
    .S_BSCAN_bscanid_en   (S_BSCAN_bscanid_en    ) ,
    .S_BSCAN_capture      (S_BSCAN_capture       ) , 
    .S_BSCAN_drck         (S_BSCAN_drck          ) ,
    .S_BSCAN_reset        (S_BSCAN_reset         ) ,
    .S_BSCAN_runtest      (S_BSCAN_runtest       ) ,
    .S_BSCAN_sel          (S_BSCAN_sel           ) ,
    .S_BSCAN_shift        (S_BSCAN_shift         ) ,
    .S_BSCAN_tck          (S_BSCAN_tck           ) ,
    .S_BSCAN_tdi          (S_BSCAN_tdi           ) ,
    .S_BSCAN_tdo          (S_BSCAN_tdo           ) ,
    .S_BSCAN_tms          (S_BSCAN_tms           ) ,
    .S_BSCAN_update       (S_BSCAN_update        ) 
);

endmodule
