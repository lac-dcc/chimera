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

// ******************************************************************************************************************************
// File Name          :  ocx_tlx_top.v
// Project            :  TLX 0.7x Reference Design (External Transaction Layer logic for attaching to the IBM P9 OpenCAPI Interface)
// Module Name        :  ocx_tlx_top 
//
// Module Description : This logic does the following:
//     - Instantiates the tlx_parser module
//     - Instantiates the tlx_framer module
//
// To find the subsections of this module, search for "@@@"
//
// ******************************************************************************************************************************
// OpenCAPI 3.0 TLX VERSION NUMBER :
// Update the following line whenever a new version of TLX is released (even if only lower level files changed).
// Format is: yymmddvv where yy = year (i.e. 18 = 2018), mm = month, dd = day, vv = version made on that day, starting with 00
//`define OC3_TLX_VERSION 32'h18011800
//`define OC3_TLX_VERSION 32'h18020700   // Some clean up for tvc compile warnings.   No functional change.
//`define OC3_TLX_VERSION 32'h18061800   // Remove a change that was put in previously for timing (for better bandwidth)
//`define OC3_TLX_VERSION 32'h18071600   // Allow TLX Receiver FIFO depths to be set using top-level parameters
  `define OC3_TLX_VERSION 32'h18101000   // Changes in Framer to reset the capt_cfg_packet latch, move reset earlier in flit_will_be_sent logic.
// ******************************************************************************************************************************


// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================
module ocx_tlx_top
    #(
        // NOTE!  EVEN THOUGH THESE PARAMETERS ALLOW THE TLX RECEIVER FIFO SIZES TO BE CHANGED, ONLY THE CURRENT FIFO SIZES HAVE BEEN VERIFIED!!!
        parameter capp_vc0_fifo_addr_width  = 7,
        parameter capp_vc1_fifo_addr_width  = 6,
        parameter capp_dcp0_fifo_addr_width = 8,
        parameter capp_dcp1_fifo_addr_width = 7
    )
    (
        // -----------------------------------
        // TLX Parser to AFU Receive Interface
        // -----------------------------------
        // --TLX Ready signal
        tlx_afu_ready                     ,

        // Command interface to AFU
        afu_tlx_cmd_initial_credit        ,
        afu_tlx_cmd_credit                ,
        tlx_afu_cmd_valid                 ,
        tlx_afu_cmd_opcode                ,
        tlx_afu_cmd_dl                    ,
        tlx_afu_cmd_end                   ,
        tlx_afu_cmd_pa                    ,
        tlx_afu_cmd_flag                  ,
        tlx_afu_cmd_os                    ,
        tlx_afu_cmd_capptag               ,
        tlx_afu_cmd_pl                    ,
        tlx_afu_cmd_be                    ,
        // tlx_afu_cmd_t                     ,

        // Config Command interface to AFU
        cfg_tlx_initial_credit            ,
        cfg_tlx_credit_return             ,
        tlx_cfg_valid                     ,
        tlx_cfg_opcode                    ,
        tlx_cfg_pa                        ,
        tlx_cfg_t                         ,
        tlx_cfg_pl                        , 
        tlx_cfg_capptag                   ,
        tlx_cfg_data_bus                  ,
        tlx_cfg_data_bdi                  ,

         
        // Response interface to AFU
        afu_tlx_resp_initial_credit       ,
        afu_tlx_resp_credit               ,
        tlx_afu_resp_valid                ,
        tlx_afu_resp_opcode               ,
        tlx_afu_resp_afutag               ,
        tlx_afu_resp_code                 ,
        tlx_afu_resp_pg_size              ,
        tlx_afu_resp_dl                   ,
        tlx_afu_resp_dp                   ,
        tlx_afu_resp_host_tag             ,
        tlx_afu_resp_cache_state          ,
        tlx_afu_resp_addr_tag             ,

        // Command data interface to AFU
        afu_tlx_cmd_rd_req                ,
        afu_tlx_cmd_rd_cnt                ,
        tlx_afu_cmd_data_valid            ,
        tlx_afu_cmd_data_bus              ,
        tlx_afu_cmd_data_bdi              ,

        // Response data interface to AFU
        afu_tlx_resp_rd_req               ,
        afu_tlx_resp_rd_cnt               ,
        tlx_afu_resp_data_valid           ,
        tlx_afu_resp_data_bus             ,
        tlx_afu_resp_data_bdi             ,

        // -----------------------------------
        // AFU to TLX Framer Transmit Interface
        // -----------------------------------

        // --- Commands from AFU
        tlx_afu_cmd_initial_credit        ,
        tlx_afu_cmd_credit                ,
        afu_tlx_cmd_valid                 ,
        afu_tlx_cmd_opcode                ,
        afu_tlx_cmd_actag                 ,
        afu_tlx_cmd_stream_id             ,
        afu_tlx_cmd_ea_or_obj             ,
        afu_tlx_cmd_afutag                ,
        afu_tlx_cmd_dl                    ,
        afu_tlx_cmd_pl                    ,
        afu_tlx_cmd_os                    ,
        afu_tlx_cmd_be                    ,
        afu_tlx_cmd_flag                  ,
        afu_tlx_cmd_endian                ,
        afu_tlx_cmd_bdf                   ,
        afu_tlx_cmd_pasid                 ,
        afu_tlx_cmd_pg_size               ,

        // --- Command data from AFU
        tlx_afu_cmd_data_initial_credit   ,
        tlx_afu_cmd_data_credit           ,
        afu_tlx_cdata_valid               ,
        afu_tlx_cdata_bus                 ,
        afu_tlx_cdata_bdi                 ,

        // --- Responses from AFU
        tlx_afu_resp_initial_credit       ,
        tlx_afu_resp_credit               ,
        afu_tlx_resp_valid                ,
        afu_tlx_resp_opcode               ,
        afu_tlx_resp_dl                   ,
        afu_tlx_resp_capptag              ,
        afu_tlx_resp_dp                   ,
        afu_tlx_resp_code                 ,

        // --- Response data from AFU
        tlx_afu_resp_data_initial_credit  ,
        tlx_afu_resp_data_credit          ,
        afu_tlx_rdata_valid               ,
        afu_tlx_rdata_bus                 ,
        afu_tlx_rdata_bdi                 ,

        // --- Config Responses from AFU
        cfg_tlx_resp_valid                ,
        cfg_tlx_resp_opcode               ,
        cfg_tlx_resp_capptag              ,
        cfg_tlx_resp_code                 ,
        tlx_cfg_resp_ack                  ,

        // --- Config Response data from AFU
        cfg_tlx_rdata_offset              ,
        cfg_tlx_rdata_bus                 ,
        cfg_tlx_rdata_bdi                 ,

        // -----------------------------------
        // DLX to TLX Parser Interface
        // -----------------------------------
        dlx_tlx_flit_valid                ,
        dlx_tlx_flit                      ,
        dlx_tlx_flit_crc_err              ,
        dlx_tlx_link_up                   ,


        // -----------------------------------
        // TLX Framer to DLX Interface
        // -----------------------------------
        dlx_tlx_flit_credit               ,
        dlx_tlx_init_flit_depth           ,            
        tlx_dlx_flit_valid                ,
        tlx_dlx_flit                      ,
        tlx_dlx_debug_encode              ,
        tlx_dlx_debug_info                ,
        dlx_tlx_dlx_config_info           ,


        // -----------------------------------
        // Configuration Ports
        // -----------------------------------
        cfg_tlx_xmit_tmpl_config_0        ,
        cfg_tlx_xmit_tmpl_config_1        ,
        cfg_tlx_xmit_tmpl_config_2        ,
        cfg_tlx_xmit_tmpl_config_3        ,
        cfg_tlx_xmit_rate_config_0        ,
        cfg_tlx_xmit_rate_config_1        ,
        cfg_tlx_xmit_rate_config_2        ,
        cfg_tlx_xmit_rate_config_3        ,

        tlx_cfg_in_rcv_tmpl_capability_0  ,
        tlx_cfg_in_rcv_tmpl_capability_1  ,
        tlx_cfg_in_rcv_tmpl_capability_2  ,
        tlx_cfg_in_rcv_tmpl_capability_3  ,
        tlx_cfg_in_rcv_rate_capability_0  ,
        tlx_cfg_in_rcv_rate_capability_1  ,
        tlx_cfg_in_rcv_rate_capability_2  ,
        tlx_cfg_in_rcv_rate_capability_3  ,

        tlx_cfg_oc3_tlx_version           ,


        // -----------------------------------
        // Miscellaneous Ports
        // -----------------------------------
        clock                             ,
        reset_n
    ) ;


// ==============================================================================================================================
// @@@  Parameters
// ==============================================================================================================================


// ==============================================================================================================================
// @@@  Port Declarations
// ==============================================================================================================================

        // -----------------------------------
        // TLX Parser to AFU Receive Interface
        // -----------------------------------
        output             tlx_afu_ready                     ;

        // Command interface to AFU
        input   [  6:0]    afu_tlx_cmd_initial_credit        ;
        input              afu_tlx_cmd_credit                ;
        output             tlx_afu_cmd_valid                 ;
        output  [  7:0]    tlx_afu_cmd_opcode                ;
        output  [  1:0]    tlx_afu_cmd_dl                    ;
        output             tlx_afu_cmd_end                   ;
        output  [ 63:0]    tlx_afu_cmd_pa                    ;
        output  [  3:0]    tlx_afu_cmd_flag                  ;
        output             tlx_afu_cmd_os                    ;
        output  [ 15:0]    tlx_afu_cmd_capptag               ;
        output  [  2:0]    tlx_afu_cmd_pl                    ;
        output  [ 63:0]    tlx_afu_cmd_be                    ;
        // output             tlx_afu_cmd_t                     ;

        // Config Command interface to AFU
        input   [  3:0]    cfg_tlx_initial_credit            ;
        input              cfg_tlx_credit_return             ;
        output             tlx_cfg_valid                     ;
        output  [  7:0]    tlx_cfg_opcode                    ;
        output  [ 63:0]    tlx_cfg_pa                        ;
        output             tlx_cfg_t                         ;
        output  [  2:0]    tlx_cfg_pl                        ; 
        output  [ 15:0]    tlx_cfg_capptag                   ;
        output  [ 31:0]    tlx_cfg_data_bus                  ;
        output             tlx_cfg_data_bdi                  ;

        // Response interface to AFU
        input   [  6:0]    afu_tlx_resp_initial_credit       ;
        input              afu_tlx_resp_credit               ;
        output             tlx_afu_resp_valid                ;
        output  [  7:0]    tlx_afu_resp_opcode               ;
        output  [ 15:0]    tlx_afu_resp_afutag               ;
        output  [  3:0]    tlx_afu_resp_code                 ;
        output  [  5:0]    tlx_afu_resp_pg_size              ;
        output  [  1:0]    tlx_afu_resp_dl                   ;
        output  [  1:0]    tlx_afu_resp_dp                   ;
        output  [ 23:0]    tlx_afu_resp_host_tag             ;
        output  [  3:0]    tlx_afu_resp_cache_state          ;
        output  [ 17:0]    tlx_afu_resp_addr_tag             ;

        // Command data interface to AFU
        input              afu_tlx_cmd_rd_req                ;
        input   [  2:0]    afu_tlx_cmd_rd_cnt                ;
        output             tlx_afu_cmd_data_valid            ;
        output             tlx_afu_cmd_data_bdi              ;
        output  [511:0]    tlx_afu_cmd_data_bus              ;

        // Response data interface to AFU
        input              afu_tlx_resp_rd_req               ;
        input   [  2:0]    afu_tlx_resp_rd_cnt               ;
        output             tlx_afu_resp_data_valid           ;
        output             tlx_afu_resp_data_bdi             ;
        output  [511:0]    tlx_afu_resp_data_bus             ;

        // -----------------------------------
        // AFU to TLX Framer Transmit Interface
        // -----------------------------------

        // --- Commands from AFU
        output  [  3:0]    tlx_afu_cmd_initial_credit        ;
        output             tlx_afu_cmd_credit                ;
        input              afu_tlx_cmd_valid                 ;
        input   [  7:0]    afu_tlx_cmd_opcode                ;
        input   [ 11:0]    afu_tlx_cmd_actag                 ;
        input   [  3:0]    afu_tlx_cmd_stream_id             ;
        input   [ 67:0]    afu_tlx_cmd_ea_or_obj             ;
        input   [ 15:0]    afu_tlx_cmd_afutag                ;
        input   [  1:0]    afu_tlx_cmd_dl                    ;
        input   [  2:0]    afu_tlx_cmd_pl                    ;
        input              afu_tlx_cmd_os                    ;
        input   [ 63:0]    afu_tlx_cmd_be                    ;
        input   [  3:0]    afu_tlx_cmd_flag                  ;
        input              afu_tlx_cmd_endian                ;
        input   [ 15:0]    afu_tlx_cmd_bdf                   ;
        input   [ 19:0]    afu_tlx_cmd_pasid                 ;
        input   [  5:0]    afu_tlx_cmd_pg_size               ;

        // --- Command data from AFU
        output  [  5:0]    tlx_afu_cmd_data_initial_credit   ;
        output             tlx_afu_cmd_data_credit           ;
        input              afu_tlx_cdata_valid               ;
        input   [511:0]    afu_tlx_cdata_bus                 ;
        input              afu_tlx_cdata_bdi                 ;

        // --- Responses from AFU
        output  [  3:0]    tlx_afu_resp_initial_credit       ;
        output             tlx_afu_resp_credit               ;
        input              afu_tlx_resp_valid                ;
        input   [  7:0]    afu_tlx_resp_opcode               ;
        input   [  1:0]    afu_tlx_resp_dl                   ;
        input   [ 15:0]    afu_tlx_resp_capptag              ;
        input   [  1:0]    afu_tlx_resp_dp                   ;
        input   [  3:0]    afu_tlx_resp_code                 ;

        // --- Response data from AFU
        output  [  5:0]    tlx_afu_resp_data_initial_credit  ;
        output             tlx_afu_resp_data_credit          ;
        input              afu_tlx_rdata_valid               ;
        input   [511:0]    afu_tlx_rdata_bus                 ;
        input              afu_tlx_rdata_bdi                 ;

        // --- Config Responses from AFU
        input              cfg_tlx_resp_valid                ;
        input   [  7:0]    cfg_tlx_resp_opcode               ;
        input   [ 15:0]    cfg_tlx_resp_capptag              ;
        input   [  3:0]    cfg_tlx_resp_code                 ;
        output             tlx_cfg_resp_ack                  ;

        // --- Config Response data from AFU
        input   [  3:0]    cfg_tlx_rdata_offset              ;
        input   [ 31:0]    cfg_tlx_rdata_bus                 ;
        input              cfg_tlx_rdata_bdi                 ;


        // -----------------------------------
        // DLX to TLX Parser Interface
        // -----------------------------------
        input              dlx_tlx_flit_valid                ;
        input   [511:0]    dlx_tlx_flit                      ;
        input              dlx_tlx_flit_crc_err              ;
        input              dlx_tlx_link_up                   ;


        // -----------------------------------
        // TLX Framer to DLX Interface
        // -----------------------------------
        input   [  2:0]    dlx_tlx_init_flit_depth           ;
        input              dlx_tlx_flit_credit               ;
        output             tlx_dlx_flit_valid                ;
        output  [511:0]    tlx_dlx_flit                      ;
        output  [  3:0]    tlx_dlx_debug_encode              ;
        output  [ 31:0]    tlx_dlx_debug_info                ;
        input   [ 31:0]    dlx_tlx_dlx_config_info           ;


        // -----------------------------------
        // Configuration Ports
        // -----------------------------------
        input              cfg_tlx_xmit_tmpl_config_0        ;
        input              cfg_tlx_xmit_tmpl_config_1        ;
        input              cfg_tlx_xmit_tmpl_config_2        ;
        input              cfg_tlx_xmit_tmpl_config_3        ;
        input   [  3:0]    cfg_tlx_xmit_rate_config_0        ;
        input   [  3:0]    cfg_tlx_xmit_rate_config_1        ;
        input   [  3:0]    cfg_tlx_xmit_rate_config_2        ;
        input   [  3:0]    cfg_tlx_xmit_rate_config_3        ;

        output             tlx_cfg_in_rcv_tmpl_capability_0  ;
        output             tlx_cfg_in_rcv_tmpl_capability_1  ;
        output             tlx_cfg_in_rcv_tmpl_capability_2  ;
        output             tlx_cfg_in_rcv_tmpl_capability_3  ;
        output  [  3:0]    tlx_cfg_in_rcv_rate_capability_0  ;
        output  [  3:0]    tlx_cfg_in_rcv_rate_capability_1  ;
        output  [  3:0]    tlx_cfg_in_rcv_rate_capability_2  ;
        output  [  3:0]    tlx_cfg_in_rcv_rate_capability_3  ;

        output  [ 31:0]    tlx_cfg_oc3_tlx_version           ;


        // -----------------------------------
        // Miscellaneous Ports
        // -----------------------------------
        input              clock                             ;
        input              reset_n                           ;



// ==============================================================================================================================
// @@@  Wires and Variables (Regs)
// ==============================================================================================================================


        // -----------------------------------
        // TLX Parser to TLX Framer Interface
        // -----------------------------------
        wire              rcv_xmt_tl_credit_vc0_valid       ;  // TL credit for VC0,  to send to TL
        wire              rcv_xmt_tl_credit_vc1_valid       ;  // TL credit for VC1,  to send to TL
        wire              rcv_xmt_tl_credit_dcp0_valid      ;  // TL credit for DCP0, to send to TL
        wire              rcv_xmt_tl_credit_dcp1_valid      ;  // TL credit for DCP1, to send to TL
        wire              rcv_xmt_tl_crd_cfg_dcp1_valid     ;  // TL credit for DCP1, to send to TL

        wire              rcv_xmt_tlx_credit_valid          ;  // Indicates there are valid TLX credits to capture and use
        wire   [  3:0]    rcv_xmt_tlx_credit_vc0            ;  // TLX credit for VC0,  to be used by TLX
        wire   [  3:0]    rcv_xmt_tlx_credit_vc3            ;  // TLX credit for VC3,  to be used by TLX
        wire   [  5:0]    rcv_xmt_tlx_credit_dcp0           ;  // TLX credit for DCP0, to be used by TLX
        wire   [  5:0]    rcv_xmt_tlx_credit_dcp3           ;  // TLX credit for DCP3, to be used by TLX

        wire   [ 31:0]    rcv_xmt_debug_info                ;
        wire              rcv_xmt_debug_fatal               ;
        wire              rcv_xmt_debug_valid               ;


// ==============================================================================================================================
// @@@  Ties and Hard-coded  Assignments
// ==============================================================================================================================

    assign tlx_cfg_oc3_tlx_version[31:0] = `OC3_TLX_VERSION ;



// ==============================================================================================================================
// @@@  Instances of Sub Modules
// ==============================================================================================================================

    // ----------
    // TLX Parser
    // ----------
    ocx_tlx_rcv_top #(
        .cmd_addr_width             (capp_vc1_fifo_addr_width),
        .resp_addr_width            (capp_vc0_fifo_addr_width),
        .cmd_data_addr_width        (capp_dcp1_fifo_addr_width),
        .resp_data_addr_width       (capp_dcp0_fifo_addr_width)
    ) OCX_TLX_PARSER (

        // -----------------------------------
        // DLX to TLX Interface
        // -----------------------------------
        .dlx_tlx_flit_valid                (dlx_tlx_flit_valid               ) ,
        .dlx_tlx_flit                      (dlx_tlx_flit                     ) ,
        .dlx_tlx_flit_crc_err              (dlx_tlx_flit_crc_err             ) ,
        .dlx_tlx_link_up                   (dlx_tlx_link_up                  ) ,


        // -----------------------------------
        // TLX to AFU Receive Interface
        // -----------------------------------
        .tlx_afu_ready                     (tlx_afu_ready                    ) ,

        // Command interface to AFU
        .afu_tlx_cmd_initial_credit        (afu_tlx_cmd_initial_credit       ) ,
        .afu_tlx_cmd_credit                (afu_tlx_cmd_credit               ) ,
        .tlx_afu_cmd_valid                 (tlx_afu_cmd_valid                ) ,
        .tlx_afu_cmd_opcode                (tlx_afu_cmd_opcode               ) ,
        .tlx_afu_cmd_dl                    (tlx_afu_cmd_dl                   ) ,
        .tlx_afu_cmd_end                   (tlx_afu_cmd_end                  ) ,
        .tlx_afu_cmd_pa                    (tlx_afu_cmd_pa                   ) ,
        .tlx_afu_cmd_flag                  (tlx_afu_cmd_flag                 ) ,
        .tlx_afu_cmd_os                    (tlx_afu_cmd_os                   ) ,
        .tlx_afu_cmd_capptag               (tlx_afu_cmd_capptag              ) ,
        .tlx_afu_cmd_pl                    (tlx_afu_cmd_pl                   ) , 
        .tlx_afu_cmd_be                    (tlx_afu_cmd_be                   ) ,
        //.tlx_afu_cmd_t                     (tlx_afu_cmd_t                    ) ,

        // Config Command interface to AFU
        .cfg_tlx_initial_credit            (cfg_tlx_initial_credit           ) ,
        .cfg_tlx_credit_return             (cfg_tlx_credit_return            ) ,
        .tlx_cfg_valid                     (tlx_cfg_valid                    ) ,
        .tlx_cfg_opcode                    (tlx_cfg_opcode                   ) ,
        .tlx_cfg_pa                        (tlx_cfg_pa                       ) ,
        .tlx_cfg_t                         (tlx_cfg_t                        ) ,
        .tlx_cfg_pl                        (tlx_cfg_pl                       ) , 
        .tlx_cfg_capptag                   (tlx_cfg_capptag                  ) ,
        .tlx_cfg_data_bus                  (tlx_cfg_data_bus                 ) ,
        .tlx_cfg_data_bdi                  (tlx_cfg_data_bdi                 ) ,


        // Response interface to AFU
        .afu_tlx_resp_initial_credit       (afu_tlx_resp_initial_credit      ) ,
        .afu_tlx_resp_credit               (afu_tlx_resp_credit              ) ,
        .tlx_afu_resp_valid                (tlx_afu_resp_valid               ) ,
        .tlx_afu_resp_opcode               (tlx_afu_resp_opcode              ) ,
        .tlx_afu_resp_afutag               (tlx_afu_resp_afutag              ) ,
        .tlx_afu_resp_code                 (tlx_afu_resp_code                ) ,
        .tlx_afu_resp_pg_size              (tlx_afu_resp_pg_size             ) ,
        .tlx_afu_resp_dl                   (tlx_afu_resp_dl                  ) ,
        .tlx_afu_resp_dp                   (tlx_afu_resp_dp                  ) ,
        .tlx_afu_resp_host_tag             (tlx_afu_resp_host_tag            ) ,
        .tlx_afu_resp_cache_state          (tlx_afu_resp_cache_state         ) ,
        .tlx_afu_resp_addr_tag             (tlx_afu_resp_addr_tag            ) ,

        // Command data interface to AFU
        .afu_tlx_cmd_rd_req                (afu_tlx_cmd_rd_req               ) ,
        .afu_tlx_cmd_rd_cnt                (afu_tlx_cmd_rd_cnt               ) ,
        .tlx_afu_cmd_data_valid            (tlx_afu_cmd_data_valid           ) ,
        .tlx_afu_cmd_data_bus              (tlx_afu_cmd_data_bus             ) ,
        .tlx_afu_cmd_data_bdi              (tlx_afu_cmd_data_bdi             ) ,

        // Response data interface to AFU
        .afu_tlx_resp_rd_req               (afu_tlx_resp_rd_req              ) ,
        .afu_tlx_resp_rd_cnt               (afu_tlx_resp_rd_cnt              ) ,
        .tlx_afu_resp_data_valid           (tlx_afu_resp_data_valid          ) ,
        .tlx_afu_resp_data_bus             (tlx_afu_resp_data_bus            ) ,
        .tlx_afu_resp_data_bdi             (tlx_afu_resp_data_bdi            ) ,

        // -----------------------------------
        // TLX Parser to TLX Framer Interface
        // -----------------------------------
        .rcv_xmt_tl_credit_vc0_valid       (rcv_xmt_tl_credit_vc0_valid      ) ,
        .rcv_xmt_tl_credit_vc1_valid       (rcv_xmt_tl_credit_vc1_valid      ) ,
        .rcv_xmt_tl_credit_dcp0_valid      (rcv_xmt_tl_credit_dcp0_valid     ) ,
        .rcv_xmt_tl_credit_dcp1_valid      (rcv_xmt_tl_credit_dcp1_valid     ) ,
        .rcv_xmt_tl_crd_cfg_dcp1_valid     (rcv_xmt_tl_crd_cfg_dcp1_valid    ) ,

        .rcv_xmt_tlx_credit_valid          (rcv_xmt_tlx_credit_valid         ) ,
        .rcv_xmt_tlx_credit_vc0            (rcv_xmt_tlx_credit_vc0           ) ,
        .rcv_xmt_tlx_credit_vc3            (rcv_xmt_tlx_credit_vc3           ) ,
        .rcv_xmt_tlx_credit_dcp0           (rcv_xmt_tlx_credit_dcp0          ) ,
        .rcv_xmt_tlx_credit_dcp3           (rcv_xmt_tlx_credit_dcp3          ) ,

        .rcv_xmt_debug_info                (rcv_xmt_debug_info               ) ,
        .rcv_xmt_debug_fatal               (rcv_xmt_debug_fatal              ) ,
        .rcv_xmt_debug_valid               (rcv_xmt_debug_valid              ) ,


        // -----------------------------------
        // Configuration Ports
        // -----------------------------------
        .tlx_cfg_in_rcv_tmpl_capability_0     (tlx_cfg_in_rcv_tmpl_capability_0    ) ,
        .tlx_cfg_in_rcv_tmpl_capability_1     (tlx_cfg_in_rcv_tmpl_capability_1    ) ,
        .tlx_cfg_in_rcv_tmpl_capability_2     (tlx_cfg_in_rcv_tmpl_capability_2    ) ,
        .tlx_cfg_in_rcv_tmpl_capability_3     (tlx_cfg_in_rcv_tmpl_capability_3    ) ,
        .tlx_cfg_in_rcv_rate_capability_0     (tlx_cfg_in_rcv_rate_capability_0    ) ,
        .tlx_cfg_in_rcv_rate_capability_1     (tlx_cfg_in_rcv_rate_capability_1    ) ,
        .tlx_cfg_in_rcv_rate_capability_2     (tlx_cfg_in_rcv_rate_capability_2    ) ,
        .tlx_cfg_in_rcv_rate_capability_3     (tlx_cfg_in_rcv_rate_capability_3    ) ,


        // -----------------------------------
        // Misc. Interface
        // -----------------------------------
        .tlx_clk                           (clock                            ) ,
        .reset_n                           (reset_n                          ) 
    ) ;



    // ----------
    // TLX Framer
    // ----------
    ocx_tlx_framer OCX_TLX_FRAMER (

        // -----------------------------------
        // AFU Command/Response/Data Interface
        // -----------------------------------
        // --- Initial credit allocation

        // --- Commands from AFU
        .tlx_afu_cmd_initial_credit        (tlx_afu_cmd_initial_credit       ) ,
        .tlx_afu_cmd_credit                (tlx_afu_cmd_credit               ) ,
        .afu_tlx_cmd_valid                 (afu_tlx_cmd_valid                ) ,
        .afu_tlx_cmd_opcode                (afu_tlx_cmd_opcode               ) ,
        .afu_tlx_cmd_actag                 (afu_tlx_cmd_actag                ) ,
        .afu_tlx_cmd_stream_id             (afu_tlx_cmd_stream_id            ) ,
        .afu_tlx_cmd_ea_or_obj             (afu_tlx_cmd_ea_or_obj            ) ,
        .afu_tlx_cmd_afutag                (afu_tlx_cmd_afutag               ) ,
        .afu_tlx_cmd_dl                    (afu_tlx_cmd_dl                   ) ,
        .afu_tlx_cmd_pl                    (afu_tlx_cmd_pl                   ) ,
        .afu_tlx_cmd_os                    (afu_tlx_cmd_os                   ) ,
        .afu_tlx_cmd_be                    (afu_tlx_cmd_be                   ) ,
        .afu_tlx_cmd_flag                  (afu_tlx_cmd_flag                 ) ,
        .afu_tlx_cmd_endian                (afu_tlx_cmd_endian               ) ,
        .afu_tlx_cmd_bdf                   (afu_tlx_cmd_bdf                  ) ,
        .afu_tlx_cmd_pasid                 (afu_tlx_cmd_pasid                ) ,
        .afu_tlx_cmd_pg_size               (afu_tlx_cmd_pg_size              ) ,

        // --- Command data from AFU
        .tlx_afu_cmd_data_initial_credit   (tlx_afu_cmd_data_initial_credit  ) ,
        .tlx_afu_cmd_data_credit           (tlx_afu_cmd_data_credit          ) ,
        .afu_tlx_cdata_valid               (afu_tlx_cdata_valid              ) ,
        .afu_tlx_cdata_bus                 (afu_tlx_cdata_bus                ) ,
        .afu_tlx_cdata_bdi                 (afu_tlx_cdata_bdi                ) ,

        // --- Responses from AFU
        .tlx_afu_resp_initial_credit       (tlx_afu_resp_initial_credit      ) ,
        .tlx_afu_resp_credit               (tlx_afu_resp_credit              ) ,
        .afu_tlx_resp_valid                (afu_tlx_resp_valid               ) ,
        .afu_tlx_resp_opcode               (afu_tlx_resp_opcode              ) ,
        .afu_tlx_resp_dl                   (afu_tlx_resp_dl                  ) ,
        .afu_tlx_resp_capptag              (afu_tlx_resp_capptag             ) ,
        .afu_tlx_resp_dp                   (afu_tlx_resp_dp                  ) ,
        .afu_tlx_resp_code                 (afu_tlx_resp_code                ) ,

        // --- Response data from AFU
        .tlx_afu_resp_data_initial_credit  (tlx_afu_resp_data_initial_credit ) ,
        .tlx_afu_resp_data_credit          (tlx_afu_resp_data_credit         ) ,
        .afu_tlx_rdata_valid               (afu_tlx_rdata_valid              ) ,
        .afu_tlx_rdata_bus                 (afu_tlx_rdata_bus                ) ,
        .afu_tlx_rdata_bdi                 (afu_tlx_rdata_bdi                ) ,

        // --- Config Responses from AFU
        .cfg_tlx_resp_valid                (cfg_tlx_resp_valid               ) ,
        .cfg_tlx_resp_opcode               (cfg_tlx_resp_opcode              ) ,
        //.cfg_tlx_resp_dl                   (cfg_tlx_resp_dl                  ) ,
        .cfg_tlx_resp_capptag              (cfg_tlx_resp_capptag             ) ,
        //.cfg_tlx_resp_dp                   (cfg_tlx_resp_dp                  ) ,
        .cfg_tlx_resp_code                 (cfg_tlx_resp_code                ) ,
        .tlx_cfg_resp_ack                  (tlx_cfg_resp_ack                 ) ,

        // --- Config Response data from AFU
        .cfg_tlx_rdata_offset              (cfg_tlx_rdata_offset             ) ,
        .cfg_tlx_rdata_bus                 (cfg_tlx_rdata_bus                ) ,
        .cfg_tlx_rdata_bdi                 (cfg_tlx_rdata_bdi                ) ,


        // -----------------------------------
        // TLX to DLX Interface
        // -----------------------------------
        .dlx_tlx_link_up                   (dlx_tlx_link_up                  ) ,
        .dlx_tlx_init_flit_depth           (dlx_tlx_init_flit_depth          ) ,
        .dlx_tlx_flit_credit               (dlx_tlx_flit_credit              ) ,
        .tlx_dlx_flit_valid                (tlx_dlx_flit_valid               ) ,
        .tlx_dlx_flit                      (tlx_dlx_flit                     ) ,


        // -----------------------------------
        // TLX Parser to TLX Framer Interface
        // -----------------------------------
        .rcv_xmt_tl_credit_vc0_valid       (rcv_xmt_tl_credit_vc0_valid      ) ,
        .rcv_xmt_tl_credit_vc1_valid       (rcv_xmt_tl_credit_vc1_valid      ) ,
        .rcv_xmt_tl_credit_dcp0_valid      (rcv_xmt_tl_credit_dcp0_valid     ) ,
        .rcv_xmt_tl_credit_dcp1_valid      (rcv_xmt_tl_credit_dcp1_valid     ) ,
        .rcv_xmt_tl_crd_cfg_dcp1_valid     (rcv_xmt_tl_crd_cfg_dcp1_valid    ) ,

        .rcv_xmt_tlx_credit_valid          (rcv_xmt_tlx_credit_valid         ) ,
        .rcv_xmt_tlx_credit_vc0            (rcv_xmt_tlx_credit_vc0           ) ,
        .rcv_xmt_tlx_credit_vc3            (rcv_xmt_tlx_credit_vc3           ) ,
        .rcv_xmt_tlx_credit_dcp0           (rcv_xmt_tlx_credit_dcp0          ) ,
        .rcv_xmt_tlx_credit_dcp3           (rcv_xmt_tlx_credit_dcp3          ) ,


        // -----------------------------------
        // Configuration Ports
        // -----------------------------------
        .cfg_tlx_xmit_tmpl_config_0     (cfg_tlx_xmit_tmpl_config_0    ) ,
        .cfg_tlx_xmit_tmpl_config_1     (cfg_tlx_xmit_tmpl_config_1    ) ,
        .cfg_tlx_xmit_tmpl_config_2     (cfg_tlx_xmit_tmpl_config_2    ) ,
        .cfg_tlx_xmit_tmpl_config_3     (cfg_tlx_xmit_tmpl_config_3    ) ,
        .cfg_tlx_xmit_rate_config_0     (cfg_tlx_xmit_rate_config_0    ) ,
        .cfg_tlx_xmit_rate_config_1     (cfg_tlx_xmit_rate_config_1    ) ,
        .cfg_tlx_xmit_rate_config_2     (cfg_tlx_xmit_rate_config_2    ) ,
        .cfg_tlx_xmit_rate_config_3     (cfg_tlx_xmit_rate_config_3    ) ,


        // -----------------------------------
        // Debug Ports
        // -----------------------------------
        .rcv_xmt_debug_info                (rcv_xmt_debug_info               ) ,
        .rcv_xmt_debug_fatal               (rcv_xmt_debug_fatal              ) ,
        .rcv_xmt_debug_valid               (rcv_xmt_debug_valid              ) ,
        .tlx_dlx_debug_encode              (tlx_dlx_debug_encode             ) ,
        .tlx_dlx_debug_info                (tlx_dlx_debug_info               ) ,
        .dlx_tlx_dlx_config_info           (dlx_tlx_dlx_config_info          ) ,


        // -----------------------------------
        // Misc. Interface
        // -----------------------------------
        .clock                             (clock                            ) ,
        .reset_n                           (reset_n                          ) 
    ) ;


// ==============================================================================================================================
// @@@  ocx_tlx_top Logic
// ==============================================================================================================================



endmodule  // ocx_tlx_top
