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
// File Name          :  ocx_tlx_framer.v 
// Project            :  TLX 3.0x Reference Design (External Transaction Layer logic for attaching to the IBM P9 OpenCAPI Interface)
// Module Name        :  ocx_tlx_framer
//
// Module Description : This logic does the following:
//     - Receives commands, responses, and data from the attached AFU
//     - Packs the commands, responses, and TL credits into DLX control flits
//     - Packs the control flits and data flits into DLX frames
//     - Sends the DLX frames to the attached DLX
//
// Notes              :  This design supports the OpenCapi Transaction Layer Specification up through version 3.02
//                       -  It does NOT support OMI (OpenCapi Memory Interface) extentions
//                       -  It does NOT support OpenCapi 4.0 Transaction Layer extentions
//                       This design only supports template types 00, 01, and 03 in host-bound flits.
//                       For timing reasons this design does NOT support mixing commands and responses in the same control flit.
//
// To find module sub-sections, search for "@@@"
//
// ******************************************************************************************************************************
// Modification History :
//                               | Version   |     | Author   | Date        | Description of change
//                               | --------- |     | -------- | ----------- | ---------------------
  `define OCX_TLX_FRAMER_VERSION  10_Oct_2018   // |          | Oct.10,2018 | 
//
// ******************************************************************************************************************************


// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================
module ocx_tlx_framer
    (
        // -----------------------------------
        // AFU Command/Response/Data Interface
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
        //cfg_tlx_resp_dl                   ,
        cfg_tlx_resp_capptag              ,
        //cfg_tlx_resp_dp                   ,
        cfg_tlx_resp_code                 ,
        tlx_cfg_resp_ack                  ,

        // --- Config Response data from AFU
        cfg_tlx_rdata_offset              ,
        cfg_tlx_rdata_bus                 ,
        cfg_tlx_rdata_bdi                 ,


        // -----------------------------------
        // TLX to DLX Interface
        // -----------------------------------
        dlx_tlx_link_up                   ,
        dlx_tlx_init_flit_depth           ,
        dlx_tlx_flit_credit               ,
        tlx_dlx_flit_valid                ,
        tlx_dlx_flit                      ,
        dlx_tlx_dlx_config_info           ,


        // -----------------------------------
        // TLX Parser to TLX Framer Interface
        // -----------------------------------
        rcv_xmt_tl_credit_vc0_valid          ,
        rcv_xmt_tl_credit_vc1_valid          ,
        rcv_xmt_tl_credit_dcp0_valid         ,
        rcv_xmt_tl_credit_dcp1_valid         ,
        rcv_xmt_tl_crd_cfg_dcp1_valid        ,

        rcv_xmt_tlx_credit_valid             ,
        rcv_xmt_tlx_credit_vc0               ,
        rcv_xmt_tlx_credit_vc3               ,
        rcv_xmt_tlx_credit_dcp0              ,
        rcv_xmt_tlx_credit_dcp3              ,


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


        // -----------------------------------
        // Debug Ports
        // -----------------------------------
        rcv_xmt_debug_info                ,
        rcv_xmt_debug_fatal               ,
        rcv_xmt_debug_valid               ,
        tlx_dlx_debug_encode              ,
        tlx_dlx_debug_info                ,


        // -----------------------------------
        // Miscellaneous Ports
        // -----------------------------------
        clock                                ,
        reset_n
    ) ;

//!! Bugspray Include : ocx_tlx_framer ;

// ==============================================================================================================================
// @@@  Parameters
// ==============================================================================================================================

        // Config Response Injector FSM States
        parameter    [4:0]   CFG_IDLE            = 5'b00001 ;   // 1
        parameter    [4:0]   CFG_NODATA_RDY      = 5'b00010 ;   // 2
        parameter    [4:0]   CFG_NODATA_IN_FIFO  = 5'b00100 ;   // 4
        parameter    [4:0]   CFG_W_DATA_RDY      = 5'b01000 ;   // 8
        parameter    [4:0]   CFG_W_DATA_IN_FIFO  = 5'b10000 ;   // 10

        // Response Packer FSM States
        parameter    [3:0]   RP_IDLE       = 4'b0001 ;   // 1
        parameter    [3:0]   RP_STRT       = 4'b0010 ;   // 2
        parameter    [3:0]   RP_CONT       = 4'b0100 ;   // 4
        parameter    [3:0]   RP_FULL       = 4'b1000 ;   // 8

        // Command Packer FSM States
        parameter    [3:0]   CP_IDLE       = 4'b0001 ;   // 1
        parameter    [3:0]   CP_STRT       = 4'b0010 ;   // 2
        parameter    [3:0]   CP_CONT       = 4'b0100 ;   // 4
        parameter    [3:0]   CP_FULL       = 4'b1000 ;   // 8

        // Output Framer Control States
        parameter    [4:0]   SEND_NOTHING       = 5'b00001 ;  //  1
        parameter    [4:0]   SEND_RSP_CFLIT     = 5'b00010 ;  //  2
        parameter    [4:0]   SEND_CMD_CFLIT     = 5'b00100 ;  //  4
        parameter    [4:0]   SEND_BE_CFLIT      = 5'b01000 ;  //  8
        parameter    [4:0]   SEND_DATA_FLIT     = 5'b10000 ;  // 10


// ==============================================================================================================================
// @@@  Port Declarations
// ==============================================================================================================================

        // -----------------------------------
        // AFU Command/Response/Data Interface
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
        //input   [  1:0]    cfg_tlx_resp_dl                   ;
        input   [ 15:0]    cfg_tlx_resp_capptag              ;
        //input   [  1:0]    cfg_tlx_resp_dp                   ;
        input   [  3:0]    cfg_tlx_resp_code                 ;
        output             tlx_cfg_resp_ack                  ;

        // --- Config Response data from AFU
        input   [  3:0]    cfg_tlx_rdata_offset              ;
        input   [ 31:0]    cfg_tlx_rdata_bus                 ;
        input              cfg_tlx_rdata_bdi                 ;


        // -----------------------------------
        // TLX to DLX Interface
        // -----------------------------------
        input              dlx_tlx_link_up                   ;
        input   [  2:0]    dlx_tlx_init_flit_depth           ;
        input              dlx_tlx_flit_credit               ;
        output             tlx_dlx_flit_valid                ;
        output  [511:0]    tlx_dlx_flit                      ;
        input   [ 31:0]    dlx_tlx_dlx_config_info           ;


        // -----------------------------------
        // TLX Parser to TLX Framer Interface
        // -----------------------------------
        input              rcv_xmt_tl_credit_vc0_valid       ;  // TL credit for VC0,  to send to TL
        input              rcv_xmt_tl_credit_vc1_valid       ;  // TL credit for VC1,  to send to TL
        input              rcv_xmt_tl_credit_dcp0_valid      ;  // TL credit for DCP0, to send to TL
        input              rcv_xmt_tl_credit_dcp1_valid      ;  // TL credit for DCP1, to send to TL
        input              rcv_xmt_tl_crd_cfg_dcp1_valid     ;  // TL credit for DCP1, to send to TL

        input              rcv_xmt_tlx_credit_valid          ;  // Indicates there are valid TLX credits to capture and use
        input   [  3:0]    rcv_xmt_tlx_credit_vc0            ;  // TLX credit for VC0,  to be used by TLX
        input   [  3:0]    rcv_xmt_tlx_credit_vc3            ;  // TLX credit for VC3,  to be used by TLX
        input   [  5:0]    rcv_xmt_tlx_credit_dcp0           ;  // TLX credit for DCP0, to be used by TLX
        input   [  5:0]    rcv_xmt_tlx_credit_dcp3           ;  // TLX credit for DCP3, to be used by TLX


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


        // -----------------------------------
        // Debug  Ports
        // -----------------------------------
        input   [ 31:0]    rcv_xmt_debug_info                ;  // 32-bit debug bus from TLX Parser
        input              rcv_xmt_debug_fatal               ;  // Indicates that a fatal error was seen in the AFU (if valid is also asserted)
        input              rcv_xmt_debug_valid               ;  // Indicates that rcv_xmt_debug_info and rcv_xmt_debug_fatal are valid
        output  [  3:0]    tlx_dlx_debug_encode              ;
        output  [ 31:0]    tlx_dlx_debug_info                ;


        // -----------------------------------
        // Miscellaneous Ports
        // -----------------------------------
        input              clock                             ;
        input              reset_n                           ;




// ==============================================================================================================================
// @@@  Wire and Variable (Regs) Declarations
// ==============================================================================================================================

    // ----------------- Data Flow logic Wires and Variables ---------------------

    wire             intentionally_unused      ;

    // ---------------
    // Input Registers
    // ---------------
    reg              afu_reg_cmd_valid         ;
    reg   [  7:0]    afu_reg_cmd_opcode        ;
    reg   [ 11:0]    afu_reg_cmd_actag         ;
    reg   [  3:0]    afu_reg_cmd_stream_id     ;
    reg   [ 67:0]    afu_reg_cmd_ea_or_obj     ;
    reg   [ 15:0]    afu_reg_cmd_afutag        ;
    reg   [  1:0]    afu_reg_cmd_dl            ;
    reg   [  2:0]    afu_reg_cmd_pl            ;
    reg              afu_reg_cmd_os            ;
    reg   [ 63:0]    afu_reg_cmd_be            ;
    reg   [  3:0]    afu_reg_cmd_flag          ;
    reg              afu_reg_cmd_endian        ;
    reg   [ 15:0]    afu_reg_cmd_bdf           ;
    reg   [ 19:0]    afu_reg_cmd_pasid         ;
    reg   [  5:0]    afu_reg_cmd_pg_size       ;
    reg              cmd_valid_d1              ;

    reg              afu_reg_resp_valid        ;
    reg   [  7:0]    afu_reg_resp_opcode       ;
    reg   [  1:0]    afu_reg_resp_dl           ;
    reg   [ 15:0]    afu_reg_resp_capptag      ;
    reg   [  1:0]    afu_reg_resp_dp           ;
    reg   [  3:0]    afu_reg_resp_code         ;
    reg              rsp_valid_d1              ;
    wire             rsp_fifo_wr_enable        ;
    wire             rsp_data_fifo_wr_enable   ;

    reg   [511:0]    cmd_data_input_reg        ;
    reg              cmd_bad_data_flag         ;
    reg              cmd_data_valid_d1         ;

    reg   [511:0]    rsp_data_input_reg        ;
    reg              rsp_bad_data_flag         ;
    reg              rsp_data_valid_d1         ;
    wire  [511:0]    cfg_rdata_flit            ;

    reg              cfg_tlx_resp_valid_d1     ;
    wire             capt_cfg_resp             ;
    reg              cfg_reg_resp_valid        ;
    reg   [  7:0]    cfg_reg_resp_opcode       ;
    reg   [  1:0]    cfg_reg_resp_dl           ;
    reg   [ 15:0]    cfg_reg_resp_capptag      ;
    reg   [  1:0]    cfg_reg_resp_dp           ;
    reg   [  3:0]    cfg_reg_resp_code         ;
    wire  [  1:0]    cfg_tlx_resp_dl           ;
    wire  [  1:0]    cfg_tlx_resp_dp           ;

    reg   [  3:0]    cfg_reg_rdata_offset      ;
    reg   [ 31:0]    cfg_reg_rdata_bus         ;
    reg              cfg_reg_rdata_bdi         ;

    reg              rsp_data_missing_error    ;
    reg              cmd_data_missing_error    ;
    reg              rouge_rsp_data_error      ;
    reg              rouge_cmd_data_error      ;

    wire             vc0_rsp_available         ;
    wire             vc3_cmd_available         ;
    wire   [  3:0]   vc0_valid_entry_count     ;
    wire   [  3:0]   vc3_valid_entry_count     ;
    wire             vc0_underflow_error       ;
    wire             vc0_overflow_error        ;
    wire             vc3_underflow_error       ;
    wire             vc3_overflow_error        ;
    wire             dcp0_data_look_ahead      ;
    wire             dcp0_data_available       ;
    wire             dcp0_underflow_error      ;
    wire             dcp0_overflow_error       ;
    wire             dcp3_data_look_ahead      ;
    wire             dcp3_data_available       ;
    wire             dcp3_underflow_error      ;
    wire             dcp3_overflow_error       ;

    // ---------------
    // TL Credit Counters
    // ---------------
    reg   [  7:0]    vc0_tlcrd_counter_nxt     ;  // TL credit counters for 63 credits max per VC
 `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    reg   [  7:0]    vc0_tlcrd_counter         ;
 `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    reg   [  3:0]    vc0_tlcrd_counter_snd     ;
    reg   [  7:0]    vc1_tlcrd_counter_nxt     ;
    reg   [  7:0]    vc1_tlcrd_counter         ;
    reg   [  3:0]    vc1_tlcrd_counter_snd     ;
    reg   [  7:0]    dcp0_tlcrd_counter_nxt    ;  // TL credit counters for 255 credits max per DCP
 `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    reg   [  7:0]    dcp0_tlcrd_counter        ;
 `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    reg   [  5:0]    dcp0_tlcrd_counter_snd    ;
    reg   [  7:0]    dcp1_tlcrd_counter_nxt    ;
    reg   [  7:0]    dcp1_tlcrd_counter        ;
    reg   [  5:0]    dcp1_tlcrd_counter_snd    ;
 `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    reg              any_tlcrds_waiting        ;
 `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    reg              bunch_tlcrds_waiting      ;

    // ---------------
    // Packet Formation Registers
    // ---------------
    reg   [  1:0]    num_rsp_data_segments     ;  // "00"=0,  "01"=1,  "10"=2,  "11"=4
    reg   [  1:0]    num_cfg_data_segments     ;  // "00"=0,  "01"=1,  "10"=2,  "11"=4
    reg   [  1:0]    num_cmd_data_segments     ;  // "00"=0,  "01"=1,  "10"=2,  "11"=4
    reg   [  1:0]    cmd_slot_count_encode     ;  // "00"=1,  "01"=2,  "10"=4,  "11"=6
    reg   [ 58:0]    rsp_packet                ;
    reg   [ 58:0]    rsp_packet_reg            ;
    reg   [ 58:0]    cfg_packet                ;
    reg   [ 58:0]    cfg_packet_reg            ;
    reg   [171:0]    cmd_packet                ;
    reg   [171:0]    cmd_packet_reg            ;
    reg              capt_cfg_packet           ;

    // ---------------
    // FIFO Input Registers
    // ---------------
    wire  [ 58:0]    vc0_fifo_input_bus        ;
    wire  [171:0]    vc3_fifo_input_bus        ;
    wire  [513:0]    dcp0_fifo_input_bus       ;
    wire  [512:0]    dcp3_fifo_input_bus       ;

    // ---------------
    // FIFO Output Registers
    // ---------------
    wire  [ 58:0]    vc0_fifo_output_data      ;
    wire  [171:0]    vc3_fifo_output_data      ;
    reg   [ 58:0]    vc0_fifo_output_reg       ;
    reg   [171:0]    vc3_fifo_output_reg       ;
    reg   [ 58:0]    vc0_fifo_output_reg_din   ;
    reg   [171:0]    vc3_fifo_output_reg_din   ;
    wire  [513:0]    dcp0_fifo_output_reg      ;
    wire  [512:0]    dcp3_fifo_output_reg      ;
    wire             fifo_rsp_is_cfg_rsp       ;
    wire  [  1:0]    vc0_dsegs_lookahead       ;
    wire  [  1:0]    vc3_dsegs_lookahead       ;
    wire  [  7:0]    vc0_opcode_lookahead      ;
    wire  [  7:0]    vc3_opcode_lookahead      ;
    reg              six_slot_going_into_fifo  ;
    reg  [  7:0]     six_slot_shift_reg_din    ;
    reg  [  7:0]     six_slot_shift_reg        ;
    wire             six_slot_lookahead        ;
    reg              six_slot_cmd              ;

    // ---------------
    // Control Flit Formation Registers
    // ---------------
    reg   [511:0]    rsp_cntl_flit_reg_din     ;
    reg   [511:0]    rsp_cntl_flit_reg         ;
    reg   [511:0]    cmd_cntl_flit_reg_din     ;
    reg   [511:0]    cmd_cntl_flit_reg         ;


    // ---------------
    // Output Flit Register
    // ---------------
    reg   [511:0]    output_flit_reg_din       ;
    reg   [511:0]    output_flit_reg           ;



    // ----------------- Control logic Wires and Variables ---------------------

    // Power-on Reset logic
    reg              por_on                       ;
    reg              por_off                      ;
    wire             power_on_reset               ;
    reg              afu_has_started_talking      ;

    reg              cfg_packet_ready             ;
    reg   [  4:0]    cfg_injector_state           ;
    reg   [  4:0]    cfg_injector_next_state      ;
    wire             space_in_rsp_stream          ;
    wire             space_in_rsp_data_stream     ;
    wire             cfg_rsp_leaves_fifo          ;
    wire             fifo_data_is_cfg_data        ;
    wire             cfg_data_leaves_fifo         ;

    // TLX Credit Counters
    wire  [ 15:0]    vc0_tlxcrd_counter_nxt       ;  // TLX credit counters for 63 credits max per VC
    reg   [ 15:0]    vc0_tlxcrd_counter           ;
    wire  [ 15:0]    vc3_tlxcrd_counter_nxt       ;
    reg   [ 15:0]    vc3_tlxcrd_counter           ;
    wire  [ 15:0]    dcp0_tlxcrd_counter_nxt      ;  // TLX credit counters for 255 credits max per DCP
//  reg   [ 15:0]    dcp0_tlxcrd_counter_nxt      ;  // TLX credit counters for 255 credits max per DCP
    reg   [ 15:0]    dcp0_tlxcrd_counter          ;
    wire  [ 15:0]    dcp3_tlxcrd_counter_nxt      ;
//  reg   [ 15:0]    dcp3_tlxcrd_counter_nxt      ;
    reg   [ 15:0]    dcp3_tlxcrd_counter          ;
    wire             spec_use_rsp_credit          ;
    wire             spec_use_cmd_credit          ;
    reg              spec_rsp_credit_was_borrowed ;
    reg              spec_cmd_credit_was_borrowed ;
    reg              rsp_pipe_was_stalled         ;
    reg              cmd_pipe_was_stalled         ;
    reg   [  2:0]    rdsegs_add_back              ;
    reg   [  2:0]    cdsegs_add_back              ;
    wire             there_are_enough_dcp0_credits ;
    wire             there_are_enough_dcp3_credits ;

    reg   [  4:0]    cf_rate_counter              ;
    reg   [  4:0]    cf_rate_counter_nxt          ;
    reg              must_send_be                 ;
    reg   [  3:0]    template00_flit_rate         ;
    reg   [  3:0]    template01_flit_rate         ;
    reg   [  3:0]    template02_flit_rate         ;
    reg   [  3:0]    template03_flit_rate         ;
    reg              template00_supported         ;
    reg              template01_supported         ;
    reg              template02_supported         ;
    reg              template03_supported         ;
    reg  [  1:0]     best_tmpl                    ;
    reg  [  1:0]     best_tmpl_din                ;


    // --- TL Credit Packing
 `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    reg   [  5:0]    crd_waiting_counter          ;
    reg   [  5:0]    crd_waiting_counter_nxt      ;
 `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    reg              tl_credit_timeout            ;
    reg              xredy                        ;
    reg              xredy_din                    ;
    reg              rxredy                       ;
    reg              cxredy                       ;
    reg              push_cred_into_rsp_cf        ;
    reg              push_cred_into_cmd_cf        ;
    reg   [ 55:0]    credit_packet                ;
    reg   [ 55:0]    credit_packet_din            ;
    reg              capture_credit_packet        ;
    reg              clear_credit_packet          ;
 `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    reg              pack_crd_now                 ;


    // --- Response Packing Pipeline

    reg              rsp_credit_return            ;
    reg   [  7:0]    cfg_wait_time                ;
    wire  [  7:0]    cfg_wait_threshold           ;
    wire             cfg_is_tired_of_waiting      ;
    reg              rsp_credit_direct_return     ;
    reg              put_rsp_credit_onto_stack    ;
    wire             take_rsp_credit_off_stack    ;
    reg   [  3:0]    rsp_credit_stack             ;

    wire             valid_rsp_leaving_fifo       ;
    reg              rsp_credit_ok                ;
    reg              r_valid                      ;
    reg              r_valid_din                  ;
    reg              rsp_pipe_stall               ;
    reg  [  1:0]     rsp_tmpl                     ;
    reg  [  1:0]     rsp_tmpl_din                 ;
    reg  [  2:0]     rsp_packet_ptr               ;
    reg  [  2:0]     rsp_packet_ptr_din           ;
    reg  [  3:0]     rsp_packer_state             ;
    reg  [  3:0]     rsp_packer_next_state        ;
    reg              rsp_hold                     ;
    reg              pack_rsp_now                 ;
    reg              rsp_was_packed               ;
    wire             rsp_cf_empty                 ;
    reg   [  2:0]    rdsegs                       ;
    wire  [  1:0]    rdsege                       ;
    reg   [  4:0]    rcf_df_count_nxt             ;
    reg   [  4:0]    rcf_df_count                 ;
    reg   [  2:0]    rdincr                       ;
    wire             injct_cfg_rsp                ;
    wire             injct_cfg_rsp_data           ;


    // --- Command Packing Pipeline
    wire             valid_cmd_leaving_fifo       ;
    reg              cmd_credit_ok                ;
    reg              c_valid                      ;
    reg              c_valid_din                  ;
    reg              cmd_pipe_stall               ;
    reg  [  1:0]     cmd_tmpl                     ;
    reg  [  1:0]     cmd_tmpl_din                 ;
    reg  [  2:0]     cmd_packet_ptr               ;
    reg  [  2:0]     cmd_packet_ptr_din           ;
    reg  [  3:0]     cmd_packer_state             ;
    reg  [  3:0]     cmd_packer_next_state        ;
    reg              cmd_hold                     ;
    reg              pack_cmd_now                 ;
    reg              cmd_was_packed               ;
    wire             cmd_cf_empty                 ;
    reg   [  2:0]    cdsegs                       ;
    wire  [  1:0]    cdsege                       ;
    reg   [  4:0]    ccf_df_count_nxt             ;
    reg   [  4:0]    ccf_df_count                 ;
    //reg   [  4:0]    ccf_df_count_d1              ;
    reg   [  2:0]    cdincr                       ;


    // --- DFSR Variables
    reg              load_dfsr                    ;
    reg   [ 15:0]    df_ones_vector               ;
    reg   [ 31:0]    df_load                      ;
    reg   [ 31:0]    df_shift_load                ;
    reg   [ 31:0]    df_shift_reg_din             ;
    reg   [ 31:0]    df_shift_reg                 ;
    reg   [  4:0]    dfincr                       ;
    reg   [  4:0]    dfsr_idx                     ;
    reg   [  4:0]    dfsr_idx_nxt                 ;
    reg   [  4:0]    dfsr_idx_d1                  ;
    reg              hw_shift_error               ;
    wire  [  3:0]    run_length_countdown_nxt     ;
    reg   [  3:0]    run_length_countdown         ;
    wire  [  3:0]    num_dfs_for_next_frame       ;
    wire  [  3:0]    next_frame_run_length        ;
    reg   [  3:0]    frame_run_length             ;


    // --- Framer Variables
    reg              be_will_be_taken             ;
    reg              rsp_cf_will_be_taken         ;
    reg              cmd_cf_will_be_taken         ;
    reg              df_will_be_taken             ;
    reg              rsp_cf_was_taken             ;
    reg              cmd_cf_was_taken             ;
    //reg              cmd_cf_was_taken_d1          ;
    reg              frame_stall                  ;
    reg              frame_was_stalled            ;
    reg   [  4:0]    framer_state                 ;
    reg   [  4:0]    framer_next_state            ;
    reg              toggle                       ;
    reg              toggle_din                   ;
    reg              toggle_state                 ;
    wire  [  4:0]    flit_mux_cntl                ;
    reg   [  7:0]    bad_data_flit_vector_din     ;
    reg   [  7:0]    bad_data_flit_vector         ;
    reg   [  3:0]    bdfv_idx_din                 ;
    reg   [  3:0]    bdfv_idx                     ;
    reg              dflit_is_bad                 ;
    reg   [  7:0]    bdfv_bad_mask                ;
    reg              shift                        ;
    reg              will_shift                   ;
    reg              send_rsp_dflit               ;
    reg              send_cmd_dflit               ;
    reg              flit_will_be_sent            ;
    reg              flit_will_be_sent_d2         ;
    reg              send_flit_now                ;
    reg              dlx_tlx_flit_credit_latched  ;
    reg   [  3:0]    dlxcrd_counter_nxt           ;
    reg   [  3:0]    dlxcrd_counter               ;
    wire             read_dcp0_done               ;
    wire             read_dcp3_done               ;

    wire  [  3:0]    new_vc0_tlxcrd               ;
    wire  [  3:0]    new_vc3_tlxcrd               ;
    wire  [  5:0]    new_dcp0_tlxcrd              ;
//    wire  [ 15:0]    new_dcp0_tlxcrd              ;
    wire  [  5:0]    new_dcp3_tlxcrd              ;
//    wire  [ 15:0]    new_dcp3_tlxcrd              ;
    reg              vc0_tlxcrd_overflow_err_din  ;
    reg              vc0_tlxcrd_overflow_err      ;
    reg              vc3_tlxcrd_overflow_err_din  ;
    reg              vc3_tlxcrd_overflow_err      ;
    reg              dcp0_tlxcrd_overflow_err_din ;
    reg              dcp0_tlxcrd_overflow_err     ;
    reg              dcp3_tlxcrd_overflow_err_din ;
    reg              dcp3_tlxcrd_overflow_err     ;

    wire  [  4:0]    vc0_tlxcrd_delta             ;
//    wire  [ 15:0]    vc0_tlxcrd_temp1             ;
//    wire  [ 15:0]    vc0_tlxcrd_temp2             ;
//    wire  [ 15:0]    vc0_tlxcrd_temp3             ;
//    wire  [ 15:0]    vc0_tlxcrd_temp4             ;

    wire  [  4:0]    vc3_tlxcrd_delta             ;
//    wire  [ 15:0]    vc3_tlxcrd_temp1             ;
//    wire  [ 15:0]    vc3_tlxcrd_temp2             ;
//    wire  [ 15:0]    vc3_tlxcrd_temp3             ;
//    wire  [ 15:0]    vc3_tlxcrd_temp4             ;

    wire   [  5:0]     dcp0_tlxcrd_addback     ;
    wire   [  6:0]     dcp0_tlxcrd_adder       ;
    wire   [  2:0]     dcp0_tlxcrd_borrow      ;
    wire   [  3:0]     dcp0_tlxcrd_borrow2c    ;
    wire   [  7:0]     dcp0_tlxcrd_subtractor  ;
    wire   [  7:0]     dcp0_tlxcrd_delta       ;
    wire   [ 15:0]     dcp0_tlxcrd_delta_pad   ;
//  wire  [ 15:0]    dcp0_tlxcrd_temp_nc          ;
//  wire  [ 15:0]    dcp0_tlxcrd_temp_p1          ;
//  wire  [ 15:0]    dcp0_tlxcrd_temp_p2          ;
//  wire  [ 15:0]    dcp0_tlxcrd_temp_p3          ;
//  wire  [ 15:0]    dcp0_tlxcrd_temp_p4          ;
//  wire  [ 15:0]    dcp0_tlxcrd_temp_m1          ;
//  wire  [ 15:0]    dcp0_tlxcrd_temp_m2          ;
//  wire  [ 15:0]    dcp0_tlxcrd_temp_m3          ;
//  wire  [ 15:0]    dcp0_tlxcrd_temp_m4          ;
//  wire  [ 15:0]    dcp0_tlxcrd_temp_max         ;
//  reg   [ 15:0]    dcp0_tlxcrd_temp_borrow      ;
//  reg   [ 15:0]    dcp0_tlxcrd_temp_addback     ;
//  reg   [ 15:0]    dcp0_tlxcrd_temp_both        ;

    wire   [  5:0]     dcp3_tlxcrd_addback     ;
    wire   [  6:0]     dcp3_tlxcrd_adder       ;
    wire   [  2:0]     dcp3_tlxcrd_borrow      ;
    wire   [  3:0]     dcp3_tlxcrd_borrow2c    ;
    wire   [  7:0]     dcp3_tlxcrd_subtractor  ;
    wire   [  7:0]     dcp3_tlxcrd_delta       ;
    wire   [ 15:0]     dcp3_tlxcrd_delta_pad   ;
//    wire  [ 15:0]    dcp3_tlxcrd_temp_nc          ;
//    wire  [ 15:0]    dcp3_tlxcrd_temp_p1          ;
//    wire  [ 15:0]    dcp3_tlxcrd_temp_p2          ;
//    wire  [ 15:0]    dcp3_tlxcrd_temp_p3          ;
//    wire  [ 15:0]    dcp3_tlxcrd_temp_p4          ;
//    wire  [ 15:0]    dcp3_tlxcrd_temp_m1          ;
//    wire  [ 15:0]    dcp3_tlxcrd_temp_m2          ;
//    wire  [ 15:0]    dcp3_tlxcrd_temp_m3          ;
//    wire  [ 15:0]    dcp3_tlxcrd_temp_m4          ;
//    wire  [ 15:0]    dcp3_tlxcrd_temp_max         ;
//    reg   [ 15:0]    dcp3_tlxcrd_temp_borrow      ;
//    reg   [ 15:0]    dcp3_tlxcrd_temp_addback     ;
//    reg   [ 15:0]    dcp3_tlxcrd_temp_both        ;

    wire             tlxcrd_overflow_error        ;


    wire  [ 31:0]    afu_tlx_debug_info           ;  // 32-bit debug bus from AFU
    wire             afu_tlx_debug_fatal          ;  // Indicates that a fatal error was seen in the AFU (if valid is also asserted)
    wire             afu_tlx_debug_valid          ;  // Indicates that afu_tlx_debug_info and afu_tlx_debug_fatal are valid
    wire             clear_sticky_debug_info      ;  // Resets the debug output registers or lets them capture a new value.

    wire  [ 15:0]    detected_error_vector_din    ;
    reg   [ 15:0]    detected_error_vector        ;
    reg   [  3:0]    detected_error_encode        ;


    reg   [ 27:0]    error_0_supp_info            ;
    reg   [ 27:0]    error_1_supp_info            ;
    reg   [ 27:0]    error_2_supp_info            ;
    reg   [ 27:0]    error_3_supp_info            ;
    reg   [ 27:0]    error_4_supp_info            ;
    reg   [ 27:0]    error_5_supp_info            ;
    reg   [ 27:0]    error_6_supp_info            ;
    reg   [ 27:0]    error_7_supp_info            ;
    reg   [ 27:0]    error_8_supp_info            ;
    reg   [ 27:0]    error_9_supp_info            ;
    reg   [ 27:0]    error_A_supp_info            ;
    reg   [ 27:0]    error_B_supp_info            ;
    reg   [ 27:0]    error_C_supp_info            ;
    reg   [ 27:0]    error_D_supp_info            ;

    reg   [ 27:0]    error_0_supp_info_din        ;
    reg   [ 27:0]    error_1_supp_info_din        ;
    reg   [ 27:0]    error_2_supp_info_din        ;
    reg   [ 27:0]    error_3_supp_info_din        ;
    reg   [ 27:0]    error_4_supp_info_din        ;
    reg   [ 27:0]    error_5_supp_info_din        ;
    reg   [ 27:0]    error_6_supp_info_din        ;
    reg   [ 27:0]    error_7_supp_info_din        ;
    reg   [ 27:0]    error_8_supp_info_din        ;
    reg   [ 27:0]    error_9_supp_info_din        ;
    reg   [ 27:0]    error_A_supp_info_din        ;
    reg   [ 27:0]    error_B_supp_info_din        ;
    reg   [ 27:0]    error_C_supp_info_din        ;
    reg   [ 27:0]    error_D_supp_info_din        ;

    reg   [ 27:0]    supplemental_error_info      ;
    reg              error_fatal_flag             ;
    reg              error_valid_flag             ;
    reg   [ 31:0]    framer_debug_info_din        ;  // 32-bit debug bus from TLX Framer
    reg              framer_debug_fatal_din       ;  // Indicates that a fatal error was seen in the AFU (if valid is also asserted)
    reg              framer_debug_valid_din       ;  // Indicates that framer_debug_info and framer_debug_fatal are valid
    reg   [ 31:0]    framer_debug_info            ;  // 32-bit debug bus from TLX Framer
    reg              framer_debug_fatal           ;  // Indicates that a fatal error was seen in the AFU (if valid is also asserted)
    reg              framer_debug_valid           ;  // Indicates that framer_debug_info and framer_debug_fatal are valid

    reg              debug_reg_is_full            ;
    reg              capture_afu_dbg_info         ;
    reg              capture_rcv_dbg_info         ;
    reg              capture_framer_dbg_info      ;
    reg              capture_zero_dbg_info        ;

    reg   [ 31:0]    debug_info_din               ;
    reg   [ 31:0]    latched_debug_info           ;
    reg   [  3:0]    debug_encode_din             ;
    reg   [  3:0]    latched_debug_encode         ;


// ==============================================================================================================================
// @@@  Ties and Hard-coded  Assignments
// ==============================================================================================================================

    // Hard code some internal constants
    assign   cfg_tlx_resp_dl                    =   2'b01;           //  Config response DL is always 1
    assign   cfg_tlx_resp_dp                    =   2'b00;           //  Config response DP is always 0

    // Drive some outputs with constants
    assign   tlx_afu_resp_initial_credit        =   4'b0111;         //  Set initial rsp credit to 7.  Reserve one for config responses.
    assign   tlx_afu_cmd_initial_credit         =   4'b1000;         //  Set initial cmd credit to 8.
    assign   tlx_afu_resp_data_initial_credit   =   6'b001111;       //  Set initial data credit to 15.  Reserve one for cofig responses.
    assign   tlx_afu_cmd_data_initial_credit    =   6'b100000;       //  Set initial data credit to 32.

    assign   cfg_wait_threshold                 =   8'b11111111 ;    //  Wait up to 256 cycles before forcing a break in the response pipeline.


// ==============================================================================================================================
// @@@ Intentionally Unused Signals
// ==============================================================================================================================
// Tie any signals that will never be used into this giant OR gate.   This will help make lint happy.
// Use OR-REDUCE operator "|" for vectors.

  assign  intentionally_unused  =     |vc0_valid_entry_count[3:0]
                                  ||  |vc3_valid_entry_count[3:0]
                                  ||   dcp0_data_look_ahead
                                  ||   dcp0_data_available
                                  ||   dcp3_data_look_ahead
                                  ||   dcp3_data_available
                                  ||   cfg_reg_resp_valid
                                  ||  |template02_flit_rate[3:0]
                                  ||   template00_supported
                                  ||   template02_supported
                                  ||  |dlx_tlx_dlx_config_info[30:0]
                                  ;



// ==============================================================================================================================
// @@@ Data Flow Logic
// ==============================================================================================================================

    // ---------------
    // @@@ Input Registers
    // ---------------
    // Capture command from AFU
    always @ (posedge clock) begin
        if      (!reset_n)              afu_reg_cmd_valid  <= 1'b0;
        else                            afu_reg_cmd_valid  <= afu_tlx_cmd_valid;
    end
    // Capture command from AFU
    always @ (posedge clock) begin
        if      (!reset_n)              afu_reg_cmd_opcode  <= 8'h00;
        else                            afu_reg_cmd_opcode  <= afu_tlx_cmd_opcode;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              afu_reg_cmd_actag  <= 12'h000;
        else                            afu_reg_cmd_actag  <= afu_tlx_cmd_actag;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              afu_reg_cmd_stream_id  <= 4'h0;
        else                            afu_reg_cmd_stream_id  <= afu_tlx_cmd_stream_id;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              afu_reg_cmd_ea_or_obj  <= 68'h0;
        else                            afu_reg_cmd_ea_or_obj  <= afu_tlx_cmd_ea_or_obj;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              afu_reg_cmd_afutag  <= 16'h0000;
        else                            afu_reg_cmd_afutag  <= afu_tlx_cmd_afutag;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              afu_reg_cmd_dl  <= 2'b00;
        else                            afu_reg_cmd_dl  <= afu_tlx_cmd_dl;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              afu_reg_cmd_pl  <= 3'b000;
        else                            afu_reg_cmd_pl  <= afu_tlx_cmd_pl;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              afu_reg_cmd_os  <= 1'b0;
        else                            afu_reg_cmd_os  <= afu_tlx_cmd_os;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              afu_reg_cmd_be  <= 64'h0;
        else                            afu_reg_cmd_be  <= afu_tlx_cmd_be;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              afu_reg_cmd_flag  <= 4'h0;
        else                            afu_reg_cmd_flag  <= afu_tlx_cmd_flag;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              afu_reg_cmd_endian  <= 1'b0;
        else                            afu_reg_cmd_endian  <= afu_tlx_cmd_endian;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              afu_reg_cmd_bdf  <= 16'h0000;
        else                            afu_reg_cmd_bdf  <= afu_tlx_cmd_bdf;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              afu_reg_cmd_pasid  <= 20'h00000;
        else                            afu_reg_cmd_pasid  <= afu_tlx_cmd_pasid;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              afu_reg_cmd_pg_size  <= 6'b000000;
        else                            afu_reg_cmd_pg_size  <= afu_tlx_cmd_pg_size;
    end
    // Capture valid signal and delay it two cycles.  Use it to write the cmd into the FIFOs.
    always @ (posedge clock) begin
        if      (!reset_n)              cmd_valid_d1  <= 1'b0;
        else                            cmd_valid_d1  <= afu_reg_cmd_valid;
    end



    // Capture response from AFU
    always @ (posedge clock) begin
        if      (!reset_n)              afu_reg_resp_valid  <= 1'b0;
        else                            afu_reg_resp_valid  <= afu_tlx_resp_valid;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              afu_reg_resp_opcode  <= 8'h00;
        else                            afu_reg_resp_opcode  <= afu_tlx_resp_opcode;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              afu_reg_resp_dl  <= 2'b00;
        else                            afu_reg_resp_dl  <= afu_tlx_resp_dl;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              afu_reg_resp_capptag  <= 16'h0000;
        else                            afu_reg_resp_capptag  <= afu_tlx_resp_capptag;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              afu_reg_resp_dp  <= 2'b00;
        else                            afu_reg_resp_dp  <= afu_tlx_resp_dp;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              afu_reg_resp_code  <= 4'h0;
        else                            afu_reg_resp_code  <= afu_tlx_resp_code;
    end
    // Capture valid signal and delay it two cycles.  Use it to write the response into the FIFOs.
    always @ (posedge clock) begin
        if      (!reset_n)              rsp_valid_d1  <= 1'b0;
        else                            rsp_valid_d1  <= afu_reg_resp_valid;
    end



    // Capture command data from AFU
    always @ (posedge clock) begin
        if      (!reset_n)              cmd_data_input_reg  <= 512'h0;
        else if (!afu_tlx_cdata_valid)  cmd_data_input_reg  <= cmd_data_input_reg;
        else                            cmd_data_input_reg  <= afu_tlx_cdata_bus;
    end
    // Capture command data flag from AFU
    always @ (posedge clock) begin
        if      (!reset_n)              cmd_bad_data_flag  <= 1'b0;
        else if (!afu_tlx_cdata_valid)  cmd_bad_data_flag  <= cmd_bad_data_flag;
        else                            cmd_bad_data_flag  <= afu_tlx_cdata_bdi;
    end
    // Capture data valid signals and delay them two cycles.  Use them to write the data into the FIFOs.
    always @ (posedge clock) begin
        if      (!reset_n)              cmd_data_valid_d1  <= 1'b0;
        else                            cmd_data_valid_d1  <= afu_tlx_cdata_valid;
    end



    // Capture response data from AFU
    always @ (posedge clock) begin
        if      (!reset_n)              rsp_data_input_reg  <= 512'h0;
        else if (!afu_tlx_rdata_valid)  rsp_data_input_reg  <= rsp_data_input_reg;
        else                            rsp_data_input_reg  <= afu_tlx_rdata_bus;
    end
    // Capture response data flag from AFU
    always @ (posedge clock) begin
        if      (!reset_n)              rsp_bad_data_flag  <= 1'b0;
        else if (!afu_tlx_rdata_valid)  rsp_bad_data_flag  <= rsp_bad_data_flag;
        else                            rsp_bad_data_flag  <= afu_tlx_rdata_bdi;
    end
    // Capture data valid signals and delay them two cycles.  Use them to write the data into the FIFOs.
    always @ (posedge clock) begin
        if      (!reset_n)              rsp_data_valid_d1  <= 1'b0;
        else                            rsp_data_valid_d1  <= afu_tlx_rdata_valid;
    end




    // Capture config response from AFU
    always @ (posedge clock) begin
        if      (!reset_n)              cfg_tlx_resp_valid_d1 <= 1'b0;
        else                            cfg_tlx_resp_valid_d1 <= cfg_tlx_resp_valid;
    end
    assign  capt_cfg_resp  =  cfg_tlx_resp_valid  && !( cfg_tlx_resp_valid_d1 ) ;  // Make this into a one-cycle pulse

    always @ (posedge clock) begin
        if      (!reset_n)              cfg_reg_resp_valid    <= 1'b0;
        else                            cfg_reg_resp_valid    <= cfg_tlx_resp_valid;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              cfg_reg_resp_opcode   <= 8'h00;
        else if (capt_cfg_resp)         cfg_reg_resp_opcode   <= cfg_tlx_resp_opcode;
        else                            cfg_reg_resp_opcode   <= cfg_reg_resp_opcode;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              cfg_reg_resp_dl       <= 2'b00;
        else if (capt_cfg_resp)         cfg_reg_resp_dl       <= cfg_tlx_resp_dl;
        else                            cfg_reg_resp_dl       <= cfg_reg_resp_dl;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              cfg_reg_resp_capptag  <= 16'h0000;
        else if (capt_cfg_resp)         cfg_reg_resp_capptag  <= cfg_tlx_resp_capptag;
        else                            cfg_reg_resp_capptag  <= cfg_reg_resp_capptag;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              cfg_reg_resp_dp       <= 2'b00;
        else if (capt_cfg_resp)         cfg_reg_resp_dp       <= cfg_tlx_resp_dp;
        else                            cfg_reg_resp_dp       <= cfg_reg_resp_dp;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              cfg_reg_resp_code     <= 4'h0;
        else if (capt_cfg_resp)         cfg_reg_resp_code     <= cfg_tlx_resp_code;
        else                            cfg_reg_resp_code     <= cfg_reg_resp_code;
    end


    // Capture config response data from AFU
    always @ (posedge clock) begin
        if      (!reset_n)              cfg_reg_rdata_offset  <= 4'h0;
        else if (capt_cfg_resp)         cfg_reg_rdata_offset  <= cfg_tlx_rdata_offset;
        else                            cfg_reg_rdata_offset  <= cfg_reg_rdata_offset;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              cfg_reg_rdata_bus     <= 32'h00000000;
        else if (capt_cfg_resp)         cfg_reg_rdata_bus     <= cfg_tlx_rdata_bus;
        else                            cfg_reg_rdata_bus     <= cfg_reg_rdata_bus;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              cfg_reg_rdata_bdi     <= 1'b0;
        else if (capt_cfg_resp)         cfg_reg_rdata_bdi     <= cfg_tlx_rdata_bdi;
        else                            cfg_reg_rdata_bdi     <= cfg_reg_rdata_bdi;
    end



    // ---------------
    // @@@ TL Credit Counters
    // ---------------
    // Count the TL credits which will be sent to, and used by the TL
    // These TL credit counters handle max of 255 credits per VC and 255 credits per DCP
    // Subtract the credits from these counters when the credits are put into the credit pactet register.  (Not when packed into control flit.)

    always @ (*) begin
        if (vc0_tlcrd_counter > 8'b00001111)  vc0_tlcrd_counter_snd = 4'b1111 ;                 // If there are more than 15 credits, send 15 of them.
        else                                  vc0_tlcrd_counter_snd = vc0_tlcrd_counter[3:0] ;  // Otherwise, send all of them in the counter
        if      (!capture_credit_packet && !rcv_xmt_tl_credit_vc0_valid) vc0_tlcrd_counter_nxt = vc0_tlcrd_counter;                // No change
        else if (!capture_credit_packet &&  rcv_xmt_tl_credit_vc0_valid) vc0_tlcrd_counter_nxt = vc0_tlcrd_counter + 8'b00000001;    // Increment
        else if ( capture_credit_packet && !rcv_xmt_tl_credit_vc0_valid) vc0_tlcrd_counter_nxt = vc0_tlcrd_counter - {4'b0000,vc0_tlcrd_counter_snd};
        else                                                             vc0_tlcrd_counter_nxt = vc0_tlcrd_counter - {4'b0000,vc0_tlcrd_counter_snd} + 8'b00000001;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              vc0_tlcrd_counter  <= 8'h00;
        else                            vc0_tlcrd_counter  <= vc0_tlcrd_counter_nxt;
    end

    always @ (*) begin
        if (vc1_tlcrd_counter > 8'b00001111)  vc1_tlcrd_counter_snd = 4'b1111 ;                 // If there are more than 15 credits, send 15 of them.
        else                                  vc1_tlcrd_counter_snd = vc1_tlcrd_counter[3:0] ;  // Otherwise, send all of them in the counter
        if      (!capture_credit_packet && !rcv_xmt_tl_credit_vc1_valid) vc1_tlcrd_counter_nxt = vc1_tlcrd_counter;                // No change
        else if (!capture_credit_packet &&  rcv_xmt_tl_credit_vc1_valid) vc1_tlcrd_counter_nxt = vc1_tlcrd_counter + 8'b00000001;    // Increment
        else if ( capture_credit_packet && !rcv_xmt_tl_credit_vc1_valid) vc1_tlcrd_counter_nxt = vc1_tlcrd_counter - {4'b0000,vc1_tlcrd_counter_snd};
        else                                                             vc1_tlcrd_counter_nxt = vc1_tlcrd_counter - {4'b0000,vc1_tlcrd_counter_snd} + 8'b00000001;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              vc1_tlcrd_counter  <= 8'h00;
        else                            vc1_tlcrd_counter  <= vc1_tlcrd_counter_nxt;
    end

    always @ (*) begin
        if (dcp0_tlcrd_counter > 8'b00111111)  dcp0_tlcrd_counter_snd = 6'b111111 ;                // If there are more than 63 credits, send 63 of them.
        else                                   dcp0_tlcrd_counter_snd = dcp0_tlcrd_counter[5:0] ;  // Otherwise, send all of them in the counter
        if      (!capture_credit_packet && !rcv_xmt_tl_credit_dcp0_valid) dcp0_tlcrd_counter_nxt = dcp0_tlcrd_counter;                // No change
        else if (!capture_credit_packet &&  rcv_xmt_tl_credit_dcp0_valid) dcp0_tlcrd_counter_nxt = dcp0_tlcrd_counter + 8'b00000001;    // Increment
        else if ( capture_credit_packet && !rcv_xmt_tl_credit_dcp0_valid) dcp0_tlcrd_counter_nxt = dcp0_tlcrd_counter - {2'b00,dcp0_tlcrd_counter_snd};
        else                                                              dcp0_tlcrd_counter_nxt = dcp0_tlcrd_counter - {2'b00,dcp0_tlcrd_counter_snd} + 8'b00000001;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              dcp0_tlcrd_counter  <= 8'h00;
        else                            dcp0_tlcrd_counter  <= dcp0_tlcrd_counter_nxt;
    end

    always @ (*) begin
        if (dcp1_tlcrd_counter > 8'b00111111)  dcp1_tlcrd_counter_snd = 6'b111111 ;                // If there are more than 63 credits, send 63 of them.
        else                                   dcp1_tlcrd_counter_snd = dcp1_tlcrd_counter[5:0] ;  // Otherwise, send all of them in the counter

        if      (!capture_credit_packet && !rcv_xmt_tl_credit_dcp1_valid && !rcv_xmt_tl_crd_cfg_dcp1_valid)  dcp1_tlcrd_counter_nxt = dcp1_tlcrd_counter;                 // No change
        else if (!capture_credit_packet && !rcv_xmt_tl_credit_dcp1_valid &&  rcv_xmt_tl_crd_cfg_dcp1_valid)  dcp1_tlcrd_counter_nxt = dcp1_tlcrd_counter + 8'b00000001;   // Increment by 1
        else if (!capture_credit_packet &&  rcv_xmt_tl_credit_dcp1_valid && !rcv_xmt_tl_crd_cfg_dcp1_valid)  dcp1_tlcrd_counter_nxt = dcp1_tlcrd_counter + 8'b00000001;   // Increment by 1
        else if (!capture_credit_packet &&  rcv_xmt_tl_credit_dcp1_valid &&  rcv_xmt_tl_crd_cfg_dcp1_valid)  dcp1_tlcrd_counter_nxt = dcp1_tlcrd_counter + 8'b00000010;   // Increment by 2
        else if ( capture_credit_packet && !rcv_xmt_tl_credit_dcp1_valid && !rcv_xmt_tl_crd_cfg_dcp1_valid)  dcp1_tlcrd_counter_nxt = dcp1_tlcrd_counter - {2'b00,dcp1_tlcrd_counter_snd};
        else if ( capture_credit_packet && !rcv_xmt_tl_credit_dcp1_valid &&  rcv_xmt_tl_crd_cfg_dcp1_valid)  dcp1_tlcrd_counter_nxt = dcp1_tlcrd_counter - {2'b00,dcp1_tlcrd_counter_snd} + 8'b00000001;
        else if ( capture_credit_packet &&  rcv_xmt_tl_credit_dcp1_valid && !rcv_xmt_tl_crd_cfg_dcp1_valid)  dcp1_tlcrd_counter_nxt = dcp1_tlcrd_counter - {2'b00,dcp1_tlcrd_counter_snd} + 8'b00000001;
        else                                                                                                 dcp1_tlcrd_counter_nxt = dcp1_tlcrd_counter - {2'b00,dcp1_tlcrd_counter_snd} + 8'b00000010;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              dcp1_tlcrd_counter  <= 8'h00;
        else                            dcp1_tlcrd_counter  <= dcp1_tlcrd_counter_nxt;
    end


    // ---------------
    // @@@ TL Credit Packet
    // ---------------

    // Capture 2-slot Credit Packet
    // Note - in the current design, sometimes the credits may be packed into the control flit even when xredy=0.
    // This can happen when the packer needs to fill slots 0,1 to prevent a six-slot command from going into slots 0,1.
    // So, the logic needs to have a credit packet ready to go at all times, even if it is a credit packet of zeros.
    always @ (*) begin
        if    (capture_credit_packet) credit_packet_din[55:0] = { 12'b000000000000,
                                                                  dcp1_tlcrd_counter_snd,
                                                                  dcp0_tlcrd_counter_snd,
                                                                  16'h0000,
                                                                  vc1_tlcrd_counter_snd,
                                                                  vc0_tlcrd_counter_snd,
                                                                  8'b00001000         };            // Pack slots 0,1 with TL credits.  AP Credit packet opcode = 00001000.
        else if (clear_credit_packet) credit_packet_din[55:0] = { 48'h000000000000, 8'b00001000 };  // Pack slots 0,1 with zero TL credits.  AP Credit packet opcode = 00001000.
        else                          credit_packet_din[55:0] = credit_packet ;                     // Hold credit packet until it is taken.
    end
    always @ (posedge clock) begin
        if      (!reset_n)    credit_packet    <= 56'h0;
        else                  credit_packet    <= credit_packet_din;
    end


    // ---------------
    // @@@ TL Credit Ready Logic
    // ---------------

    always @ (*) begin
        // Determine whether or not there are credits waiting to be sent.
        if ( (vc0_tlcrd_counter > 8'h00) || (vc1_tlcrd_counter > 8'h00) || (dcp0_tlcrd_counter > 8'h00) || (dcp1_tlcrd_counter > 8'h00) )  any_tlcrds_waiting = 1'b1;
        else                                                                                                                               any_tlcrds_waiting = 1'b0;

        // Determine whether or not there is a bunch of credits waiting to be sent.
        if ( (vc0_tlcrd_counter > 8'h08) || (vc1_tlcrd_counter > 8'h08) || (dcp0_tlcrd_counter > 8'h08) || (dcp1_tlcrd_counter > 8'h08) )  bunch_tlcrds_waiting = 1'b1;
        else                                                                                                                               bunch_tlcrds_waiting = 1'b0;
    end


    // Credits waiting counter
    // If there are credits waiting to be sent, this counter counts the number of cycles that have been sent since the last credit packet was sent.
    // This is a count up and hold counter.   It is reset when a credit packet is packed into a control flit.
    // If there are a few TL credits waiting to be sent, and they have waited for a while, this will cause them to be sent even if there are not that many.
    always @ (*) begin
        if      (capture_credit_packet)             crd_waiting_counter_nxt  = 6'b000000 ;                         // Reset the counter if credits are packed.
        else if (crd_waiting_counter == 6'b000000) begin                                                           // Counter has not started yet
                   if (any_tlcrds_waiting)          crd_waiting_counter_nxt  = 6'b000001 ;                         // There are credits waiting. Start the counter
                   else                             crd_waiting_counter_nxt  = 6'b000000 ;                         // There are no credits waiting.  Hold at zero
             end
        else if (crd_waiting_counter == 6'b111111)  crd_waiting_counter_nxt  = 6'b111111 ;                         // Counter has reached max.  Hold this value.
        else                                        crd_waiting_counter_nxt  = crd_waiting_counter + 6'b000001 ;   // Increment the counter

        if  (crd_waiting_counter >= 6'b100000)  tl_credit_timeout = 1'b1 ;  // Set the timeout threshold to the desired number of cycles.
        else                                    tl_credit_timeout = 1'b0 ;
    end
    always @ (posedge clock) begin
        if      (!reset_n)   crd_waiting_counter  <= 6'b000000;
        else                 crd_waiting_counter  <= crd_waiting_counter_nxt;
    end


    // Determine when to capture credits into the credit packet latches.
    always @ (*) begin
        if (!xredy) begin                                      // The current credit packet is empty, so go ahead an fill it if there is something to send.
             if ( bunch_tlcrds_waiting || tl_credit_timeout )  capture_credit_packet = 1'b1;  // There are credits waiting to go, so capture them into credit packet
             else                                              capture_credit_packet = 1'b0;  // There are no credits that need to be sent right now
                                                               clear_credit_packet = 1'b0 ;
        end
        else       begin                                       // The current credit packet is not empty, so don't capture a new one until this one is packed.
             if (pack_crd_now)                                 clear_credit_packet = 1'b1;    // The current credit packet is being packed so clear the credit packet.
             else                                              clear_credit_packet = 1'b0;    // Hold the current packet.  It is not packet yet.
                                                               capture_credit_packet = 1'b0;
        end
    end


    // xredy (credit packet ready) logic
    always @ (*) begin
        if      (capture_credit_packet)   xredy_din = 1'b1  ;  // A new credit packet will be ready
        else if (clear_credit_packet)     xredy_din = 1'b0  ;  // The credit packet will be taken
        else                              xredy_din = xredy ;  // No change
    end
    always @ (posedge clock) begin
        if      (!reset_n)      xredy  <= 1'b0;
        else                    xredy  <= xredy_din;
    end
    always @ (*) begin
      if      (xredy && c_valid)  begin   rxredy = 1'b0;   cxredy = 1'b1;  end  // If commands are already flowing, tell CMD pipeline to pick up credits.
      else if (xredy)             begin   rxredy = 1'b1;   cxredy = 1'b0;  end  // Otherwise tell the RSP pipeline to pick up credits.
      else                        begin   rxredy = 1'b0;   cxredy = 1'b0;  end
    end

    // Push the credit packet into either the Response Pipeline or the Command Pipeline
    always @ (*) begin
      if (xredy)
        if       (rsp_packer_next_state == RP_STRT && rxredy)  begin  push_cred_into_rsp_cf = 1'b1;  push_cred_into_cmd_cf = 1'b0;  end  // If RSP CF is starting, add credits
        else if  (cmd_packer_next_state == CP_STRT && cxredy)  begin  push_cred_into_rsp_cf = 1'b0;  push_cred_into_cmd_cf = 1'b1;  end  // If CMD CF is starting, add credits
        else                                                   begin  push_cred_into_rsp_cf = 1'b0;  push_cred_into_cmd_cf = 1'b0;  end  // If no rsps or cmds are flowing, send rsp credit packet.
      else                                                     begin  push_cred_into_rsp_cf = 1'b0;  push_cred_into_cmd_cf = 1'b0;  end

      pack_crd_now  =  push_cred_into_rsp_cf  ||  push_cred_into_cmd_cf ;
    end


    // ---------------
    // @@@ Check for missing data flits and rouge data flits
    // ---------------
    // This logic checks for responses or cmds from the AFU which should have immediate data, but no data arrived.
    // It also checks for data that arrives without a coincident cmd or response.
    always @ (*) begin
        if     ( afu_reg_resp_valid && (afu_reg_resp_opcode == 8'b00000001) && ( !rsp_data_valid_d1 ) )   rsp_data_missing_error  = 1'b1 ;   // mem_rd_response must have immediate data
        else                                                                                              rsp_data_missing_error  = 1'b0 ;
    end
    always @ (*) begin
        if ( afu_reg_cmd_valid  &&  !cmd_data_valid_d1 ) begin
                case (afu_reg_cmd_opcode)
                    8'b00100000  :    cmd_data_missing_error  = 1'b1 ;   // dma_w       command must have immediate data
                    8'b00100100  :    cmd_data_missing_error  = 1'b1 ;   // dma_w.n     command must have immediate data
                    8'b00101000  :    cmd_data_missing_error  = 1'b1 ;   // dma_w.be    command must have immediate data
                    8'b00101100  :    cmd_data_missing_error  = 1'b1 ;   // dma_w.be.n  command must have immediate data
                    8'b00110000  :    cmd_data_missing_error  = 1'b1 ;   // dma_pr_w    command must have immediate data
                    8'b00110100  :    cmd_data_missing_error  = 1'b1 ;   // dma_pr_w.n  command must have immediate data
                    8'b01000000  :    cmd_data_missing_error  = 1'b1 ;   // amo_rw      command must have immediate data
                    8'b01000100  :    cmd_data_missing_error  = 1'b1 ;   // amo_rw.n    command must have immediate data
                    8'b01001000  :    cmd_data_missing_error  = 1'b1 ;   // amo_w       command must have immediate data
                    8'b01001100  :    cmd_data_missing_error  = 1'b1 ;   // amo_w.n     command must have immediate data
                    8'b01011010  :    cmd_data_missing_error  = 1'b1 ;   // intrp_req.d command must have immediate data
                    default      :    cmd_data_missing_error  = 1'b0 ;
                endcase
            end 
        else                          cmd_data_missing_error  = 1'b0 ;
    end
    always @ (*) begin
        if     ( afu_tlx_rdata_valid  &&  !rsp_data_valid_d1  &&  !afu_tlx_resp_valid )   rouge_rsp_data_error  = 1'b1 ;   // Response data arriving from AFU at unexpected time
        else                                                                              rouge_rsp_data_error  = 1'b0 ;
    end
    always @ (*) begin
        if     ( afu_tlx_cdata_valid  &&  !cmd_data_valid_d1  &&  !afu_tlx_cmd_valid )    rouge_cmd_data_error  = 1'b1 ;   // Command data arriving from AFU at unexpected time
        else                                                                              rouge_cmd_data_error  = 1'b0 ;
    end


    // ---------------
    // @@@ Response Packet Formmation Logic
    // ---------------
    always @ (*) begin
        case (afu_reg_resp_opcode)
            8'b00000000  :   begin                                                       // --> nop
                             rsp_packet [55:0] = { 48'h000000000000,
                                                   afu_reg_resp_opcode };
                             num_rsp_data_segments = 2'b00;  // 0 data Segments
                             end
            8'b00000001  :   begin                                                       // --> mem_rd_response
                             rsp_packet [55:0] = { 28'h0000000,
                                                   afu_reg_resp_dl,
                                                   afu_reg_resp_dp,
                                                   afu_reg_resp_capptag,
                                                   afu_reg_resp_opcode };
                             num_rsp_data_segments = afu_reg_resp_dl;
                             end
            8'b00000010  :   begin                                                       // --> mem_rd_fail
                             rsp_packet [55:0] = { afu_reg_resp_code,
                                                   24'h000000,
                                                   afu_reg_resp_dl,
                                                   afu_reg_resp_dp,
                                                   afu_reg_resp_capptag,
                                                   afu_reg_resp_opcode };
                             num_rsp_data_segments = 2'b00;
                             end
            8'b00000100  :   begin                                                       // --> mem_wr_response
                             rsp_packet [55:0] = { 28'h0000000,
                                                   afu_reg_resp_dl,
                                                   afu_reg_resp_dp,
                                                   afu_reg_resp_capptag,
                                                   afu_reg_resp_opcode };
                             num_rsp_data_segments = 2'b00;
                             end
            8'b00000101  :   begin                                                       // --> mem_wr_fail
                             rsp_packet [55:0] = { afu_reg_resp_code,
                                                   24'h000000,
                                                   afu_reg_resp_dl,
                                                   afu_reg_resp_dp,
                                                   afu_reg_resp_capptag,
                                                   afu_reg_resp_opcode };
                             num_rsp_data_segments = 2'b00;
                             end
            default      :   begin                                                       // --> credits or invalid resp
                             rsp_packet [55:0] = { 48'h000000000000,
                                                   afu_reg_resp_opcode };
                             num_rsp_data_segments = 2'b00;  // 0 data Segments
                             end
        endcase
        rsp_packet [57:56]  =  num_rsp_data_segments ;  // "00"=0,  "01"=1,  "10"=2,  "11"=4
        rsp_packet [58]  =  1'b0;    // Config response flag = 0.  This is a regular response, not a config response
    end


    // ---------------
    // @@@ Config Response Packet Formmation Logic
    // ---------------
    always @ (*) begin
        case (cfg_reg_resp_opcode)
            8'b00000000  :   begin                                                       // --> nop
                             cfg_packet [55:0] = { 48'h000000000000,
                                                   cfg_reg_resp_opcode };
                             num_cfg_data_segments = 2'b00;  // 0 data Segments
                             end
            8'b00000001  :   begin                                                       // --> mem_rd_response
                             cfg_packet [55:0] = { 28'h0000000,
                                                   cfg_reg_resp_dl,
                                                   cfg_reg_resp_dp,
                                                   cfg_reg_resp_capptag,
                                                   cfg_reg_resp_opcode };
                             num_cfg_data_segments = cfg_reg_resp_dl;
                             end
            8'b00000010  :   begin                                                       // --> mem_rd_fail
                             cfg_packet [55:0] = { cfg_reg_resp_code,
                                                   24'h000000,
                                                   cfg_reg_resp_dl,
                                                   cfg_reg_resp_dp,
                                                   cfg_reg_resp_capptag,
                                                   cfg_reg_resp_opcode };
                             num_cfg_data_segments = 2'b00;
                             end
            8'b00000100  :   begin                                                       // --> mem_wr_response
                             cfg_packet [55:0] = { 28'h0000000,
                                                   cfg_reg_resp_dl,
                                                   cfg_reg_resp_dp,
                                                   cfg_reg_resp_capptag,
                                                   cfg_reg_resp_opcode };
                             num_cfg_data_segments = 2'b00;
                             end
            8'b00000101  :   begin                                                       // --> mem_wr_fail
                             cfg_packet [55:0] = { cfg_reg_resp_code,
                                                   24'h000000,
                                                   cfg_reg_resp_dl,
                                                   cfg_reg_resp_dp,
                                                   cfg_reg_resp_capptag,
                                                   cfg_reg_resp_opcode };
                             num_cfg_data_segments = 2'b00;
                             end
            default      :   begin                                                       // --> credits or invalid resp
                             cfg_packet [55:0] = { 48'h000000000000,
                                                   cfg_reg_resp_opcode };
                             num_cfg_data_segments = 2'b00;  // 0 data Segments
                             end
        endcase
        cfg_packet [57:56]  =  num_cfg_data_segments ;  // "00"=0,  "01"=1,  "10"=2,  "11"=4
        cfg_packet [58]  =  1'b1;    // Config response flag = 1.  This is a config response
    end


    // ---------------
    // @@@ Command Packet Formmation Logic
    // ---------------
    always @ (*) begin
        casex (afu_reg_cmd_opcode)
            8'b00000000  :  begin                                                       // --> nop
                             cmd_packet [167:0] = { 160'h0000000000000000000000000000000000000000,
                                                   afu_reg_cmd_opcode               };
                             num_cmd_data_segments = 2'b00;  // 0 data segments
                             cmd_slot_count_encode = 2'b00;  // 1 slot
                            end
            8'b00010x0x  :  begin                                                       // --> rd_wnitc
                             cmd_packet [167:0] = { 56'h00000000000000,
                                                   afu_reg_cmd_dl,
                                                   2'b00,
                                                   afu_reg_cmd_afutag,
                                                   afu_reg_cmd_ea_or_obj[63:6],   // Bit 5 of EA is zeroed out in version 3.0 of the spec.
                                                   6'b000000,
                                                   afu_reg_cmd_stream_id,
                                                   afu_reg_cmd_actag,
                                                   4'b0000,
                                                   afu_reg_cmd_opcode               };
                             num_cmd_data_segments = 2'b00;  // 0 data segments
                             cmd_slot_count_encode = 2'b10;  // 4 slots
                            end
            8'b00010x1x  :  begin                                                       // --> pr_rd_wnitc
                             cmd_packet [167:0] = { 56'h00000000000000,
                                                   afu_reg_cmd_pl,
                                                   1'b0,
                                                   afu_reg_cmd_afutag,
                                                   afu_reg_cmd_ea_or_obj[63:0],
                                                   afu_reg_cmd_stream_id,
                                                   afu_reg_cmd_actag,
                                                   4'b0000,
                                                   afu_reg_cmd_opcode               };
                             num_cmd_data_segments = 2'b00;  // 0 data segments
                             cmd_slot_count_encode = 2'b10;  // 4 slots
                            end
            8'b00100xxx  :  begin                                                       // --> dma_w
                             cmd_packet [167:0] = { 56'h00000000000000,
                                                   afu_reg_cmd_dl,
                                                   1'b0,
                                                   afu_reg_cmd_os,
                                                   afu_reg_cmd_afutag,
                                                   afu_reg_cmd_ea_or_obj[63:6],
                                                   6'b000000,
                                                   afu_reg_cmd_stream_id,
                                                   afu_reg_cmd_actag,
                                                   4'b0000,
                                                   afu_reg_cmd_opcode               };
                             num_cmd_data_segments = afu_reg_cmd_dl;  // 1-4 data segments
                             cmd_slot_count_encode = 2'b10;  // 4 slots
                            end
            8'b00101xxx  :  begin                                                       // --> dma_w.be
                             cmd_packet [167:0] = { afu_reg_cmd_be[63:4],
                                                   afu_reg_cmd_afutag,
                                                   afu_reg_cmd_ea_or_obj[63:6],
                                                   2'b00,
                                                   afu_reg_cmd_be[3:0],
                                                   afu_reg_cmd_stream_id,
                                                   afu_reg_cmd_actag,
                                                   4'b0000,
                                                   afu_reg_cmd_opcode               };
                             num_cmd_data_segments = 2'b01;  // 1 data segment
                             cmd_slot_count_encode = 2'b11;  // 6 slots
                            end
            8'b00110xxx  :  begin                                                       // --> dma_pr_w
                             cmd_packet [167:0] = { 56'h00000000000000,
                                                   afu_reg_cmd_pl,
                                                   1'b0,
                                                   afu_reg_cmd_afutag,
                                                   afu_reg_cmd_ea_or_obj[63:0],
                                                   afu_reg_cmd_stream_id,
                                                   afu_reg_cmd_actag,
                                                   4'b0000,
                                                   afu_reg_cmd_opcode               };
                             num_cmd_data_segments = 2'b01;  // 1 data segment
                             cmd_slot_count_encode = 2'b10;  // 4 slots
                            end
            8'b00111x0x  :  begin                                                       // --> amo_rd
                             cmd_packet [167:0] = { 56'h00000000000000,
                                                   afu_reg_cmd_pl,
                                                   afu_reg_cmd_endian,
                                                   afu_reg_cmd_afutag,
                                                   afu_reg_cmd_ea_or_obj[63:0],
                                                   afu_reg_cmd_stream_id,
                                                   afu_reg_cmd_actag,
                                                   afu_reg_cmd_flag,
                                                   afu_reg_cmd_opcode               };
                             num_cmd_data_segments = 2'b00;  // 0 data segments
                             cmd_slot_count_encode = 2'b10;  // 4 slots
                            end
            8'b01000x0x  :  begin                                                       // --> amo_rw
                             cmd_packet [167:0] = { 56'h00000000000000,
                                                   afu_reg_cmd_pl,
                                                   afu_reg_cmd_endian,
                                                   afu_reg_cmd_afutag,
                                                   afu_reg_cmd_ea_or_obj[63:0],
                                                   afu_reg_cmd_stream_id,
                                                   afu_reg_cmd_actag,
                                                   afu_reg_cmd_flag,
                                                   afu_reg_cmd_opcode               };
                             num_cmd_data_segments = 2'b01;  // 1 data segment
                             cmd_slot_count_encode = 2'b10;  // 4 slots
                            end
            8'b01001xxx  :  begin                                                       // --> amo_w
                             cmd_packet [167:0] = { 56'h00000000000000,
                                                   afu_reg_cmd_pl,
                                                   afu_reg_cmd_endian,
                                                   afu_reg_cmd_afutag,
                                                   afu_reg_cmd_ea_or_obj[63:0],
                                                   afu_reg_cmd_stream_id,
                                                   afu_reg_cmd_actag,
                                                   afu_reg_cmd_flag,
                                                   afu_reg_cmd_opcode               };
                             num_cmd_data_segments = 2'b01;  // 1 data segment
                             cmd_slot_count_encode = 2'b10;  // 4 slots
                            end
            8'b01010000  :  begin                                                       // --> assign_actag
                             cmd_packet [167:0] = { 112'h0000000000000000000000000000,
                                                   afu_reg_cmd_pasid,
                                                   afu_reg_cmd_bdf,
                                                   afu_reg_cmd_actag,
                                                   afu_reg_cmd_opcode               };
                             num_cmd_data_segments = 2'b00;  // 0 data segments
                             cmd_slot_count_encode = 2'b01;  // 2 slots
                            end
            8'b0101100x  :  begin                                                       // --> intrp_req
                             cmd_packet [167:0] = { 60'h000000000000000,
                                                   afu_reg_cmd_afutag,
                                                   afu_reg_cmd_ea_or_obj[63:0],
                                                   afu_reg_cmd_stream_id,
                                                   afu_reg_cmd_actag,
                                                   afu_reg_cmd_flag,
                                                   afu_reg_cmd_opcode               };
                             num_cmd_data_segments = 2'b00;  // 0 data segments
                             cmd_slot_count_encode = 2'b10;  // 4 slots
                            end
            8'b0101101x  :  begin                                                       // --> intrp_req.d
                             cmd_packet [167:0] = { 56'h00000000000000,
                                                   afu_reg_cmd_pl,
                                                   1'b0,
                                                   afu_reg_cmd_afutag,
                                                   afu_reg_cmd_ea_or_obj[63:0],
                                                   afu_reg_cmd_stream_id,
                                                   afu_reg_cmd_actag,
                                                   afu_reg_cmd_flag,
                                                   afu_reg_cmd_opcode               };
                             num_cmd_data_segments = 2'b01;  // 1 data segment
                             cmd_slot_count_encode = 2'b10;  // 4 slots
                            end
            8'b0101110x  :  begin                                                       // --> wake_host_thread
                             cmd_packet [167:0] = { 56'h00000000000000,
                                                   afu_reg_cmd_ea_or_obj[67:64],
                                                   afu_reg_cmd_afutag,
                                                   afu_reg_cmd_ea_or_obj[63:0],
                                                   afu_reg_cmd_stream_id,
                                                   afu_reg_cmd_actag,
                                                   afu_reg_cmd_flag,
                                                   afu_reg_cmd_opcode               };
                             num_cmd_data_segments = 2'b00;  // 0 data segments
                             cmd_slot_count_encode = 2'b10;  // 4 slots
                            end
            8'b01111x00  :  begin                                                       // --> xlate_touch
                             cmd_packet [167:0] = { 60'h000000000000000,
                                                   afu_reg_cmd_afutag,
                                                   afu_reg_cmd_ea_or_obj[63:6],
                                                   afu_reg_cmd_pg_size,
                                                   afu_reg_cmd_stream_id,
                                                   afu_reg_cmd_actag,
                                                   afu_reg_cmd_flag,
                                                   afu_reg_cmd_opcode               };
                             num_cmd_data_segments = 2'b00;  // 0 data segments
                             cmd_slot_count_encode = 2'b10;  // 4 slots
                            end
            default      :  begin                                                       // --> invalid cmd
                             cmd_packet [167:0] = { 160'h0000000000000000000000000000000000000000,
                                                   afu_reg_cmd_opcode               };
                             num_cmd_data_segments = 2'b00;  // 0 data segments
                             cmd_slot_count_encode = 2'b00;  // 1 sLot
                            end
        endcase
                            cmd_packet [169:168]  =  num_cmd_data_segments ;  // "00"=0,  "01"=1,  "10"=2,  "11"=4
                            cmd_packet [171:170]  =  cmd_slot_count_encode ;  // "00"=1,  "01"=2,  "10"=4,  "11"=6
    end



    // ---------------
    // @@@ Packet Formation Registers
    // ---------------
    always @ (posedge clock) begin
        if      (!reset_n)              capt_cfg_packet <= 1'b0;
        else                            capt_cfg_packet <= capt_cfg_resp;
    end

    always @ (posedge clock) begin
        if      (!reset_n)              rsp_packet_reg  <= 59'h0;
        else if (afu_reg_resp_valid)    rsp_packet_reg  <= rsp_packet;  // Capture regular response packet
        else                            rsp_packet_reg  <= rsp_packet_reg;
//      if      (afu_reg_resp_valid)    rsp_packet_reg  <= rsp_packet;  // Capture regular response packet
//      else                            rsp_packet_reg  <= rsp_packet_reg;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              cfg_packet_reg  <= 59'h0;
        else if (capt_cfg_packet)       cfg_packet_reg  <= cfg_packet;  // Capture config response packet
        else                            cfg_packet_reg  <= cfg_packet_reg;
//      if      (capt_cfg_packet)       cfg_packet_reg  <= cfg_packet;  // Capture config response packet
//      else                            cfg_packet_reg  <= cfg_packet_reg;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              cmd_packet_reg  <= 172'h0;
        else if (afu_reg_cmd_valid)     cmd_packet_reg  <= cmd_packet;
        else                            cmd_packet_reg  <= cmd_packet_reg;
//      if      (afu_reg_cmd_valid)     cmd_packet_reg  <= cmd_packet;
//      else                            cmd_packet_reg  <= cmd_packet_reg;
    end


    // ---------------
    // @@@ FIFO Input Signals
    // ---------------

        // Form the data flit from Config Response interface
        // Align the 4B of data from ACS (AFU Config Space) into the proper position in the 64B flit
        // Form the return data at all times. The state machine will determine when to validate it.
        assign cfg_rdata_flit[ 31:  0] = (cfg_reg_rdata_offset == 4'b0000) ? cfg_reg_rdata_bus : 32'b0;
        assign cfg_rdata_flit[ 63: 32] = (cfg_reg_rdata_offset == 4'b0001) ? cfg_reg_rdata_bus : 32'b0;
        assign cfg_rdata_flit[ 95: 64] = (cfg_reg_rdata_offset == 4'b0010) ? cfg_reg_rdata_bus : 32'b0;
        assign cfg_rdata_flit[127: 96] = (cfg_reg_rdata_offset == 4'b0011) ? cfg_reg_rdata_bus : 32'b0;
        assign cfg_rdata_flit[159:128] = (cfg_reg_rdata_offset == 4'b0100) ? cfg_reg_rdata_bus : 32'b0;
        assign cfg_rdata_flit[191:160] = (cfg_reg_rdata_offset == 4'b0101) ? cfg_reg_rdata_bus : 32'b0;
        assign cfg_rdata_flit[223:192] = (cfg_reg_rdata_offset == 4'b0110) ? cfg_reg_rdata_bus : 32'b0;
        assign cfg_rdata_flit[255:224] = (cfg_reg_rdata_offset == 4'b0111) ? cfg_reg_rdata_bus : 32'b0;
        assign cfg_rdata_flit[287:256] = (cfg_reg_rdata_offset == 4'b1000) ? cfg_reg_rdata_bus : 32'b0;
        assign cfg_rdata_flit[319:288] = (cfg_reg_rdata_offset == 4'b1001) ? cfg_reg_rdata_bus : 32'b0;
        assign cfg_rdata_flit[351:320] = (cfg_reg_rdata_offset == 4'b1010) ? cfg_reg_rdata_bus : 32'b0;
        assign cfg_rdata_flit[383:352] = (cfg_reg_rdata_offset == 4'b1011) ? cfg_reg_rdata_bus : 32'b0;
        assign cfg_rdata_flit[415:384] = (cfg_reg_rdata_offset == 4'b1100) ? cfg_reg_rdata_bus : 32'b0;
        assign cfg_rdata_flit[447:416] = (cfg_reg_rdata_offset == 4'b1101) ? cfg_reg_rdata_bus : 32'b0;
        assign cfg_rdata_flit[479:448] = (cfg_reg_rdata_offset == 4'b1110) ? cfg_reg_rdata_bus : 32'b0;
        assign cfg_rdata_flit[511:480] = (cfg_reg_rdata_offset == 4'b1111) ? cfg_reg_rdata_bus : 32'b0;


        assign    vc0_fifo_input_bus   = (injct_cfg_rsp)      ? { cfg_packet_reg }                    :  { rsp_packet_reg } ;
        assign    vc3_fifo_input_bus   = { cmd_packet_reg };
        assign    dcp0_fifo_input_bus  = (injct_cfg_rsp_data) ? { 1'b1, cfg_reg_rdata_bdi, cfg_rdata_flit } : { 1'b0, rsp_bad_data_flag, rsp_data_input_reg } ;  // Select config resp data or regular resp data
        assign    dcp3_fifo_input_bus  = { cmd_bad_data_flag, cmd_data_input_reg } ;


    // ---------------
    // @@@ FIFOs
    // ---------------

    assign  rsp_fifo_wr_enable       =  rsp_valid_d1       ||  injct_cfg_rsp ;
    assign  rsp_data_fifo_wr_enable  =  rsp_data_valid_d1  ||  injct_cfg_rsp_data ;

    ocx_tlx_framer_rsp_fifo  vc0_fifo (
       .data_in             ( vc0_fifo_input_bus ) ,
       .wr_enable           ( rsp_fifo_wr_enable ) ,
       .data_out            ( vc0_fifo_output_data ) ,
       .rd_done             ( valid_rsp_leaving_fifo ) ,

       .data_available      ( vc0_rsp_available ) ,
       .valid_entry_count   ( vc0_valid_entry_count ) ,
       .underflow_error     ( vc0_underflow_error ) ,
       .overflow_error      ( vc0_overflow_error ) ,

       .clock               ( clock ) ,
       .reset_n             ( reset_n )
    );

    ocx_tlx_framer_cmd_fifo  vc3_fifo (
       .data_in             ( vc3_fifo_input_bus ) ,
       .wr_enable           ( cmd_valid_d1 ) ,
       .data_out            ( vc3_fifo_output_data ) ,
       .rd_done             ( valid_cmd_leaving_fifo ) ,
       .use_min_fifo_depth  ( 1'b0 ) ,

       .data_available      ( vc3_cmd_available ) ,
       .valid_entry_count   ( vc3_valid_entry_count ) ,
       .underflow_error     ( vc3_underflow_error ) ,
       .overflow_error      ( vc3_overflow_error ) ,

       .clock               ( clock ) ,
       .reset_n             ( reset_n )
    );

    ocx_tlx_514x16_fifo  dcp0_fifo (
       .data_in             ( dcp0_fifo_input_bus ) ,
       .wr_enable           ( rsp_data_fifo_wr_enable ) ,
       .data_out            ( dcp0_fifo_output_reg ) ,
       .rd_done             ( read_dcp0_done ) ,
       .use_min_fifo_depth  ( 1'b0 ) ,

       .data_look_ahead     ( dcp0_data_look_ahead ) ,
       .data_available      ( dcp0_data_available ) ,
       .underflow_error     ( dcp0_underflow_error ) ,
       .overflow_error      ( dcp0_overflow_error ) ,

       .clock               ( clock ) ,
       .reset_n             ( reset_n )
    );

    ocx_tlx_513x32_fifo  dcp3_fifo (
       .data_in             ( dcp3_fifo_input_bus ) ,
       .wr_enable           ( cmd_data_valid_d1 ) ,
       .data_out            ( dcp3_fifo_output_reg ) ,
       .rd_done             ( read_dcp3_done ) ,
       .use_min_fifo_depth  ( 1'b0 ) ,

       .data_look_ahead     ( dcp3_data_look_ahead ) ,
       .data_available      ( dcp3_data_available ) ,
       .underflow_error     ( dcp3_underflow_error ) ,
       .overflow_error      ( dcp3_overflow_error ) ,

       .clock               ( clock ) ,
       .reset_n             ( reset_n )
    );

    assign fifo_rsp_is_cfg_rsp    =  vc0_fifo_output_data[58] ;
    assign fifo_data_is_cfg_data  =  dcp0_fifo_output_reg[513] ;
    assign vc0_opcode_lookahead   =  vc0_fifo_output_data[7:0] ;
    assign vc3_opcode_lookahead   =  vc3_fifo_output_data[7:0] ;
    assign vc0_dsegs_lookahead    =  vc0_fifo_output_data[57:56] ;
    assign vc3_dsegs_lookahead    =  vc3_fifo_output_data[169:168] ;


    // ---------------
    // @@@ FIFO Output Registers
    // ---------------
    always @ (*) begin
        if (rsp_pipe_stall)      vc0_fifo_output_reg_din  =  vc0_fifo_output_reg  ;  // Rsp pipe is stalled.  Packer can't take rsp yet, so hold it here.
        else                     vc0_fifo_output_reg_din  =  vc0_fifo_output_data ;
        if (cmd_pipe_stall)      vc3_fifo_output_reg_din  =  vc3_fifo_output_reg  ;  // Cmd pipe is stalled.  Packer can't take cmd yet, so hold it here.
        else                     vc3_fifo_output_reg_din  =  vc3_fifo_output_data ;
    end
    always @ (posedge clock) begin
//        if      (!reset_n)     vc0_fifo_output_reg   <= 59'h0;
//        else                   vc0_fifo_output_reg   <= vc0_fifo_output_reg_din;
                               vc0_fifo_output_reg   <= vc0_fifo_output_reg_din;
    end
    always @ (posedge clock) begin
//        if      (!reset_n)     vc3_fifo_output_reg   <= 172'h0;
//        else                   vc3_fifo_output_reg   <= vc3_fifo_output_reg_din;
                               vc3_fifo_output_reg   <= vc3_fifo_output_reg_din;
    end

    // Read the data segment encode from the FIFOs.   // "00"=0,  "01"=1,  "10"=2,  "11"=4
    assign rdsege = vc0_fifo_output_reg[57:56] ;
    assign cdsege = vc3_fifo_output_reg[169:168] ;
    // See if the cmd exiting the FIFO is a 6-slot cmd.
    always @ (*) begin
        if (vc3_fifo_output_reg[171:170] == 2'b11)  six_slot_cmd = 1'b1;
        else                                        six_slot_cmd = 1'b0;
    end


    // ---------------
    // @@@ Control Flit Formation Registers
    // ---------------
    always @ (posedge clock) begin
//        if      (!reset_n)              rsp_cntl_flit_reg  <= 512'h0;
//        else                            rsp_cntl_flit_reg  <= rsp_cntl_flit_reg_din;    // See control logic below
                                        rsp_cntl_flit_reg  <= rsp_cntl_flit_reg_din;    // See control logic below
    end
    always @ (posedge clock) begin
//        if      (!reset_n)              cmd_cntl_flit_reg  <= 512'h0;
//        else                            cmd_cntl_flit_reg  <= cmd_cntl_flit_reg_din;    // See control logic below
                                        cmd_cntl_flit_reg  <= cmd_cntl_flit_reg_din;    // See control logic below
    end



    // ---------------
    // @@@ Output Flit MUX
    // ---------------
    always @ (*) begin
        case  ( framer_state )
          SEND_NOTHING      :       output_flit_reg_din  =  output_flit_reg;    // No new flit.  Keep same data.
          SEND_RSP_CFLIT    :       output_flit_reg_din  =  { rsp_cntl_flit_reg[511:460], bad_data_flit_vector, frame_run_length, rsp_cntl_flit_reg[447:0] };
          SEND_CMD_CFLIT    :       output_flit_reg_din  =  { cmd_cntl_flit_reg[511:460], bad_data_flit_vector, frame_run_length, cmd_cntl_flit_reg[447:0] };
          SEND_BE_CFLIT     :  begin                                                             // --- NULL CMD FLIT ---
                                     output_flit_reg_din[ 55:  0]  =   56'h0 ;                   // Pack slots 0,1 with zeros
                                     output_flit_reg_din[111: 56]  =   56'h0 ;                   // Pack slots 2,3 with zeros
                                     output_flit_reg_din[279:112]  =  168'h0 ;                   // Pack slots 4-9 with no op
                                     output_flit_reg_din[447:280]  =  168'h0 ;                   // Pack slots 10-15 with zeros
                                     output_flit_reg_din[451:448]  =  frame_run_length ;         // Set DataRunLength for the next frame
                                     output_flit_reg_din[459:452]  =  bad_data_flit_vector ;     // Set BadDataFlit indicators
                                     output_flit_reg_din[465:460]  =    6'b000000 ;              // Set TLTemplate indicator to x00
                                     output_flit_reg_din[511:466]  =   46'h0 ;                   // Set DLSpecified content with zeros
                                end
          SEND_DATA_FLIT    :        output_flit_reg_din  =  send_cmd_dflit ? dcp3_fifo_output_reg[511:0] : dcp0_fifo_output_reg[511:0];

          default           :        output_flit_reg_din  =  output_flit_reg;    // No new flit.  Keep same data.
        endcase
    end


    // ---------------
    // @@@ Output Flit Register
    // ---------------
    always @ (posedge clock) begin
//        if      (!reset_n)              output_flit_reg  <= 512'h0;
//        else                            output_flit_reg  <= output_flit_reg_din;
                                        output_flit_reg  <= output_flit_reg_din;
    end


    // ---------------
    // @@@ Handshaking with DLX
    // ---------------
    assign   tlx_dlx_flit_valid          =   send_flit_now;
    assign   tlx_dlx_flit                =   output_flit_reg[511:0];





// ==============================================================================================================================
// @@@ Control Logic
// ==============================================================================================================================


    // ---------------
    // @@@ Power-On Reset Logic
    // ---------------
    // This logic generates a 1-cycle pulse right after the clocks start at the beginning of time, or one cycle after a reset_n event.
    always @ (posedge clock) begin
                                        por_on   <= reset_n;
    end
    always @ (posedge clock) begin
        if      (!reset_n)              por_off  <= 1'b0;
        else                            por_off  <= por_on ;  // Delay por_on by one cycle.
    end
    assign power_on_reset  =  por_on  &&  !por_off;

    // Flag to indicate that AFU is alive and has started talking.
    always @ (posedge clock) begin
        if      (!reset_n)                                  afu_has_started_talking   <=  1'b0;
        else if (afu_tlx_cmd_valid || afu_tlx_resp_valid)   afu_has_started_talking   <=  1'b1 ;
        else                                                afu_has_started_talking   <=  afu_has_started_talking ;
    end


    // ---------------
    // @@@ Control Interleaving of Config Responses and Regular Responses
    // ---------------

    // The interleaving of configuration responses works like this:
    //
    // If there is a configuration response waiting to be sent,
    // this state machine inserts the configuration response when there is a gap in the regular response stream.
    // Then the state machine waits until the single config response has gone through the FIFO before sending the ACK to the AFU.
    // So there should never be more than one config response in the FIFO at a time.
    // And there should never be more than one config reseponse data in the response data FIFO.
    //
    // In order to avoid overflowing the TLX Framer FIFOs, not all of the reponse credits are given to the AFU.
    // One reseponse credit and one response data credit are reserved for use by configuration responses.
    // So configuration responses should be able to fit into the TLX Framer FIFOs without overflowing.
    // However, only one configuration response is allowed at a time (because only one credit is reserved for config reponses).

    always @ (posedge clock) begin
        if      (!reset_n)               cfg_packet_ready     <= 1'b0             ;
        else if (capt_cfg_packet)        cfg_packet_ready     <= 1'b1             ;  // set to one whenever cfg packet is ready to be injected
        else if (injct_cfg_rsp)          cfg_packet_ready     <= 1'b0             ;  // set to zero when cfg packet is injected into fifos.
        else                             cfg_packet_ready     <= cfg_packet_ready ;  // remember state
    end
    assign   space_in_rsp_stream       =  !rsp_valid_d1      ;  // There will not be a regular response at the FIFO input next cycle.
    assign   space_in_rsp_data_stream  =  !rsp_data_valid_d1 ;  // There will not be any regular response data at the FIFO input next cycle.
    assign   cfg_rsp_leaves_fifo       =  valid_rsp_leaving_fifo  &&  fifo_rsp_is_cfg_rsp ;    // Current response on FIFO output is a config response
    assign   cfg_data_leaves_fifo      =  read_dcp0_done          &&  fifo_data_is_cfg_data ;  // Current response data on FIFO output is a config response data

    // Next state logic
    always @ (*) begin
        case ( cfg_injector_state )
          CFG_IDLE : begin
                      if      ( cfg_packet_ready && (cfg_packet_reg[57:56] == 2'b00) )  cfg_injector_next_state = CFG_NODATA_RDY     ;   //
                      else if ( cfg_packet_ready && (cfg_packet_reg[57:56] >  2'b00) )  cfg_injector_next_state = CFG_W_DATA_RDY     ;   //
                      else                                                              cfg_injector_next_state = CFG_IDLE           ;   //
                    end
          CFG_NODATA_RDY : begin
                      if      ( space_in_rsp_stream )                                   cfg_injector_next_state = CFG_NODATA_IN_FIFO ;   //
                      else                                                              cfg_injector_next_state = CFG_NODATA_RDY     ;   //
                    end
          CFG_NODATA_IN_FIFO : begin
                      if      ( cfg_rsp_leaves_fifo )                                   cfg_injector_next_state = CFG_IDLE           ;   //
                      else                                                              cfg_injector_next_state = CFG_NODATA_IN_FIFO ;   //
                    end
          CFG_W_DATA_RDY : begin
                      if      ( space_in_rsp_stream  &&  space_in_rsp_data_stream )     cfg_injector_next_state = CFG_W_DATA_IN_FIFO ;   //
                      else                                                              cfg_injector_next_state = CFG_W_DATA_RDY     ;   //
                    end
          CFG_W_DATA_IN_FIFO : begin
                      if      ( cfg_data_leaves_fifo )                                  cfg_injector_next_state = CFG_IDLE           ;   //
                      else                                                              cfg_injector_next_state = CFG_W_DATA_IN_FIFO ;   //
                    end

          default :                                                                     cfg_injector_next_state = CFG_IDLE           ;   //
        endcase

    end
    // State register
    always @ (posedge clock) begin
        if    (!reset_n)  cfg_injector_state     <= CFG_IDLE   ;
        else              cfg_injector_state     <= cfg_injector_next_state;
    end

    // Insert a config response if there is one waiting to go, and it has not already been sent, and no regular responses are going right now.
    assign   injct_cfg_rsp       =   ( (cfg_injector_state == CFG_NODATA_RDY)  &&  (cfg_injector_next_state == CFG_NODATA_IN_FIFO) ) ||
                                     ( (cfg_injector_state == CFG_W_DATA_RDY)  &&  (cfg_injector_next_state == CFG_W_DATA_IN_FIFO) ) ;
    assign   injct_cfg_rsp_data  =   ( (cfg_injector_state == CFG_W_DATA_RDY)  &&  (cfg_injector_next_state == CFG_W_DATA_IN_FIFO) ) ;

    assign   tlx_cfg_resp_ack    =   ( (cfg_injector_state == CFG_NODATA_RDY)  &&  (cfg_injector_next_state == CFG_NODATA_IN_FIFO) ) ||
                                     ( (cfg_injector_state == CFG_W_DATA_RDY)  &&  (cfg_injector_next_state == CFG_W_DATA_IN_FIFO) ) ;



    // Force a break in the regular response stream by draining the response credits to the AFU.
    // Count the cycles while a config response is waiting to go.
    always @ (posedge clock) begin
        if      (!reset_n)                      cfg_wait_time   <=  8'h00;
        else if (!cfg_tlx_resp_valid)           cfg_wait_time   <=  8'h00;                               // There is no config resp waiting.  Reset the counter
        else if (cfg_wait_time == 8'b11111111)  cfg_wait_time   <=  cfg_wait_time ;                  // The counter is full.  Do not wrap.
        else                                    cfg_wait_time   <=  cfg_wait_time + 8'b00000001;     // Increment the counter.
    end
    assign  cfg_is_tired_of_waiting  =  (cfg_wait_time >= cfg_wait_threshold) ?  1'b1  :  1'b0 ;


    // Return response credits to AFU
    // latch timing-critical path that credit return signal.
    always @ (posedge clock) begin
        if      (!reset_n)   rsp_credit_return  <=  1'b0;
        else                 rsp_credit_return  <=  valid_rsp_leaving_fifo  &&  !fifo_rsp_is_cfg_rsp ; // Don't return credit if this is a config response ;
    end

    // Either send the credit back directly, or put it onto the resp credit stack if a config response needs to break in.
    always @ (*) begin
       if      ( !rsp_credit_return  &&  !cfg_is_tired_of_waiting )  begin  rsp_credit_direct_return = 1'b0;   put_rsp_credit_onto_stack = 1'b0;  end 
       else if ( !rsp_credit_return  &&   cfg_is_tired_of_waiting )  begin  rsp_credit_direct_return = 1'b0;   put_rsp_credit_onto_stack = 1'b0;  end 
       else if (  rsp_credit_return  &&  !cfg_is_tired_of_waiting )  begin  rsp_credit_direct_return = 1'b1;   put_rsp_credit_onto_stack = 1'b0;  end 
       else                                                          begin  rsp_credit_direct_return = 1'b0;   put_rsp_credit_onto_stack = 1'b1;  end 
    end

    // Response Credit Stack.  (Counter of reponse credits waiting to go back to the AFU.)  (Should never be > 7 in current implementation.)
    always @ (posedge clock) begin
        if      ( !reset_n )                                                     rsp_credit_stack   <=  4'b0000;                      // Initialize the credit stack to 0
        else if ( !put_rsp_credit_onto_stack  &&  !take_rsp_credit_off_stack )   rsp_credit_stack   <=  rsp_credit_stack ;            // No change
        else if ( !put_rsp_credit_onto_stack  &&   take_rsp_credit_off_stack )   rsp_credit_stack   <=  rsp_credit_stack - 4'b0001 ;  // Decrement stack
        else if (  put_rsp_credit_onto_stack  &&  !take_rsp_credit_off_stack )   rsp_credit_stack   <=  rsp_credit_stack + 4'b0001 ;  // Increment stack
        else                                                                     rsp_credit_stack   <=  rsp_credit_stack ;            // No change
    end

    // Take one off the stack if stack is not empty and there is no direct return, and no config response needs to break in.
    assign   take_rsp_credit_off_stack  =   (rsp_credit_stack > 4'b0000)  &&  !rsp_credit_direct_return  &&  !cfg_is_tired_of_waiting  &&  afu_has_started_talking ; 

    // Send response credits back to AFU
    assign    tlx_afu_resp_credit  =  rsp_credit_direct_return  ||  take_rsp_credit_off_stack ;



    // ---------------
    // @@@ Best Template Logic
    // ---------------
    // Latch the incoming config signals.
    always @ (posedge clock) begin
        if (!reset_n) begin
            template00_supported  <= 1'b0;
            template01_supported  <= 1'b0;
            template02_supported  <= 1'b0;
            template03_supported  <= 1'b0;
            template00_flit_rate  <= 4'h0;
            template01_flit_rate  <= 4'h0;
            template02_flit_rate  <= 4'h0;
            template03_flit_rate  <= 4'h0;
        end
        else begin
            template00_supported  <= cfg_tlx_xmit_tmpl_config_0 ;  // template00 must be supported.  So it can be assumed.  Input will be ignored
            template01_supported  <= cfg_tlx_xmit_tmpl_config_1 ;
            template02_supported  <= cfg_tlx_xmit_tmpl_config_2 ;  // This reference design does not support template 02.  Input will be ignored
            template03_supported  <= cfg_tlx_xmit_tmpl_config_3 ;
            template00_flit_rate  <= cfg_tlx_xmit_rate_config_0 ;
            template01_flit_rate  <= cfg_tlx_xmit_rate_config_1 ;
            template02_flit_rate  <= cfg_tlx_xmit_rate_config_2 ;  // This reference design does not support template 02.  Input will be ignored
            template03_flit_rate  <= cfg_tlx_xmit_rate_config_3 ;
        end
    end
    always @ (*) begin
       if      (template01_supported)  best_tmpl_din = 2'b01 ;
       else if (template03_supported)  best_tmpl_din = 2'b11 ;
       else                            best_tmpl_din = 2'b00 ;
    end

    always @ (posedge clock) begin
        if    (!reset_n)  best_tmpl  <= 2'b00; 
        else              best_tmpl  <= best_tmpl_din;
    end


    // ---------------
    // @@@ TLX Credit Counters
    // ---------------
    // Decrement these counters when a cmd or response which required credits is captured in the fifo output register.
    // Use cmd and resp fifo lookahead data to calculate how many data credits will be required.
    // Decode the number of data segments of immediate data.   // "00"=0,  "01"=1,  "10"=2,  "11"=4
    always @ (*) begin
        if      (vc0_dsegs_lookahead == 2'b00)  rdsegs = 3'b000 ;
        else if (vc0_dsegs_lookahead == 2'b01)  rdsegs = 3'b001 ;
        else if (vc0_dsegs_lookahead == 2'b10)  rdsegs = 3'b010 ;
        else                                    rdsegs = 3'b100 ;
    end
    always @ (*) begin
        if      (vc3_dsegs_lookahead == 2'b00)  cdsegs = 3'b000 ;
        else if (vc3_dsegs_lookahead == 2'b01)  cdsegs = 3'b001 ;
        else if (vc3_dsegs_lookahead == 2'b10)  cdsegs = 3'b010 ;
        else                                    cdsegs = 3'b100 ;
    end

    // Note - the logic paths used to generate the rsp_pipe_stall and cmd_pipe_stall signals are quite long, so in order to meet timing constraints, these TLX credit counters do the following:
    // The pipe stall signals will be latched, then
    // Instead of decrementing the count only when the really credit is used,
    // these counters will speculatively decrement the counters every time a valid rsp or cmd which needs credits is ready.
    // And then if the pipe was stalled, the counters will add back, in the next cycle, the credits that were not actually used.
    // and then add back, in the next cycle, any credits that were not actually used.
    // This behavior will prevent the TLX from using any credits it does not really have.
    // Latch the xxx_pipe_stall signals
    always @ (posedge clock) begin
        if      (!reset_n)  rsp_pipe_was_stalled   <= 1'b0;
        else                rsp_pipe_was_stalled   <= rsp_pipe_stall;
        if      (!reset_n)  cmd_pipe_was_stalled   <= 1'b0;
        else                cmd_pipe_was_stalled   <= cmd_pipe_stall;
    end
    // Remember how many data credits to add back
    always @ (posedge clock) begin
        if      (!reset_n)  rdsegs_add_back   <= 3'b000;
        else                rdsegs_add_back   <= rdsegs;
        if      (!reset_n)  cdsegs_add_back   <= 3'b000;
        else                cdsegs_add_back   <= cdsegs;
    end

    // See if there are enough DCP credits for the cmd/response coming out of the FIFOs.  (Use MUX form of logic because data from fifo is on long path.)
    assign  there_are_enough_dcp0_credits  =   (vc0_dsegs_lookahead == 2'b00)  ?  (dcp0_tlxcrd_counter >= 16'h0000)  :   // 0 DCP credits needed
                                               (vc0_dsegs_lookahead == 2'b01)  ?  (dcp0_tlxcrd_counter >= 16'h0001)  :   // 1 DCP credit needed
                                               (vc0_dsegs_lookahead == 2'b10)  ?  (dcp0_tlxcrd_counter >= 16'h0002)  :   // 2 DCP credits needed
                                                                                  (dcp0_tlxcrd_counter >= 16'h0004)  ;   // 4 DCP credits needed
    assign  there_are_enough_dcp3_credits  =   (vc3_dsegs_lookahead == 2'b00)  ?  (dcp3_tlxcrd_counter >= 16'h0000)  :   // 0 DCP credits needed
                                               (vc3_dsegs_lookahead == 2'b01)  ?  (dcp3_tlxcrd_counter >= 16'h0001)  :   // 1 DCP credit needed
                                               (vc3_dsegs_lookahead == 2'b10)  ?  (dcp3_tlxcrd_counter >= 16'h0002)  :   // 2 DCP credits needed
                                                                                  (dcp3_tlxcrd_counter >= 16'h0004)  ;   // 4 DCP credits needed

    // Speculatively use a TLX credit whenever a valid rsp or cmd which needs credits is ready.
    // A VC0 TLX credit may be used if there is a response ready which is not a NOP, and if there is credit to use.
    // A VC3 TLX credit may be used if there is a command ready which is not a NOP, and if there is credit to use.
    assign  spec_use_rsp_credit  =  vc0_rsp_available  &&  (vc0_opcode_lookahead != 8'h00)  &&  (vc0_tlxcrd_counter > 16'h0000) && there_are_enough_dcp0_credits ;
    assign  spec_use_cmd_credit  =  vc3_cmd_available  &&  (vc3_opcode_lookahead != 8'h00)  &&  (vc3_tlxcrd_counter > 16'h0000) && there_are_enough_dcp3_credits ;

    // Remember whether or not speculative credit were indeed used last cycle (so they can be added back if not really used).
    always @ (posedge clock) begin
        if      (!reset_n)  spec_rsp_credit_was_borrowed   <= 1'b0;
        else                spec_rsp_credit_was_borrowed   <= spec_use_rsp_credit;
        if      (!reset_n)  spec_cmd_credit_was_borrowed   <= 1'b0;
        else                spec_cmd_credit_was_borrowed   <= spec_use_cmd_credit;
    end

    // Get new credits, if any, from TL
    assign  new_vc0_tlxcrd   =  (rcv_xmt_tlx_credit_valid) ? rcv_xmt_tlx_credit_vc0   :  4'h0 ;
    assign  new_vc3_tlxcrd   =  (rcv_xmt_tlx_credit_valid) ? rcv_xmt_tlx_credit_vc3   :  4'h0 ;
    assign  new_dcp0_tlxcrd  =  (rcv_xmt_tlx_credit_valid) ? rcv_xmt_tlx_credit_dcp0  :  6'h0 ;
    assign  new_dcp3_tlxcrd  =  (rcv_xmt_tlx_credit_valid) ? rcv_xmt_tlx_credit_dcp3  :  6'h0 ;


    // The TLX Credit counters

    // --- VCO ---
    assign vc0_tlxcrd_delta = ((!rsp_pipe_was_stalled || !spec_rsp_credit_was_borrowed) && spec_use_rsp_credit) ? {1'b0, new_vc0_tlxcrd} - 5'b00001 :  // No need to add back for last cycle.  Subtract one for this cycle (-1)
                              (!rsp_pipe_was_stalled || !spec_rsp_credit_was_borrowed)                          ? {1'b0, new_vc0_tlxcrd}            :  // No need to add back for last cycle.  No change for this cycle    (NC)
                              (spec_use_rsp_credit)                                                             ? {1'b0, new_vc0_tlxcrd}            :  // Not used last cycle. Add one back.  Subtract one for this cycle.  No change (NC)
                                                                                                                  {1'b0, new_vc0_tlxcrd} + 5'b00001 ;  // Not used last cycle. Add one back.  No change for this cycle                (+1)

    assign vc0_tlxcrd_counter_nxt = (vc0_tlxcrd_delta == 5'b11111)  ?  vc0_tlxcrd_counter - 16'b0000000000000001      :  // Delta value is negative one
                                                                       vc0_tlxcrd_counter + {11'b0, vc0_tlxcrd_delta} ;  // Change the counter by delta amount

//    assign vc0_tlxcrd_counter_nxt = (vc0_tlxcrd_overflow_err)       ?  16'b1111111111111111                           :  // Overflow, set to max count (MAX)
//                                    (vc0_tlxcrd_delta == 5'b11111)  ?  vc0_tlxcrd_counter - 16'b0000000000000001      :  // Delta value is negative one
//                                                                       vc0_tlxcrd_counter + {11'b0, vc0_tlxcrd_delta} ;  // Change the counter by delta amount
//
//    assign vc0_tlxcrd_temp1 = vc0_tlxcrd_counter + new_vc0_tlxcrd;                 // No change + new credits, if any (NC)
//    assign vc0_tlxcrd_temp2 = vc0_tlxcrd_counter + new_vc0_tlxcrd + 16'h0001;      // + 1       + new credits, if any (+1)
//    assign vc0_tlxcrd_temp3 = vc0_tlxcrd_counter + new_vc0_tlxcrd - 16'h0001;      // - 1       + new credits, if any (-1)
//    assign vc0_tlxcrd_temp4 = 16'b1111111111111111;                                // Counter is at max               (MAX)
//    always @ (*) begin
//      if (vc0_tlxcrd_overflow_err)                                     vc0_tlxcrd_counter_nxt = vc0_tlxcrd_temp4;  // Overflow, set to max count (MAX)
//      else if (!rsp_pipe_was_stalled || !spec_rsp_credit_was_borrowed)
//        if    (spec_use_rsp_credit)                                    vc0_tlxcrd_counter_nxt = vc0_tlxcrd_temp3;  // No need to add back for last cycle.  Subtract one for this cycle (-1)
//        else                                                           vc0_tlxcrd_counter_nxt = vc0_tlxcrd_temp1;  // No need to add back for last cycle.  No change for this cycle    (NC)
//      else                                                                                                         // The pipe stalled previous cycle, so credits were not actually used.  Add them back.
//        if    (spec_use_rsp_credit)                                    vc0_tlxcrd_counter_nxt = vc0_tlxcrd_temp1;  // Add one for last cycle.  Subtract one for this cycle.  No change (NC)
//        else                                                           vc0_tlxcrd_counter_nxt = vc0_tlxcrd_temp2;  // Add one for last chcle.  No change for this cycle                (+1)
//    end
    always @ (posedge clock) begin
        if      (!reset_n)              vc0_tlxcrd_counter  <= 16'h0000;
        else                            vc0_tlxcrd_counter  <= vc0_tlxcrd_counter_nxt;
    end
    // Detect and report counter overflow
    // Use a sticky register to capture overflow error to hold the error until it is cleared.
    always @ (*) begin
        if  (clear_sticky_debug_info)                                                              vc0_tlxcrd_overflow_err_din  =   1'b0  ;  // Clear the error
        else if ((vc0_tlxcrd_counter[15:12] == 4'b1111) && (vc0_tlxcrd_counter_nxt[15] == 1'b0))   vc0_tlxcrd_overflow_err_din  =   1'b1  ;  // Set the error
        else                                                                                       vc0_tlxcrd_overflow_err_din  =   vc0_tlxcrd_overflow_err ;  // Remember error
    end
    always @ (posedge clock) begin
        if    (!reset_n)  vc0_tlxcrd_overflow_err   <=  1'b0;
        else              vc0_tlxcrd_overflow_err   <=  vc0_tlxcrd_overflow_err_din ;
    end


    // --- VC3 ---
    assign vc3_tlxcrd_delta = ((!cmd_pipe_was_stalled || !spec_cmd_credit_was_borrowed) && spec_use_cmd_credit) ? {1'b0, new_vc3_tlxcrd} - 5'b00001 :  // No need to add back for last cycle.  Subtract one for this cycle (-1)
                              (!cmd_pipe_was_stalled || !spec_cmd_credit_was_borrowed)                          ? {1'b0, new_vc3_tlxcrd}            :  // No need to add back for last cycle.  No change for this cycle    (NC)
                              (spec_use_cmd_credit)                                                             ? {1'b0, new_vc3_tlxcrd}            :  // Not used last cycle. Add one back.  Subtract one for this cycle.  No change (NC)
                                                                                                                  {1'b0, new_vc3_tlxcrd} + 5'b00001 ;  // Not used last cycle. Add one back.  No change for this cycle                (+1)

    assign vc3_tlxcrd_counter_nxt = (vc3_tlxcrd_delta == 5'b11111)  ?  vc3_tlxcrd_counter - 16'b0000000000000001      :  // Delta value is negative one
                                                                       vc3_tlxcrd_counter + {11'b0, vc3_tlxcrd_delta} ;  // Change the counter by delta amount

//    assign vc3_tlxcrd_counter_nxt = (vc3_tlxcrd_overflow_err)       ?  16'b1111111111111111                           :  // Overflow, set to max count (MAX)
//                                    (vc3_tlxcrd_delta == 5'b11111)  ?  vc3_tlxcrd_counter - 16'b0000000000000001      :  // Delta value is negative one
//                                                                       vc3_tlxcrd_counter + {11'b0, vc3_tlxcrd_delta} ;  // Change the counter by delta amount

//    assign vc3_tlxcrd_temp1 = vc3_tlxcrd_counter + new_vc3_tlxcrd;                 // No change + new credits, if any (NC)
//    assign vc3_tlxcrd_temp2 = vc3_tlxcrd_counter + new_vc3_tlxcrd + 16'h0001;      // + 1       + new credits, if any (+1)
//    assign vc3_tlxcrd_temp3 = vc3_tlxcrd_counter + new_vc3_tlxcrd - 16'h0001;      // - 1       + new credits, if any (-1)
//    assign vc3_tlxcrd_temp4 = 16'b1111111111111111;                                // Counter is at max               (MAX)
//    always @ (*) begin
//      if (vc3_tlxcrd_overflow_err)                                     vc3_tlxcrd_counter_nxt = vc3_tlxcrd_temp4;  // Overflow, set to max count (MAX)
//      else if (!cmd_pipe_was_stalled || !spec_cmd_credit_was_borrowed)
//        if    (spec_use_cmd_credit)                                    vc3_tlxcrd_counter_nxt = vc3_tlxcrd_temp3;  // No need to add back for last cycle.  Subtract one for this cycle (-1)
//        else                                                           vc3_tlxcrd_counter_nxt = vc3_tlxcrd_temp1;  // No need to add back for last cycle.  No change for this cycle    (NC)
//      else                                                                                                         // The pipe stalled previous cycle, so credits were not actually used.  Add them back.
//        if    (spec_use_cmd_credit)                                    vc3_tlxcrd_counter_nxt = vc3_tlxcrd_temp1;  // Add one for last cycle.  Subtract one for this cycle.  No change (NC)
//        else                                                           vc3_tlxcrd_counter_nxt = vc3_tlxcrd_temp2;  // Add one for last chcle.  No change for this cycle                (+1)
//    end
    always @ (posedge clock) begin
        if      (!reset_n)              vc3_tlxcrd_counter  <= 16'h0000;
        else                            vc3_tlxcrd_counter  <= vc3_tlxcrd_counter_nxt;
    end
    // Detect and report counter overflow
    // Use a sticky register to capture overflow error.
    // This is a sticky register, it holds its value until it is cleared.
    always @ (*) begin
        if  (clear_sticky_debug_info)                                                              vc3_tlxcrd_overflow_err_din  =   1'b0  ;  // Clear the error
        else if ((vc3_tlxcrd_counter[15:12] == 4'b1111) && (vc3_tlxcrd_counter_nxt[15] == 1'b0))   vc3_tlxcrd_overflow_err_din  =   1'b1  ;  // Set the error
        else                                                                                       vc3_tlxcrd_overflow_err_din  =   vc3_tlxcrd_overflow_err ;  // Remember error
    end
    always @ (posedge clock) begin
        if    (!reset_n)  vc3_tlxcrd_overflow_err   <=  1'b0;
        else              vc3_tlxcrd_overflow_err   <=  vc3_tlxcrd_overflow_err_din ;
    end





    // --- DCP0 ---

//    // Option 1 - Using 16-bit adders and subtractor.
//    assign  dcp0_tlxcrd_counter_nxt = (dcp0_tlxcrd_overflow_err) ? 16'b1111111111111111                             :  // Overflow, set to max count (MAX)
//                                                                   dcp0_tlxcrd_counter + {10'h0, new_dcp0_tlxcrd} + {10'h0, dcp0_tlxcrd_addback} - {13'h0, dcp0_tlxcrd_borrow} ;  // Add the delta to the counter



    // Option 2 - Using smaller adders where possible and using 2s compliment addition for subtractor
    assign  dcp0_tlxcrd_addback = (rsp_pipe_was_stalled && spec_rsp_credit_was_borrowed)  ?  {3'h0, rdsegs_add_back}  :  // If credit was borrowed but not spent, add it back (0, 1, 2, or 4 credits)
                                                                                             6'h0                     ;  // Otherwise don't add any back.
    assign  dcp0_tlxcrd_adder  =  {1'b0, new_dcp0_tlxcrd}  +  {1'b0, dcp0_tlxcrd_addback}                             ;  // 7-bit adder, 7-bit positive integer result


    assign  dcp0_tlxcrd_borrow  = (spec_use_rsp_credit)                                   ?  rdsegs                   :  // If needed, borrow enough data credits for next response (0, 1, 2, or 4 credits)
                                                                                             3'h0                     ;  // Otherwise don't borrow any.
    assign  dcp0_tlxcrd_borrow2c =  {1'b0,~dcp0_tlxcrd_borrow}  +  4'b0001                                            ;  // 2's compliment of borrow.  4 bit result.  If msb is 1 then borrow was zero, no need to use it.
    assign  dcp0_tlxcrd_subtractor =  (dcp0_tlxcrd_borrow2c[3])  ?  8'h0  :  {5'b11111,dcp0_tlxcrd_borrow2c[2:0]}     ;  // Pad 2's compliment with ones if it is negative.

    assign  dcp0_tlxcrd_delta  =  {1'b0, dcp0_tlxcrd_adder}  +  dcp0_tlxcrd_subtractor                                ;  // 8-bit adder, 8-bit result. If msb=1 then other bits are positive, so pad them with 0s.   Else pad with 1's
    assign  dcp0_tlxcrd_delta_pad  =  (~dcp0_tlxcrd_delta[7])  ?   {9'b000000000, dcp0_tlxcrd_delta[6:0] }            :  // Delta is positive, so pad it with zeros.
                                                                   {9'b111111111, dcp0_tlxcrd_delta[6:0] }            ;  // Delta is negative (in 2's compliment) so pad it with ones.

    assign  dcp0_tlxcrd_counter_nxt  =                                 dcp0_tlxcrd_counter +  dcp0_tlxcrd_delta_pad   ;  // Add the delta to the counter

//    assign  dcp0_tlxcrd_counter_nxt  =  (dcp0_tlxcrd_overflow_err)  ?  16'b1111111111111111                           :  // Overflow, set to max count (MAX)
//                                                                       dcp0_tlxcrd_counter +  dcp0_tlxcrd_delta_pad   ;  // Add the delta to the counter



//  // Option 3 - Using parallel 16-bit adders/subtractors and using mux to select the correct one.
//  assign dcp0_tlxcrd_temp_nc  = dcp0_tlxcrd_counter + {10'h0, new_dcp0_tlxcrd};                                // No change + new credits, if any (NC)
//  assign dcp0_tlxcrd_temp_p1  = dcp0_tlxcrd_counter + {10'h0, new_dcp0_tlxcrd} + {16'b0000000000000001} ;      // + 1       + new credits, if any (+1)
//  assign dcp0_tlxcrd_temp_p2  = dcp0_tlxcrd_counter + {10'h0, new_dcp0_tlxcrd} + {16'b0000000000000010} ;      // + 2       + new credits, if any (+2)
//  assign dcp0_tlxcrd_temp_p3  = dcp0_tlxcrd_counter + {10'h0, new_dcp0_tlxcrd} + {16'b0000000000000011} ;      // + 3       + new credits, if any (+3)
//  assign dcp0_tlxcrd_temp_p4  = dcp0_tlxcrd_counter + {10'h0, new_dcp0_tlxcrd} + {16'b0000000000000100} ;      // + 4       + new credits, if any (+4)
//  assign dcp0_tlxcrd_temp_m1  = dcp0_tlxcrd_counter + {10'h0, new_dcp0_tlxcrd} - {16'b0000000000000001} ;      // - 1       + new credits, if any (-1)
//  assign dcp0_tlxcrd_temp_m2  = dcp0_tlxcrd_counter + {10'h0, new_dcp0_tlxcrd} - {16'b0000000000000010} ;      // - 2       + new credits, if any (-2)
//  assign dcp0_tlxcrd_temp_m3  = dcp0_tlxcrd_counter + {10'h0, new_dcp0_tlxcrd} - {16'b0000000000000011} ;      // - 3       + new credits, if any (-3)
//  assign dcp0_tlxcrd_temp_m4  = dcp0_tlxcrd_counter + {10'h0, new_dcp0_tlxcrd} - {16'b0000000000000100} ;      // - 4       + new credits, if any (-4)
//  assign dcp0_tlxcrd_temp_max = 16'b1111111111111111;                                                 // Counter is at max               (MAX)
//  always @ (*) begin
//    case (vc0_dsegs_lookahead)  // Determine how many DCP credits to borrow for this cycle
//      2'b00   :   dcp0_tlxcrd_temp_borrow = dcp0_tlxcrd_temp_nc;
//      2'b01   :   dcp0_tlxcrd_temp_borrow = dcp0_tlxcrd_temp_m1;
//      2'b10   :   dcp0_tlxcrd_temp_borrow = dcp0_tlxcrd_temp_m2;
//      default :   dcp0_tlxcrd_temp_borrow = dcp0_tlxcrd_temp_m4;
//    endcase
//    case (rdsegs_add_back)  // Determine how many DCP credits to add back from previous cycle
//      3'b000  :   dcp0_tlxcrd_temp_addback = dcp0_tlxcrd_temp_nc;
//      3'b001  :   dcp0_tlxcrd_temp_addback = dcp0_tlxcrd_temp_p1;
//      3'b010  :   dcp0_tlxcrd_temp_addback = dcp0_tlxcrd_temp_p2;
//      default :   dcp0_tlxcrd_temp_addback = dcp0_tlxcrd_temp_p4;
//    endcase
//    case (vc0_dsegs_lookahead)  // Need to borrow new credits AND add back ones that were not spent in the previous cycle
//      2'b00   :
//                 case (rdsegs_add_back)  // Borrow zero and add some back
//                  3'b000  :   dcp0_tlxcrd_temp_both = dcp0_tlxcrd_temp_nc;
//                  3'b001  :   dcp0_tlxcrd_temp_both = dcp0_tlxcrd_temp_p1;
//                  3'b010  :   dcp0_tlxcrd_temp_both = dcp0_tlxcrd_temp_p2;
//                  default :   dcp0_tlxcrd_temp_both = dcp0_tlxcrd_temp_p4;
//                endcase
//      2'b01   :
//                 case (rdsegs_add_back)  // Borrow one and add some back
//                  3'b000  :   dcp0_tlxcrd_temp_both = dcp0_tlxcrd_temp_m1;
//                  3'b001  :   dcp0_tlxcrd_temp_both = dcp0_tlxcrd_temp_nc;
//                  3'b010  :   dcp0_tlxcrd_temp_both = dcp0_tlxcrd_temp_p1;
//                  default :   dcp0_tlxcrd_temp_both = dcp0_tlxcrd_temp_p3;
//                endcase
//      2'b10   :
//                 case (rdsegs_add_back)  // Borrow two and add some back
//                  3'b000  :   dcp0_tlxcrd_temp_both = dcp0_tlxcrd_temp_m2;
//                  3'b001  :   dcp0_tlxcrd_temp_both = dcp0_tlxcrd_temp_m1;
//                  3'b010  :   dcp0_tlxcrd_temp_both = dcp0_tlxcrd_temp_nc;
//                  default :   dcp0_tlxcrd_temp_both = dcp0_tlxcrd_temp_p2;
//                endcase
//      default :
//                 case (rdsegs_add_back)  // Borrow four and add some back
//                  3'b000  :   dcp0_tlxcrd_temp_both = dcp0_tlxcrd_temp_m4;
//                  3'b001  :   dcp0_tlxcrd_temp_both = dcp0_tlxcrd_temp_m3;
//                  3'b010  :   dcp0_tlxcrd_temp_both = dcp0_tlxcrd_temp_m2;
//                  default :   dcp0_tlxcrd_temp_both = dcp0_tlxcrd_temp_nc;
//                endcase
//    endcase
//  end
//    always @ (*) begin
//      if (dcp0_tlxcrd_overflow_err)                                     dcp0_tlxcrd_counter_nxt = dcp0_tlxcrd_temp_max     ;  // Overflow, set to max count (MAX)
//      else if (!rsp_pipe_was_stalled || !spec_rsp_credit_was_borrowed)
//        if    (spec_use_rsp_credit)                                     dcp0_tlxcrd_counter_nxt = dcp0_tlxcrd_temp_borrow  ;  // No need to add back for last cycle.  Subtract one for this cycle (Borrow)
//        else                                                            dcp0_tlxcrd_counter_nxt = dcp0_tlxcrd_temp_nc      ;  // No need to add back for last cycle.  No change for this cycle    (NC)
//      else                                                                                                                    // The pipe stalled previous cycle, so credits were not actually used.  Add them back.
//        if    (spec_use_rsp_credit)                                     dcp0_tlxcrd_counter_nxt = dcp0_tlxcrd_temp_both    ;  // Add one for last cycle.  Subtract one for this cycle.  No change (Both)
//        else                                                            dcp0_tlxcrd_counter_nxt = dcp0_tlxcrd_temp_addback ;  // Add one for last chcle.  No change for this cycle                (AddBack)
//    end


    always @ (posedge clock) begin
        if      (!reset_n)              dcp0_tlxcrd_counter  <= 16'h0000;
        else                            dcp0_tlxcrd_counter  <= dcp0_tlxcrd_counter_nxt;
    end
    // Detect and report counter overflow
    // Use a sticky register to capture overflow error.
    // This is a sticky register, it holds its value until it is cleared.
    always @ (*) begin
        if  (clear_sticky_debug_info)                                                                dcp0_tlxcrd_overflow_err_din  =   1'b0  ;  // Clear the error
        else if ((dcp0_tlxcrd_counter[15:12] == 4'b1111) && (dcp0_tlxcrd_counter_nxt[15] == 1'b0))   dcp0_tlxcrd_overflow_err_din  =   1'b1  ;  // Set the error
        else                                                                                         dcp0_tlxcrd_overflow_err_din  =   dcp0_tlxcrd_overflow_err ;  // Remember error
    end
    always @ (posedge clock) begin
        if    (!reset_n)  dcp0_tlxcrd_overflow_err   <=  1'b0;
        else              dcp0_tlxcrd_overflow_err   <=  dcp0_tlxcrd_overflow_err_din ;
    end




    // --- DCP3 ---

//    // Option 1 - Using 16-bit adders and subtractor.
//    assign  dcp3_tlxcrd_counter_nxt = (dcp3_tlxcrd_overflow_err) ? 16'b1111111111111111                             :  // Overflow, set to max count (MAX)
//                                                                   dcp3_tlxcrd_counter + {10'h0, new_dcp3_tlxcrd} + {10'h0, dcp3_tlxcrd_addback} - {13'h0, dcp3_tlxcrd_borrow} ;  // Add the delta to the counter



    // Option 2 - Using smaller adders where possible and using 2s compliment addition for subtractor
    assign  dcp3_tlxcrd_addback = (cmd_pipe_was_stalled && spec_cmd_credit_was_borrowed)  ?  {3'h0, cdsegs_add_back}  :  // If credit was borrowed but not spent, add it back (0, 1, 2, or 4 credits)
                                                                                             6'h0                     ;  // Otherwise don't add any back.
    assign  dcp3_tlxcrd_adder  =  {1'b0, new_dcp3_tlxcrd}  +  {1'b0, dcp3_tlxcrd_addback}                             ;  // 7-bit adder, 7-bit positive integer result


    assign  dcp3_tlxcrd_borrow  = (spec_use_cmd_credit)                                   ?  cdsegs                   :  // If needed, borrow enough data credits for next response (0, 1, 2, or 4 credits)
                                                                                             3'h0                     ;  // Otherwise don't borrow any.
    assign  dcp3_tlxcrd_borrow2c =  {1'b0,~dcp3_tlxcrd_borrow}  +  4'b0001                                            ;  // 2's compliment of borrow.  4 bit result.  If msb is 1 then borrow was zero, no need to use it.
    assign  dcp3_tlxcrd_subtractor =  (dcp3_tlxcrd_borrow2c[3])  ?  8'h0  :  {5'b11111,dcp3_tlxcrd_borrow2c[2:0]}     ;  // Pad 2's compliment with ones if it is negative.

    assign  dcp3_tlxcrd_delta  =  {1'b0, dcp3_tlxcrd_adder}  +  dcp3_tlxcrd_subtractor                                ;  // 8-bit adder, 8-bit result. If msb=1 then other bits are positive, so pad them with 0s.   Else pad with 1's
    assign  dcp3_tlxcrd_delta_pad  =  (~dcp3_tlxcrd_delta[7])  ?   {9'b000000000, dcp3_tlxcrd_delta[6:0] }            :  // Delta is positive, so pad it with zeros.
                                                                   {9'b111111111, dcp3_tlxcrd_delta[6:0] }            ;  // Delta is negative (in 2's compliment) so pad it with ones.

    assign  dcp3_tlxcrd_counter_nxt  =                                 dcp3_tlxcrd_counter +  dcp3_tlxcrd_delta_pad   ;  // Add the delta to the counter

//    assign  dcp3_tlxcrd_counter_nxt  =  (dcp3_tlxcrd_overflow_err)  ?  16'b1111111111111111                           :  // Overflow, set to max count (MAX)
//                                                                       dcp3_tlxcrd_counter +  dcp3_tlxcrd_delta_pad   ;  // Add the delta to the counter



//  // Option 3 - Using parallel 16-bit adders/subtractors and using mux to select the correct one.
//    assign dcp3_tlxcrd_temp_nc  = dcp3_tlxcrd_counter + {10'h0, new_dcp3_tlxcrd};                                // No change + new credits, if any (NC)
//    assign dcp3_tlxcrd_temp_p1  = dcp3_tlxcrd_counter + {10'h0, new_dcp3_tlxcrd} + {16'b0000000000000001} ;      // + 1       + new credits, if any (+1)
//    assign dcp3_tlxcrd_temp_p2  = dcp3_tlxcrd_counter + {10'h0, new_dcp3_tlxcrd} + {16'b0000000000000010} ;      // + 2       + new credits, if any (+2)
//    assign dcp3_tlxcrd_temp_p3  = dcp3_tlxcrd_counter + {10'h0, new_dcp3_tlxcrd} + {16'b0000000000000011} ;      // + 3       + new credits, if any (+3)
//    assign dcp3_tlxcrd_temp_p4  = dcp3_tlxcrd_counter + {10'h0, new_dcp3_tlxcrd} + {16'b0000000000000100} ;      // + 4       + new credits, if any (+4)
//    assign dcp3_tlxcrd_temp_m1  = dcp3_tlxcrd_counter + {10'h0, new_dcp3_tlxcrd} - {16'b0000000000000001} ;      // - 1       + new credits, if any (-1)
//    assign dcp3_tlxcrd_temp_m2  = dcp3_tlxcrd_counter + {10'h0, new_dcp3_tlxcrd} - {16'b0000000000000010} ;      // - 2       + new credits, if any (-2)
//    assign dcp3_tlxcrd_temp_m3  = dcp3_tlxcrd_counter + {10'h0, new_dcp3_tlxcrd} - {16'b0000000000000011} ;      // - 3       + new credits, if any (-3)
//    assign dcp3_tlxcrd_temp_m4  = dcp3_tlxcrd_counter + {10'h0, new_dcp3_tlxcrd} - {16'b0000000000000100} ;      // - 4       + new credits, if any (-4)
//    assign dcp3_tlxcrd_temp_max = 16'b1111111111111111;                                                 // Counter is at max               (MAX)
//    always @ (*) begin
//      case (vc3_dsegs_lookahead)  // Determine how many DCP credits to borrow for this cycle
//        2'b00   :   dcp3_tlxcrd_temp_borrow = dcp3_tlxcrd_temp_nc;
//        2'b01   :   dcp3_tlxcrd_temp_borrow = dcp3_tlxcrd_temp_m1;
//        2'b10   :   dcp3_tlxcrd_temp_borrow = dcp3_tlxcrd_temp_m2;
//        default :   dcp3_tlxcrd_temp_borrow = dcp3_tlxcrd_temp_m4;
//      endcase
//      case (cdsegs_add_back)  // Determine how many DCP credits to add back from previous cycle
//        3'b000  :   dcp3_tlxcrd_temp_addback = dcp3_tlxcrd_temp_nc;
//        3'b001  :   dcp3_tlxcrd_temp_addback = dcp3_tlxcrd_temp_p1;
//        3'b010  :   dcp3_tlxcrd_temp_addback = dcp3_tlxcrd_temp_p2;
//        default :   dcp3_tlxcrd_temp_addback = dcp3_tlxcrd_temp_p4;
//      endcase
//      case (vc3_dsegs_lookahead)  // Need to borrow new credits AND add back ones that were not spent in the previous cycle
//        2'b00   :
//                   case (cdsegs_add_back)  // Borrow zero and add some back
//                    3'b000  :   dcp3_tlxcrd_temp_both = dcp3_tlxcrd_temp_nc;
//                    3'b001  :   dcp3_tlxcrd_temp_both = dcp3_tlxcrd_temp_p1;
//                    3'b010  :   dcp3_tlxcrd_temp_both = dcp3_tlxcrd_temp_p2;
//                    default :   dcp3_tlxcrd_temp_both = dcp3_tlxcrd_temp_p4;
//                  endcase
//        2'b01   :
//                   case (cdsegs_add_back)  // Borrow one and add some back
//                    3'b000  :   dcp3_tlxcrd_temp_both = dcp3_tlxcrd_temp_m1;
//                    3'b001  :   dcp3_tlxcrd_temp_both = dcp3_tlxcrd_temp_nc;
//                    3'b010  :   dcp3_tlxcrd_temp_both = dcp3_tlxcrd_temp_p1;
//                    default :   dcp3_tlxcrd_temp_both = dcp3_tlxcrd_temp_p3;
//                  endcase
//        2'b10   :
//                   case (cdsegs_add_back)  // Borrow two and add some back
//                    3'b000  :   dcp3_tlxcrd_temp_both = dcp3_tlxcrd_temp_m2;
//                    3'b001  :   dcp3_tlxcrd_temp_both = dcp3_tlxcrd_temp_m1;
//                    3'b010  :   dcp3_tlxcrd_temp_both = dcp3_tlxcrd_temp_nc;
//                    default :   dcp3_tlxcrd_temp_both = dcp3_tlxcrd_temp_p2;
//                  endcase
//        default :
//                   case (cdsegs_add_back)  // Borrow four and add some back
//                    3'b000  :   dcp3_tlxcrd_temp_both = dcp3_tlxcrd_temp_m4;
//                    3'b001  :   dcp3_tlxcrd_temp_both = dcp3_tlxcrd_temp_m3;
//                    3'b010  :   dcp3_tlxcrd_temp_both = dcp3_tlxcrd_temp_m2;
//                    default :   dcp3_tlxcrd_temp_both = dcp3_tlxcrd_temp_nc;
//                  endcase
//      endcase
//    end
//    always @ (*) begin
//      if (dcp3_tlxcrd_overflow_err)                                     dcp3_tlxcrd_counter_nxt = dcp3_tlxcrd_temp_max     ;  // Overflow, set to max count (MAX)
//      else if (!cmd_pipe_was_stalled || !spec_cmd_credit_was_borrowed)
//        if    (spec_use_cmd_credit)                                     dcp3_tlxcrd_counter_nxt = dcp3_tlxcrd_temp_borrow  ;  // No need to add back for last cycle.  Subtract one for this cycle (Borrow)
//        else                                                            dcp3_tlxcrd_counter_nxt = dcp3_tlxcrd_temp_nc      ;  // No need to add back for last cycle.  No change for this cycle    (NC)
//      else                                                                                                                    // The pipe stalled previous cycle, so credits were not actually used.  Add them back.
//        if    (spec_use_cmd_credit)                                     dcp3_tlxcrd_counter_nxt = dcp3_tlxcrd_temp_both    ;  // Add one for last cycle.  Subtract one for this cycle.  No change (Both)
//        else                                                            dcp3_tlxcrd_counter_nxt = dcp3_tlxcrd_temp_addback ;  // Add one for last chcle.  No change for this cycle                (AddBack)
//    end

    always @ (posedge clock) begin
        if      (!reset_n)              dcp3_tlxcrd_counter  <= 16'h0000;
        else                            dcp3_tlxcrd_counter  <= dcp3_tlxcrd_counter_nxt;
    end
    // Detect and report counter overflow
    // Use a sticky register to capture overflow error.
    // This is a sticky register, it holds its value until it is cleared.
    always @ (*) begin
        if  (clear_sticky_debug_info)                                                                dcp3_tlxcrd_overflow_err_din  =   1'b0  ;  // Clear the error
        else if ((dcp3_tlxcrd_counter[15:12] == 4'b1111) && (dcp3_tlxcrd_counter_nxt[15] == 1'b0))   dcp3_tlxcrd_overflow_err_din  =   1'b1  ;  // Set the error
        else                                                                                         dcp3_tlxcrd_overflow_err_din  =   dcp3_tlxcrd_overflow_err ;  // Remember error
    end
    always @ (posedge clock) begin
        if    (!reset_n)  dcp3_tlxcrd_overflow_err   <=  1'b0;
        else              dcp3_tlxcrd_overflow_err   <=  dcp3_tlxcrd_overflow_err_din ;
    end




    // ---------------------------------
    // @@@ ----- RESPONSE PIPELINE -----
    // ---------------------------------

    // ---------------
    // @@@ Response Valid Logic
    // ---------------
    // Check to see if there are responses waiting in the FIFO and if the necessary TLX credits are available.
    // If the response  waiting in the FIFO is a NOP, then it does not require TLX credits.
    always @ (*) begin
        if (((vc0_tlxcrd_counter > 16'h0000) && there_are_enough_dcp0_credits) || (vc0_opcode_lookahead == 8'h00))  rsp_credit_ok = 1'b1 ;
        else                                                                                                        rsp_credit_ok = 1'b0 ;

        if (rsp_pipe_stall)                             r_valid_din =  r_valid ;  // Pipeline stalled.  Packer can't take rsp yet.   Hold the values
        else if (vc0_rsp_available && rsp_credit_ok)    r_valid_din =  1'b1 ;     // Set r_valid
        else                                            r_valid_din =  1'b0 ;     // Clear r_valid
    end
    always @ (posedge clock) begin
        if    (!reset_n)  r_valid  <= 1'b0; 
        else              r_valid  <= r_valid_din;
    end

    assign  valid_rsp_leaving_fifo  =  vc0_rsp_available && rsp_credit_ok &&  !rsp_pipe_stall ;



    // ---------------
    // @@@ Response Template Picker
    // ---------------
    // Choose a template and don't change it until the next template is started.
    always @ (*) begin
       if (rsp_cf_was_taken || ((rsp_packer_state == RP_IDLE) && r_valid) || power_on_reset)
                rsp_tmpl_din = best_tmpl ;  // Choose the best template
       else     rsp_tmpl_din = rsp_tmpl ;   // Hold template steady until next one is started.
    end
    always @ (posedge clock) begin
        if    (!reset_n)  rsp_tmpl  <= 2'b00; 
        else              rsp_tmpl  <= rsp_tmpl_din;
    end


    // ---------------
    // @@@ Response Template Packet Counter
    // ---------------
    // This counter points at the next field in the cntl flit in which a packet may be packed.
    // Encode:  "000"=field 0, "001"=field 1, "010"=field 2, "011"=field 3, "100" or greater is invalid.
    // It starts with field 0 unless field 0 is reserved for credits.
    // The counter increments each time a rsp is packed.
    
    always @ (posedge clock) begin
        if    (!reset_n)  rsp_was_packed  <= 1'b0; 
        else              rsp_was_packed  <= pack_rsp_now;
    end

    always @ (*) begin
        if (rsp_packer_next_state == RP_STRT) begin
           if  ( (rsp_tmpl_din == 2'b00)  || rxredy)  rsp_packet_ptr_din = 3'b001 ;  // Field 1  (slots 4-)
           else                                       rsp_packet_ptr_din = 3'b000 ;  // Field 0  (slots 0-3)
        end
        else if (rsp_was_packed)                      rsp_packet_ptr_din = rsp_packet_ptr + 3'b001 ; // Increment the pointer when rsps are packed.
        else                                          rsp_packet_ptr_din = rsp_packet_ptr ;          // Hold
    end

    always @ (posedge clock) begin
        if    (!reset_n)  rsp_packet_ptr  <= 3'b000; 
        else              rsp_packet_ptr  <= rsp_packet_ptr_din;
    end


    // ------------------------
    // @@@ Response CF Packer State Machine
    // ------------------------
    // This state machine packs responses and credits into the selected template.
    // This logic looks at available responses and credits, etc and chooses what to pack into the control flit during this cycle.
    // At the end of each cycle, the control flit should contain a valid combination of responses and credits (unless the FSM is in the IDLE state).
    // At the end of each cycle, the current control flit should be ready to go to the DLX if the Framer (below) takes it (unless the FSM is in the IDLE state).
    // A control flit could be taken every cycle by the framer, if desired.
    // So, if the FSM is in any state besides RP_IDLE, it should have a full or partially full control flit ready to go.
    // TL credits may be packed into slots 0,1 of any control flit.
    // rsp_hold=1 means hold values, no need to pack new content into templates.

    // Next state logic
    always @ (*) begin
        case ( rsp_packer_state )
          RP_IDLE : begin
                      if ( r_valid || rxredy )                             begin  rsp_packer_next_state = RP_STRT;  rsp_hold = 1'b0;  end  // Start packing the template
                      else                                                 begin  rsp_packer_next_state = RP_IDLE;  rsp_hold = 1'b1;  end
                    end
          RP_STRT : begin
                      if (rsp_cf_was_taken)                                begin  rsp_packer_next_state = RP_IDLE;  rsp_hold = 1'b1;  end
                      else if (  rsp_tmpl_din == 2'b00)                    begin  rsp_packer_next_state = RP_FULL;  rsp_hold = 1'b1;  end  // This template is as full as it will ever be.
                      else if ( !r_valid  )                                begin  rsp_packer_next_state = RP_CONT;  rsp_hold = 1'b1;  end  // Stall if there are no additional rsps to load
                      else                                                 begin  rsp_packer_next_state = RP_CONT;  rsp_hold = 1'b0;  end  // Pack another response into this template
                    end
          RP_CONT : begin
                      if (rsp_cf_was_taken && ( r_valid || rxredy ))       begin  rsp_packer_next_state = RP_STRT;  rsp_hold = 1'b0;  end  // Start packing a new template
                      else if (rsp_cf_was_taken)                           begin  rsp_packer_next_state = RP_IDLE;  rsp_hold = 1'b1;  end
                      else if ( ((rsp_tmpl_din == 2'b00) && (rsp_packet_ptr >= 3'b001)) ||
                                ((rsp_tmpl_din == 2'b01) && (rsp_packet_ptr >= 3'b011)) ||
                                ((rsp_tmpl_din == 2'b11) && (rsp_packet_ptr >= 3'b010))  )
                                                                           begin  rsp_packer_next_state = RP_FULL;  rsp_hold = 1'b1;  end
                      else if ( !r_valid  )                                begin  rsp_packer_next_state = RP_CONT;  rsp_hold = 1'b1;  end  // Stall if there are no additional rsps to load
                      else                                                 begin  rsp_packer_next_state = RP_CONT;  rsp_hold = 1'b0;  end  // Pack another response into this template
                    end
          RP_FULL : begin
                      if (rsp_cf_was_taken && ( r_valid || rxredy ))       begin  rsp_packer_next_state = RP_STRT;  rsp_hold = 1'b0;  end  // Start packing a new template
                      else if (rsp_cf_was_taken)                           begin  rsp_packer_next_state = RP_IDLE;  rsp_hold = 1'b1;  end
                      else                                                 begin  rsp_packer_next_state = RP_FULL;  rsp_hold = 1'b1;  end
                    end

          default : begin
                      if ( r_valid || rxredy )                             begin  rsp_packer_next_state = RP_STRT;  rsp_hold = 1'b0;  end  // Start packing the template
                      else                                                 begin  rsp_packer_next_state = RP_IDLE;  rsp_hold = 1'b1;  end
                    end
        endcase

        if (r_valid && rsp_hold)  rsp_pipe_stall = 1'b1 ;  // Stall the rsp pipe if there is a valid rsp but it cannot be packed at this time.
        else                      rsp_pipe_stall = 1'b0 ;
    end

    // State register
    always @ (posedge clock) begin
        if    (!reset_n)  rsp_packer_state     <= RP_IDLE   ;
        else              rsp_packer_state     <= rsp_packer_next_state;
    end
    assign  rsp_cf_empty = rsp_packer_state[0] ;  // The response cf is only empty if the rsp packer is in the RP_IDLE state.


    // ------------------------
    // @@@ Response Control Flit Packing Logic
    // ------------------------
    // Based on the state of the Template Packing FSM, this logic packs responses and credits into the current control flit
    // If the FSM is "holding", no change is made to the FSM state, the control flit contents, or the data flit shift register
    // If the FSM is not holding, and the FSM state is in the RP_STRT state, a new control flit is started, a rsp and/or credit is filled in, other fields are filled with zeros.
    // If the FSM is not holding, and the FSM state is in the RP_CONT state, then an additional rsp is added to the control flit.
    // Some handshaking signals are also set to synchronize this FSM with other logic.

    always @ (*) begin

        if (rsp_hold) begin     // rsp_hold=1 means hold values, do not pack new content into templates.
                                pack_rsp_now                    =  1'b0 ;
                                rsp_cntl_flit_reg_din[511:0]    =  rsp_cntl_flit_reg[511:0] ;      // Hold control flit contents.  Updated slots will be overwritten below.
        end
        else begin              // rsp_hold=0 means pack new content into templates, and update the data flit vector (dfvector)
          case  ( rsp_packet_ptr_din )
            3'b000  :  begin   // Pack rsp into slots 0-3
                                rsp_cntl_flit_reg_din[ 55:  0]  =  vc0_fifo_output_reg[55:0] ;      // Pack slots 0-1 with response from FIFO
                                rsp_cntl_flit_reg_din[111: 56]  =   56'h0 ;                         // Pack slots 2-3 with zeros
                                rsp_cntl_flit_reg_din[279:112]  =  168'h0 ;                         // Pack slots 4-9 with no op
                                rsp_cntl_flit_reg_din[447:280]  =  168'h0 ;                         // Pack slots 10-15 with zeros
                                rsp_cntl_flit_reg_din[451:448]  =    4'h0 ;                         // Set DataRunLength to zero.  It will be filled in when cntl flit is sent.
                                rsp_cntl_flit_reg_din[459:452]  =    8'h0 ;                         // Set BadDataFlit vector to zero.  It will be filled in when the cntl flit is sent.
                                rsp_cntl_flit_reg_din[465:460]  =  {4'b0000, rsp_tmpl_din} ;        // Set TLTemplate indicator
                                rsp_cntl_flit_reg_din[511:466]  =  46'h0 ;                          // Set DLSpecified content with zeros
                                pack_rsp_now                    =  1'b1 ;
                      end
            3'b001  :  begin   // Pack rsp into slots 4-7, or 4-9
                        if ((rsp_packer_next_state == RP_STRT) && push_cred_into_rsp_cf ) begin     // Pack credits into slots 0-3
                                rsp_cntl_flit_reg_din[ 55:  0]  =  credit_packet ;                  // Pack slots 0,1 with TLX credits
                                rsp_cntl_flit_reg_din[111: 56]  =   56'h0 ;                         // Pack slots 2,3 with zeros
                        end
                        else if (rsp_packer_next_state == RP_STRT) begin  // Pack zeros into slots 0-3, There are not credits ready
                                rsp_cntl_flit_reg_din[111:  0]  =  112'h0 ;                         // Pack slots 2,3 with zeros
                        end
                        else begin  // This is a continution, so preserve the response that was packed into slots 0-3
                                rsp_cntl_flit_reg_din[111:  0]  =  rsp_cntl_flit_reg[111:  0] ;     // Hold slots  0-3  with previous content
                        end

                        if (r_valid) begin
                            if (rsp_tmpl_din == 2'b01) begin   // Template 1, pack rsp into slots 4-7
                                rsp_cntl_flit_reg_din[167:112]  =  vc0_fifo_output_reg[55:0] ;      // Pack slots 4-5 with response from FIFO
                                rsp_cntl_flit_reg_din[223:168]  =  56'h0 ;                          // Pack slots 6-7 with zeros
                                rsp_cntl_flit_reg_din[279:224]  =  56'h0 ;                          // Pack slots 8,9 with zeros
                            end
                            else begin  // Template 0 or 3, pack rsp into slots 4-9
                                rsp_cntl_flit_reg_din[167:112]  =  vc0_fifo_output_reg[55:0] ;      // Pack slots 4-5 with response from FIFO
                                rsp_cntl_flit_reg_din[279:168]  =  112'h0 ;                         // Pack slots 6-9 with zeros
                            end
                                pack_rsp_now                    =  1'b1 ;
                        end
                        else begin
                                rsp_cntl_flit_reg_din[279:112]  =  168'h0 ;                         // Pack slots 4-9 with zeros
                                pack_rsp_now                    =  1'b0 ;
                        end

                                rsp_cntl_flit_reg_din[447:280]  =  168'h0 ;                         // Pack slots 10-15 with zeros
                                rsp_cntl_flit_reg_din[451:448]  =    4'h0 ;                         // Set DataRunLength to zero.  It will be filled in when cntl flit is sent.
                                rsp_cntl_flit_reg_din[459:452]  =    8'h0 ;                         // Set BadDataFlit vector to zero.  It will be filled in when the cntl flit is sent.
                                rsp_cntl_flit_reg_din[465:460]  =  {4'b0000, rsp_tmpl_din} ;        // Set TLTemplate indicator
                                rsp_cntl_flit_reg_din[511:466]  =  46'h0 ;                          // Set DLSpecified content with zeros
                       end
            3'b010  :  begin   // Pack rsp into slots 8-11, or 10-15
                                rsp_cntl_flit_reg_din[223:  0]  =  rsp_cntl_flit_reg[223:  0] ;     // Hold slots  0-7  with previous content
                        if (rsp_tmpl_din == 2'b01) begin   // Template 1, pack rsp into slots 8-11
                                rsp_cntl_flit_reg_din[279:224]  =  vc0_fifo_output_reg[55:0] ;      // Pack slots  8-9  with response from FIFO
                                rsp_cntl_flit_reg_din[447:280]  =  168'h0 ;                         // Pack slots 10-15 with zeros
                        end
                        else begin  // Template 0 or 3, pack rsp into slots 4-9
                                rsp_cntl_flit_reg_din[279:224]  =  rsp_cntl_flit_reg[279:224] ;     // Hold slots  8-9  with previous content
                                rsp_cntl_flit_reg_din[335:280]  =  vc0_fifo_output_reg[55:0] ;      // Pack slots 10-11 with response from FIFO
                                rsp_cntl_flit_reg_din[447:336]  =  112'h0 ;                         // Pack slots 12-15 with zeros
                        end
                                rsp_cntl_flit_reg_din[451:448]  =    4'h0 ;                         // Set DataRunLength to zero.  It will be filled in when cntl flit is sent.
                                rsp_cntl_flit_reg_din[459:452]  =    8'h0 ;                         // Set BadDataFlit vector to zero.  It will be filled in when the cntl flit is sent.
                                rsp_cntl_flit_reg_din[465:460]  =  {4'b0000, rsp_tmpl_din} ;        // Set TLTemplate indicator
                                rsp_cntl_flit_reg_din[511:466]  =  46'h0 ;                          // Set DLSpecified content with zeros
                                pack_rsp_now                    =  1'b1 ;
                      end
            default :  begin   // Pack rsp into slots 12-15  (Should only happen for Template 1)
                                rsp_cntl_flit_reg_din[335:  0]  =  rsp_cntl_flit_reg[335:  0] ;     // Hold slots  0-11 with previous content
                                rsp_cntl_flit_reg_din[391:336]  =  vc0_fifo_output_reg[55:0] ;      // Pack slots 12-13 with response from FIFO
                                rsp_cntl_flit_reg_din[447:392]  =  56'h0 ;                          // Pack slots 14-15 with zeros
                                rsp_cntl_flit_reg_din[451:448]  =   4'h0 ;                          // Set DataRunLength to zero.  It will be filled in when cntl flit is sent.
                                rsp_cntl_flit_reg_din[459:452]  =   8'h0 ;                          // Set BadDataFlit vector to zero.  It will be filled in when the cntl flit is sent.
                                rsp_cntl_flit_reg_din[465:460]  =  {4'b0000, rsp_tmpl_din} ;        // Set TLTemplate indicator
                                rsp_cntl_flit_reg_din[511:466]  =  46'h0 ;                          // Set DLSpecified content with zeros
                                pack_rsp_now                    =  1'b1 ;
                            end
          endcase
        end
    end


    // ------------------------
    // @@@ Response Control Flit DF Counter
    // ------------------------
    // This counter counts the number of data flits (DFs) associated with the current control flit which is being packed.
    // Whenever a response is packed into the current control flit, the corresponding number of DFs is added to this counter.
    // The counter gets reset whenever the control flit is sent to the framer.
    // Before the counter is reset, the DF count is loaded broadside into the DFSR, to keep track of the data flits that need to be sent to DLX

    always @ (*) begin
        if      (rdsege == 2'b00)  rdincr = 3'b000 ;
        else if (rdsege == 2'b01)  rdincr = 3'b001 ;
        else if (rdsege == 2'b10)  rdincr = 3'b010 ;
        else                       rdincr = 3'b100 ;
    end
    always @ (*) begin
        if      ( !pack_rsp_now  &&  !rsp_cf_was_taken )  rcf_df_count_nxt  =  rcf_df_count ;                      // No change
        else if ( !pack_rsp_now  &&   rsp_cf_was_taken )  rcf_df_count_nxt  =  5'b00000 ;                          // CF was taken.  Set DF count to zero
        else if (  pack_rsp_now  &&  !rsp_cf_was_taken )  rcf_df_count_nxt  =  rcf_df_count + {2'b00, rdincr} ;    // Increment count by rdincr
        else                                              rcf_df_count_nxt  =  5'b00000     + {2'b00, rdincr} ;    // Set to zero plus rdincr
    end
    always @ (posedge clock) begin
        if    (!reset_n)  rcf_df_count  <= 5'b00000;
        else              rcf_df_count  <= rcf_df_count_nxt;
    end





    // ---------------------------------
    // @@@ ----- COMMAND PIPELINE -----
    // ---------------------------------

    // ---------------
    // @@@ Command Valid Logic
    // ---------------
    // Check to see if there are commands waiting in the FIFO and if the necessary TLX credits are available.
    // If the command  waiting in the FIFO is a NOP, then it does not require TLX credits.
    always @ (*) begin
        if (((vc3_tlxcrd_counter > 16'h0000) && there_are_enough_dcp3_credits) || (vc3_opcode_lookahead == 8'h00))  cmd_credit_ok = 1'b1 ;
        else                                                                                                        cmd_credit_ok = 1'b0 ;

        if (cmd_pipe_stall)                             c_valid_din =  c_valid ;  // Pipeline stalled.  Packer can't take cmd yet.   Hold the values
        else if (vc3_cmd_available && cmd_credit_ok)    c_valid_din =  1'b1 ;     // Set c_valid
        else                                            c_valid_din =  1'b0 ;     // Clear c_valid
    end
    always @ (posedge clock) begin
        if    (!reset_n)  c_valid  <= 1'b0; 
        else              c_valid  <= c_valid_din;
    end

    assign  valid_cmd_leaving_fifo  =  vc3_cmd_available && cmd_credit_ok && !cmd_pipe_stall ;

    // Send command credits back to AFU
    assign    tlx_afu_cmd_credit   =  valid_cmd_leaving_fifo ;



    // ---------------
    // @@@ Command Template Picker
    // ---------------
    // Choose the best template whenever the FSM will start packing a new template
    // Set the template type for all of the conditions in which the FSM will be going into the CP_STRT state.

    // Six-slot command predictor
    // First, get a prediction of when a six-slot command is coming.  Six slot commands cannot go into template 01.
    // The logic was using the cmd FIFO output to detect six-slot commands, but this was causing timing problems.
    // Note - This is a pessimistic predictor.  It will cause a template 01 to be avoided sometimes unneccessarily.
    // This is probably ok because six-slot commands should be pretty rare for most work loads.
    // The output of this predictor is called six_slot_lookahead.
    // The output of this predictor will be true whenever any of that last 8 commands to enter the cmd FIFO was a six-slot command.
    // Note - this predictor is probably too pessimistic now that the FIFO is 8 entries deep.
    // This predictor will cause template 1 to be avoided for at least 8 commands every time a six-slot command is seen.
    always @ (*) begin
        if (cmd_packet_reg[171:170] == 2'b11) six_slot_going_into_fifo = 1'b1;
        else                                  six_slot_going_into_fifo = 1'b0;

        if (cmd_valid_d1)  // Any time a new cmd is going into the cmd FIFO, see if it is a six-slot cmd.
           begin
                  six_slot_shift_reg_din[0]   = six_slot_going_into_fifo ;  // Shift new  bit into shift reg.
                  six_slot_shift_reg_din[7:1] = six_slot_shift_reg[6:0] ;   // Shift the other bits along
           end
        else      six_slot_shift_reg_din[7:0] = six_slot_shift_reg[7:0] ;   // No change
    end
    always @ (posedge clock) begin
        if    (!reset_n)  six_slot_shift_reg  <= 8'h0; 
        else              six_slot_shift_reg  <= six_slot_shift_reg_din;
    end
    //assign  six_slot_lookahead  =  |six_slot_shift_reg ;   // Predict a six-slot command if any of the last 4 commands entering the FIFO were six-slot commands.
    assign  six_slot_lookahead  =  1'b0 ;       // Never predict a six_slot command.  Just handle it if it shows up.

    // Template picker
    always @ (*) begin
       if ( ((cmd_packer_state == CP_IDLE) && c_valid)  || ( ((cmd_packer_state == CP_CONT) || (cmd_packer_state == CP_FULL)) && cmd_cf_was_taken && (c_valid || cxredy) ) )
         begin
           if (((six_slot_cmd && c_valid) || six_slot_lookahead)  &&  template03_supported)   cmd_tmpl_din = 2'b11 ;      // Choose Template 03 for large cmds
           else if ((six_slot_cmd && c_valid) || six_slot_lookahead)                          cmd_tmpl_din = 2'b00 ;      // Or choose Template 00 for large cmds
           else                                                                               cmd_tmpl_din = best_tmpl ;  // Otherwise choose the best template
         end
       else                                                                                   cmd_tmpl_din = cmd_tmpl ;   // Hold template steady until next one is started.
    end
    always @ (posedge clock) begin
        if    (!reset_n)  cmd_tmpl  <= 2'b00; 
        else              cmd_tmpl  <= cmd_tmpl_din;
    end


    // ---------------
    // @@@ Command Template Packet Counter
    // ---------------
    // This counter points at the next field in the cntl flit in which a packet may be packed.
    // Encode:  "000"=field 0, "001"=field 1, "010"=field 2, "011"=field 3, "100" or greater is invalid.
    // It starts with field 0 unless field 0 is reserved for credits.
    // The counter increments each time a cmd is packed.
    
    always @ (posedge clock) begin
        if    (!reset_n)  cmd_was_packed  <= 1'b0; 
        else              cmd_was_packed  <= pack_cmd_now;
    end

    always @ (*) begin
        if (cmd_packer_next_state == CP_STRT) begin
           if  ( (cmd_tmpl_din == 2'b00) || six_slot_cmd || cxredy)  cmd_packet_ptr_din = 3'b001 ;  // Field 1  (slots 4-)
           else                                                      cmd_packet_ptr_din = 3'b000 ;  // Field 0  (slots 0-3)
        end
        else if (cmd_was_packed)                                     cmd_packet_ptr_din = cmd_packet_ptr + 3'b001 ; // Increment the pointer when cmds are packed.
        else                                                         cmd_packet_ptr_din = cmd_packet_ptr ;          // Hold
    end

    always @ (posedge clock) begin
        if    (!reset_n)  cmd_packet_ptr  <= 3'b000; 
        else              cmd_packet_ptr  <= cmd_packet_ptr_din;
    end


    // ------------------------
    // @@@ Command CF Packer State Machine
    // ------------------------
    // This state machine packs commands and credits into the selected template.
    // This logic looks at available commands and credits, etc and chooses what to pack into the control flit during this cycle.
    // At the end of each cycle, the control flit should contain a valid combination of commands and credits (unless the FSM is in the IDLE state).
    // At the end of each cycle, the current control flit should be ready to go to the DLX if the Framer (below) takes it (unless the FSM is in the IDLE state).
    // A control flit could be taken every cycle by the framer, if desired.
    // So, if the FSM is in any state besides CP_IDLE, it should have a full or partially full control flit ready to go.
    // TL credits may be packed into slots 0,1 of any control flit.
    // cmd_hold=1 means, hold values, no need to pack new content into templates.

    // Next state logic
    always @ (*) begin
        case ( cmd_packer_state )
          CP_IDLE : begin
                      if ( c_valid )                                       begin  cmd_packer_next_state = CP_STRT;  cmd_hold = 1'b0;  end  // Start packing the template
                      else                                                 begin  cmd_packer_next_state = CP_IDLE;  cmd_hold = 1'b1;  end
                    end
          CP_STRT : begin
                      if (cmd_cf_was_taken)                                begin  cmd_packer_next_state = CP_IDLE;  cmd_hold = 1'b1;  end
                      else if ( (cmd_tmpl_din == 2'b01) && six_slot_cmd )  begin  cmd_packer_next_state = CP_FULL;  cmd_hold = 1'b1;  end  // Can't pack six-slot cmd into template 01
                      else if (  cmd_tmpl_din == 2'b00)                    begin  cmd_packer_next_state = CP_FULL;  cmd_hold = 1'b1;  end  // This template is as full as it will ever be.
                      else if ( !c_valid  )                                begin  cmd_packer_next_state = CP_CONT;  cmd_hold = 1'b1;  end  // Stall if there are no additional cmds to load
                      else                                                 begin  cmd_packer_next_state = CP_CONT;  cmd_hold = 1'b0;  end  // Pack another command into this template
                    end
          CP_CONT : begin
                      if (cmd_cf_was_taken && ( c_valid || cxredy ))       begin  cmd_packer_next_state = CP_STRT;  cmd_hold = 1'b0;  end  // Start packing a new template
                      else if (cmd_cf_was_taken)                           begin  cmd_packer_next_state = CP_IDLE;  cmd_hold = 1'b1;  end
                      else if ( (cmd_tmpl_din == 2'b01) && six_slot_cmd )  begin  cmd_packer_next_state = CP_FULL;  cmd_hold = 1'b1;  end  // Can't pack six-slot cmd into template 01
                      else if ( ((cmd_tmpl_din == 2'b00) && (cmd_packet_ptr >= 3'b001)) ||
                                ((cmd_tmpl_din == 2'b01) && (cmd_packet_ptr >= 3'b011)) ||
                                ((cmd_tmpl_din == 2'b11) && (cmd_packet_ptr >= 3'b010))  )
                                                                           begin  cmd_packer_next_state = CP_FULL;  cmd_hold = 1'b1;  end  // This template is as full as it will ever be.
                      else if ( !c_valid  )                                begin  cmd_packer_next_state = CP_CONT;  cmd_hold = 1'b1;  end  // Stall if there are no additional cmds to load
                      else                                                 begin  cmd_packer_next_state = CP_CONT;  cmd_hold = 1'b0;  end  // Pack another command into this template
                    end
          CP_FULL : begin
                      if (cmd_cf_was_taken && ( c_valid || cxredy ))       begin  cmd_packer_next_state = CP_STRT;  cmd_hold = 1'b0;  end  // Start packing a new template
                      else if (cmd_cf_was_taken)                           begin  cmd_packer_next_state = CP_IDLE;  cmd_hold = 1'b1;  end
                      else                                                 begin  cmd_packer_next_state = CP_FULL;  cmd_hold = 1'b1;  end
                    end

          default : begin
                      if ( c_valid || cxredy )                             begin  cmd_packer_next_state = CP_STRT;  cmd_hold = 1'b0;  end  // Start packing the template
                      else                                                 begin  cmd_packer_next_state = CP_IDLE;  cmd_hold = 1'b1;  end
                    end
        endcase

        if (c_valid && cmd_hold)  cmd_pipe_stall = 1'b1 ;  // Stall the cmd pipe if there is a valid cmd but it cannot be packed at this time.
        else                      cmd_pipe_stall = 1'b0 ;
    end

    // State register
    always @ (posedge clock) begin
        if    (!reset_n)  cmd_packer_state     <= CP_IDLE   ;
        else              cmd_packer_state     <= cmd_packer_next_state;
    end
    assign  cmd_cf_empty = cmd_packer_state[0] ;  // The command cf is only empty if the cmd packer is in the CP_IDLE state.


    // ------------------------
    // @@@ Command Control Flit Packing Logic
    // ------------------------
    // Based on the state of the Template Packing FSM, this logic packs commands and credits into the current control flit
    // If the FSM is "holding", no change is made to the FSM state, the control flit contents, or the data flit shift register
    // If the FSM is not holding, and the FSM state is in the CP_STRT state, a new control flit is started, a cmd and/or credit is filled in, other fields are filled with zeros.
    // If the FSM is not holding, and the FSM state is in the CP_CONT state, then an additional cmd is added to the control flit.
    // Some handshaking signals are also set to synchronize this FSM with other logic.

    always @ (*) begin

        if (cmd_hold) begin     // cmd_hold=1 means hold values, do not pack new content into templates.
                                pack_cmd_now                    =  1'b0 ;
                                cmd_cntl_flit_reg_din[511:0]    =  cmd_cntl_flit_reg[511:0] ;      // Hold control flit contents.  Updated slots will be overwritten below.
        end
        else begin              // cmd_hold=0 means pack new content into templates, and update the data flit vector (dfvector)
          case  ( cmd_packet_ptr_din )
            3'b000  :  begin   // Pack cmd into slots 0-3
                                cmd_cntl_flit_reg_din[111:  0]  =  vc3_fifo_output_reg[111:0] ;     // Pack slots 0-3 with COMMAND from FIFO
                                cmd_cntl_flit_reg_din[279:112]  =  168'h0 ;                         // Pack slots 4-9 with no op
                                cmd_cntl_flit_reg_din[447:280]  =  168'h0 ;                         // Pack slots 10-15 with zeros
                                cmd_cntl_flit_reg_din[451:448]  =    4'h0 ;                         // Set DataRunLength to zero.  It will be filled in when cntl flit is sent.
                                cmd_cntl_flit_reg_din[459:452]  =    8'h0 ;                         // Set BadDataFlit vector to zero.  It will be filled in when the cntl flit is sent.
                                cmd_cntl_flit_reg_din[465:460]  =  {4'b0000, cmd_tmpl_din} ;        // Set TLTemplate indicator
                                cmd_cntl_flit_reg_din[511:466]  =  46'h0 ;                          // Set DLSpecified content with zeros
                                pack_cmd_now                    =  1'b1 ;
                      end
            3'b001  :  begin   // Pack cmd into slots 4-7, or 4-9
                        if ((cmd_packer_next_state == CP_STRT) && push_cred_into_cmd_cf ) begin     // Pack credits into slots 0-3
                                cmd_cntl_flit_reg_din[ 55:  0]  =  credit_packet ;                  // Pack slots 0,1 with TLX credits
                                cmd_cntl_flit_reg_din[111: 56]  =   56'h0 ;                         // Pack slots 2,3 with zeros
                        end
                        else if (cmd_packer_next_state == CP_STRT) begin  // Pack zeros into slots 0-3, There are not credits ready
                                cmd_cntl_flit_reg_din[111:  0]  =  112'h0 ;                         // Pack slots 2,3 with zeros
                        end
                        else begin  // This is a continution, so preserve the command that was packed into slots 0-3
                                cmd_cntl_flit_reg_din[111:  0]  =  cmd_cntl_flit_reg[111:  0] ;     // Hold slots  0-3  with previous content
                        end

                        if (c_valid) begin
                            if (cmd_tmpl_din == 2'b01) begin   // Template 1, pack cmd into slots 4-7
                                cmd_cntl_flit_reg_din[223:112]  =  vc3_fifo_output_reg[111:0] ;     // Pack slots  4-7  with COMMAND from FIFO
                                cmd_cntl_flit_reg_din[279:224]  =  56'h0 ;                          // Pack slots 8,9 with zeros
                            end
                            else begin  // Template 0 or 3, pack cmd into slots 4-9
                                cmd_cntl_flit_reg_din[279:112]  =  vc3_fifo_output_reg[167:0] ;     // Pack slots 4-9 with COMMAND from FIFO
                            end
                                pack_cmd_now                    =  1'b1 ;
                        end
                        else begin
                                cmd_cntl_flit_reg_din[279:112]  =  168'h0 ;                         // Pack slots 4-9 with zeros
                                pack_cmd_now                    =  1'b0 ;
                        end

                                cmd_cntl_flit_reg_din[447:280]  =  168'h0 ;                         // Pack slots 10-15 with zeros
                                cmd_cntl_flit_reg_din[451:448]  =    4'h0 ;                         // Set DataRunLength to zero.  It will be filled in when cntl flit is sent.
                                cmd_cntl_flit_reg_din[459:452]  =    8'h0 ;                         // Set BadDataFlit vector to zero.  It will be filled in when the cntl flit is sent.
                                cmd_cntl_flit_reg_din[465:460]  =  {4'b0000, cmd_tmpl_din} ;        // Set TLTemplate indicator
                                cmd_cntl_flit_reg_din[511:466]  =  46'h0 ;                          // Set DLSpecified content with zeros
                       end
            3'b010  :  begin   // Pack cmd into slots 8-11, or 10-15
                                cmd_cntl_flit_reg_din[111:  0]  =  cmd_cntl_flit_reg[111:  0] ;     // Hold slots  0-3  with previous content
                                cmd_cntl_flit_reg_din[223:112]  =  cmd_cntl_flit_reg[223:112] ;     // Hold slots  4-7  with previous content
                        if (cmd_tmpl_din == 2'b01) begin   // Template 1, pack cmd into slots 8-11
                                cmd_cntl_flit_reg_din[335:224]  =  vc3_fifo_output_reg[111:0] ;     // Pack slots  8-11 with COMMAND from FIFO
                                cmd_cntl_flit_reg_din[447:336]  =  112'h0 ;                         // Pack slots 12-15 with zeros
                        end
                        else begin  // Template 0 or 3, pack cmd into slots 4-9
                                cmd_cntl_flit_reg_din[279:224]  =  cmd_cntl_flit_reg[279:224] ;     // Hold slots  8-9  with previous content
                                cmd_cntl_flit_reg_din[447:280]  =  vc3_fifo_output_reg[167:0] ;     // Pack slots 10-15 with COMMAND from FIFO
                        end
                                cmd_cntl_flit_reg_din[451:448]  =    4'h0 ;                         // Set DataRunLength to zero.  It will be filled in when cntl flit is sent.
                                cmd_cntl_flit_reg_din[459:452]  =    8'h0 ;                         // Set BadDataFlit vector to zero.  It will be filled in when the cntl flit is sent.
                                cmd_cntl_flit_reg_din[465:460]  =  {4'b0000, cmd_tmpl_din} ;        // Set TLTemplate indicator
                                cmd_cntl_flit_reg_din[511:466]  =  46'h0 ;                          // Set DLSpecified content with zeros
                                pack_cmd_now                    =  1'b1 ;
                      end
            default :  begin   // Pack cmd into slots 12-15  (Should only happen for Template 1)
                                cmd_cntl_flit_reg_din[111:  0]  =  cmd_cntl_flit_reg[111:  0] ;     // Hold slots  0-3  with previous content
                                cmd_cntl_flit_reg_din[223:112]  =  cmd_cntl_flit_reg[223:112] ;     // Hold slots  4-7  with previous content
                                cmd_cntl_flit_reg_din[335:224]  =  cmd_cntl_flit_reg[335:224] ;     // Hold slots  8-11 with previous content
                                cmd_cntl_flit_reg_din[447:336]  =  vc3_fifo_output_reg[111:0] ;     // Pack slots 12-15 with COMMAND from FIFO
                                cmd_cntl_flit_reg_din[451:448]  =    4'h0 ;                         // Set DataRunLength to zero.  It will be filled in when cntl flit is sent.
                                cmd_cntl_flit_reg_din[459:452]  =    8'h0 ;                         // Set BadDataFlit vector to zero.  It will be filled in when the cntl flit is sent.
                                cmd_cntl_flit_reg_din[465:460]  =  {4'b0000, cmd_tmpl_din} ;        // Set TLTemplate indicator
                                cmd_cntl_flit_reg_din[511:466]  =  46'h0 ;                          // Set DLSpecified content with zeros
                                pack_cmd_now                    =  1'b1 ;
                            end
          endcase
        end
    end


    // ------------------------
    // @@@ Command Control Flit DF Counter
    // ------------------------
    // This counter counts the number of data flits (DFs) associated with the current control flit which is being packed.
    // Whenever a command is packed into the current control flit, the corresponding number of DFs is added to this counter.
    // The counter gets reset whenever the control flit is sent to the framer.
    // Before the counter is reset, the DF count is loaded broadside into the DFSR, to keep track of the data flits that need to be sent to DLX
    always @ (*) begin
        if      (cdsege == 2'b00)  cdincr = 3'b000 ;
        else if (cdsege == 2'b01)  cdincr = 3'b001 ;
        else if (cdsege == 2'b10)  cdincr = 3'b010 ;
        else                       cdincr = 3'b100 ;
    end
    always @ (*) begin
        if      ( !pack_cmd_now  &&  !cmd_cf_was_taken )  ccf_df_count_nxt  =  ccf_df_count ;                      // No change
        else if ( !pack_cmd_now  &&   cmd_cf_was_taken )  ccf_df_count_nxt  =  5'b00000 ;                          // CF was taken.  Set DF count to zero
        else if (  pack_cmd_now  &&  !cmd_cf_was_taken )  ccf_df_count_nxt  =  ccf_df_count + {2'b00, cdincr} ;    // Increment count by cdincr
        else                                              ccf_df_count_nxt  =  5'b00000     + {2'b00, cdincr} ;    // Set to zero plus cdincr
    end
    always @ (posedge clock) begin
        if    (!reset_n)  ccf_df_count      <= 5'b00000;
        else              ccf_df_count      <= ccf_df_count_nxt;
        //if    (!reset_n)  ccf_df_count_d1   <= 5'b00000;
        //else              ccf_df_count_d1   <= ccf_df_count;
    end







    // ---------------------------------
    // @@@ ----- FRAMER LOGIC -----
    // ---------------------------------

    // ---------------
    // @@@ Run Length Countdown Counter
    // ---------------
    // Here is a counter to count down the data flits belonging to the current frame.
    // At the start of a new frame, this counter should be equal to the frame Data Run Length field (Max value = 8)
    // At the end of a frame, this counter should be zero.

    assign  run_length_countdown_nxt = (frame_stall)                                                                                                ?  run_length_countdown           :  // No change
                                       ((flit_mux_cntl == SEND_RSP_CFLIT) || (flit_mux_cntl == SEND_CMD_CFLIT) || (flit_mux_cntl == SEND_BE_CFLIT)) ?  next_frame_run_length          :  // New Frame starting, load counter
                                       ((flit_mux_cntl == SEND_DATA_FLIT) && ( run_length_countdown > 4'b0000 ))                                    ?  run_length_countdown - 4'b0001 :  // Decrement the count
                                                                                                                                                       run_length_countdown           ;  // No change
    always @ (posedge clock) begin
        if    (!reset_n)  begin  run_length_countdown   <= 4'h0;                      end
        else              begin  run_length_countdown   <= run_length_countdown_nxt;  end
    end






    // ---------------
    // @@@ Frame Sizer
    // ---------------
    // Use the dfsr index to decide how many data flits to send in the next frame.  (Max = 8, Min = 0)
    assign num_dfs_for_next_frame  =  (dfsr_idx_nxt > 5'b01000)  ?  4'b1000           :  // Only send 8 of the DFs that are ready
                                                                    dfsr_idx_nxt[3:0] ;  // Send all the DFs that are ready

    assign next_frame_run_length = (!frame_stall && ((flit_mux_cntl == SEND_RSP_CFLIT) || (flit_mux_cntl == SEND_CMD_CFLIT) || (flit_mux_cntl == SEND_BE_CFLIT))) ? num_dfs_for_next_frame :  // Load new value
                                                                                                                                                                    frame_run_length       ;  // No change
    always @ (posedge clock) begin
        if    (!reset_n)  begin  frame_run_length   <= 4'h0;                    end
        else              begin  frame_run_length   <= next_frame_run_length;   end  // remember the frame length for one cycle so it can be inserted into the output flit at the right time.
    end





    // ---------------
    // @@@ DLX Credit Counter
    // ---------------
    // TLX can only send flits to DLX if DLX has room to capture them.
    // Make this a 4-bit counter.   The max credit count should be "0100" because currently the DLX can only hold 4 flits.

    // Latch the incoming dlx_tlx_flit_credit for timing:
    always @ (posedge clock) begin
        if      (!reset_n)        dlx_tlx_flit_credit_latched   <= 1'b0;
        else                      dlx_tlx_flit_credit_latched   <= dlx_tlx_flit_credit;
    end

    always @ (*) begin
        if      ( power_on_reset )                                          dlxcrd_counter_nxt = {1'b0, dlx_tlx_init_flit_depth};  // Initial load at start or restart
        else if ( !flit_will_be_sent_d2  &&  !dlx_tlx_flit_credit_latched ) dlxcrd_counter_nxt = dlxcrd_counter;                   // No change
        else if ( !flit_will_be_sent_d2  &&   dlx_tlx_flit_credit_latched ) dlxcrd_counter_nxt = dlxcrd_counter + 4'b0001;         // Increment by 1
        else if (  flit_will_be_sent_d2  &&  !dlx_tlx_flit_credit_latched ) dlxcrd_counter_nxt = dlxcrd_counter - 4'b0001;         // Decrement by 1
        else                                                                dlxcrd_counter_nxt = dlxcrd_counter;                   // Both
    end
    always @ (posedge clock) begin
        if      (!reset_n)         dlxcrd_counter  <= 4'h0;
        else                       dlxcrd_counter  <= dlxcrd_counter_nxt;
    end
    always @ (*) begin
        if ((dlxcrd_counter_nxt == 4'b0000) || !dlx_tlx_link_up)  frame_stall = 1'b1 ;   // No DLX credits, stall the frame.
        else                                                      frame_stall = 1'b0 ;
    end


    // ---------------
    // @@@ Control Flit Rate Counter
    // ---------------
    // If a control flit gets sent out to DLX, load the control flit rate counter with the appropriate wait time.

    always @ (*) begin
       if        (rsp_cf_will_be_taken)             // Response CF is going out next
            case (rsp_cntl_flit_reg[465:460])       // Set increment based on template type being sent
                6'b000000 :                                     cf_rate_counter_nxt = {1'b0, template00_flit_rate};
                6'b000001 :                                     cf_rate_counter_nxt = {1'b0, template01_flit_rate};
                6'b000011 :                                     cf_rate_counter_nxt = {1'b0, template03_flit_rate};
                default   :                                     cf_rate_counter_nxt = {1'b0, template00_flit_rate};
            endcase
       else if   (cmd_cf_will_be_taken)             // Command CF is going out next 
            case (cmd_cntl_flit_reg[465:460])       // Set increment based on template type being sent
                6'b000000 :                                     cf_rate_counter_nxt = {1'b0, template00_flit_rate};
                6'b000001 :                                     cf_rate_counter_nxt = {1'b0, template01_flit_rate};
                6'b000011 :                                     cf_rate_counter_nxt = {1'b0, template03_flit_rate};
                default   :                                     cf_rate_counter_nxt = {1'b0, template00_flit_rate};
            endcase
        else if ((cf_rate_counter > 5'b00000) && (be_will_be_taken || df_will_be_taken))
                                                                cf_rate_counter_nxt = cf_rate_counter - 5'b00001;  // Decrement the wait time by 1 cycle.
        else if (cf_rate_counter > 5'b00000)                    cf_rate_counter_nxt = cf_rate_counter;             // Hold counter at current value to preserve spacing in DLX replay buffer.
        else                                                    cf_rate_counter_nxt = 5'b00000;                    // Hold counter at zero.
    end

    always @ (posedge clock) begin
        if      (!reset_n)              cf_rate_counter  <= 5'b00000;
        else                            cf_rate_counter  <= cf_rate_counter_nxt;
    end
    always @ (*) begin
        if (cf_rate_counter > 5'b00000)  must_send_be  = 1'b1 ;   // If the rate counter is not zero, send book end flits to preserve spacing in DLX replay buffer.
        else                             must_send_be  = 1'b0 ;
    end



    // ---------------
    // @@@ Flit Framer State Machine
    // ---------------
    // TLX must send a flit to DLX every cycle unless:
    //      (a) There are no DLX credits (frame_stall is asserted).
    //  or  (b) There is nothing to send AND the rate-limiit counter is down to zero, AND TLX has already sent a bookend flit with run-length = 0.
    // (If the rate-limit counter is not down to zero, TLX will send Null Cmd flits to DLX to preserve the correct spacing in the DLX replay buffer.)
    //
    // Note:  This state machine can stall if there are no DLX credits  (frame_stall=1)
    //        In case of a stall, the FSM stays in the same state for multiple cycles.
    //        All meaningful actions should happen when frame_stall==0.

    // Next state logic
    always @ (*) begin
        toggle = 1'b0;
        case  ( framer_state )
          SEND_NOTHING    :  if ( frame_stall )                                     framer_next_state  =  SEND_NOTHING   ;  // Stall for DLX credits.
                             else if ( must_send_be )                               framer_next_state  =  SEND_BE_CFLIT  ;  // Send book end flits until rate counter expires
                             else if ( !rsp_cf_empty && !cmd_cf_empty)
                                 begin
                                     if (toggle_state)                              framer_next_state  =  SEND_RSP_CFLIT ;
                                     else                                           framer_next_state  =  SEND_CMD_CFLIT ;
                                     toggle = 1'b1;
                                 end
                             else if ( !rsp_cf_empty )                              framer_next_state  =  SEND_RSP_CFLIT ;  // Send Response Control Flit to start new frame
                             else if ( !cmd_cf_empty )                              framer_next_state  =  SEND_CMD_CFLIT ;  // Send Command Control Flit to start new frame
                             else if ( dfsr_idx > 5'b00000 )                        framer_next_state  =  SEND_BE_CFLIT  ;  // Send any remaining data flits.
                             else                                                   framer_next_state  =  SEND_NOTHING   ;  // There is nothing to send

          SEND_RSP_CFLIT  :  if ( frame_stall )                                     framer_next_state  =  SEND_RSP_CFLIT ;  // Stall for DLX credits.
                             else if ( run_length_countdown >  4'b0000 )            framer_next_state  =  SEND_DATA_FLIT ;  // Send data if any
                             else if ( must_send_be )                               framer_next_state  =  SEND_BE_CFLIT  ;  // Send book end flits until rate counter expires
                             else if ( !cmd_cf_empty )                              framer_next_state  =  SEND_CMD_CFLIT ;  // Send Command Control Flit to start new frame
                             else                                                   framer_next_state  =  SEND_NOTHING   ;  // There is nothing to send

          SEND_CMD_CFLIT  :  if ( frame_stall )                                     framer_next_state  =  SEND_CMD_CFLIT ;  // Stall for DLX credits.
                             else if ( run_length_countdown >  4'b0000 )            framer_next_state  =  SEND_DATA_FLIT ;  // Send data if any
                             else if ( must_send_be )                               framer_next_state  =  SEND_BE_CFLIT  ;  // Send book end flits until rate counter expires
                             else if ( !rsp_cf_empty )                              framer_next_state  =  SEND_RSP_CFLIT ;  // Send Response Control Flit to start new frame
                             else                                                   framer_next_state  =  SEND_NOTHING   ;  // There is nothing to send

          SEND_BE_CFLIT   :  if ( frame_stall )                                     framer_next_state  =  SEND_BE_CFLIT  ;  // Stall for DLX credits.
                             else if ( run_length_countdown >  4'b0000 )            framer_next_state  =  SEND_DATA_FLIT ;  // Send data if any
                             else if ( must_send_be )                               framer_next_state  =  SEND_BE_CFLIT  ;  // Send book end flits until rate counter expires
                             else if ( !rsp_cf_empty && !cmd_cf_empty)
                                 begin
                                     if (toggle_state)                              framer_next_state  =  SEND_RSP_CFLIT ;
                                     else                                           framer_next_state  =  SEND_CMD_CFLIT ;
                                     toggle = 1'b1;
                                 end
                             else if ( !rsp_cf_empty )                              framer_next_state  =  SEND_RSP_CFLIT ;  // Send Response Control Flit to start new frame
                             else if ( !cmd_cf_empty )                              framer_next_state  =  SEND_CMD_CFLIT ;  // Send Command Control Flit to start new frame
                             else                                                   framer_next_state  =  SEND_NOTHING   ;  // There is nothing to send

          SEND_DATA_FLIT  :  if ( frame_stall )                                     framer_next_state  =  SEND_DATA_FLIT ;  // Stall for DLX credits.
                             else if ( run_length_countdown >  4'b0000 )            framer_next_state  =  SEND_DATA_FLIT ;  // Send data if any
                             else if ( must_send_be )                               framer_next_state  =  SEND_BE_CFLIT  ;  // Send book end flit to close frame.  Nothing else is allowed
                             else if ( dfsr_idx > 5'b01111 )                        framer_next_state  =  SEND_BE_CFLIT  ;  // Send book end flit to let data flits catch up with cntl flits.
                             else if ( !rsp_cf_empty && !cmd_cf_empty)
                                 begin
                                     if (toggle_state)                              framer_next_state  =  SEND_RSP_CFLIT ;
                                     else                                           framer_next_state  =  SEND_CMD_CFLIT ;
                                     toggle = 1'b1;
                                 end
                             else if ( !rsp_cf_empty )                              framer_next_state  =  SEND_RSP_CFLIT ;  // Send Response Control Flit to close frame and start new one
                             else if ( !cmd_cf_empty )                              framer_next_state  =  SEND_CMD_CFLIT ;  // Send Command Control Flit to close frame and start new one
                             else                                                   framer_next_state  =  SEND_BE_CFLIT  ;  // Send book end flits to close frame.  Nothing else is ready

          default         :  if ( frame_stall )                                     framer_next_state  =  SEND_NOTHING   ;  // Stall for DLX credits.
                             else if ( !rsp_cf_empty )                              framer_next_state  =  SEND_RSP_CFLIT ;  // Send Response Control Flit to start new frame
                             else if ( !cmd_cf_empty )                              framer_next_state  =  SEND_CMD_CFLIT ;  // Send Command Control Flit to start new frame
                             else                                                   framer_next_state  =  SEND_NOTHING   ;  // There is nothing to send
        endcase

        if (toggle)  toggle_din = !toggle_state ;
        else         toggle_din =  toggle_state ;
    end

    // State register
    always @ (posedge clock) begin
        if    (!reset_n)  framer_state   <= SEND_NOTHING ;
        else              framer_state   <= framer_next_state;
        if    (!reset_n)  toggle_state   <= 1'b0 ;
        else              toggle_state   <= toggle_din;
    end



     // ---------------
    // @@@ Flit Framer Control Logic
    // ---------------

    // Use Framer state to drive various interfaces
    assign  flit_mux_cntl  =  framer_next_state ;


    always @ (*) begin

        // Tell Packer FSM that the control flit or a book end control flit will be taken
        // If there is a frame_stall then the CF will not be taken this cycle.
        if (frame_stall)      begin  rsp_cf_will_be_taken = 1'b0;  cmd_cf_will_be_taken = 1'b0;  be_will_be_taken = 1'b0;  df_will_be_taken = 1'b0;  end
        else
          case (flit_mux_cntl)
            SEND_RSP_CFLIT :  begin  rsp_cf_will_be_taken = 1'b1;  cmd_cf_will_be_taken = 1'b0;  be_will_be_taken = 1'b0;  df_will_be_taken = 1'b0;  end
            SEND_CMD_CFLIT :  begin  rsp_cf_will_be_taken = 1'b0;  cmd_cf_will_be_taken = 1'b1;  be_will_be_taken = 1'b0;  df_will_be_taken = 1'b0;  end
            SEND_BE_CFLIT  :  begin  rsp_cf_will_be_taken = 1'b0;  cmd_cf_will_be_taken = 1'b0;  be_will_be_taken = 1'b1;  df_will_be_taken = 1'b0;  end
            SEND_DATA_FLIT :  begin  rsp_cf_will_be_taken = 1'b0;  cmd_cf_will_be_taken = 1'b0;  be_will_be_taken = 1'b0;  df_will_be_taken = 1'b1;  end
            default        :  begin  rsp_cf_will_be_taken = 1'b0;  cmd_cf_will_be_taken = 1'b0;  be_will_be_taken = 1'b0;  df_will_be_taken = 1'b0;  end
          endcase



        // Let the Run Length Counter know if the DFSR is going to shift
        if ( (flit_mux_cntl == SEND_DATA_FLIT) && !frame_stall )      will_shift = 1'b1;  // Let the Run Length Counter know if the DFSR is going to shift
        else                                                          will_shift = 1'b0;

        // Cause the Data Flit Shift Register to shift if a data flit is going.
        if ( (framer_state == SEND_DATA_FLIT) && !frame_was_stalled )  shift = 1'b1;  // Pop bit 0 out of the Data Flit Shift Register next cycle.
        else                                                           shift = 1'b0;

        // Use bit 0 of the Data Flit Shift Register (The bit that will be shifted out) to determine
        //     whether the next data flit should be from DCP0 (response data) or DCP3 (command data)
        if ( (framer_state == SEND_DATA_FLIT) && !frame_was_stalled ) begin
             if (df_shift_reg[0])   begin   send_rsp_dflit = 1'b0;    send_cmd_dflit = 1'b1;    end
             else                   begin   send_rsp_dflit = 1'b1;    send_cmd_dflit = 1'b0;    end
        end
        else                        begin   send_rsp_dflit = 1'b0;    send_cmd_dflit = 1'b0;    end




        // Determine whether or not a flit will be sent to the DLX
        // Fix for cases when reset_n is late.  Oct 10, 2018   M.Fredrickson
        // if  ((flit_mux_cntl == SEND_NOTHING) || !por_off || frame_stall )  flit_will_be_sent = 1'b0;
        if  ((flit_mux_cntl == SEND_NOTHING) || !reset_n || frame_stall )  flit_will_be_sent = 1'b0;
        else                                                               flit_will_be_sent = 1'b1;
    end

    // Latch some signals before feeding them back to the packer FSMs (for timing).
    always @ (posedge clock) begin
        if    (!reset_n)  rsp_cf_was_taken     <= 1'b0;
        else              rsp_cf_was_taken     <= rsp_cf_will_be_taken;
        if    (!reset_n)  cmd_cf_was_taken     <= 1'b0;
        else              cmd_cf_was_taken     <= cmd_cf_will_be_taken;
        //if    (!reset_n)  cmd_cf_was_taken_d1  <= 1'b0;
        //else              cmd_cf_was_taken_d1  <= cmd_cf_was_taken;
    end


    // Latch some signals to delay them for handshaking.
    always @ (posedge clock) begin
        if    (!reset_n)  frame_was_stalled   <= 1'b0;
        else              frame_was_stalled   <= frame_stall;
    end
    // Increment the data FIFO read pointers, and send data credits back to AFU
    assign    read_dcp0_done            =  send_rsp_dflit ;
    assign    read_dcp3_done            =  send_cmd_dflit ;
    assign    tlx_afu_resp_data_credit  =  send_rsp_dflit  &&  !fifo_data_is_cfg_data  ;  // Don't send credit for cfg data.
    assign    tlx_afu_cmd_data_credit   =  send_cmd_dflit ;



    // When valid data will be sent to the DLX, do the following:
    //    Send flit valid signal to DLX
    //    Decrement the DLX flit counter
    always @ (posedge clock) begin
        if    (!reset_n)  flit_will_be_sent_d2   <= 1'b0;
        else              flit_will_be_sent_d2   <= flit_will_be_sent;
        if    (!reset_n)  send_flit_now   <= 1'b0;
        else              send_flit_now   <= flit_will_be_sent_d2;
    end





    // -----------------------------------------------------
    // @@@ ----- DATA FLIT SHIFT REGISTER (DFSR) LOGIC -----
    // -----------------------------------------------------

    // The Data Flit Shift Register is a shift register that is used to remember the data flits that need to be sent to DLX.
    // The information is remembered in the shift register as follows:
    // The number of bits in the shift register which are valid equal the number of data flits which need to be sent to DLX.  This number is "dfsr_idx"
    // The polarity of the valid bits in the shift register specify the virtual channel through which the data flit should be sent.
    //       "0" means the data flit should go through DCP0 (Response Data)
    //       "1" means the data flit should go through DCP3 (Command Data)
    // Valid bits are loaded, broadside, into the shift register when a control flit is taken by the framer.  (This is done by the logic below.)
    // Valid bits are removed from the shift register, one at a time, as the data flits are sent to DLX.
    // The bits are removed from the shift register by shifting all the bits to the right.
    // Bit zero is popped out of the shift register and the corresponding data flit is sent to the DLX.
    // The framer logic below controls the shifting operation as the data flits are put into frames and sent to the DLX.


    // ---------------
    // @@@ DFSR Index
    // ---------------
    // dfsr_idx
    // This index equals the number of valid data flits that need to be sent to the DLX.
    // This index points to the bit in the shift register where the next df_ones_vector will be loaded, broadside, into the shift register
    // When dfsr_idx == 0 the shift register is empty.  (There are no data flits waiting to be sent to DLX.)
    always @ (*) begin

        load_dfsr  =  rsp_cf_will_be_taken  ||  cmd_cf_will_be_taken ;      // Broadside load the dfsr when either a response or command control flit is being taken by the framer
        if      (rsp_cf_will_be_taken)    dfincr  =  rcf_df_count_nxt ;
        else if (cmd_cf_will_be_taken)    dfincr  =  ccf_df_count_nxt ;
        else                          dfincr  =  5'b00000;

        //load_dfsr  =  rsp_cf_was_taken  ||  cmd_cf_was_taken ;      // Broadside load the dfsr when either a response or command control flit is being taken by the framer
        //if      (rsp_cf_was_taken)    dfincr  =  rcf_df_count ;
        //else if (cmd_cf_was_taken)    dfincr  =  ccf_df_count ;
        //else                          dfincr  =  5'b00000;

        if      ( !load_dfsr   &&  !will_shift )  dfsr_idx_nxt  =  dfsr_idx ;                       // No change
        else if ( !load_dfsr   &&   will_shift )  dfsr_idx_nxt  =  dfsr_idx - 5'b00001 ;            // Shift - Decrement index by one
        else if (  load_dfsr   &&  !will_shift )  dfsr_idx_nxt  =  dfsr_idx + dfincr ;              // Load - Increment index by dfincr
        else                                      dfsr_idx_nxt  =  dfsr_idx + dfincr - 5'b00001 ;   // Load and Shift - Increment index by dfincr and decrement by one.
    end
    always @ (posedge clock) begin
        if    (!reset_n)  dfsr_idx   <= 5'b00000;
        else              dfsr_idx   <= dfsr_idx_nxt;
        if    (!reset_n)  dfsr_idx_d1   <= 5'b00000;
        else              dfsr_idx_d1   <= dfsr_idx;  // Delay the dfsr_idx change by one cycle so the DFSR is updated in the correct place.
    end


    // ---------------
    // @@@ Data Flit Shift Register (df_shift_reg) 
    // ---------------
    // If a cmd CF was taken, this logic needs to load into the dfsr the number of bits representing the dataflits of that cmd CF.
    // Command data flits are indicated by "1"s in the DFSR.
    // The appropriate number of "1"s needs to be loaded broadside into the DFSR at the location indicated by dfsr_idx
    always @ (*) begin
        // If a cmd CF was taken by the framer, then this make a vector of '1's to be loaded broadside into the DFSR
        case (ccf_df_count)
        //case (ccf_df_count_d1)
          5'b00000 :   df_ones_vector = 16'b0000000000000000 ;
          5'b00001 :   df_ones_vector = 16'b0000000000000001 ;
          5'b00010 :   df_ones_vector = 16'b0000000000000011 ;
          5'b00011 :   df_ones_vector = 16'b0000000000000111 ;
          5'b00100 :   df_ones_vector = 16'b0000000000001111 ;
          5'b00101 :   df_ones_vector = 16'b0000000000011111 ;
          5'b00110 :   df_ones_vector = 16'b0000000000111111 ;
          5'b00111 :   df_ones_vector = 16'b0000000001111111 ;
          5'b01000 :   df_ones_vector = 16'b0000000011111111 ;
          5'b01001 :   df_ones_vector = 16'b0000000111111111 ;
          5'b01010 :   df_ones_vector = 16'b0000001111111111 ;
          5'b01011 :   df_ones_vector = 16'b0000011111111111 ;
          5'b01100 :   df_ones_vector = 16'b0000111111111111 ;
          5'b01101 :   df_ones_vector = 16'b0001111111111111 ;
          5'b01110 :   df_ones_vector = 16'b0011111111111111 ;
          5'b01111 :   df_ones_vector = 16'b0111111111111111 ;
          5'b10000 :   df_ones_vector = 16'b1111111111111111 ;
          default  :   df_ones_vector = 16'b0000000000000000 ;
        endcase

        case (dfsr_idx_d1)
          5'b00000 :  begin  df_load = {16'h0, df_ones_vector        };  df_shift_load = {16'h0, df_ones_vector       };  end  // df_shift_load should not be used in this case
          5'b00001 :  begin  df_load = {15'h0, df_ones_vector,  1'h0 };  df_shift_load = {16'h0, df_ones_vector       };  end
          5'b00010 :  begin  df_load = {14'h0, df_ones_vector,  2'h0 };  df_shift_load = {15'h0, df_ones_vector,  1'h0};  end
          5'b00011 :  begin  df_load = {13'h0, df_ones_vector,  3'h0 };  df_shift_load = {14'h0, df_ones_vector,  2'h0};  end
          5'b00100 :  begin  df_load = {12'h0, df_ones_vector,  4'h0 };  df_shift_load = {13'h0, df_ones_vector,  3'h0};  end
          5'b00101 :  begin  df_load = {11'h0, df_ones_vector,  5'h0 };  df_shift_load = {12'h0, df_ones_vector,  4'h0};  end
          5'b00110 :  begin  df_load = {10'h0, df_ones_vector,  6'h0 };  df_shift_load = {11'h0, df_ones_vector,  5'h0};  end
          5'b00111 :  begin  df_load = { 9'h0, df_ones_vector,  7'h0 };  df_shift_load = {10'h0, df_ones_vector,  6'h0};  end
          5'b01000 :  begin  df_load = { 8'h0, df_ones_vector,  8'h0 };  df_shift_load = { 9'h0, df_ones_vector,  7'h0};  end
          5'b01001 :  begin  df_load = { 7'h0, df_ones_vector,  9'h0 };  df_shift_load = { 8'h0, df_ones_vector,  8'h0};  end
          5'b01010 :  begin  df_load = { 6'h0, df_ones_vector, 10'h0 };  df_shift_load = { 7'h0, df_ones_vector,  9'h0};  end
          5'b01011 :  begin  df_load = { 5'h0, df_ones_vector, 11'h0 };  df_shift_load = { 6'h0, df_ones_vector, 10'h0};  end
          5'b01100 :  begin  df_load = { 4'h0, df_ones_vector, 12'h0 };  df_shift_load = { 5'h0, df_ones_vector, 11'h0};  end
          5'b01101 :  begin  df_load = { 3'h0, df_ones_vector, 13'h0 };  df_shift_load = { 4'h0, df_ones_vector, 12'h0};  end
          5'b01110 :  begin  df_load = { 2'h0, df_ones_vector, 14'h0 };  df_shift_load = { 3'h0, df_ones_vector, 13'h0};  end
          5'b01111 :  begin  df_load = { 1'h0, df_ones_vector, 15'h0 };  df_shift_load = { 2'h0, df_ones_vector, 14'h0};  end
          5'b10000 :  begin  df_load = {       df_ones_vector, 16'h0 };  df_shift_load = { 1'h0, df_ones_vector, 15'h0};  end
          default  :  begin  df_load = {       df_ones_vector, 16'h0 };  df_shift_load = { 1'h0, df_ones_vector, 15'h0};  end
        endcase

        if      ( !cmd_cf_was_taken  && !shift )  df_shift_reg_din[31:0] = df_shift_reg[31:0] ;                               // No change
        else if ( !cmd_cf_was_taken  &&  shift )  df_shift_reg_din[31:0] = {1'b0,df_shift_reg[31:1]} ;                        // Shift
        else if (  cmd_cf_was_taken  && !shift )  df_shift_reg_din[31:0] = df_shift_reg[31:0]        | df_load[31:0] ;        // Load - broadside load ccf_df_count ones into DFSR
        else                                      df_shift_reg_din[31:0] = {1'b0,df_shift_reg[31:1]} | df_shift_load[31:0] ;  // Load and Shift

        //if      ( !cmd_cf_was_taken_d1  && !shift )  df_shift_reg_din[31:0] = df_shift_reg[31:0] ;                               // No change
        //else if ( !cmd_cf_was_taken_d1  &&  shift )  df_shift_reg_din[31:0] = {1'b0,df_shift_reg[31:1]} ;                        // Shift
        //else if (  cmd_cf_was_taken_d1  && !shift )  df_shift_reg_din[31:0] = df_shift_reg[31:0]        | df_load[31:0] ;        // Load - broadside load ccf_df_count ones into DFSR
        //else                                         df_shift_reg_din[31:0] = {1'b0,df_shift_reg[31:1]} | df_shift_load[31:0] ;  // Load and Shift



        if      (dfsr_idx == 5'b00000  && will_shift )                                              hw_shift_error = 1'b1 ;   // Error, shift register underflow.
        else if ( ({1'b0,dfsr_idx} + {1'b0,ccf_df_count}) >= 6'b100000  && cmd_cf_will_be_taken )   hw_shift_error = 1'b1 ;   // Error, dfsr may not be wide enough to handle data flits from cmd CF.
        else                                                                                        hw_shift_error = 1'b0 ;

    end

    // Data Flit Shift Register
    always @ (posedge clock) begin
        if    (!reset_n)  df_shift_reg  <= 32'h00000000;
        else              df_shift_reg  <= df_shift_reg_din ;
    end




    // -----------------------------------------------------
    // @@@ ----- MISC. LOGIC -----
    // -----------------------------------------------------


    // ---------------
    // @@@ Bad Data Flit Indicator Logic
    // ---------------
    always @ (*) begin
        dflit_is_bad    =  send_cmd_dflit ? dcp3_fifo_output_reg[512] : dcp0_fifo_output_reg[512];
        case ( bdfv_idx[2:0])
          3'b000  :  begin   bdfv_bad_mask = 8'b00000001;  end
          3'b001  :  begin   bdfv_bad_mask = 8'b00000010;  end
          3'b010  :  begin   bdfv_bad_mask = 8'b00000100;  end
          3'b011  :  begin   bdfv_bad_mask = 8'b00001000;  end
          3'b100  :  begin   bdfv_bad_mask = 8'b00010000;  end
          3'b101  :  begin   bdfv_bad_mask = 8'b00100000;  end
          3'b110  :  begin   bdfv_bad_mask = 8'b01000000;  end
          3'b111  :  begin   bdfv_bad_mask = 8'b10000000;  end
          default :  begin   bdfv_bad_mask = 8'b00000000;  end
        endcase

        case  ( framer_state )
          SEND_NOTHING       :   begin
                                                               bad_data_flit_vector_din  =  bad_data_flit_vector ;   // hold value
                                                               bdfv_idx_din              =  bdfv_idx ;               // hold value
                                 end
          SEND_DATA_FLIT     :   begin
                                   if (frame_was_stalled) begin
                                                               bad_data_flit_vector_din  =  bad_data_flit_vector ;   // hold value
                                                               bdfv_idx_din              =  bdfv_idx ;               // hold value
                                   end
                                   else begin
                                          if ( dflit_is_bad )  bad_data_flit_vector_din  =  bad_data_flit_vector  |    bdfv_bad_mask  ;   // Set bit:    bit-wise OR with bad mask
                                          else                 bad_data_flit_vector_din  =  bad_data_flit_vector  &  ~(bdfv_bad_mask) ;   // Clear bit:  bit-wise AND with ~bad mask
                                                               bdfv_idx_din              =  bdfv_idx + 4'b0001 ;      // Increment the index to put the next bit into the next spot.
                                   end
                                 end
          default            :   begin
                                                               bad_data_flit_vector_din  =  8'h0 ;                   // reset vector to zeros, start new frame
                                                               bdfv_idx_din              =  4'h0 ;                   // reset index to zero
                                 end
        endcase
    end

    always @ (posedge clock) begin
        if    (!reset_n)  bad_data_flit_vector   <= 8'h00;
        else              bad_data_flit_vector   <= bad_data_flit_vector_din;
        if    (!reset_n)  bdfv_idx   <= 4'h0;
        else              bdfv_idx   <= bdfv_idx_din;
    end



    // -----------------------------------------------------
    // @@@ ----- DEBUG LOGIC -----
    // -----------------------------------------------------

    // ---------------
    // @@@ Framer Debug Logic
    // ---------------

    assign tlxcrd_overflow_error  =  vc0_tlxcrd_overflow_err  ||  vc3_tlxcrd_overflow_err  ||  dcp0_tlxcrd_overflow_err  ||  dcp3_tlxcrd_overflow_err ;

    assign  detected_error_vector_din  = {
          2'b00                     ,
          tlxcrd_overflow_error     ,
          hw_shift_error            ,
          dcp3_overflow_error       ,
          dcp3_underflow_error      ,
          dcp0_overflow_error       ,
          dcp0_underflow_error      ,
          vc3_overflow_error        ,
          vc3_underflow_error       ,
          vc0_overflow_error        ,
          vc0_underflow_error       ,
          rouge_cmd_data_error      ,
          rouge_rsp_data_error      ,
          cmd_data_missing_error    ,
          rsp_data_missing_error    
    } ;
    always @ (posedge clock) begin   // Add latches here for timing
        if    (!reset_n)  detected_error_vector   <= 16'h0000;
        else              detected_error_vector   <= detected_error_vector_din;
    end

    always @ (*) begin
                  error_0_supp_info_din = {
                                              2'b00,
                                              rsp_data_valid_d1,
                                              afu_reg_resp_valid,
                                              afu_reg_resp_capptag,
                                              afu_reg_resp_opcode
                                            } ;
                  error_1_supp_info_din = {
                                              2'b00,
                                              cmd_data_valid_d1,
                                              afu_reg_cmd_valid,
                                              afu_reg_cmd_afutag,
                                              afu_reg_cmd_opcode
                                            } ;
                  error_2_supp_info_din = {
                                              afu_tlx_rdata_bus[27:0]
                                            } ;
                  error_3_supp_info_din = {
                                              afu_tlx_cdata_bus[27:0]
                                            } ;
                  error_4_supp_info_din = {
                                              vc0_fifo_input_bus[27:0]
                                            } ;
                  error_5_supp_info_din = {
                                              vc0_fifo_input_bus[27:0]
                                            } ;
                  error_6_supp_info_din = {
                                              vc3_fifo_input_bus[27:0]
                                            } ;
                  error_7_supp_info_din = {
                                              vc3_fifo_input_bus[27:0]
                                            } ;
                  error_8_supp_info_din = {
                                              dcp0_fifo_input_bus[27:0]
                                            } ;
                  error_9_supp_info_din = {
                                              dcp0_fifo_input_bus[27:0]
                                            } ;
                  error_A_supp_info_din = {
                                              dcp3_fifo_input_bus[27:0]
                                            } ;
                  error_B_supp_info_din = {
                                              dcp3_fifo_input_bus[27:0]
                                            } ;
                  error_C_supp_info_din = {
                                              21'h0,
                                              cmd_cf_will_be_taken,
                                              will_shift,
                                              dfsr_idx_d1
                                            } ;
                  error_D_supp_info_din = {
                                              11'h000,
                                              dcp3_tlxcrd_overflow_err,
                                              2'b00,
                                              dcp0_tlxcrd_overflow_err,
                                              1'b0,
                                              vc3_tlxcrd_overflow_err,
                                              2'b00,
                                              vc0_tlxcrd_overflow_err,
                                              8'b00000001                 // Error signature and Opcode for TLX credit return from TL
                                            } ;
     end
     always @ (posedge clock) begin   // Add latches here for timing
        if    (!reset_n)  error_0_supp_info   <= 28'h0000000;
        else              error_0_supp_info   <= error_0_supp_info_din;
        if    (!reset_n)  error_1_supp_info   <= 28'h0000000;
        else              error_1_supp_info   <= error_1_supp_info_din;
        if    (!reset_n)  error_2_supp_info   <= 28'h0000000;
        else              error_2_supp_info   <= error_2_supp_info_din;
        if    (!reset_n)  error_3_supp_info   <= 28'h0000000;
        else              error_3_supp_info   <= error_3_supp_info_din;
        if    (!reset_n)  error_4_supp_info   <= 28'h0000000;
        else              error_4_supp_info   <= error_4_supp_info_din;
        if    (!reset_n)  error_5_supp_info   <= 28'h0000000;
        else              error_5_supp_info   <= error_5_supp_info_din;
        if    (!reset_n)  error_6_supp_info   <= 28'h0000000;
        else              error_6_supp_info   <= error_6_supp_info_din;
        if    (!reset_n)  error_7_supp_info   <= 28'h0000000;
        else              error_7_supp_info   <= error_7_supp_info_din;
        if    (!reset_n)  error_8_supp_info   <= 28'h0000000;
        else              error_8_supp_info   <= error_8_supp_info_din;
        if    (!reset_n)  error_9_supp_info   <= 28'h0000000;
        else              error_9_supp_info   <= error_9_supp_info_din;
        if    (!reset_n)  error_A_supp_info   <= 28'h0000000;
        else              error_A_supp_info   <= error_A_supp_info_din;
        if    (!reset_n)  error_B_supp_info   <= 28'h0000000;
        else              error_B_supp_info   <= error_B_supp_info_din;
        if    (!reset_n)  error_C_supp_info   <= 28'h0000000;
        else              error_C_supp_info   <= error_C_supp_info_din;
        if    (!reset_n)  error_D_supp_info   <= 28'h0000000;
        else              error_D_supp_info   <= error_D_supp_info_din;
    end

    // Define and encode and supplemental info to go with each type of detected error.
    always @ (*) begin
        casex (detected_error_vector)
            16'b0000000000000001  :  // rsp_data_missing_error   - Error 0 detected
                begin
                  detected_error_encode   = 4'b0000 ;
                  supplemental_error_info = error_0_supp_info ;
                  error_fatal_flag        = 1'b1 ;
                  error_valid_flag        = 1'b1 ;
                end
            16'b000000000000001x  :  // cmd_data_missing_error   - Error 1 detected
                begin
                  detected_error_encode   = 4'b0001 ;
                  supplemental_error_info = error_1_supp_info ;
                  error_fatal_flag        = 1'b1 ;
                  error_valid_flag        = 1'b1 ;
                end
            16'b00000000000001xx  :  // rouge_rsp_data_error     - Error 2 detected
                begin
                  detected_error_encode   = 4'b0010 ;
                  supplemental_error_info = error_2_supp_info ;
                  error_fatal_flag        = 1'b1 ;
                  error_valid_flag        = 1'b1 ;
                end
            16'b0000000000001xxx  :  // rouge_cmd_data_error     - Error 3 detected
                begin
                  detected_error_encode   = 4'b0011 ;
                  supplemental_error_info = error_3_supp_info ;
                  error_fatal_flag        = 1'b1 ;
                  error_valid_flag        = 1'b1 ;
                end
            16'b000000000001xxxx  :  // vc0_underflow_error      - Error 4 detected
                begin
                  detected_error_encode   = 4'b0100 ;
                  supplemental_error_info = error_4_supp_info ;
                  error_fatal_flag        = 1'b1 ;
                  error_valid_flag        = 1'b1 ;
                end
            16'b00000000001xxxxx  :  // vc0_overflow_error       - Error 5 detected
                begin
                  detected_error_encode   = 4'b0101 ;
                  supplemental_error_info = error_5_supp_info ;
                  error_fatal_flag        = 1'b1 ;
                  error_valid_flag        = 1'b1 ;
                end
            16'b0000000001xxxxxx  :  // vc3_underflow_error      - Error 6 detected
                begin
                  detected_error_encode   = 4'b0110 ;
                  supplemental_error_info = error_6_supp_info ;
                  error_fatal_flag        = 1'b1 ;
                  error_valid_flag        = 1'b1 ;
                end
            16'b000000001xxxxxxx  :  // vc3_overflow_error       - Error 7 detected
                begin
                  detected_error_encode   = 4'b0111 ;
                  supplemental_error_info = error_7_supp_info ;
                  error_fatal_flag        = 1'b1 ;
                  error_valid_flag        = 1'b1 ;
                end
            16'b00000001xxxxxxxx  :  // dcp0_underflow_error     - Error 8 detected
                begin
                  detected_error_encode   = 4'b1000 ;
                  supplemental_error_info = error_8_supp_info ;
                  error_fatal_flag        = 1'b1 ;
                  error_valid_flag        = 1'b1 ;
                end
            16'b0000001xxxxxxxxx  :  // dcp0_overflow_error      - Error 9 detected
                begin
                  detected_error_encode   = 4'b1001 ;
                  supplemental_error_info = error_9_supp_info ;
                  error_fatal_flag        = 1'b1 ;
                  error_valid_flag        = 1'b1 ;
                end
            16'b000001xxxxxxxxxx  :  // dcp3_underflow_error     - Error A detected
                begin
                  detected_error_encode   = 4'b1010 ;
                  supplemental_error_info = error_A_supp_info ;
                  error_fatal_flag        = 1'b1 ;
                  error_valid_flag        = 1'b1 ;
                end
            16'b00001xxxxxxxxxxx  :  // dcp3_overflow_error      - Error B detected
                begin
                  detected_error_encode   = 4'b1011 ;
                  supplemental_error_info = error_B_supp_info ;
                  error_fatal_flag        = 1'b1 ;
                  error_valid_flag        = 1'b1 ;
                end
            16'b0001xxxxxxxxxxxx  :  // hw_shift_error           - Error C detected
                begin
                  detected_error_encode   = 4'b1100 ;
                  supplemental_error_info = error_C_supp_info ;
                  error_fatal_flag        = 1'b0 ;
                  error_valid_flag        = 1'b1 ;
                end
            16'b001xxxxxxxxxxxxx  :  // tlxcrd_overflow_error      - Error D detected
                begin
                  detected_error_encode   = 4'b1101 ;
                  supplemental_error_info = error_D_supp_info ;
                  error_fatal_flag        = 1'b1 ;
                  error_valid_flag        = 1'b1 ;
                end
            16'b01xxxxxxxxxxxxxx  :  //                          - Error E detected
                begin
                  detected_error_encode   = 4'b1110 ;
                  supplemental_error_info = 28'h0000000 ;
                  error_fatal_flag        = 1'b0 ;
                  error_valid_flag        = 1'b1 ;
                end
            16'b1xxxxxxxxxxxxxxx  :  //                          - Error F detected
                begin
                  detected_error_encode   = 4'b1111 ;
                  supplemental_error_info = 28'h0000000 ;
                  error_fatal_flag        = 1'b0 ;
                  error_valid_flag        = 1'b1 ;
                end
            default               :  //                          - No error detected
                begin
                  detected_error_encode   = 4'b0000 ;
                  supplemental_error_info = 28'h0000000 ;
                  error_fatal_flag        = 1'b0 ;
                  error_valid_flag        = 1'b0 ;
                end
        endcase


        // Use a sticky register to remember the Framer debug info
        if  (clear_sticky_debug_info)     // Clear out the debug regs.
            begin
                framer_debug_info_din   =  32'h00000000  ;  // 32-bit debug bus from TLX Framer
                framer_debug_fatal_din  =   1'b0         ;  // Indicates that a fatal error was seen in the AFU (if valid is also asserted)
                framer_debug_valid_din  =   1'b0         ;  // Indicates that framer_debug_info and framer_debug_fatal are valid
            end
        else if  (framer_debug_valid)    // Debug info has already been captured, so don't change the values
            begin
                framer_debug_info_din   =  framer_debug_info  ;  // 32-bit debug bus from TLX Framer
                framer_debug_fatal_din  =  framer_debug_fatal ;  // Indicates that a fatal error was seen in the AFU (if valid is also asserted)
                framer_debug_valid_din  =  framer_debug_valid ;  // Indicates that framer_debug_info and framer_debug_fatal are valid
            end
        else if  (!error_valid_flag)     // No new error has been detected
            begin
                framer_debug_info_din   =  32'h00000000  ;  // 32-bit debug bus from TLX Framer
                framer_debug_fatal_din  =   1'b0         ;  // Indicates that a fatal error was seen in the AFU (if valid is also asserted)
                framer_debug_valid_din  =   1'b0         ;  // Indicates that framer_debug_info and framer_debug_fatal are valid
            end
        else                             // A new error has been detected, so capture the debug info.
            begin
                framer_debug_info_din   =  {supplemental_error_info, detected_error_encode}  ;  // 32-bit debug bus from TLX Framer
                framer_debug_fatal_din  =  error_fatal_flag  ;                                  // Indicates that a fatal error was seen in the AFU (if valid is also asserted)
                framer_debug_valid_din  =  error_valid_flag  ;                                  // Indicates that framer_debug_info and framer_debug_fatal are valid
            end
    end

    // These are sticky registers, once they capture debug info, they hold the value until they are cleared.
    always @ (posedge clock) begin
        if    (!reset_n)  framer_debug_info    <=  32'h00000000;
        else              framer_debug_info    <=  framer_debug_info_din ;
        if    (!reset_n)  framer_debug_fatal   <=  1'b0;
        else              framer_debug_fatal   <=  framer_debug_fatal_din ;
        if    (!reset_n)  framer_debug_valid   <=  1'b0;
        else              framer_debug_valid   <=  framer_debug_valid_din ;
    end



    // ---------------
    // @@@ TLX Debug Logic
    // ---------------
    // The outputs of this logic are:
    //     tlx_dlx_debug_info[31:0]  -- 32-bit debug bus going to DLX.  Contains debug info defined by AFU, TLX Parser, or TLX Framer.
    //     tlx_dlx_debug_encode[3:0] -- bit[0] indicates that a fatal error was detected
    //                                  bit[1] indicates that the debug bus and fatal error indicator are coming from the AFU.
    //                                  bit[2] indicates that the debug bus and fatal error indicator are coming from the TLX Parser.
    //                                  bit[3] indicates that the debug bus and fatal error indicator are coming from the TLX Framer.
    //
    // The inputs to this logic are:
    //     afu_tlx_debug_info[31:0]  -- 32-bit debug bus from AFU
    //     afu_tlx_debug_fatal       -- Indicates that a fatal error was seen in the AFU (if valid is also asserted)
    //     afu_tlx_debug_valid       -- Indicates that afu_tlx_debug_info and afu_tlx_debug_fatal are valid
    //     rcv_xmt_debug_info[31:0]  -- 32-bit debug bus from TLX Parser
    //     rcv_xmt_debug_fatal       -- Indicates that a fatal error was seen in the AFU (if valid is also asserted)
    //     rcv_xmt_debug_valid       -- Indicates that rcv_xmt_debug_info and rcv_xmt_debug_fatal are valid
    //     framer_debug_info[31:0]   -- 32-bit debug bus from TLX Framer
    //     framer_debug_fatal        -- Indicates that a fatal error was seen in the AFU (if valid is also asserted)
    //     framer_debug_valid        -- Indicates that framer_debug_info and framer_debug_fatal are valid
    //     clear_sticky_debug_info   -- Resets the debug output registers or lets them capture a new value.

    // Currently we do not have these interfaces in the logic, so temporarily drive them to zero.
    assign  afu_tlx_debug_info  =  32'h00000000 ;          // TODO - get this from the AFU.
    assign  afu_tlx_debug_fatal =  1'b0 ;                  // TODO - get this from the AFU.
    assign  afu_tlx_debug_valid =  1'b0 ;                  // TODO - get this from the AFU.
    assign  clear_sticky_debug_info = dlx_tlx_dlx_config_info[31];

    always @ (*) begin
        if ( latched_debug_encode[1]  ||  latched_debug_encode[2]  ||  latched_debug_encode[3] )  debug_reg_is_full = 1'b1 ;
        else                                                                                      debug_reg_is_full = 1'b0 ;


        if ( debug_reg_is_full && !clear_sticky_debug_info )  // Debug output has already been captured, so hold it until it is cleared.
                    begin
                        capture_afu_dbg_info    = 1'b0 ;
                        capture_rcv_dbg_info    = 1'b0 ;
                        capture_framer_dbg_info = 1'b0 ;
                        capture_zero_dbg_info   = 1'b0 ;
                    end
        else begin
                if       (afu_tlx_debug_valid && afu_tlx_debug_fatal )  // Fatal error from AFU
                    begin
                        capture_afu_dbg_info    = 1'b1 ;
                        capture_rcv_dbg_info    = 1'b0 ;
                        capture_framer_dbg_info = 1'b0 ;
                        capture_zero_dbg_info   = 1'b0 ;
                    end
                else if  (framer_debug_valid  && framer_debug_fatal  )  // Fatal error from TLX Framer
                    begin
                        capture_afu_dbg_info    = 1'b0 ;
                        capture_rcv_dbg_info    = 1'b0 ;
                        capture_framer_dbg_info = 1'b1 ;
                        capture_zero_dbg_info   = 1'b0 ;
                    end
                else if  (rcv_xmt_debug_valid && rcv_xmt_debug_fatal )  // Fatal error from TLX Parser
                    begin
                        capture_afu_dbg_info    = 1'b0 ;
                        capture_rcv_dbg_info    = 1'b1 ;
                        capture_framer_dbg_info = 1'b0 ;
                        capture_zero_dbg_info   = 1'b0 ;
                    end
                else if  (afu_tlx_debug_valid )                         // Non-fatal debug from AFU
                    begin
                        capture_afu_dbg_info    = 1'b1 ;
                        capture_rcv_dbg_info    = 1'b0 ;
                        capture_framer_dbg_info = 1'b0 ;
                        capture_zero_dbg_info   = 1'b0 ;
                    end
                else if  (framer_debug_valid  )                         // Non-fatal debug from TLX Framer
                    begin
                        capture_afu_dbg_info    = 1'b0 ;
                        capture_rcv_dbg_info    = 1'b0 ;
                        capture_framer_dbg_info = 1'b1 ;
                        capture_zero_dbg_info   = 1'b0 ;
                    end
                else if  (rcv_xmt_debug_valid )                         // Non-fatal debug from TLX Parser
                    begin
                        capture_afu_dbg_info    = 1'b0 ;
                        capture_rcv_dbg_info    = 1'b1 ;
                        capture_framer_dbg_info = 1'b0 ;
                        capture_zero_dbg_info   = 1'b0 ;
                    end
                else                                                    // No valid debug info, so capture zeros
                    begin
                        capture_afu_dbg_info    = 1'b0 ;
                        capture_rcv_dbg_info    = 1'b0 ;
                        capture_framer_dbg_info = 1'b0 ;
                        capture_zero_dbg_info   = 1'b1 ;
                    end
            end


        if      (capture_afu_dbg_info)    begin  debug_info_din = afu_tlx_debug_info ;   debug_encode_din = {3'b001, afu_tlx_debug_fatal} ;  end
        else if (capture_rcv_dbg_info)    begin  debug_info_din = rcv_xmt_debug_info ;   debug_encode_din = {3'b010, rcv_xmt_debug_fatal} ;  end
        else if (capture_framer_dbg_info) begin  debug_info_din = framer_debug_info  ;   debug_encode_din = {3'b100, framer_debug_fatal}  ;  end
        else if (capture_zero_dbg_info)   begin  debug_info_din = 32'h00000000       ;   debug_encode_din = 4'b0000                       ;  end
        else                              begin  debug_info_din = latched_debug_info ;   debug_encode_din = latched_debug_encode          ;  end
    end

    // These are sticky registers, once they capture debug info, they hold the value until they are cleared.
    always @ (posedge clock) begin
        if    (!reset_n)  latched_debug_info    <=  32'h00000000;
        else              latched_debug_info    <=  debug_info_din ;
        if    (!reset_n)  latched_debug_encode  <=  4'h0;
        else              latched_debug_encode  <=  debug_encode_din ;
    end
    assign   tlx_dlx_debug_info       =  latched_debug_info ;
    assign   tlx_dlx_debug_encode     =  latched_debug_encode ;



endmodule  // ocx_tlx_framer
