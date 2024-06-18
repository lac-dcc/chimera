// This program was cloned from: https://github.com/OpenCAPI/ThymesisFlow
// License: Apache License 2.0

// *!***************************************************************************
// *! Copyright 2019 International Business Machines
// *!
// *! Licensed under the Apache License, Version 2.0 (the "License");
// *! you may not use this file except in compliance with the License.
// *! You may obtain a copy of the License at
// *! http://www.apache.org/licenses/LICENSE-2.0 
// *!
// *! The patent license granted to you in Section 3 of the License, as applied
// *! to the "Work," hereby includes implementations of the Work in physical form.  
// *!
// *! Unless required by applicable law or agreed to in writing, the reference design
// *! distributed under the License is distributed on an "AS IS" BASIS,
// *! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// *! See the License for the specific language governing permissions and
// *! limitations under the License.
// *! 
// *! The background Specification upon which this is based is managed by and available from
// *! the OpenCAPI Consortium.  More information can be found at https://opencapi.org. 
// *!***************************************************************************
`timescale 1ns / 10ps
`define IBM_SIM

// ******************************************************************************************************************************
// File Name          :  ocx_tlx_513x32_fifo.v
// Project            :  TLX 0.7x Reference Design (External Transaction Layer logic for attaching to the IBM P9 OpenCAPI Interface)
// Module Name        :  ocx_tlx_513x32_fifo
//
// Module Description : This logic does the following:
//     - 
//
// To see module sub-sections search for @@@
//
// ******************************************************************************************************************************
// Modification History :
//                                      | Version   |     | Author   | Date        | Description of change
//                                      | --------- |     | -------- | ----------- | ---------------------
   `define OCX_TLX_513X32_FIFO_VERSION   07_Sep_2017   // |          | Sep.07,2017 | Doubled the depth of the fifo to 32
//
// ******************************************************************************************************************************


// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================
module ocx_tlx_513x32_fifo
    (
        // -----------------------------------
        // Miscellaneous Ports
        // -----------------------------------
        data_in             ,
        wr_enable           ,
        data_out            ,
        rd_done             ,
        use_min_fifo_depth  ,

        data_look_ahead     ,
        data_available      ,
        underflow_error     ,
        overflow_error      ,

        clock               ,
        reset_n
    ) ;


// ==============================================================================================================================
// @@@  Parameters   (These can be overwritten by module instatiation.)
// ==============================================================================================================================


// ==============================================================================================================================
// @@@  Port Declarations
// ==============================================================================================================================

        // -----------------------------------
        // Miscellaneous Ports
        // -----------------------------------
        input  [512:0]                 data_in              ;
        input                          wr_enable            ;
        output [512:0]                 data_out             ;
        input                          rd_done              ;
        input                          use_min_fifo_depth   ;

        output                         data_look_ahead      ;
        output                         data_available       ;
        output                         underflow_error      ;
        output                         overflow_error       ;

        input                          clock                ;
        input                          reset_n              ;


// ==============================================================================================================================
// @@@  Wires and Variables (Regs)
// ==============================================================================================================================

        wire    [4:0]  ram_wr_addr   ;
        wire    [4:0]  ram_rd_addr   ;
        wire           ram_wr_enable ;
        wire           rd_data_capture ;


// ==============================================================================================================================
// @@@  DistributedRAM Inferrence and Instantiation
// ==============================================================================================================================
`ifdef IBM_SIM
    // ----------------
    // INFERRED REGFILE
    // ----------------
    // RAM Inferrence  (To work with IBM cycle simulators.)
    ocx_leaf_inferd_regfile # (
   
      // Parameters (Can be used to overwrite the lower-level file.)
      .REGFILE_DEPTH    (32),        //positive integer
      .REGFILE_WIDTH   (513),        //positive integer
      .ADDR_WIDTH        (5)         //positive integer

    ) fifo_memory_inst (

      // Port A module ports (This is a WRITE-ONLY port.)
      .clka   ( clock         ),
      .ena    ( ram_wr_enable ),
      .addra  ( ram_wr_addr   ),
      .dina   ( data_in       ),
   
      // Port B module ports (This is a READ-ONLY port.)
      .clkb   ( clock         ),
      .rstb_n ( reset_n       ),
      .enb    ( rd_data_capture ),
      .addrb  ( ram_rd_addr   ),
      .doutb  ( data_out      )
    );  // End of inferred regfile instance

`else
    // ---------------------
    // INSTANTIATED DIST-RAM
    // ---------------------
    // Xilinx Distributed RAM Instantiation
    // xpm_memory_dpdistram: Dual Port distributed RAM
    // Xilinx Parameterized Macro, Version 2016.2
    xpm_memory_dpdistram # (
   
      // Common module parameters
      .MEMORY_SIZE        (16416),                //positive integer
      .CLOCKING_MODE      ("common_clock"),      //string; "common_clock", "independent_clock" 
      .MEMORY_INIT_FILE   ("none"),              //string; "none" or "<filename>.mem" 
      .MEMORY_INIT_PARAM  (""    ),              //string;
      .USE_MEM_INIT       (1),                   //integer; 0,1
      .MESSAGE_CONTROL    (0),                   //integer; 0,1
   
      // Port A module parameters
      .WRITE_DATA_WIDTH_A (513),                 //positive integer
      .READ_DATA_WIDTH_A  (513),                 //positive integer
      .BYTE_WRITE_WIDTH_A (513),                 //integer; 8, 9, or WRITE_DATA_WIDTH_A value
      .ADDR_WIDTH_A       (5),                   //positive integer
      .READ_reset_n_VALUE_A ("0"),                 //string
      .READ_LATENCY_A     (0),                   //non-negative integer
   
      // Port B module parameters
      .READ_DATA_WIDTH_B  (513),                 //positive integer
      .ADDR_WIDTH_B       (5),                   //positive integer
      .READ_reset_n_VALUE_B ("0"),                 //string
      .READ_LATENCY_B     (1)                    //non-negative integer
   
    ) fifo_memory_inst (
   
      // Port A module ports
      .clka   ( clock         ),
      .rsta   ( reset_n       ),
      .ena    ( ram_wr_enable ),
      .regcea ( 1'b1          ),
      .wea    ( ram_wr_enable ),
      .addra  ( ram_wr_addr   ),
      .dina   ( data_in       ),
      .douta  ( douta         ),
   
      // Port B module ports
      .clkb   ( clock         ),
      .rstb   ( reset_n       ),
      .enb    ( rd_data_capture ),
      .regceb ( 1'b1          ),
      .addrb  ( ram_rd_addr   ),
      .doutb  ( data_out      )
    );  // End of xpm_memory_dpdistram instance declaration
`endif


// ==============================================================================================================================
// @@@  FIFO Controller Instantiation
// ==============================================================================================================================
ocx_tlx_fifo_cntlr
    #(
        // Note:   The FIFO will be *built* using the size specified by these parameters (or as overwritten by instantiation.)
        .FIFO_ADDR_WIDTH  ( 5 )
    )
    FIFO_CNTLR
    (
        // -----------------------------------
        // Miscellaneous Ports
        // -----------------------------------
        .fifo_wr              ( wr_enable            ) ,
        .fifo_rd_done         ( rd_done              ) ,
                                
        .ram_wr_addr          ( ram_wr_addr          ) ,   // [FIFO_ADDR_WIDTH-1:0]
        .ram_wr_enable        ( ram_wr_enable        ) ,
        .ram_rd_addr          ( ram_rd_addr          ) ,   // [FIFO_ADDR_WIDTH-1:0]
        .rd_data_capture      ( rd_data_capture      ) ,
                                
        .fifo_data_look_ahead ( data_look_ahead      ) ,
        .fifo_data_available  ( data_available       ) ,
        .fifo_underflow_error ( underflow_error      ) ,
        .fifo_overflow_error  ( overflow_error       ) ,

        .clock                ( clock                ) ,
        .reset_n              ( reset_n              )
    ) ;


endmodule  // ocx_tlx_513x32_fifo
