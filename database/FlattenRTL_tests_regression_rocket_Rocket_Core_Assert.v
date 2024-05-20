// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module RocketTile #(
        parameter tlMasterXbar__monitor__plusarg_reader__DEFAULT=0,
        parameter tlMasterXbar__monitor__plusarg_reader__FORMAT="tilelink_timeout=%d",
        parameter tlMasterXbar__monitor__plusarg_reader__WIDTH=32,
        parameter tlMasterXbar__monitor__plusarg_reader_1__DEFAULT=0,
        parameter tlMasterXbar__monitor__plusarg_reader_1__FORMAT="tilelink_timeout=%d",
        parameter tlMasterXbar__monitor__plusarg_reader_1__WIDTH=32,
        parameter tlMasterXbar__monitor_1__plusarg_reader__DEFAULT=0,
        parameter tlMasterXbar__monitor_1__plusarg_reader__FORMAT="tilelink_timeout=%d",
        parameter tlMasterXbar__monitor_1__plusarg_reader__WIDTH=32,
        parameter tlMasterXbar__monitor_1__plusarg_reader_1__DEFAULT=0,
        parameter tlMasterXbar__monitor_1__plusarg_reader_1__FORMAT="tilelink_timeout=%d",
        parameter tlMasterXbar__monitor_1__plusarg_reader_1__WIDTH=32,
        parameter core__PlusArgTimeout__plusarg_reader__DEFAULT=0,
        parameter core__PlusArgTimeout__plusarg_reader__FORMAT="max_core_cycles=%d",
        parameter core__PlusArgTimeout__plusarg_reader__WIDTH=32) (
            input clock,
            input reset,
            input auto_buffer_out_a_ready,
            output auto_buffer_out_a_valid,
            output [2:0] auto_buffer_out_a_bits_opcode,
            output [2:0] auto_buffer_out_a_bits_param,
            output [3:0] auto_buffer_out_a_bits_size,
            output [1:0] auto_buffer_out_a_bits_source,
            output [31:0] auto_buffer_out_a_bits_address,
            output [7:0] auto_buffer_out_a_bits_mask,
            output [63:0] auto_buffer_out_a_bits_data,
            output auto_buffer_out_b_ready,
            input auto_buffer_out_b_valid,
            input [2:0] auto_buffer_out_b_bits_opcode,
            input [1:0] auto_buffer_out_b_bits_param,
            input [3:0] auto_buffer_out_b_bits_size,
            input [1:0] auto_buffer_out_b_bits_source,
            input [31:0] auto_buffer_out_b_bits_address,
            input [7:0] auto_buffer_out_b_bits_mask,
            input auto_buffer_out_b_bits_corrupt,
            input auto_buffer_out_c_ready,
            output auto_buffer_out_c_valid,
            output [2:0] auto_buffer_out_c_bits_opcode,
            output [2:0] auto_buffer_out_c_bits_param,
            output [3:0] auto_buffer_out_c_bits_size,
            output [1:0] auto_buffer_out_c_bits_source,
            output [31:0] auto_buffer_out_c_bits_address,
            output [63:0] auto_buffer_out_c_bits_data,
            output auto_buffer_out_d_ready,
            input auto_buffer_out_d_valid,
            input [2:0] auto_buffer_out_d_bits_opcode,
            input [1:0] auto_buffer_out_d_bits_param,
            input [3:0] auto_buffer_out_d_bits_size,
            input [1:0] auto_buffer_out_d_bits_source,
            input [1:0] auto_buffer_out_d_bits_sink,
            input auto_buffer_out_d_bits_denied,
            input [63:0] auto_buffer_out_d_bits_data,
            input auto_buffer_out_d_bits_corrupt,
            input auto_buffer_out_e_ready,
            output auto_buffer_out_e_valid,
            output [1:0] auto_buffer_out_e_bits_sink,
            output auto_wfi_out_0,
            input auto_int_local_in_2_0,
            input auto_int_local_in_1_0,
            input auto_int_local_in_1_1,
            input auto_int_local_in_0_0,
            input auto_hartid_in) ;
    wire _core_io_imem_might_request ;
    wire _core_io_imem_req_valid ;
    wire [33:0] _core_io_imem_req_bits_pc ;
    wire _core_io_imem_req_bits_speculative ;
    wire _core_io_imem_resp_ready ;
    wire _core_io_imem_btb_update_valid ;
    wire _core_io_imem_bht_update_valid ;
    wire _core_io_imem_flush_icache ;
    wire _core_io_dmem_req_valid ;
    wire [33:0] _core_io_dmem_req_bits_addr ;
    wire [5:0] _core_io_dmem_req_bits_tag ;
    wire [4:0] _core_io_dmem_req_bits_cmd ;
    wire [1:0] _core_io_dmem_req_bits_size ;
    wire _core_io_dmem_req_bits_signed ;
    wire _core_io_dmem_req_bits_dv ;
    wire _core_io_dmem_s1_kill ;
    wire [63:0] _core_io_dmem_s1_data_data ;
    wire _core_io_ptw_status_debug ;
    wire _core_io_ptw_pmp_cfg_l_0 ;
    wire _core_io_ptw_pmp_cfg_l_1 ;
    wire _core_io_ptw_pmp_cfg_l_2 ;
    wire _core_io_ptw_pmp_cfg_l_3 ;
    wire _core_io_ptw_pmp_cfg_l_4 ;
    wire _core_io_ptw_pmp_cfg_l_5 ;
    wire _core_io_ptw_pmp_cfg_l_6 ;
    wire _core_io_ptw_pmp_cfg_l_7 ;
    wire [1:0] _core_io_ptw_pmp_cfg_a_0 ;
    wire [1:0] _core_io_ptw_pmp_cfg_a_1 ;
    wire [1:0] _core_io_ptw_pmp_cfg_a_2 ;
    wire [1:0] _core_io_ptw_pmp_cfg_a_3 ;
    wire [1:0] _core_io_ptw_pmp_cfg_a_4 ;
    wire [1:0] _core_io_ptw_pmp_cfg_a_5 ;
    wire [1:0] _core_io_ptw_pmp_cfg_a_6 ;
    wire [1:0] _core_io_ptw_pmp_cfg_a_7 ;
    wire _core_io_ptw_pmp_cfg_x_0 ;
    wire _core_io_ptw_pmp_cfg_x_1 ;
    wire _core_io_ptw_pmp_cfg_x_2 ;
    wire _core_io_ptw_pmp_cfg_x_3 ;
    wire _core_io_ptw_pmp_cfg_x_4 ;
    wire _core_io_ptw_pmp_cfg_x_5 ;
    wire _core_io_ptw_pmp_cfg_x_6 ;
    wire _core_io_ptw_pmp_cfg_x_7 ;
    wire _core_io_ptw_pmp_cfg_w_0 ;
    wire _core_io_ptw_pmp_cfg_w_1 ;
    wire _core_io_ptw_pmp_cfg_w_2 ;
    wire _core_io_ptw_pmp_cfg_w_3 ;
    wire _core_io_ptw_pmp_cfg_w_4 ;
    wire _core_io_ptw_pmp_cfg_w_5 ;
    wire _core_io_ptw_pmp_cfg_w_6 ;
    wire _core_io_ptw_pmp_cfg_w_7 ;
    wire _core_io_ptw_pmp_cfg_r_0 ;
    wire _core_io_ptw_pmp_cfg_r_1 ;
    wire _core_io_ptw_pmp_cfg_r_2 ;
    wire _core_io_ptw_pmp_cfg_r_3 ;
    wire _core_io_ptw_pmp_cfg_r_4 ;
    wire _core_io_ptw_pmp_cfg_r_5 ;
    wire _core_io_ptw_pmp_cfg_r_6 ;
    wire _core_io_ptw_pmp_cfg_r_7 ;
    wire [29:0] _core_io_ptw_pmp_addr_0 ;
    wire [29:0] _core_io_ptw_pmp_addr_1 ;
    wire [29:0] _core_io_ptw_pmp_addr_2 ;
    wire [29:0] _core_io_ptw_pmp_addr_3 ;
    wire [29:0] _core_io_ptw_pmp_addr_4 ;
    wire [29:0] _core_io_ptw_pmp_addr_5 ;
    wire [29:0] _core_io_ptw_pmp_addr_6 ;
    wire [29:0] _core_io_ptw_pmp_addr_7 ;
    wire [31:0] _core_io_ptw_pmp_mask_0 ;
    wire [31:0] _core_io_ptw_pmp_mask_1 ;
    wire [31:0] _core_io_ptw_pmp_mask_2 ;
    wire [31:0] _core_io_ptw_pmp_mask_3 ;
    wire [31:0] _core_io_ptw_pmp_mask_4 ;
    wire [31:0] _core_io_ptw_pmp_mask_5 ;
    wire [31:0] _core_io_ptw_pmp_mask_6 ;
    wire [31:0] _core_io_ptw_pmp_mask_7 ;
    wire [63:0] _core_io_ptw_customCSRs_csrs_0_value ;
    wire _core_io_wfi ;
    wire _ptw_io_requestor_0_status_debug ;
    wire _ptw_io_requestor_0_pmp_cfg_l_0 ;
    wire _ptw_io_requestor_0_pmp_cfg_l_1 ;
    wire _ptw_io_requestor_0_pmp_cfg_l_2 ;
    wire _ptw_io_requestor_0_pmp_cfg_l_3 ;
    wire _ptw_io_requestor_0_pmp_cfg_l_4 ;
    wire _ptw_io_requestor_0_pmp_cfg_l_5 ;
    wire _ptw_io_requestor_0_pmp_cfg_l_6 ;
    wire _ptw_io_requestor_0_pmp_cfg_l_7 ;
    wire [1:0] _ptw_io_requestor_0_pmp_cfg_a_0 ;
    wire [1:0] _ptw_io_requestor_0_pmp_cfg_a_1 ;
    wire [1:0] _ptw_io_requestor_0_pmp_cfg_a_2 ;
    wire [1:0] _ptw_io_requestor_0_pmp_cfg_a_3 ;
    wire [1:0] _ptw_io_requestor_0_pmp_cfg_a_4 ;
    wire [1:0] _ptw_io_requestor_0_pmp_cfg_a_5 ;
    wire [1:0] _ptw_io_requestor_0_pmp_cfg_a_6 ;
    wire [1:0] _ptw_io_requestor_0_pmp_cfg_a_7 ;
    wire _ptw_io_requestor_0_pmp_cfg_w_0 ;
    wire _ptw_io_requestor_0_pmp_cfg_w_1 ;
    wire _ptw_io_requestor_0_pmp_cfg_w_2 ;
    wire _ptw_io_requestor_0_pmp_cfg_w_3 ;
    wire _ptw_io_requestor_0_pmp_cfg_w_4 ;
    wire _ptw_io_requestor_0_pmp_cfg_w_5 ;
    wire _ptw_io_requestor_0_pmp_cfg_w_6 ;
    wire _ptw_io_requestor_0_pmp_cfg_w_7 ;
    wire _ptw_io_requestor_0_pmp_cfg_r_0 ;
    wire _ptw_io_requestor_0_pmp_cfg_r_1 ;
    wire _ptw_io_requestor_0_pmp_cfg_r_2 ;
    wire _ptw_io_requestor_0_pmp_cfg_r_3 ;
    wire _ptw_io_requestor_0_pmp_cfg_r_4 ;
    wire _ptw_io_requestor_0_pmp_cfg_r_5 ;
    wire _ptw_io_requestor_0_pmp_cfg_r_6 ;
    wire _ptw_io_requestor_0_pmp_cfg_r_7 ;
    wire [29:0] _ptw_io_requestor_0_pmp_addr_0 ;
    wire [29:0] _ptw_io_requestor_0_pmp_addr_1 ;
    wire [29:0] _ptw_io_requestor_0_pmp_addr_2 ;
    wire [29:0] _ptw_io_requestor_0_pmp_addr_3 ;
    wire [29:0] _ptw_io_requestor_0_pmp_addr_4 ;
    wire [29:0] _ptw_io_requestor_0_pmp_addr_5 ;
    wire [29:0] _ptw_io_requestor_0_pmp_addr_6 ;
    wire [29:0] _ptw_io_requestor_0_pmp_addr_7 ;
    wire [31:0] _ptw_io_requestor_0_pmp_mask_0 ;
    wire [31:0] _ptw_io_requestor_0_pmp_mask_1 ;
    wire [31:0] _ptw_io_requestor_0_pmp_mask_2 ;
    wire [31:0] _ptw_io_requestor_0_pmp_mask_3 ;
    wire [31:0] _ptw_io_requestor_0_pmp_mask_4 ;
    wire [31:0] _ptw_io_requestor_0_pmp_mask_5 ;
    wire [31:0] _ptw_io_requestor_0_pmp_mask_6 ;
    wire [31:0] _ptw_io_requestor_0_pmp_mask_7 ;
    wire _ptw_io_requestor_1_status_debug ;
    wire _ptw_io_requestor_1_pmp_cfg_l_0 ;
    wire _ptw_io_requestor_1_pmp_cfg_l_1 ;
    wire _ptw_io_requestor_1_pmp_cfg_l_2 ;
    wire _ptw_io_requestor_1_pmp_cfg_l_3 ;
    wire _ptw_io_requestor_1_pmp_cfg_l_4 ;
    wire _ptw_io_requestor_1_pmp_cfg_l_5 ;
    wire _ptw_io_requestor_1_pmp_cfg_l_6 ;
    wire _ptw_io_requestor_1_pmp_cfg_l_7 ;
    wire [1:0] _ptw_io_requestor_1_pmp_cfg_a_0 ;
    wire [1:0] _ptw_io_requestor_1_pmp_cfg_a_1 ;
    wire [1:0] _ptw_io_requestor_1_pmp_cfg_a_2 ;
    wire [1:0] _ptw_io_requestor_1_pmp_cfg_a_3 ;
    wire [1:0] _ptw_io_requestor_1_pmp_cfg_a_4 ;
    wire [1:0] _ptw_io_requestor_1_pmp_cfg_a_5 ;
    wire [1:0] _ptw_io_requestor_1_pmp_cfg_a_6 ;
    wire [1:0] _ptw_io_requestor_1_pmp_cfg_a_7 ;
    wire _ptw_io_requestor_1_pmp_cfg_x_0 ;
    wire _ptw_io_requestor_1_pmp_cfg_x_1 ;
    wire _ptw_io_requestor_1_pmp_cfg_x_2 ;
    wire _ptw_io_requestor_1_pmp_cfg_x_3 ;
    wire _ptw_io_requestor_1_pmp_cfg_x_4 ;
    wire _ptw_io_requestor_1_pmp_cfg_x_5 ;
    wire _ptw_io_requestor_1_pmp_cfg_x_6 ;
    wire _ptw_io_requestor_1_pmp_cfg_x_7 ;
    wire [29:0] _ptw_io_requestor_1_pmp_addr_0 ;
    wire [29:0] _ptw_io_requestor_1_pmp_addr_1 ;
    wire [29:0] _ptw_io_requestor_1_pmp_addr_2 ;
    wire [29:0] _ptw_io_requestor_1_pmp_addr_3 ;
    wire [29:0] _ptw_io_requestor_1_pmp_addr_4 ;
    wire [29:0] _ptw_io_requestor_1_pmp_addr_5 ;
    wire [29:0] _ptw_io_requestor_1_pmp_addr_6 ;
    wire [29:0] _ptw_io_requestor_1_pmp_addr_7 ;
    wire [31:0] _ptw_io_requestor_1_pmp_mask_0 ;
    wire [31:0] _ptw_io_requestor_1_pmp_mask_1 ;
    wire [31:0] _ptw_io_requestor_1_pmp_mask_2 ;
    wire [31:0] _ptw_io_requestor_1_pmp_mask_3 ;
    wire [31:0] _ptw_io_requestor_1_pmp_mask_4 ;
    wire [31:0] _ptw_io_requestor_1_pmp_mask_5 ;
    wire [31:0] _ptw_io_requestor_1_pmp_mask_6 ;
    wire [31:0] _ptw_io_requestor_1_pmp_mask_7 ;
    wire [63:0] _ptw_io_requestor_1_customCSRs_csrs_0_value ;
    wire _dcacheArb_io_requestor_0_req_ready ;
    wire _dcacheArb_io_requestor_0_s2_nack ;
    wire _dcacheArb_io_requestor_0_resp_valid ;
    wire [5:0] _dcacheArb_io_requestor_0_resp_bits_tag ;
    wire [63:0] _dcacheArb_io_requestor_0_resp_bits_data ;
    wire _dcacheArb_io_requestor_0_resp_bits_replay ;
    wire _dcacheArb_io_requestor_0_resp_bits_has_data ;
    wire [63:0] _dcacheArb_io_requestor_0_resp_bits_data_word_bypass ;
    wire _dcacheArb_io_requestor_0_replay_next ;
    wire _dcacheArb_io_requestor_0_s2_xcpt_ma_ld ;
    wire _dcacheArb_io_requestor_0_s2_xcpt_ma_st ;
    wire _dcacheArb_io_requestor_0_s2_xcpt_pf_ld ;
    wire _dcacheArb_io_requestor_0_s2_xcpt_pf_st ;
    wire _dcacheArb_io_requestor_0_s2_xcpt_ae_ld ;
    wire _dcacheArb_io_requestor_0_s2_xcpt_ae_st ;
    wire _dcacheArb_io_requestor_0_ordered ;
    wire _dcacheArb_io_requestor_0_perf_release ;
    wire _dcacheArb_io_requestor_0_perf_grant ;
    wire _dcacheArb_io_mem_req_valid ;
    wire [33:0] _dcacheArb_io_mem_req_bits_addr ;
    wire [5:0] _dcacheArb_io_mem_req_bits_tag ;
    wire [4:0] _dcacheArb_io_mem_req_bits_cmd ;
    wire [1:0] _dcacheArb_io_mem_req_bits_size ;
    wire _dcacheArb_io_mem_req_bits_signed ;
    wire _dcacheArb_io_mem_req_bits_dv ;
    wire _dcacheArb_io_mem_s1_kill ;
    wire [63:0] _dcacheArb_io_mem_s1_data_data ;
    wire _frontend_auto_icache_master_out_a_valid ;
    wire [31:0] _frontend_auto_icache_master_out_a_bits_address ;
    wire _frontend_io_cpu_resp_valid ;
    wire [33:0] _frontend_io_cpu_resp_bits_pc ;
    wire [31:0] _frontend_io_cpu_resp_bits_data ;
    wire _frontend_io_cpu_resp_bits_xcpt_pf_inst ;
    wire _frontend_io_cpu_resp_bits_xcpt_gf_inst ;
    wire _frontend_io_cpu_resp_bits_xcpt_ae_inst ;
    wire _frontend_io_cpu_resp_bits_replay ;
    wire _frontend_io_ptw_req_bits_bits_need_gpa ;
    wire _frontend_io_ptw_req_bits_bits_stage2 ;
    wire _dcache_auto_out_a_valid ;
    wire [2:0] _dcache_auto_out_a_bits_opcode ;
    wire [2:0] _dcache_auto_out_a_bits_param ;
    wire [3:0] _dcache_auto_out_a_bits_size ;
    wire _dcache_auto_out_a_bits_source ;
    wire [31:0] _dcache_auto_out_a_bits_address ;
    wire [7:0] _dcache_auto_out_a_bits_mask ;
    wire [63:0] _dcache_auto_out_a_bits_data ;
    wire _dcache_auto_out_b_ready ;
    wire _dcache_auto_out_c_valid ;
    wire [2:0] _dcache_auto_out_c_bits_opcode ;
    wire [2:0] _dcache_auto_out_c_bits_param ;
    wire [3:0] _dcache_auto_out_c_bits_size ;
    wire _dcache_auto_out_c_bits_source ;
    wire [31:0] _dcache_auto_out_c_bits_address ;
    wire [63:0] _dcache_auto_out_c_bits_data ;
    wire _dcache_auto_out_d_ready ;
    wire _dcache_auto_out_e_valid ;
    wire [1:0] _dcache_auto_out_e_bits_sink ;
    wire _dcache_io_cpu_req_ready ;
    wire _dcache_io_cpu_s2_nack ;
    wire _dcache_io_cpu_resp_valid ;
    wire [5:0] _dcache_io_cpu_resp_bits_tag ;
    wire [63:0] _dcache_io_cpu_resp_bits_data ;
    wire _dcache_io_cpu_resp_bits_replay ;
    wire _dcache_io_cpu_resp_bits_has_data ;
    wire [63:0] _dcache_io_cpu_resp_bits_data_word_bypass ;
    wire _dcache_io_cpu_replay_next ;
    wire _dcache_io_cpu_s2_xcpt_ma_ld ;
    wire _dcache_io_cpu_s2_xcpt_ma_st ;
    wire _dcache_io_cpu_s2_xcpt_pf_ld ;
    wire _dcache_io_cpu_s2_xcpt_pf_st ;
    wire _dcache_io_cpu_s2_xcpt_ae_ld ;
    wire _dcache_io_cpu_s2_xcpt_ae_st ;
    wire _dcache_io_cpu_ordered ;
    wire _dcache_io_cpu_perf_release ;
    wire _dcache_io_cpu_perf_grant ;
    wire _dcache_io_ptw_req_bits_bits_need_gpa ;
    wire _dcache_io_ptw_req_bits_bits_stage2 ;
    wire _intXbar_auto_int_out_0 ;
    wire _intXbar_auto_int_out_1 ;
    wire _intXbar_auto_int_out_2 ;
    wire _intXbar_auto_int_out_3 ;
    wire _tlMasterXbar_auto_in_1_a_ready ;
    wire _tlMasterXbar_auto_in_1_d_valid ;
    wire [2:0] _tlMasterXbar_auto_in_1_d_bits_opcode ;
    wire [3:0] _tlMasterXbar_auto_in_1_d_bits_size ;
    wire [63:0] _tlMasterXbar_auto_in_1_d_bits_data ;
    wire _tlMasterXbar_auto_in_1_d_bits_corrupt ;
    wire _tlMasterXbar_auto_in_0_a_ready ;
    wire _tlMasterXbar_auto_in_0_b_valid ;
    wire [1:0] _tlMasterXbar_auto_in_0_b_bits_param ;
    wire [3:0] _tlMasterXbar_auto_in_0_b_bits_size ;
    wire _tlMasterXbar_auto_in_0_b_bits_source ;
    wire [31:0] _tlMasterXbar_auto_in_0_b_bits_address ;
    wire _tlMasterXbar_auto_in_0_c_ready ;
    wire _tlMasterXbar_auto_in_0_d_valid ;
    wire [2:0] _tlMasterXbar_auto_in_0_d_bits_opcode ;
    wire [1:0] _tlMasterXbar_auto_in_0_d_bits_param ;
    wire [3:0] _tlMasterXbar_auto_in_0_d_bits_size ;
    wire _tlMasterXbar_auto_in_0_d_bits_source ;
    wire [1:0] _tlMasterXbar_auto_in_0_d_bits_sink ;
    wire _tlMasterXbar_auto_in_0_d_bits_denied ;
    wire [63:0] _tlMasterXbar_auto_in_0_d_bits_data ;
    wire _tlMasterXbar_auto_in_0_e_ready ;
    reg wfiNodeOut_0_REG ;
    always @( posedge clock)
    begin
        if (reset)
            wfiNodeOut_0_REG <=1'h0;
        else
            wfiNodeOut_0_REG <=_core_io_wfi;
    end


    wire  tlMasterXbar__clock;
    wire  tlMasterXbar__reset;
    wire  tlMasterXbar__auto_in_1_a_ready;
    wire  tlMasterXbar__auto_in_1_a_valid;
    wire [31:0] tlMasterXbar__auto_in_1_a_bits_address;
    wire  tlMasterXbar__auto_in_1_d_valid;
    wire [2:0] tlMasterXbar__auto_in_1_d_bits_opcode;
    wire [3:0] tlMasterXbar__auto_in_1_d_bits_size;
    wire [63:0] tlMasterXbar__auto_in_1_d_bits_data;
    wire  tlMasterXbar__auto_in_1_d_bits_corrupt;
    wire  tlMasterXbar__auto_in_0_a_ready;
    wire  tlMasterXbar__auto_in_0_a_valid;
    wire [2:0] tlMasterXbar__auto_in_0_a_bits_opcode;
    wire [2:0] tlMasterXbar__auto_in_0_a_bits_param;
    wire [3:0] tlMasterXbar__auto_in_0_a_bits_size;
    wire  tlMasterXbar__auto_in_0_a_bits_source;
    wire [31:0] tlMasterXbar__auto_in_0_a_bits_address;
    wire [7:0] tlMasterXbar__auto_in_0_a_bits_mask;
    wire [63:0] tlMasterXbar__auto_in_0_a_bits_data;
    wire  tlMasterXbar__auto_in_0_b_ready;
    wire  tlMasterXbar__auto_in_0_b_valid;
    wire [1:0] tlMasterXbar__auto_in_0_b_bits_param;
    wire [3:0] tlMasterXbar__auto_in_0_b_bits_size;
    wire  tlMasterXbar__auto_in_0_b_bits_source;
    wire [31:0] tlMasterXbar__auto_in_0_b_bits_address;
    wire  tlMasterXbar__auto_in_0_c_ready;
    wire  tlMasterXbar__auto_in_0_c_valid;
    wire [2:0] tlMasterXbar__auto_in_0_c_bits_opcode;
    wire [2:0] tlMasterXbar__auto_in_0_c_bits_param;
    wire [3:0] tlMasterXbar__auto_in_0_c_bits_size;
    wire  tlMasterXbar__auto_in_0_c_bits_source;
    wire [31:0] tlMasterXbar__auto_in_0_c_bits_address;
    wire [63:0] tlMasterXbar__auto_in_0_c_bits_data;
    wire  tlMasterXbar__auto_in_0_d_ready;
    wire  tlMasterXbar__auto_in_0_d_valid;
    wire [2:0] tlMasterXbar__auto_in_0_d_bits_opcode;
    wire [1:0] tlMasterXbar__auto_in_0_d_bits_param;
    wire [3:0] tlMasterXbar__auto_in_0_d_bits_size;
    wire  tlMasterXbar__auto_in_0_d_bits_source;
    wire [1:0] tlMasterXbar__auto_in_0_d_bits_sink;
    wire  tlMasterXbar__auto_in_0_d_bits_denied;
    wire [63:0] tlMasterXbar__auto_in_0_d_bits_data;
    wire  tlMasterXbar__auto_in_0_e_ready;
    wire  tlMasterXbar__auto_in_0_e_valid;
    wire [1:0] tlMasterXbar__auto_in_0_e_bits_sink;
    wire  tlMasterXbar__auto_out_a_ready;
    wire  tlMasterXbar__auto_out_a_valid;
    wire [2:0] tlMasterXbar__auto_out_a_bits_opcode;
    wire [2:0] tlMasterXbar__auto_out_a_bits_param;
    wire [3:0] tlMasterXbar__auto_out_a_bits_size;
    wire [1:0] tlMasterXbar__auto_out_a_bits_source;
    wire [31:0] tlMasterXbar__auto_out_a_bits_address;
    wire [7:0] tlMasterXbar__auto_out_a_bits_mask;
    wire [63:0] tlMasterXbar__auto_out_a_bits_data;
    wire  tlMasterXbar__auto_out_b_ready;
    wire  tlMasterXbar__auto_out_b_valid;
    wire [2:0] tlMasterXbar__auto_out_b_bits_opcode;
    wire [1:0] tlMasterXbar__auto_out_b_bits_param;
    wire [3:0] tlMasterXbar__auto_out_b_bits_size;
    wire [1:0] tlMasterXbar__auto_out_b_bits_source;
    wire [31:0] tlMasterXbar__auto_out_b_bits_address;
    wire [7:0] tlMasterXbar__auto_out_b_bits_mask;
    wire  tlMasterXbar__auto_out_b_bits_corrupt;
    wire  tlMasterXbar__auto_out_c_ready;
    wire  tlMasterXbar__auto_out_c_valid;
    wire [2:0] tlMasterXbar__auto_out_c_bits_opcode;
    wire [2:0] tlMasterXbar__auto_out_c_bits_param;
    wire [3:0] tlMasterXbar__auto_out_c_bits_size;
    wire [1:0] tlMasterXbar__auto_out_c_bits_source;
    wire [31:0] tlMasterXbar__auto_out_c_bits_address;
    wire [63:0] tlMasterXbar__auto_out_c_bits_data;
    wire  tlMasterXbar__auto_out_d_ready;
    wire  tlMasterXbar__auto_out_d_valid;
    wire [2:0] tlMasterXbar__auto_out_d_bits_opcode;
    wire [1:0] tlMasterXbar__auto_out_d_bits_param;
    wire [3:0] tlMasterXbar__auto_out_d_bits_size;
    wire [1:0] tlMasterXbar__auto_out_d_bits_source;
    wire [1:0] tlMasterXbar__auto_out_d_bits_sink;
    wire  tlMasterXbar__auto_out_d_bits_denied;
    wire [63:0] tlMasterXbar__auto_out_d_bits_data;
    wire  tlMasterXbar__auto_out_d_bits_corrupt;
    wire  tlMasterXbar__auto_out_e_ready;
    wire  tlMasterXbar__auto_out_e_valid;
    wire [1:0] tlMasterXbar__auto_out_e_bits_sink;

    wire  tlMasterXbar__requestDOI_0_1  =  tlMasterXbar__auto_out_d_bits_source  ==2'h2;
    wire  tlMasterXbar__portsBIO_filtered_valid_0  =  tlMasterXbar__auto_out_b_valid  &~(  tlMasterXbar__auto_out_b_bits_source  [1]);
    wire  tlMasterXbar__portsDIO_filtered_0_valid  =  tlMasterXbar__auto_out_d_valid  &~(  tlMasterXbar__auto_out_d_bits_source  [1]);
    wire  tlMasterXbar__portsDIO_filtered_1_valid  =  tlMasterXbar__auto_out_d_valid  &  tlMasterXbar__requestDOI_0_1  ;
    reg[8:0]  tlMasterXbar__beatsLeft  ;
    wire  tlMasterXbar__idle  =  tlMasterXbar__beatsLeft  ==9'h0;
    wire[1:0]  tlMasterXbar__readys_valid  ={  tlMasterXbar__auto_in_1_a_valid  ,  tlMasterXbar__auto_in_0_a_valid  };
    reg[1:0]  tlMasterXbar__readys_mask  ;
    wire[1:0]  tlMasterXbar___readys_filter_T_1  =  tlMasterXbar__readys_valid  &~  tlMasterXbar__readys_mask  ;
    wire[1:0]  tlMasterXbar__readys_readys  =~({  tlMasterXbar__readys_mask  [1],  tlMasterXbar___readys_filter_T_1  [1]|  tlMasterXbar__readys_mask  [0]}&({  tlMasterXbar___readys_filter_T_1  [0],  tlMasterXbar__auto_in_1_a_valid  }|  tlMasterXbar___readys_filter_T_1  ));
    wire  tlMasterXbar__winner_0  =  tlMasterXbar__readys_readys  [0]&  tlMasterXbar__auto_in_0_a_valid  ;
    wire  tlMasterXbar__winner_1  =  tlMasterXbar__readys_readys  [1]&  tlMasterXbar__auto_in_1_a_valid  ;
    wire  tlMasterXbar___out_0_a_valid_T  =  tlMasterXbar__auto_in_0_a_valid  |  tlMasterXbar__auto_in_1_a_valid  ;
    always @( posedge   tlMasterXbar__clock  )
    begin
        if (~  tlMasterXbar__reset  &~(~  tlMasterXbar__winner_0  |~  tlMasterXbar__winner_1  ))
        begin
            if (1)
                $display("Assertion failed\n    at Arbiter.scala:77 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n");
            if (1)
                $display("");
        end
        if (~  tlMasterXbar__reset  &~(~  tlMasterXbar___out_0_a_valid_T  |  tlMasterXbar__winner_0  |  tlMasterXbar__winner_1  ))
        begin
            if (1)
                $display("Assertion failed\n    at Arbiter.scala:79 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n");
            if (1)
                $display("");
        end
    end

    reg  tlMasterXbar__state_0  ;
    reg  tlMasterXbar__state_1  ;
    wire  tlMasterXbar__muxState_0  =  tlMasterXbar__idle   ?   tlMasterXbar__winner_0  :  tlMasterXbar__state_0  ;
    wire  tlMasterXbar__muxState_1  =  tlMasterXbar__idle   ?   tlMasterXbar__winner_1  :  tlMasterXbar__state_1  ;
    wire  tlMasterXbar__portsAOI_filtered_0_ready  =  tlMasterXbar__auto_out_a_ready  &(  tlMasterXbar__idle   ?   tlMasterXbar__readys_readys  [0]:  tlMasterXbar__state_0  );
    wire  tlMasterXbar__portsAOI_filtered_1_0_ready  =  tlMasterXbar__auto_out_a_ready  &(  tlMasterXbar__idle   ?   tlMasterXbar__readys_readys  [1]:  tlMasterXbar__state_1  );
    wire  tlMasterXbar__out_0_a_valid  =  tlMasterXbar__idle   ?   tlMasterXbar___out_0_a_valid_T  :  tlMasterXbar__state_0  &  tlMasterXbar__auto_in_0_a_valid  |  tlMasterXbar__state_1  &  tlMasterXbar__auto_in_1_a_valid  ;
    wire[26:0]  tlMasterXbar___beatsAI_decode_T_1  =27'hFFF<<  tlMasterXbar__auto_in_0_a_bits_size  ;
    wire[1:0]  tlMasterXbar___readys_mask_T  =  tlMasterXbar__readys_readys  &  tlMasterXbar__readys_valid  ;
    wire  tlMasterXbar__latch  =  tlMasterXbar__idle  &  tlMasterXbar__auto_out_a_ready  ;
    always @( posedge   tlMasterXbar__clock  )
    begin
        if (  tlMasterXbar__reset  )
        begin
            tlMasterXbar__beatsLeft   <=9'h0;
            tlMasterXbar__readys_mask   <=2'h3;
            tlMasterXbar__state_0   <=1'h0;
            tlMasterXbar__state_1   <=1'h0;
        end
        else
        begin
            if (  tlMasterXbar__latch  )
                tlMasterXbar__beatsLeft   <=  tlMasterXbar__winner_0  &~(  tlMasterXbar__auto_in_0_a_bits_opcode  [2]) ? ~(  tlMasterXbar___beatsAI_decode_T_1  [11:3]):9'h0;
            else
                tlMasterXbar__beatsLeft   <=  tlMasterXbar__beatsLeft  -{8'h0,  tlMasterXbar__auto_out_a_ready  &  tlMasterXbar__out_0_a_valid  };
            if (  tlMasterXbar__latch  &(|  tlMasterXbar__readys_valid  ))
                tlMasterXbar__readys_mask   <=  tlMasterXbar___readys_mask_T  |{  tlMasterXbar___readys_mask_T  [0],1'h0};
            if (  tlMasterXbar__idle  )
            begin
                tlMasterXbar__state_0   <=  tlMasterXbar__winner_0  ;
                tlMasterXbar__state_1   <=  tlMasterXbar__winner_1  ;
            end
        end
    end


    wire  tlMasterXbar__monitor__clock;
    wire  tlMasterXbar__monitor__reset;
    wire  tlMasterXbar__monitor__io_in_a_ready;
    wire  tlMasterXbar__monitor__io_in_a_valid;
    wire [2:0] tlMasterXbar__monitor__io_in_a_bits_opcode;
    wire [2:0] tlMasterXbar__monitor__io_in_a_bits_param;
    wire [3:0] tlMasterXbar__monitor__io_in_a_bits_size;
    wire  tlMasterXbar__monitor__io_in_a_bits_source;
    wire [31:0] tlMasterXbar__monitor__io_in_a_bits_address;
    wire [7:0] tlMasterXbar__monitor__io_in_a_bits_mask;
    wire  tlMasterXbar__monitor__io_in_b_ready;
    wire  tlMasterXbar__monitor__io_in_b_valid;
    wire [2:0] tlMasterXbar__monitor__io_in_b_bits_opcode;
    wire [1:0] tlMasterXbar__monitor__io_in_b_bits_param;
    wire [3:0] tlMasterXbar__monitor__io_in_b_bits_size;
    wire  tlMasterXbar__monitor__io_in_b_bits_source;
    wire [31:0] tlMasterXbar__monitor__io_in_b_bits_address;
    wire [7:0] tlMasterXbar__monitor__io_in_b_bits_mask;
    wire  tlMasterXbar__monitor__io_in_b_bits_corrupt;
    wire  tlMasterXbar__monitor__io_in_c_ready;
    wire  tlMasterXbar__monitor__io_in_c_valid;
    wire [2:0] tlMasterXbar__monitor__io_in_c_bits_opcode;
    wire [2:0] tlMasterXbar__monitor__io_in_c_bits_param;
    wire [3:0] tlMasterXbar__monitor__io_in_c_bits_size;
    wire  tlMasterXbar__monitor__io_in_c_bits_source;
    wire [31:0] tlMasterXbar__monitor__io_in_c_bits_address;
    wire  tlMasterXbar__monitor__io_in_d_ready;
    wire  tlMasterXbar__monitor__io_in_d_valid;
    wire [2:0] tlMasterXbar__monitor__io_in_d_bits_opcode;
    wire [1:0] tlMasterXbar__monitor__io_in_d_bits_param;
    wire [3:0] tlMasterXbar__monitor__io_in_d_bits_size;
    wire  tlMasterXbar__monitor__io_in_d_bits_source;
    wire [1:0] tlMasterXbar__monitor__io_in_d_bits_sink;
    wire  tlMasterXbar__monitor__io_in_d_bits_denied;
    wire  tlMasterXbar__monitor__io_in_d_bits_corrupt;
    wire  tlMasterXbar__monitor__io_in_e_ready;
    wire  tlMasterXbar__monitor__io_in_e_valid;
    wire [1:0] tlMasterXbar__monitor__io_in_e_bits_sink;

    wire[31:0]  tlMasterXbar__monitor___plusarg_reader_1_out  ;
    wire[31:0]  tlMasterXbar__monitor___plusarg_reader_out  ;
    wire[26:0]  tlMasterXbar__monitor___GEN  ={23'h0,  tlMasterXbar__monitor__io_in_a_bits_size  };
    wire[26:0]  tlMasterXbar__monitor___GEN_0  ={23'h0,  tlMasterXbar__monitor__io_in_c_bits_size  };
    wire  tlMasterXbar__monitor___a_first_T_1  =  tlMasterXbar__monitor__io_in_a_ready  &  tlMasterXbar__monitor__io_in_a_valid  ;
    reg[8:0]  tlMasterXbar__monitor__a_first_counter  ;
    reg[2:0]  tlMasterXbar__monitor__opcode  ;
    reg[2:0]  tlMasterXbar__monitor__param  ;
    reg[3:0]  tlMasterXbar__monitor__size  ;
    reg  tlMasterXbar__monitor__source  ;
    reg[31:0]  tlMasterXbar__monitor__address  ;
    wire  tlMasterXbar__monitor___d_first_T_3  =  tlMasterXbar__monitor__io_in_d_ready  &  tlMasterXbar__monitor__io_in_d_valid  ;
    reg[8:0]  tlMasterXbar__monitor__d_first_counter  ;
    reg[2:0]  tlMasterXbar__monitor__opcode_1  ;
    reg[1:0]  tlMasterXbar__monitor__param_1  ;
    reg[3:0]  tlMasterXbar__monitor__size_1  ;
    reg  tlMasterXbar__monitor__source_1  ;
    reg[1:0]  tlMasterXbar__monitor__sink  ;
    reg  tlMasterXbar__monitor__denied  ;
    reg[8:0]  tlMasterXbar__monitor__b_first_counter  ;
    reg[2:0]  tlMasterXbar__monitor__opcode_2  ;
    reg[1:0]  tlMasterXbar__monitor__param_2  ;
    reg[3:0]  tlMasterXbar__monitor__size_2  ;
    reg  tlMasterXbar__monitor__source_2  ;
    reg[31:0]  tlMasterXbar__monitor__address_1  ;
    wire  tlMasterXbar__monitor___c_first_T_1  =  tlMasterXbar__monitor__io_in_c_ready  &  tlMasterXbar__monitor__io_in_c_valid  ;
    reg[8:0]  tlMasterXbar__monitor__c_first_counter  ;
    reg[2:0]  tlMasterXbar__monitor__opcode_3  ;
    reg[2:0]  tlMasterXbar__monitor__param_3  ;
    reg[3:0]  tlMasterXbar__monitor__size_3  ;
    reg  tlMasterXbar__monitor__source_3  ;
    reg[31:0]  tlMasterXbar__monitor__address_2  ;
    reg[1:0]  tlMasterXbar__monitor__inflight  ;
    reg[7:0]  tlMasterXbar__monitor__inflight_opcodes  ;
    reg[15:0]  tlMasterXbar__monitor__inflight_sizes  ;
    reg[8:0]  tlMasterXbar__monitor__a_first_counter_1  ;
    wire  tlMasterXbar__monitor__a_first_1  =  tlMasterXbar__monitor__a_first_counter_1  ==9'h0;
    reg[8:0]  tlMasterXbar__monitor__d_first_counter_1  ;
    wire  tlMasterXbar__monitor__d_first_1  =  tlMasterXbar__monitor__d_first_counter_1  ==9'h0;
    wire[7:0]  tlMasterXbar__monitor___a_opcode_lookup_T_1  =  tlMasterXbar__monitor__inflight_opcodes  >>{5'h0,  tlMasterXbar__monitor__io_in_d_bits_source  ,2'h0};
    wire[1:0]  tlMasterXbar__monitor___GEN_1  ={1'h0,  tlMasterXbar__monitor__io_in_a_bits_source  };
    wire  tlMasterXbar__monitor___GEN_2  =  tlMasterXbar__monitor___a_first_T_1  &  tlMasterXbar__monitor__a_first_1  ;
    wire  tlMasterXbar__monitor__d_release_ack  =  tlMasterXbar__monitor__io_in_d_bits_opcode  ==3'h6;
    wire[1:0]  tlMasterXbar__monitor___GEN_3  ={1'h0,  tlMasterXbar__monitor__io_in_d_bits_source  };
    reg[2:0]  tlMasterXbar__monitor__casez_tmp  ;
    always @(*)
    begin
        casez (  tlMasterXbar__monitor__io_in_a_bits_opcode  )
            3 'b000:
                tlMasterXbar__monitor__casez_tmp   =3'h0;
            3 'b001:
                tlMasterXbar__monitor__casez_tmp   =3'h0;
            3 'b010:
                tlMasterXbar__monitor__casez_tmp   =3'h1;
            3 'b011:
                tlMasterXbar__monitor__casez_tmp   =3'h1;
            3 'b100:
                tlMasterXbar__monitor__casez_tmp   =3'h1;
            3 'b101:
                tlMasterXbar__monitor__casez_tmp   =3'h2;
            3 'b110:
                tlMasterXbar__monitor__casez_tmp   =3'h4;
            default :
                tlMasterXbar__monitor__casez_tmp   =3'h4;
        endcase
    end

    reg[2:
        0]  tlMasterXbar__monitor__casez_tmp_0  ;
    always @(*)
    begin
        casez (  tlMasterXbar__monitor__io_in_a_bits_opcode  )
            3 'b000:
                tlMasterXbar__monitor__casez_tmp_0   =3'h0;
            3 'b001:
                tlMasterXbar__monitor__casez_tmp_0   =3'h0;
            3 'b010:
                tlMasterXbar__monitor__casez_tmp_0   =3'h1;
            3 'b011:
                tlMasterXbar__monitor__casez_tmp_0   =3'h1;
            3 'b100:
                tlMasterXbar__monitor__casez_tmp_0   =3'h1;
            3 'b101:
                tlMasterXbar__monitor__casez_tmp_0   =3'h2;
            3 'b110:
                tlMasterXbar__monitor__casez_tmp_0   =3'h5;
            default :
                tlMasterXbar__monitor__casez_tmp_0   =3'h4;
        endcase
    end

    reg[2:0]  tlMasterXbar__monitor__casez_tmp_1  ;
    always @(*)
    begin
        casez (  tlMasterXbar__monitor___a_opcode_lookup_T_1  [3:1])
            3 'b000:
                tlMasterXbar__monitor__casez_tmp_1   =3'h0;
            3 'b001:
                tlMasterXbar__monitor__casez_tmp_1   =3'h0;
            3 'b010:
                tlMasterXbar__monitor__casez_tmp_1   =3'h1;
            3 'b011:
                tlMasterXbar__monitor__casez_tmp_1   =3'h1;
            3 'b100:
                tlMasterXbar__monitor__casez_tmp_1   =3'h1;
            3 'b101:
                tlMasterXbar__monitor__casez_tmp_1   =3'h2;
            3 'b110:
                tlMasterXbar__monitor__casez_tmp_1   =3'h4;
            default :
                tlMasterXbar__monitor__casez_tmp_1   =3'h4;
        endcase
    end

    reg[2:0]  tlMasterXbar__monitor__casez_tmp_2  ;
    always @(*)
    begin
        casez (  tlMasterXbar__monitor___a_opcode_lookup_T_1  [3:1])
            3 'b000:
                tlMasterXbar__monitor__casez_tmp_2   =3'h0;
            3 'b001:
                tlMasterXbar__monitor__casez_tmp_2   =3'h0;
            3 'b010:
                tlMasterXbar__monitor__casez_tmp_2   =3'h1;
            3 'b011:
                tlMasterXbar__monitor__casez_tmp_2   =3'h1;
            3 'b100:
                tlMasterXbar__monitor__casez_tmp_2   =3'h1;
            3 'b101:
                tlMasterXbar__monitor__casez_tmp_2   =3'h2;
            3 'b110:
                tlMasterXbar__monitor__casez_tmp_2   =3'h5;
            default :
                tlMasterXbar__monitor__casez_tmp_2   =3'h4;
        endcase
    end

    reg[31:0]  tlMasterXbar__monitor__watchdog  ;
    reg[1:0]  tlMasterXbar__monitor__inflight_1  ;
    reg[15:0]  tlMasterXbar__monitor__inflight_sizes_1  ;
    reg[8:0]  tlMasterXbar__monitor__c_first_counter_1  ;
    wire  tlMasterXbar__monitor__c_first_1  =  tlMasterXbar__monitor__c_first_counter_1  ==9'h0;
    reg[8:0]  tlMasterXbar__monitor__d_first_counter_2  ;
    wire  tlMasterXbar__monitor__d_first_2  =  tlMasterXbar__monitor__d_first_counter_2  ==9'h0;
    wire  tlMasterXbar__monitor___GEN_4  =  tlMasterXbar__monitor__io_in_c_bits_opcode  [2]&  tlMasterXbar__monitor__io_in_c_bits_opcode  [1];
    wire[1:0]  tlMasterXbar__monitor___GEN_5  ={1'h0,  tlMasterXbar__monitor__io_in_c_bits_source  };
    wire  tlMasterXbar__monitor___GEN_6  =  tlMasterXbar__monitor___c_first_T_1  &  tlMasterXbar__monitor__c_first_1  &  tlMasterXbar__monitor___GEN_4  ;
    reg[31:0]  tlMasterXbar__monitor__watchdog_1  ;
    reg[3:0]  tlMasterXbar__monitor__inflight_2  ;
    reg[8:0]  tlMasterXbar__monitor__d_first_counter_3  ;
    wire  tlMasterXbar__monitor__d_first_3  =  tlMasterXbar__monitor__d_first_counter_3  ==9'h0;
    wire  tlMasterXbar__monitor___GEN_7  =  tlMasterXbar__monitor___d_first_T_3  &  tlMasterXbar__monitor__d_first_3  &  tlMasterXbar__monitor__io_in_d_bits_opcode  [2]&~(  tlMasterXbar__monitor__io_in_d_bits_opcode  [1]);
    wire[3:0]  tlMasterXbar__monitor___GEN_8  ={2'h0,  tlMasterXbar__monitor__io_in_d_bits_sink  };
    wire[3:0]  tlMasterXbar__monitor__d_set  =  tlMasterXbar__monitor___GEN_7   ? 4'h1<<  tlMasterXbar__monitor___GEN_8  :4'h0;
    wire  tlMasterXbar__monitor___GEN_9  =  tlMasterXbar__monitor__io_in_e_ready  &  tlMasterXbar__monitor__io_in_e_valid  ;
    wire[3:0]  tlMasterXbar__monitor___GEN_10  ={2'h0,  tlMasterXbar__monitor__io_in_e_bits_sink  };
    wire[26:0]  tlMasterXbar__monitor___is_aligned_mask_T_1  =27'hFFF<<  tlMasterXbar__monitor___GEN  ;
    wire[11:0]  tlMasterXbar__monitor___GEN_11  =  tlMasterXbar__monitor__io_in_a_bits_address  [11:0]&~(  tlMasterXbar__monitor___is_aligned_mask_T_1  [11:0]);
    wire  tlMasterXbar__monitor___mask_T  =  tlMasterXbar__monitor__io_in_a_bits_size  >4'h2;
    wire  tlMasterXbar__monitor__mask_size  =  tlMasterXbar__monitor__io_in_a_bits_size  [1:0]==2'h2;
    wire  tlMasterXbar__monitor__mask_acc  =  tlMasterXbar__monitor___mask_T  |  tlMasterXbar__monitor__mask_size  &~(  tlMasterXbar__monitor__io_in_a_bits_address  [2]);
    wire  tlMasterXbar__monitor__mask_acc_1  =  tlMasterXbar__monitor___mask_T  |  tlMasterXbar__monitor__mask_size  &  tlMasterXbar__monitor__io_in_a_bits_address  [2];
    wire  tlMasterXbar__monitor__mask_size_1  =  tlMasterXbar__monitor__io_in_a_bits_size  [1:0]==2'h1;
    wire  tlMasterXbar__monitor__mask_eq_2  =~(  tlMasterXbar__monitor__io_in_a_bits_address  [2])&~(  tlMasterXbar__monitor__io_in_a_bits_address  [1]);
    wire  tlMasterXbar__monitor__mask_acc_2  =  tlMasterXbar__monitor__mask_acc  |  tlMasterXbar__monitor__mask_size_1  &  tlMasterXbar__monitor__mask_eq_2  ;
    wire  tlMasterXbar__monitor__mask_eq_3  =~(  tlMasterXbar__monitor__io_in_a_bits_address  [2])&  tlMasterXbar__monitor__io_in_a_bits_address  [1];
    wire  tlMasterXbar__monitor__mask_acc_3  =  tlMasterXbar__monitor__mask_acc  |  tlMasterXbar__monitor__mask_size_1  &  tlMasterXbar__monitor__mask_eq_3  ;
    wire  tlMasterXbar__monitor__mask_eq_4  =  tlMasterXbar__monitor__io_in_a_bits_address  [2]&~(  tlMasterXbar__monitor__io_in_a_bits_address  [1]);
    wire  tlMasterXbar__monitor__mask_acc_4  =  tlMasterXbar__monitor__mask_acc_1  |  tlMasterXbar__monitor__mask_size_1  &  tlMasterXbar__monitor__mask_eq_4  ;
    wire  tlMasterXbar__monitor__mask_eq_5  =  tlMasterXbar__monitor__io_in_a_bits_address  [2]&  tlMasterXbar__monitor__io_in_a_bits_address  [1];
    wire  tlMasterXbar__monitor__mask_acc_5  =  tlMasterXbar__monitor__mask_acc_1  |  tlMasterXbar__monitor__mask_size_1  &  tlMasterXbar__monitor__mask_eq_5  ;
    wire[7:0]  tlMasterXbar__monitor__mask  ={  tlMasterXbar__monitor__mask_acc_5  |  tlMasterXbar__monitor__mask_eq_5  &  tlMasterXbar__monitor__io_in_a_bits_address  [0],  tlMasterXbar__monitor__mask_acc_5  |  tlMasterXbar__monitor__mask_eq_5  &~(  tlMasterXbar__monitor__io_in_a_bits_address  [0]),  tlMasterXbar__monitor__mask_acc_4  |  tlMasterXbar__monitor__mask_eq_4  &  tlMasterXbar__monitor__io_in_a_bits_address  [0],  tlMasterXbar__monitor__mask_acc_4  |  tlMasterXbar__monitor__mask_eq_4  &~(  tlMasterXbar__monitor__io_in_a_bits_address  [0]),  tlMasterXbar__monitor__mask_acc_3  |  tlMasterXbar__monitor__mask_eq_3  &  tlMasterXbar__monitor__io_in_a_bits_address  [0],  tlMasterXbar__monitor__mask_acc_3  |  tlMasterXbar__monitor__mask_eq_3  &~(  tlMasterXbar__monitor__io_in_a_bits_address  [0]),  tlMasterXbar__monitor__mask_acc_2  |  tlMasterXbar__monitor__mask_eq_2  &  tlMasterXbar__monitor__io_in_a_bits_address  [0],  tlMasterXbar__monitor__mask_acc_2  |  tlMasterXbar__monitor__mask_eq_2  &~(  tlMasterXbar__monitor__io_in_a_bits_address  [0])};
    wire  tlMasterXbar__monitor___GEN_12  =  tlMasterXbar__monitor__io_in_a_bits_size  <4'hD;
    wire  tlMasterXbar__monitor___GEN_13  =  tlMasterXbar__monitor__io_in_a_bits_size  <4'h7;
    wire  tlMasterXbar__monitor___GEN_14  =  tlMasterXbar__monitor__io_in_a_bits_address  [31:28]==4'h8;
    wire  tlMasterXbar__monitor___GEN_15  =  tlMasterXbar__monitor___GEN_12  &  tlMasterXbar__monitor___GEN_13  &  tlMasterXbar__monitor___GEN_14  ;
    wire  tlMasterXbar__monitor___GEN_16  =  tlMasterXbar__monitor__io_in_a_valid  &  tlMasterXbar__monitor__io_in_a_bits_opcode  ==3'h6&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_17  =  tlMasterXbar__monitor__io_in_a_bits_address  [31:12]==20'h0;
    wire  tlMasterXbar__monitor___GEN_18  ={  tlMasterXbar__monitor__io_in_a_bits_address  [31:14],~(  tlMasterXbar__monitor__io_in_a_bits_address  [13:12])}==20'h0;
    wire  tlMasterXbar__monitor___GEN_19  ={  tlMasterXbar__monitor__io_in_a_bits_address  [31:17],~(  tlMasterXbar__monitor__io_in_a_bits_address  [16])}==16'h0;
    wire  tlMasterXbar__monitor___GEN_20  ={  tlMasterXbar__monitor__io_in_a_bits_address  [31:26],  tlMasterXbar__monitor__io_in_a_bits_address  [25:16]^10'h200}==16'h0;
    wire  tlMasterXbar__monitor___GEN_21  ={  tlMasterXbar__monitor__io_in_a_bits_address  [31:28],~(  tlMasterXbar__monitor__io_in_a_bits_address  [27:26])}==6'h0;
    wire  tlMasterXbar__monitor___GEN_22  ={  tlMasterXbar__monitor__io_in_a_bits_address  [31],~(  tlMasterXbar__monitor__io_in_a_bits_address  [30:29])}==3'h0;
    wire  tlMasterXbar__monitor___GEN_23  =  tlMasterXbar__monitor___GEN_17  |  tlMasterXbar__monitor___GEN_18  ;
    wire  tlMasterXbar__monitor___GEN_24  =~  tlMasterXbar__monitor__io_in_a_bits_source  &  tlMasterXbar__monitor__io_in_a_bits_size  ==4'h6&  tlMasterXbar__monitor___GEN_12  &(  tlMasterXbar__monitor___GEN_23  |  tlMasterXbar__monitor___GEN_19  |  tlMasterXbar__monitor___GEN_20  |  tlMasterXbar__monitor___GEN_21  |  tlMasterXbar__monitor___GEN_22  |  tlMasterXbar__monitor___GEN_14  );
    wire  tlMasterXbar__monitor___GEN_25  =  tlMasterXbar__monitor__io_in_a_bits_param  >3'h2;
    wire  tlMasterXbar__monitor___GEN_26  =  tlMasterXbar__monitor__io_in_a_bits_mask  !=8'hFF;
    wire  tlMasterXbar__monitor___GEN_27  =  tlMasterXbar__monitor__io_in_a_valid  &(&  tlMasterXbar__monitor__io_in_a_bits_opcode  )&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_28  =  tlMasterXbar__monitor__io_in_a_valid  &  tlMasterXbar__monitor__io_in_a_bits_opcode  ==3'h4&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_29  =  tlMasterXbar__monitor___GEN_12  &  tlMasterXbar__monitor___GEN_18  ;
    wire  tlMasterXbar__monitor___GEN_30  =  tlMasterXbar__monitor__io_in_a_bits_mask  !=  tlMasterXbar__monitor__mask  ;
    wire  tlMasterXbar__monitor___GEN_31  =  tlMasterXbar__monitor___GEN_12  &(  tlMasterXbar__monitor___GEN_29  |  tlMasterXbar__monitor___GEN_13  &(  tlMasterXbar__monitor___GEN_17  |  tlMasterXbar__monitor___GEN_20  |  tlMasterXbar__monitor___GEN_21  |  tlMasterXbar__monitor___GEN_14  )|  tlMasterXbar__monitor__io_in_a_bits_size  <4'h9&  tlMasterXbar__monitor___GEN_22  );
    wire  tlMasterXbar__monitor___GEN_32  =  tlMasterXbar__monitor__io_in_a_valid  &  tlMasterXbar__monitor__io_in_a_bits_opcode  ==3'h0&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_33  =  tlMasterXbar__monitor__io_in_a_valid  &  tlMasterXbar__monitor__io_in_a_bits_opcode  ==3'h1&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_34  =  tlMasterXbar__monitor___GEN_12  &  tlMasterXbar__monitor__io_in_a_bits_size  <4'h4&(  tlMasterXbar__monitor___GEN_23  |  tlMasterXbar__monitor___GEN_20  |  tlMasterXbar__monitor___GEN_21  );
    wire  tlMasterXbar__monitor___GEN_35  =  tlMasterXbar__monitor__io_in_a_valid  &  tlMasterXbar__monitor__io_in_a_bits_opcode  ==3'h2&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_36  =  tlMasterXbar__monitor__io_in_a_valid  &  tlMasterXbar__monitor__io_in_a_bits_opcode  ==3'h3&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_37  =  tlMasterXbar__monitor__io_in_a_valid  &  tlMasterXbar__monitor__io_in_a_bits_opcode  ==3'h5&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_38  =  tlMasterXbar__monitor__io_in_d_valid  &  tlMasterXbar__monitor__io_in_d_bits_opcode  ==3'h6&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_39  =  tlMasterXbar__monitor__io_in_d_bits_size  <4'h3;
    wire  tlMasterXbar__monitor___GEN_40  =  tlMasterXbar__monitor__io_in_d_valid  &  tlMasterXbar__monitor__io_in_d_bits_opcode  ==3'h4&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_41  =  tlMasterXbar__monitor__io_in_d_bits_param  ==2'h2;
    wire  tlMasterXbar__monitor___GEN_42  =  tlMasterXbar__monitor__io_in_d_valid  &  tlMasterXbar__monitor__io_in_d_bits_opcode  ==3'h5&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_43  =~  tlMasterXbar__monitor__io_in_d_bits_denied  |  tlMasterXbar__monitor__io_in_d_bits_corrupt  ;
    wire  tlMasterXbar__monitor___GEN_44  =  tlMasterXbar__monitor__io_in_d_valid  &  tlMasterXbar__monitor__io_in_d_bits_opcode  ==3'h0&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_45  =  tlMasterXbar__monitor__io_in_d_valid  &  tlMasterXbar__monitor__io_in_d_bits_opcode  ==3'h1&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_46  =  tlMasterXbar__monitor__io_in_d_valid  &  tlMasterXbar__monitor__io_in_d_bits_opcode  ==3'h2&~  tlMasterXbar__monitor__reset  ;
    wire[19:0]  tlMasterXbar__monitor___GEN_47  ={  tlMasterXbar__monitor__io_in_b_bits_address  [31:14],~(  tlMasterXbar__monitor__io_in_b_bits_address  [13:12])};
    wire[5:0]  tlMasterXbar__monitor___GEN_48  ={  tlMasterXbar__monitor__io_in_b_bits_address  [31:28],~(  tlMasterXbar__monitor__io_in_b_bits_address  [27:26])};
    wire[15:0]  tlMasterXbar__monitor___GEN_49  ={  tlMasterXbar__monitor__io_in_b_bits_address  [31:26],  tlMasterXbar__monitor__io_in_b_bits_address  [25:16]^10'h200};
    wire[15:0]  tlMasterXbar__monitor___GEN_50  ={  tlMasterXbar__monitor__io_in_b_bits_address  [31:17],~(  tlMasterXbar__monitor__io_in_b_bits_address  [16])};
    wire  tlMasterXbar__monitor___GEN_51  =  tlMasterXbar__monitor__io_in_b_bits_address  [31:28]!=4'h8;
    wire[2:0]  tlMasterXbar__monitor___GEN_52  ={  tlMasterXbar__monitor__io_in_b_bits_address  [31],~(  tlMasterXbar__monitor__io_in_b_bits_address  [30:29])};
    wire  tlMasterXbar__monitor__address_ok  =~(|  tlMasterXbar__monitor___GEN_47  )|~(|  tlMasterXbar__monitor___GEN_48  )|~(|  tlMasterXbar__monitor___GEN_49  )|~(|(  tlMasterXbar__monitor__io_in_b_bits_address  [31:12]))|~(|  tlMasterXbar__monitor___GEN_50  )|~  tlMasterXbar__monitor___GEN_51  |~(|  tlMasterXbar__monitor___GEN_52  );
    wire[26:0]  tlMasterXbar__monitor___is_aligned_mask_T_4  =27'hFFF<<  tlMasterXbar__monitor__io_in_b_bits_size  ;
    wire[11:0]  tlMasterXbar__monitor___GEN_53  =  tlMasterXbar__monitor__io_in_b_bits_address  [11:0]&~(  tlMasterXbar__monitor___is_aligned_mask_T_4  [11:0]);
    wire  tlMasterXbar__monitor___mask_T_1  =  tlMasterXbar__monitor__io_in_b_bits_size  >4'h2;
    wire  tlMasterXbar__monitor__mask_size_3  =  tlMasterXbar__monitor__io_in_b_bits_size  [1:0]==2'h2;
    wire  tlMasterXbar__monitor__mask_acc_14  =  tlMasterXbar__monitor___mask_T_1  |  tlMasterXbar__monitor__mask_size_3  &~(  tlMasterXbar__monitor__io_in_b_bits_address  [2]);
    wire  tlMasterXbar__monitor__mask_acc_15  =  tlMasterXbar__monitor___mask_T_1  |  tlMasterXbar__monitor__mask_size_3  &  tlMasterXbar__monitor__io_in_b_bits_address  [2];
    wire  tlMasterXbar__monitor__mask_size_4  =  tlMasterXbar__monitor__io_in_b_bits_size  [1:0]==2'h1;
    wire  tlMasterXbar__monitor__mask_eq_16  =~(  tlMasterXbar__monitor__io_in_b_bits_address  [2])&~(  tlMasterXbar__monitor__io_in_b_bits_address  [1]);
    wire  tlMasterXbar__monitor__mask_acc_16  =  tlMasterXbar__monitor__mask_acc_14  |  tlMasterXbar__monitor__mask_size_4  &  tlMasterXbar__monitor__mask_eq_16  ;
    wire  tlMasterXbar__monitor__mask_eq_17  =~(  tlMasterXbar__monitor__io_in_b_bits_address  [2])&  tlMasterXbar__monitor__io_in_b_bits_address  [1];
    wire  tlMasterXbar__monitor__mask_acc_17  =  tlMasterXbar__monitor__mask_acc_14  |  tlMasterXbar__monitor__mask_size_4  &  tlMasterXbar__monitor__mask_eq_17  ;
    wire  tlMasterXbar__monitor__mask_eq_18  =  tlMasterXbar__monitor__io_in_b_bits_address  [2]&~(  tlMasterXbar__monitor__io_in_b_bits_address  [1]);
    wire  tlMasterXbar__monitor__mask_acc_18  =  tlMasterXbar__monitor__mask_acc_15  |  tlMasterXbar__monitor__mask_size_4  &  tlMasterXbar__monitor__mask_eq_18  ;
    wire  tlMasterXbar__monitor__mask_eq_19  =  tlMasterXbar__monitor__io_in_b_bits_address  [2]&  tlMasterXbar__monitor__io_in_b_bits_address  [1];
    wire  tlMasterXbar__monitor__mask_acc_19  =  tlMasterXbar__monitor__mask_acc_15  |  tlMasterXbar__monitor__mask_size_4  &  tlMasterXbar__monitor__mask_eq_19  ;
    wire[7:0]  tlMasterXbar__monitor__mask_1  ={  tlMasterXbar__monitor__mask_acc_19  |  tlMasterXbar__monitor__mask_eq_19  &  tlMasterXbar__monitor__io_in_b_bits_address  [0],  tlMasterXbar__monitor__mask_acc_19  |  tlMasterXbar__monitor__mask_eq_19  &~(  tlMasterXbar__monitor__io_in_b_bits_address  [0]),  tlMasterXbar__monitor__mask_acc_18  |  tlMasterXbar__monitor__mask_eq_18  &  tlMasterXbar__monitor__io_in_b_bits_address  [0],  tlMasterXbar__monitor__mask_acc_18  |  tlMasterXbar__monitor__mask_eq_18  &~(  tlMasterXbar__monitor__io_in_b_bits_address  [0]),  tlMasterXbar__monitor__mask_acc_17  |  tlMasterXbar__monitor__mask_eq_17  &  tlMasterXbar__monitor__io_in_b_bits_address  [0],  tlMasterXbar__monitor__mask_acc_17  |  tlMasterXbar__monitor__mask_eq_17  &~(  tlMasterXbar__monitor__io_in_b_bits_address  [0]),  tlMasterXbar__monitor__mask_acc_16  |  tlMasterXbar__monitor__mask_eq_16  &  tlMasterXbar__monitor__io_in_b_bits_address  [0],  tlMasterXbar__monitor__mask_acc_16  |  tlMasterXbar__monitor__mask_eq_16  &~(  tlMasterXbar__monitor__io_in_b_bits_address  [0])};
    wire  tlMasterXbar__monitor___GEN_54  =  tlMasterXbar__monitor__io_in_b_valid  &  tlMasterXbar__monitor__io_in_b_bits_opcode  ==3'h6&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_55  =  tlMasterXbar__monitor__io_in_b_bits_mask  !=  tlMasterXbar__monitor__mask_1  ;
    wire  tlMasterXbar__monitor___GEN_56  =  tlMasterXbar__monitor__io_in_b_valid  &  tlMasterXbar__monitor__io_in_b_bits_opcode  ==3'h4&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_57  =  tlMasterXbar__monitor__io_in_b_valid  &  tlMasterXbar__monitor__io_in_b_bits_opcode  ==3'h0&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_58  =  tlMasterXbar__monitor__io_in_b_valid  &  tlMasterXbar__monitor__io_in_b_bits_opcode  ==3'h1&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_59  =  tlMasterXbar__monitor__io_in_b_valid  &  tlMasterXbar__monitor__io_in_b_bits_opcode  ==3'h2&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_60  =  tlMasterXbar__monitor__io_in_b_valid  &  tlMasterXbar__monitor__io_in_b_bits_opcode  ==3'h3&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_61  =  tlMasterXbar__monitor__io_in_b_valid  &  tlMasterXbar__monitor__io_in_b_bits_opcode  ==3'h5&~  tlMasterXbar__monitor__reset  ;
    wire[26:0]  tlMasterXbar__monitor___is_aligned_mask_T_7  =27'hFFF<<  tlMasterXbar__monitor___GEN_0  ;
    wire[11:0]  tlMasterXbar__monitor___GEN_62  =  tlMasterXbar__monitor__io_in_c_bits_address  [11:0]&~(  tlMasterXbar__monitor___is_aligned_mask_T_7  [11:0]);
    wire[19:0]  tlMasterXbar__monitor___GEN_63  ={  tlMasterXbar__monitor__io_in_c_bits_address  [31:14],~(  tlMasterXbar__monitor__io_in_c_bits_address  [13:12])};
    wire[5:0]  tlMasterXbar__monitor___GEN_64  ={  tlMasterXbar__monitor__io_in_c_bits_address  [31:28],~(  tlMasterXbar__monitor__io_in_c_bits_address  [27:26])};
    wire[15:0]  tlMasterXbar__monitor___GEN_65  ={  tlMasterXbar__monitor__io_in_c_bits_address  [31:26],  tlMasterXbar__monitor__io_in_c_bits_address  [25:16]^10'h200};
    wire[15:0]  tlMasterXbar__monitor___GEN_66  ={  tlMasterXbar__monitor__io_in_c_bits_address  [31:17],~(  tlMasterXbar__monitor__io_in_c_bits_address  [16])};
    wire  tlMasterXbar__monitor___GEN_67  =  tlMasterXbar__monitor__io_in_c_bits_address  [31:28]!=4'h8;
    wire[2:0]  tlMasterXbar__monitor___GEN_68  ={  tlMasterXbar__monitor__io_in_c_bits_address  [31],~(  tlMasterXbar__monitor__io_in_c_bits_address  [30:29])};
    wire  tlMasterXbar__monitor__address_ok_1  =~(|  tlMasterXbar__monitor___GEN_63  )|~(|  tlMasterXbar__monitor___GEN_64  )|~(|  tlMasterXbar__monitor___GEN_65  )|~(|(  tlMasterXbar__monitor__io_in_c_bits_address  [31:12]))|~(|  tlMasterXbar__monitor___GEN_66  )|~  tlMasterXbar__monitor___GEN_67  |~(|  tlMasterXbar__monitor___GEN_68  );
    wire  tlMasterXbar__monitor___GEN_69  =  tlMasterXbar__monitor__io_in_c_valid  &  tlMasterXbar__monitor__io_in_c_bits_opcode  ==3'h4&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_70  =  tlMasterXbar__monitor__io_in_c_bits_size  <4'h3;
    wire  tlMasterXbar__monitor___GEN_71  =  tlMasterXbar__monitor__io_in_c_valid  &  tlMasterXbar__monitor__io_in_c_bits_opcode  ==3'h5&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_72  =  tlMasterXbar__monitor__io_in_c_bits_size  <4'hD;
    wire  tlMasterXbar__monitor___GEN_73  =  tlMasterXbar__monitor___GEN_72  &  tlMasterXbar__monitor__io_in_c_bits_size  <4'h7&~  tlMasterXbar__monitor___GEN_67  ;
    wire  tlMasterXbar__monitor___GEN_74  =  tlMasterXbar__monitor__io_in_c_valid  &  tlMasterXbar__monitor__io_in_c_bits_opcode  ==3'h6&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_75  =~  tlMasterXbar__monitor__io_in_c_bits_source  &  tlMasterXbar__monitor__io_in_c_bits_size  ==4'h6&  tlMasterXbar__monitor___GEN_72  &(~(|(  tlMasterXbar__monitor__io_in_c_bits_address  [31:
            12]))|~(|  tlMasterXbar__monitor___GEN_63  )|~(|  tlMasterXbar__monitor___GEN_66  )|~(|  tlMasterXbar__monitor___GEN_65  )|~(|  tlMasterXbar__monitor___GEN_64  )|~(|  tlMasterXbar__monitor___GEN_68  )|~  tlMasterXbar__monitor___GEN_67  );
    wire  tlMasterXbar__monitor___GEN_76  =  tlMasterXbar__monitor__io_in_c_valid  &(&  tlMasterXbar__monitor__io_in_c_bits_opcode  )&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_77  =  tlMasterXbar__monitor__io_in_c_valid  &  tlMasterXbar__monitor__io_in_c_bits_opcode  ==3'h0&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_78  =  tlMasterXbar__monitor__io_in_c_valid  &  tlMasterXbar__monitor__io_in_c_bits_opcode  ==3'h1&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_79  =  tlMasterXbar__monitor__io_in_c_valid  &  tlMasterXbar__monitor__io_in_c_bits_opcode  ==3'h2&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_80  =  tlMasterXbar__monitor__io_in_a_valid  &(|  tlMasterXbar__monitor__a_first_counter  )&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_81  =  tlMasterXbar__monitor__io_in_d_valid  &(|  tlMasterXbar__monitor__d_first_counter  )&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_82  =  tlMasterXbar__monitor__io_in_b_valid  &(|  tlMasterXbar__monitor__b_first_counter  )&~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_83  =  tlMasterXbar__monitor__io_in_c_valid  &(|  tlMasterXbar__monitor__c_first_counter  )&~  tlMasterXbar__monitor__reset  ;
    wire[15:0]  tlMasterXbar__monitor___GEN_84  ={12'h0,  tlMasterXbar__monitor__io_in_d_bits_source  ,3'h0};
    wire  tlMasterXbar__monitor___same_cycle_resp_T_1  =  tlMasterXbar__monitor__io_in_a_valid  &  tlMasterXbar__monitor__a_first_1  ;
    wire[1:0]  tlMasterXbar__monitor__a_set_wo_ready  =  tlMasterXbar__monitor___same_cycle_resp_T_1   ? 2'h1<<  tlMasterXbar__monitor___GEN_1  :2'h0;
    wire  tlMasterXbar__monitor___GEN_85  =  tlMasterXbar__monitor__io_in_d_valid  &  tlMasterXbar__monitor__d_first_1  ;
    wire  tlMasterXbar__monitor___GEN_86  =  tlMasterXbar__monitor___GEN_85  &~  tlMasterXbar__monitor__d_release_ack  ;
    wire  tlMasterXbar__monitor__same_cycle_resp  =  tlMasterXbar__monitor___same_cycle_resp_T_1  &  tlMasterXbar__monitor__io_in_a_bits_source  ==  tlMasterXbar__monitor__io_in_d_bits_source  ;
    wire  tlMasterXbar__monitor___GEN_87  =  tlMasterXbar__monitor___GEN_86  &  tlMasterXbar__monitor__same_cycle_resp  &~  tlMasterXbar__monitor__reset  ;
    wire  tlMasterXbar__monitor___GEN_88  =  tlMasterXbar__monitor___GEN_86  &~  tlMasterXbar__monitor__same_cycle_resp  &~  tlMasterXbar__monitor__reset  ;
    wire[7:0]  tlMasterXbar__monitor___GEN_89  ={4'h0,  tlMasterXbar__monitor__io_in_d_bits_size  };
    wire  tlMasterXbar__monitor___same_cycle_resp_T_3  =  tlMasterXbar__monitor__io_in_c_valid  &  tlMasterXbar__monitor__c_first_1  ;
    wire[1:0]  tlMasterXbar__monitor__c_set_wo_ready  =  tlMasterXbar__monitor___same_cycle_resp_T_3  &  tlMasterXbar__monitor___GEN_4   ? 2'h1<<  tlMasterXbar__monitor___GEN_5  :2'h0;
    wire  tlMasterXbar__monitor___GEN_90  =  tlMasterXbar__monitor__io_in_d_valid  &  tlMasterXbar__monitor__d_first_2  ;
    wire  tlMasterXbar__monitor___GEN_91  =  tlMasterXbar__monitor___GEN_90  &  tlMasterXbar__monitor__d_release_ack  ;
    wire  tlMasterXbar__monitor__same_cycle_resp_1  =  tlMasterXbar__monitor___same_cycle_resp_T_3  &  tlMasterXbar__monitor__io_in_c_bits_opcode  [2]&  tlMasterXbar__monitor__io_in_c_bits_opcode  [1]&  tlMasterXbar__monitor__io_in_c_bits_source  ==  tlMasterXbar__monitor__io_in_d_bits_source  ;
    wire[1:0]  tlMasterXbar__monitor___GEN_92  =  tlMasterXbar__monitor__inflight  >>  tlMasterXbar__monitor___GEN_1  ;
    wire[1:0]  tlMasterXbar__monitor___GEN_93  =  tlMasterXbar__monitor__inflight  >>  tlMasterXbar__monitor___GEN_3  ;
    wire[15:0]  tlMasterXbar__monitor___a_size_lookup_T_1  =  tlMasterXbar__monitor__inflight_sizes  >>  tlMasterXbar__monitor___GEN_84  ;
    wire[1:0]  tlMasterXbar__monitor___GEN_94  =  tlMasterXbar__monitor__inflight_1  >>  tlMasterXbar__monitor___GEN_5  ;
    wire[1:0]  tlMasterXbar__monitor___GEN_95  =  tlMasterXbar__monitor__inflight_1  >>  tlMasterXbar__monitor___GEN_3  ;
    wire[15:0]  tlMasterXbar__monitor___c_size_lookup_T_1  =  tlMasterXbar__monitor__inflight_sizes_1  >>  tlMasterXbar__monitor___GEN_84  ;
    wire[3:0]  tlMasterXbar__monitor___GEN_96  =  tlMasterXbar__monitor__inflight_2  >>  tlMasterXbar__monitor___GEN_8  ;
    wire[3:0]  tlMasterXbar__monitor___GEN_97  =(  tlMasterXbar__monitor__d_set  |  tlMasterXbar__monitor__inflight_2  )>>  tlMasterXbar__monitor___GEN_10  ;
    always @( posedge   tlMasterXbar__monitor__clock  )
    begin
        if (  tlMasterXbar__monitor___GEN_16  &~  tlMasterXbar__monitor___GEN_15  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel carries AcquireBlock type which is unexpected using diplomatic parameters (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_16  &~  tlMasterXbar__monitor___GEN_24  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel carries AcquireBlock from a client which does not support Probe (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_16  &~  tlMasterXbar__monitor___mask_T  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel AcquireBlock smaller than a beat (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_16  &(|  tlMasterXbar__monitor___GEN_11  ))
        begin
            if (1)
                $display("Assertion failed: 'A' channel AcquireBlock address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_16  &  tlMasterXbar__monitor___GEN_25  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel AcquireBlock carries invalid grow param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_16  &  tlMasterXbar__monitor___GEN_26  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel AcquireBlock contains invalid mask (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_27  &~  tlMasterXbar__monitor___GEN_15  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel carries AcquirePerm type which is unexpected using diplomatic parameters (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_27  &~  tlMasterXbar__monitor___GEN_24  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel carries AcquirePerm from a client which does not support Probe (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_27  &~  tlMasterXbar__monitor___mask_T  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel AcquirePerm smaller than a beat (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_27  &(|  tlMasterXbar__monitor___GEN_11  ))
        begin
            if (1)
                $display("Assertion failed: 'A' channel AcquirePerm address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_27  &  tlMasterXbar__monitor___GEN_25  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel AcquirePerm carries invalid grow param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_27  &~(|  tlMasterXbar__monitor__io_in_a_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'A' channel AcquirePerm requests NtoB (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_27  &  tlMasterXbar__monitor___GEN_26  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel AcquirePerm contains invalid mask (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_28  &~  tlMasterXbar__monitor___GEN_12  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel carries Get type which master claims it can't emit (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_28  &~(  tlMasterXbar__monitor___GEN_29  |  tlMasterXbar__monitor___GEN_13  &(  tlMasterXbar__monitor___GEN_17  |  tlMasterXbar__monitor___GEN_19  |  tlMasterXbar__monitor___GEN_20  |  tlMasterXbar__monitor___GEN_21  |  tlMasterXbar__monitor___GEN_22  |  tlMasterXbar__monitor___GEN_14  )))
        begin
            if (1)
                $display("Assertion failed: 'A' channel carries Get type which slave claims it can't support (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_28  &(|  tlMasterXbar__monitor___GEN_11  ))
        begin
            if (1)
                $display("Assertion failed: 'A' channel Get address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_28  &(|  tlMasterXbar__monitor__io_in_a_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'A' channel Get carries invalid param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_28  &  tlMasterXbar__monitor___GEN_30  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel Get contains invalid mask (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_32  &~  tlMasterXbar__monitor___GEN_31  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel carries PutFull type which is unexpected using diplomatic parameters (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_32  &(|  tlMasterXbar__monitor___GEN_11  ))
        begin
            if (1)
                $display("Assertion failed: 'A' channel PutFull address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_32  &(|  tlMasterXbar__monitor__io_in_a_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'A' channel PutFull carries invalid param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_32  &  tlMasterXbar__monitor___GEN_30  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel PutFull contains invalid mask (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_33  &~  tlMasterXbar__monitor___GEN_31  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel carries PutPartial type which is unexpected using diplomatic parameters (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_33  &(|  tlMasterXbar__monitor___GEN_11  ))
        begin
            if (1)
                $display("Assertion failed: 'A' channel PutPartial address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_33  &(|  tlMasterXbar__monitor__io_in_a_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'A' channel PutPartial carries invalid param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_33  &(|(  tlMasterXbar__monitor__io_in_a_bits_mask  &~  tlMasterXbar__monitor__mask  )))
        begin
            if (1)
                $display("Assertion failed: 'A' channel PutPartial contains invalid mask (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_35  &~  tlMasterXbar__monitor___GEN_34  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel carries Arithmetic type which is unexpected using diplomatic parameters (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_35  &(|  tlMasterXbar__monitor___GEN_11  ))
        begin
            if (1)
                $display("Assertion failed: 'A' channel Arithmetic address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_35  &  tlMasterXbar__monitor__io_in_a_bits_param  >3'h4)
        begin
            if (1)
                $display("Assertion failed: 'A' channel Arithmetic carries invalid opcode param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_35  &  tlMasterXbar__monitor___GEN_30  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel Arithmetic contains invalid mask (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_36  &~  tlMasterXbar__monitor___GEN_34  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel carries Logical type which is unexpected using diplomatic parameters (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_36  &(|  tlMasterXbar__monitor___GEN_11  ))
        begin
            if (1)
                $display("Assertion failed: 'A' channel Logical address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_36  &  tlMasterXbar__monitor__io_in_a_bits_param  [2])
        begin
            if (1)
                $display("Assertion failed: 'A' channel Logical carries invalid opcode param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_36  &  tlMasterXbar__monitor___GEN_30  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel Logical contains invalid mask (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_37  &~(  tlMasterXbar__monitor___GEN_12  &  tlMasterXbar__monitor___GEN_29  ))
        begin
            if (1)
                $display("Assertion failed: 'A' channel carries Hint type which is unexpected using diplomatic parameters (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_37  &(|  tlMasterXbar__monitor___GEN_11  ))
        begin
            if (1)
                $display("Assertion failed: 'A' channel Hint address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_37  &(|(  tlMasterXbar__monitor__io_in_a_bits_param  [2:1])))
        begin
            if (1)
                $display("Assertion failed: 'A' channel Hint carries invalid opcode param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_37  &  tlMasterXbar__monitor___GEN_30  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel Hint contains invalid mask (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor__io_in_d_valid  &~  tlMasterXbar__monitor__reset  &(&  tlMasterXbar__monitor__io_in_d_bits_opcode  ))
        begin
            if (1)
                $display("Assertion failed: 'D' channel has invalid opcode (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_38  &  tlMasterXbar__monitor___GEN_39  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel ReleaseAck smaller than a beat (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_38  &(|  tlMasterXbar__monitor__io_in_d_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'D' channel ReleaseeAck carries invalid param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_38  &  tlMasterXbar__monitor__io_in_d_bits_corrupt  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel ReleaseAck is corrupt (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_38  &  tlMasterXbar__monitor__io_in_d_bits_denied  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel ReleaseAck is denied (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_40  &  tlMasterXbar__monitor___GEN_39  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel Grant smaller than a beat (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_40  &(&  tlMasterXbar__monitor__io_in_d_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'D' channel Grant carries invalid cap param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_40  &  tlMasterXbar__monitor___GEN_41  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel Grant carries toN param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_40  &  tlMasterXbar__monitor__io_in_d_bits_corrupt  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel Grant is corrupt (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_42  &  tlMasterXbar__monitor___GEN_39  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel GrantData smaller than a beat (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_42  &(&  tlMasterXbar__monitor__io_in_d_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'D' channel GrantData carries invalid cap param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_42  &  tlMasterXbar__monitor___GEN_41  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel GrantData carries toN param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_42  &~  tlMasterXbar__monitor___GEN_43  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel GrantData is denied but not corrupt (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_44  &(|  tlMasterXbar__monitor__io_in_d_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'D' channel AccessAck carries invalid param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_44  &  tlMasterXbar__monitor__io_in_d_bits_corrupt  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel AccessAck is corrupt (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_45  &(|  tlMasterXbar__monitor__io_in_d_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'D' channel AccessAckData carries invalid param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_45  &~  tlMasterXbar__monitor___GEN_43  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel AccessAckData is denied but not corrupt (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_46  &(|  tlMasterXbar__monitor__io_in_d_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'D' channel HintAck carries invalid param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_46  &  tlMasterXbar__monitor__io_in_d_bits_corrupt  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel HintAck is corrupt (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor__io_in_b_valid  &~  tlMasterXbar__monitor__reset  &(&  tlMasterXbar__monitor__io_in_b_bits_opcode  ))
        begin
            if (1)
                $display("Assertion failed: 'B' channel has invalid opcode (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_54  &~(~  tlMasterXbar__monitor__io_in_b_bits_source  &  tlMasterXbar__monitor__io_in_b_bits_size  ==4'h6&  tlMasterXbar__monitor__io_in_b_bits_size  <4'hD&(~(|(  tlMasterXbar__monitor__io_in_b_bits_address  [31:12]))|~(|  tlMasterXbar__monitor___GEN_47  )|~(|  tlMasterXbar__monitor___GEN_50  )|~(|  tlMasterXbar__monitor___GEN_49  )|~(|  tlMasterXbar__monitor___GEN_48  )|~(|  tlMasterXbar__monitor___GEN_52  )|~  tlMasterXbar__monitor___GEN_51  )))
        begin
            if (1)
                $display("Assertion failed: 'B' channel carries Probe type which is unexpected using diplomatic parameters (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_54  &~  tlMasterXbar__monitor__address_ok  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel Probe carries unmanaged address (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_54  &(|  tlMasterXbar__monitor___GEN_53  ))
        begin
            if (1)
                $display("Assertion failed: 'B' channel Probe address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_54  &(&  tlMasterXbar__monitor__io_in_b_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'B' channel Probe carries invalid cap param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_54  &  tlMasterXbar__monitor___GEN_55  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel Probe contains invalid mask (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_54  &  tlMasterXbar__monitor__io_in_b_bits_corrupt  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel Probe is corrupt (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_56  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel carries Get type which is unexpected using diplomatic parameters (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_56  &~  tlMasterXbar__monitor__address_ok  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel Get carries unmanaged address (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_56  &(|  tlMasterXbar__monitor___GEN_53  ))
        begin
            if (1)
                $display("Assertion failed: 'B' channel Get address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_56  &(|  tlMasterXbar__monitor__io_in_b_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'B' channel Get carries invalid param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_56  &  tlMasterXbar__monitor___GEN_55  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel Get contains invalid mask (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_56  &  tlMasterXbar__monitor__io_in_b_bits_corrupt  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel Get is corrupt (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_57  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel carries PutFull type which is unexpected using diplomatic parameters (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_57  &~  tlMasterXbar__monitor__address_ok  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel PutFull carries unmanaged address (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_57  &(|  tlMasterXbar__monitor___GEN_53  ))
        begin
            if (1)
                $display("Assertion failed: 'B' channel PutFull address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_57  &(|  tlMasterXbar__monitor__io_in_b_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'B' channel PutFull carries invalid param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_57  &  tlMasterXbar__monitor___GEN_55  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel PutFull contains invalid mask (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_58  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel carries PutPartial type which is unexpected using diplomatic parameters (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_58  &~  tlMasterXbar__monitor__address_ok  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel PutPartial carries unmanaged address (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_58  &(|  tlMasterXbar__monitor___GEN_53  ))
        begin
            if (1)
                $display("Assertion failed: 'B' channel PutPartial address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_58  &(|  tlMasterXbar__monitor__io_in_b_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'B' channel PutPartial carries invalid param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_58  &(|(  tlMasterXbar__monitor__io_in_b_bits_mask  &~  tlMasterXbar__monitor__mask_1  )))
        begin
            if (1)
                $display("Assertion failed: 'B' channel PutPartial contains invalid mask (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_59  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel carries Arithmetic type unsupported by master (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_59  &~  tlMasterXbar__monitor__address_ok  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel Arithmetic carries unmanaged address (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_59  &(|  tlMasterXbar__monitor___GEN_53  ))
        begin
            if (1)
                $display("Assertion failed: 'B' channel Arithmetic address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_59  &  tlMasterXbar__monitor___GEN_55  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel Arithmetic contains invalid mask (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_60  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel carries Logical type unsupported by client (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_60  &~  tlMasterXbar__monitor__address_ok  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel Logical carries unmanaged address (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_60  &(|  tlMasterXbar__monitor___GEN_53  ))
        begin
            if (1)
                $display("Assertion failed: 'B' channel Logical address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_60  &  tlMasterXbar__monitor___GEN_55  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel Logical contains invalid mask (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_61  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel carries Hint type unsupported by client (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_61  &~  tlMasterXbar__monitor__address_ok  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel Hint carries unmanaged address (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_61  &(|  tlMasterXbar__monitor___GEN_53  ))
        begin
            if (1)
                $display("Assertion failed: 'B' channel Hint address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_61  &  tlMasterXbar__monitor___GEN_55  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel Hint contains invalid mask (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_61  &  tlMasterXbar__monitor__io_in_b_bits_corrupt  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel Hint is corrupt (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_69  &~  tlMasterXbar__monitor__address_ok_1  )
        begin
            if (1)
                $display("Assertion failed: 'C' channel ProbeAck carries unmanaged address (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_69  &  tlMasterXbar__monitor___GEN_70  )
        begin
            if (1)
                $display("Assertion failed: 'C' channel ProbeAck smaller than a beat (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_69  &(|  tlMasterXbar__monitor___GEN_62  ))
        begin
            if (1)
                $display("Assertion failed: 'C' channel ProbeAck address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_69  &(&(  tlMasterXbar__monitor__io_in_c_bits_param  [2:1])))
        begin
            if (1)
                $display("Assertion failed: 'C' channel ProbeAck carries invalid report param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_71  &~  tlMasterXbar__monitor__address_ok_1  )
        begin
            if (1)
                $display("Assertion failed: 'C' channel ProbeAckData carries unmanaged address (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_71  &  tlMasterXbar__monitor___GEN_70  )
        begin
            if (1)
                $display("Assertion failed: 'C' channel ProbeAckData smaller than a beat (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_71  &(|  tlMasterXbar__monitor___GEN_62  ))
        begin
            if (1)
                $display("Assertion failed: 'C' channel ProbeAckData address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_71  &(&(  tlMasterXbar__monitor__io_in_c_bits_param  [2:1])))
        begin
            if (1)
                $display("Assertion failed: 'C' channel ProbeAckData carries invalid report param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_74  &~  tlMasterXbar__monitor___GEN_73  )
        begin
            if (1)
                $display("Assertion failed: 'C' channel carries Release type unsupported by manager (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_74  &~  tlMasterXbar__monitor___GEN_75  )
        begin
            if (1)
                $display("Assertion failed: 'C' channel carries Release from a client which does not support Probe (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_74  &  tlMasterXbar__monitor___GEN_70  )
        begin
            if (1)
                $display("Assertion failed: 'C' channel Release smaller than a beat (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_74  &(|  tlMasterXbar__monitor___GEN_62  ))
        begin
            if (1)
                $display("Assertion failed: 'C' channel Release address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_74  &(&(  tlMasterXbar__monitor__io_in_c_bits_param  [2:1])))
        begin
            if (1)
                $display("Assertion failed: 'C' channel Release carries invalid report param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_76  &~  tlMasterXbar__monitor___GEN_73  )
        begin
            if (1)
                $display("Assertion failed: 'C' channel carries ReleaseData type unsupported by manager (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_76  &~  tlMasterXbar__monitor___GEN_75  )
        begin
            if (1)
                $display("Assertion failed: 'C' channel carries Release from a client which does not support Probe (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_76  &  tlMasterXbar__monitor___GEN_70  )
        begin
            if (1)
                $display("Assertion failed: 'C' channel ReleaseData smaller than a beat (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_76  &(|  tlMasterXbar__monitor___GEN_62  ))
        begin
            if (1)
                $display("Assertion failed: 'C' channel ReleaseData address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_76  &(&(  tlMasterXbar__monitor__io_in_c_bits_param  [2:1])))
        begin
            if (1)
                $display("Assertion failed: 'C' channel ReleaseData carries invalid report param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_77  &~  tlMasterXbar__monitor__address_ok_1  )
        begin
            if (1)
                $display("Assertion failed: 'C' channel AccessAck carries unmanaged address (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_77  &(|  tlMasterXbar__monitor___GEN_62  ))
        begin
            if (1)
                $display("Assertion failed: 'C' channel AccessAck address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_77  &(|  tlMasterXbar__monitor__io_in_c_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'C' channel AccessAck carries invalid param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_78  &~  tlMasterXbar__monitor__address_ok_1  )
        begin
            if (1)
                $display("Assertion failed: 'C' channel AccessAckData carries unmanaged address (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_78  &(|  tlMasterXbar__monitor___GEN_62  ))
        begin
            if (1)
                $display("Assertion failed: 'C' channel AccessAckData address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_78  &(|  tlMasterXbar__monitor__io_in_c_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'C' channel AccessAckData carries invalid param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_79  &~  tlMasterXbar__monitor__address_ok_1  )
        begin
            if (1)
                $display("Assertion failed: 'C' channel HintAck carries unmanaged address (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_79  &(|  tlMasterXbar__monitor___GEN_62  ))
        begin
            if (1)
                $display("Assertion failed: 'C' channel HintAck address not aligned to size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_79  &(|  tlMasterXbar__monitor__io_in_c_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'C' channel HintAck carries invalid param (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_80  &  tlMasterXbar__monitor__io_in_a_bits_opcode  !=  tlMasterXbar__monitor__opcode  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel opcode changed within multibeat operation (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_80  &  tlMasterXbar__monitor__io_in_a_bits_param  !=  tlMasterXbar__monitor__param  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel param changed within multibeat operation (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_80  &  tlMasterXbar__monitor__io_in_a_bits_size  !=  tlMasterXbar__monitor__size  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel size changed within multibeat operation (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_80  &  tlMasterXbar__monitor__io_in_a_bits_source  !=  tlMasterXbar__monitor__source  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel source changed within multibeat operation (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_80  &  tlMasterXbar__monitor__io_in_a_bits_address  !=  tlMasterXbar__monitor__address  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel address changed with multibeat operation (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_81  &  tlMasterXbar__monitor__io_in_d_bits_opcode  !=  tlMasterXbar__monitor__opcode_1  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel opcode changed within multibeat operation (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_81  &  tlMasterXbar__monitor__io_in_d_bits_param  !=  tlMasterXbar__monitor__param_1  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel param changed within multibeat operation (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_81  &  tlMasterXbar__monitor__io_in_d_bits_size  !=  tlMasterXbar__monitor__size_1  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel size changed within multibeat operation (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_81  &  tlMasterXbar__monitor__io_in_d_bits_source  !=  tlMasterXbar__monitor__source_1  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel source changed within multibeat operation (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_81  &  tlMasterXbar__monitor__io_in_d_bits_sink  !=  tlMasterXbar__monitor__sink  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel sink changed with multibeat operation (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_81  &  tlMasterXbar__monitor__io_in_d_bits_denied  !=  tlMasterXbar__monitor__denied  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel denied changed with multibeat operation (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_82  &  tlMasterXbar__monitor__io_in_b_bits_opcode  !=  tlMasterXbar__monitor__opcode_2  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel opcode changed within multibeat operation (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_82  &  tlMasterXbar__monitor__io_in_b_bits_param  !=  tlMasterXbar__monitor__param_2  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel param changed within multibeat operation (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_82  &  tlMasterXbar__monitor__io_in_b_bits_size  !=  tlMasterXbar__monitor__size_2  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel size changed within multibeat operation (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_82  &  tlMasterXbar__monitor__io_in_b_bits_source  !=  tlMasterXbar__monitor__source_2  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel source changed within multibeat operation (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_82  &  tlMasterXbar__monitor__io_in_b_bits_address  !=  tlMasterXbar__monitor__address_1  )
        begin
            if (1)
                $display("Assertion failed: 'B' channel addresss changed with multibeat operation (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_83  &  tlMasterXbar__monitor__io_in_c_bits_opcode  !=  tlMasterXbar__monitor__opcode_3  )
        begin
            if (1)
                $display("Assertion failed: 'C' channel opcode changed within multibeat operation (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_83  &  tlMasterXbar__monitor__io_in_c_bits_param  !=  tlMasterXbar__monitor__param_3  )
        begin
            if (1)
                $display("Assertion failed: 'C' channel param changed within multibeat operation (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_83  &  tlMasterXbar__monitor__io_in_c_bits_size  !=  tlMasterXbar__monitor__size_3  )
        begin
            if (1)
                $display("Assertion failed: 'C' channel size changed within multibeat operation (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_83  &  tlMasterXbar__monitor__io_in_c_bits_source  !=  tlMasterXbar__monitor__source_3  )
        begin
            if (1)
                $display("Assertion failed: 'C' channel source changed within multibeat operation (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_83  &  tlMasterXbar__monitor__io_in_c_bits_address  !=  tlMasterXbar__monitor__address_2  )
        begin
            if (1)
                $display("Assertion failed: 'C' channel address changed with multibeat operation (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_2  &~  tlMasterXbar__monitor__reset  &  tlMasterXbar__monitor___GEN_92  [0])
        begin
            if (1)
                $display("Assertion failed: 'A' channel re-used a source ID (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_86  &~  tlMasterXbar__monitor__reset  &~(  tlMasterXbar__monitor___GEN_93  [0]|  tlMasterXbar__monitor__same_cycle_resp  ))
        begin
            if (1)
                $display("Assertion failed: 'D' channel acknowledged for nothing inflight (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_87  &~(  tlMasterXbar__monitor__io_in_d_bits_opcode  ==  tlMasterXbar__monitor__casez_tmp  |  tlMasterXbar__monitor__io_in_d_bits_opcode  ==  tlMasterXbar__monitor__casez_tmp_0  ))
        begin
            if (1)
                $display("Assertion failed: 'D' channel contains improper opcode response (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_87  &  tlMasterXbar__monitor__io_in_a_bits_size  !=  tlMasterXbar__monitor__io_in_d_bits_size  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel contains improper response size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_88  &~(  tlMasterXbar__monitor__io_in_d_bits_opcode  ==  tlMasterXbar__monitor__casez_tmp_1  |  tlMasterXbar__monitor__io_in_d_bits_opcode  ==  tlMasterXbar__monitor__casez_tmp_2  ))
        begin
            if (1)
                $display("Assertion failed: 'D' channel contains improper opcode response (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_88  &  tlMasterXbar__monitor___GEN_89  !={1'h0,  tlMasterXbar__monitor___a_size_lookup_T_1  [7:1]})
        begin
            if (1)
                $display("Assertion failed: 'D' channel contains improper response size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_85  &  tlMasterXbar__monitor__a_first_1  &  tlMasterXbar__monitor__io_in_a_valid  &  tlMasterXbar__monitor__io_in_a_bits_source  ==  tlMasterXbar__monitor__io_in_d_bits_source  &~  tlMasterXbar__monitor__d_release_ack  &~  tlMasterXbar__monitor__reset  &~(~  tlMasterXbar__monitor__io_in_d_ready  |  tlMasterXbar__monitor__io_in_a_ready  ))
        begin
            if (1)
                $display("Assertion failed: ready check\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (~  tlMasterXbar__monitor__reset  &~(  tlMasterXbar__monitor__a_set_wo_ready  !=(  tlMasterXbar__monitor___GEN_86   ? 2'h1<<  tlMasterXbar__monitor___GEN_3  :2'h0)|  tlMasterXbar__monitor__a_set_wo_ready  ==2'h0))
        begin
            if (1)
                $display("Assertion failed: 'A' and 'D' concurrent, despite minlatency 3 (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (~  tlMasterXbar__monitor__reset  &~(  tlMasterXbar__monitor__inflight  ==2'h0|  tlMasterXbar__monitor___plusarg_reader_out  ==32'h0|  tlMasterXbar__monitor__watchdog  <  tlMasterXbar__monitor___plusarg_reader_out  ))
        begin
            if (1)
                $display("Assertion failed: TileLink timeout expired (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_6  &~  tlMasterXbar__monitor__reset  &  tlMasterXbar__monitor___GEN_94  [0])
        begin
            if (1)
                $display("Assertion failed: 'C' channel re-used a source ID (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_91  &~  tlMasterXbar__monitor__reset  &~(  tlMasterXbar__monitor___GEN_95  [0]|  tlMasterXbar__monitor__same_cycle_resp_1  ))
        begin
            if (1)
                $display("Assertion failed: 'D' channel acknowledged for nothing inflight (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_91  &  tlMasterXbar__monitor__same_cycle_resp_1  &~  tlMasterXbar__monitor__reset  &  tlMasterXbar__monitor__io_in_d_bits_size  !=  tlMasterXbar__monitor__io_in_c_bits_size  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel contains improper response size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_91  &~  tlMasterXbar__monitor__same_cycle_resp_1  &~  tlMasterXbar__monitor__reset  &  tlMasterXbar__monitor___GEN_89  !={1'h0,  tlMasterXbar__monitor___c_size_lookup_T_1  [7:1]})
        begin
            if (1)
                $display("Assertion failed: 'D' channel contains improper response size (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_90  &  tlMasterXbar__monitor__c_first_1  &  tlMasterXbar__monitor__io_in_c_valid  &  tlMasterXbar__monitor__io_in_c_bits_source  ==  tlMasterXbar__monitor__io_in_d_bits_source  &  tlMasterXbar__monitor__d_release_ack  &~(  tlMasterXbar__monitor__io_in_c_bits_opcode  ==3'h4|  tlMasterXbar__monitor__io_in_c_bits_opcode  ==3'h5)&~  tlMasterXbar__monitor__reset  &~(~  tlMasterXbar__monitor__io_in_d_ready  |  tlMasterXbar__monitor__io_in_c_ready  ))
        begin
            if (1)
                $display("Assertion failed: ready check\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if ((|  tlMasterXbar__monitor__c_set_wo_ready  )&~  tlMasterXbar__monitor__reset  &  tlMasterXbar__monitor__c_set_wo_ready  ==(  tlMasterXbar__monitor___GEN_91   ? 2'h1<<  tlMasterXbar__monitor___GEN_3  :2'h0))
        begin
            if (1)
                $display("Assertion failed: 'C' and 'D' concurrent, despite minlatency 3 (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (~  tlMasterXbar__monitor__reset  &~(  tlMasterXbar__monitor__inflight_1  ==2'h0|  tlMasterXbar__monitor___plusarg_reader_1_out  ==32'h0|  tlMasterXbar__monitor__watchdog_1  <  tlMasterXbar__monitor___plusarg_reader_1_out  ))
        begin
            if (1)
                $display("Assertion failed: TileLink timeout expired (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_7  &~  tlMasterXbar__monitor__reset  &  tlMasterXbar__monitor___GEN_96  [0])
        begin
            if (1)
                $display("Assertion failed: 'D' channel re-used a sink ID (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor___GEN_9  &~  tlMasterXbar__monitor__reset  &~(  tlMasterXbar__monitor___GEN_97  [0]))
        begin
            if (1)
                $display("Assertion failed: 'E' channel acknowledged for nothing inflight (connected at src/main/scala/rocket/HellaCache.scala:271:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
    end

    wire[26:0]  tlMasterXbar__monitor___a_first_beats1_decode_T_1  =27'hFFF<<  tlMasterXbar__monitor___GEN  ;
    wire[26:0]  tlMasterXbar__monitor___a_first_beats1_decode_T_5  =27'hFFF<<  tlMasterXbar__monitor___GEN  ;
    wire[26:0]  tlMasterXbar__monitor___GEN_98  ={23'h0,  tlMasterXbar__monitor__io_in_d_bits_size  };
    wire[26:0]  tlMasterXbar__monitor___d_first_beats1_decode_T_1  =27'hFFF<<  tlMasterXbar__monitor___GEN_98  ;
    wire[26:0]  tlMasterXbar__monitor___d_first_beats1_decode_T_5  =27'hFFF<<  tlMasterXbar__monitor___GEN_98  ;
    wire[26:0]  tlMasterXbar__monitor___d_first_beats1_decode_T_9  =27'hFFF<<  tlMasterXbar__monitor___GEN_98  ;
    wire[26:0]  tlMasterXbar__monitor___d_first_beats1_decode_T_13  =27'hFFF<<  tlMasterXbar__monitor___GEN_98  ;
    wire[26:0]  tlMasterXbar__monitor___c_first_beats1_decode_T_1  =27'hFFF<<  tlMasterXbar__monitor___GEN_0  ;
    wire[26:0]  tlMasterXbar__monitor___c_first_beats1_decode_T_5  =27'hFFF<<  tlMasterXbar__monitor___GEN_0  ;
    wire  tlMasterXbar__monitor___GEN_99  =  tlMasterXbar__monitor___d_first_T_3  &  tlMasterXbar__monitor__d_first_1  &~  tlMasterXbar__monitor__d_release_ack  ;
    wire[30:0]  tlMasterXbar__monitor___GEN_100  ={27'h0,  tlMasterXbar__monitor__io_in_d_bits_source  ,3'h0};
    wire  tlMasterXbar__monitor___GEN_101  =  tlMasterXbar__monitor___d_first_T_3  &  tlMasterXbar__monitor__d_first_2  &  tlMasterXbar__monitor__d_release_ack  ;
    wire[30:0]  tlMasterXbar__monitor___d_opcodes_clr_T_5  =31'hF<<{28'h0,  tlMasterXbar__monitor__io_in_d_bits_source  ,2'h0};
    wire[18:0]  tlMasterXbar__monitor___a_opcodes_set_T_1  ={15'h0,  tlMasterXbar__monitor___GEN_2   ? {  tlMasterXbar__monitor__io_in_a_bits_opcode  ,1'h1}:4'h0}<<{16'h0,  tlMasterXbar__monitor__io_in_a_bits_source  ,2'h0};
    wire[30:0]  tlMasterXbar__monitor___d_sizes_clr_T_5  =31'hFF<<  tlMasterXbar__monitor___GEN_100  ;
    wire[19:0]  tlMasterXbar__monitor___a_sizes_set_T_1  ={15'h0,  tlMasterXbar__monitor___GEN_2   ? {  tlMasterXbar__monitor__io_in_a_bits_size  ,1'h1}:5'h0}<<{16'h0,  tlMasterXbar__monitor__io_in_a_bits_source  ,3'h0};
    wire[30:0]  tlMasterXbar__monitor___d_sizes_clr_T_11  =31'hFF<<  tlMasterXbar__monitor___GEN_100  ;
    wire[19:0]  tlMasterXbar__monitor___c_sizes_set_T_1  ={15'h0,  tlMasterXbar__monitor___GEN_6   ? {  tlMasterXbar__monitor__io_in_c_bits_size  ,1'h1}:5'h0}<<{16'h0,  tlMasterXbar__monitor__io_in_c_bits_source  ,3'h0};
    wire  tlMasterXbar__monitor__b_first_done  =  tlMasterXbar__monitor__io_in_b_ready  &  tlMasterXbar__monitor__io_in_b_valid  ;
    always @( posedge   tlMasterXbar__monitor__clock  )
    begin
        if (  tlMasterXbar__monitor__reset  )
        begin
            tlMasterXbar__monitor__a_first_counter   <=9'h0;
            tlMasterXbar__monitor__d_first_counter   <=9'h0;
            tlMasterXbar__monitor__b_first_counter   <=9'h0;
            tlMasterXbar__monitor__c_first_counter   <=9'h0;
            tlMasterXbar__monitor__inflight   <=2'h0;
            tlMasterXbar__monitor__inflight_opcodes   <=8'h0;
            tlMasterXbar__monitor__inflight_sizes   <=16'h0;
            tlMasterXbar__monitor__a_first_counter_1   <=9'h0;
            tlMasterXbar__monitor__d_first_counter_1   <=9'h0;
            tlMasterXbar__monitor__watchdog   <=32'h0;
            tlMasterXbar__monitor__inflight_1   <=2'h0;
            tlMasterXbar__monitor__inflight_sizes_1   <=16'h0;
            tlMasterXbar__monitor__c_first_counter_1   <=9'h0;
            tlMasterXbar__monitor__d_first_counter_2   <=9'h0;
            tlMasterXbar__monitor__watchdog_1   <=32'h0;
            tlMasterXbar__monitor__inflight_2   <=4'h0;
            tlMasterXbar__monitor__d_first_counter_3   <=9'h0;
        end
        else
        begin
            if (  tlMasterXbar__monitor___a_first_T_1  )
            begin
                if (|  tlMasterXbar__monitor__a_first_counter  )
                    tlMasterXbar__monitor__a_first_counter   <=  tlMasterXbar__monitor__a_first_counter  -9'h1;
                else
                    tlMasterXbar__monitor__a_first_counter   <=  tlMasterXbar__monitor__io_in_a_bits_opcode  [2] ? 9'h0:~(  tlMasterXbar__monitor___a_first_beats1_decode_T_1  [11:3]);
                if (  tlMasterXbar__monitor__a_first_1  )
                    tlMasterXbar__monitor__a_first_counter_1   <=  tlMasterXbar__monitor__io_in_a_bits_opcode  [2] ? 9'h0:~(  tlMasterXbar__monitor___a_first_beats1_decode_T_5  [11:3]);
                else
                    tlMasterXbar__monitor__a_first_counter_1   <=  tlMasterXbar__monitor__a_first_counter_1  -9'h1;
            end
            if (  tlMasterXbar__monitor___d_first_T_3  )
            begin
                if (|  tlMasterXbar__monitor__d_first_counter  )
                    tlMasterXbar__monitor__d_first_counter   <=  tlMasterXbar__monitor__d_first_counter  -9'h1;
                else
                    tlMasterXbar__monitor__d_first_counter   <=  tlMasterXbar__monitor__io_in_d_bits_opcode  [0] ? ~(  tlMasterXbar__monitor___d_first_beats1_decode_T_1  [11:3]):9'h0;
                if (  tlMasterXbar__monitor__d_first_1  )
                    tlMasterXbar__monitor__d_first_counter_1   <=  tlMasterXbar__monitor__io_in_d_bits_opcode  [0] ? ~(  tlMasterXbar__monitor___d_first_beats1_decode_T_5  [11:3]):9'h0;
                else
                    tlMasterXbar__monitor__d_first_counter_1   <=  tlMasterXbar__monitor__d_first_counter_1  -9'h1;
                if (  tlMasterXbar__monitor__d_first_2  )
                    tlMasterXbar__monitor__d_first_counter_2   <=  tlMasterXbar__monitor__io_in_d_bits_opcode  [0] ? ~(  tlMasterXbar__monitor___d_first_beats1_decode_T_9  [11:3]):9'h0;
                else
                    tlMasterXbar__monitor__d_first_counter_2   <=  tlMasterXbar__monitor__d_first_counter_2  -9'h1;
                if (  tlMasterXbar__monitor__d_first_3  )
                    tlMasterXbar__monitor__d_first_counter_3   <=  tlMasterXbar__monitor__io_in_d_bits_opcode  [0] ? ~(  tlMasterXbar__monitor___d_first_beats1_decode_T_13  [11:3]):9'h0;
                else
                    tlMasterXbar__monitor__d_first_counter_3   <=  tlMasterXbar__monitor__d_first_counter_3  -9'h1;
            end
            if (  tlMasterXbar__monitor__b_first_done  )
            begin
                if (|  tlMasterXbar__monitor__b_first_counter  )
                    tlMasterXbar__monitor__b_first_counter   <=  tlMasterXbar__monitor__b_first_counter  -9'h1;
                else
                    tlMasterXbar__monitor__b_first_counter   <=9'h0;
            end
            if (  tlMasterXbar__monitor___c_first_T_1  )
            begin
                if (|  tlMasterXbar__monitor__c_first_counter  )
                    tlMasterXbar__monitor__c_first_counter   <=  tlMasterXbar__monitor__c_first_counter  -9'h1;
                else
                    tlMasterXbar__monitor__c_first_counter   <=  tlMasterXbar__monitor__io_in_c_bits_opcode  [0] ? ~(  tlMasterXbar__monitor___c_first_beats1_decode_T_1  [11:3]):9'h0;
                if (  tlMasterXbar__monitor__c_first_1  )
                    tlMasterXbar__monitor__c_first_counter_1   <=  tlMasterXbar__monitor__io_in_c_bits_opcode  [0] ? ~(  tlMasterXbar__monitor___c_first_beats1_decode_T_5  [11:3]):9'h0;
                else
                    tlMasterXbar__monitor__c_first_counter_1   <=  tlMasterXbar__monitor__c_first_counter_1  -9'h1;
            end
            tlMasterXbar__monitor__inflight   <=(  tlMasterXbar__monitor__inflight  |(  tlMasterXbar__monitor___GEN_2   ? 2'h1<<  tlMasterXbar__monitor___GEN_1  :2'h0))&~(  tlMasterXbar__monitor___GEN_99   ? 2'h1<<  tlMasterXbar__monitor___GEN_3  :2'h0);
            tlMasterXbar__monitor__inflight_opcodes   <=(  tlMasterXbar__monitor__inflight_opcodes  |(  tlMasterXbar__monitor___GEN_2   ?   tlMasterXbar__monitor___a_opcodes_set_T_1  [7:0]:8'h0))&~(  tlMasterXbar__monitor___GEN_99   ?   tlMasterXbar__monitor___d_opcodes_clr_T_5  [7:0]:8'h0);
            tlMasterXbar__monitor__inflight_sizes   <=(  tlMasterXbar__monitor__inflight_sizes  |(  tlMasterXbar__monitor___GEN_2   ?   tlMasterXbar__monitor___a_sizes_set_T_1  [15:0]:16'h0))&~(  tlMasterXbar__monitor___GEN_99   ?   tlMasterXbar__monitor___d_sizes_clr_T_5  [15:0]:16'h0);
            if (  tlMasterXbar__monitor___a_first_T_1  |  tlMasterXbar__monitor___d_first_T_3  )
                tlMasterXbar__monitor__watchdog   <=32'h0;
            else
                tlMasterXbar__monitor__watchdog   <=  tlMasterXbar__monitor__watchdog  +32'h1;
            tlMasterXbar__monitor__inflight_1   <=(  tlMasterXbar__monitor__inflight_1  |(  tlMasterXbar__monitor___GEN_6   ? 2'h1<<  tlMasterXbar__monitor___GEN_5  :2'h0))&~(  tlMasterXbar__monitor___GEN_101   ? 2'h1<<  tlMasterXbar__monitor___GEN_3  :2'h0);
            tlMasterXbar__monitor__inflight_sizes_1   <=(  tlMasterXbar__monitor__inflight_sizes_1  |(  tlMasterXbar__monitor___GEN_6   ?   tlMasterXbar__monitor___c_sizes_set_T_1  [15:0]:16'h0))&~(  tlMasterXbar__monitor___GEN_101   ?   tlMasterXbar__monitor___d_sizes_clr_T_11  [15:0]:16'h0);
            if (  tlMasterXbar__monitor___c_first_T_1  |  tlMasterXbar__monitor___d_first_T_3  )
                tlMasterXbar__monitor__watchdog_1   <=32'h0;
            else
                tlMasterXbar__monitor__watchdog_1   <=  tlMasterXbar__monitor__watchdog_1  +32'h1;
            tlMasterXbar__monitor__inflight_2   <=(  tlMasterXbar__monitor__inflight_2  |  tlMasterXbar__monitor__d_set  )&~(  tlMasterXbar__monitor___GEN_9   ? 4'h1<<  tlMasterXbar__monitor___GEN_10  :4'h0);
        end
        if (  tlMasterXbar__monitor___a_first_T_1  &~(|  tlMasterXbar__monitor__a_first_counter  ))
        begin
            tlMasterXbar__monitor__opcode   <=  tlMasterXbar__monitor__io_in_a_bits_opcode  ;
            tlMasterXbar__monitor__param   <=  tlMasterXbar__monitor__io_in_a_bits_param  ;
            tlMasterXbar__monitor__size   <=  tlMasterXbar__monitor__io_in_a_bits_size  ;
            tlMasterXbar__monitor__source   <=  tlMasterXbar__monitor__io_in_a_bits_source  ;
            tlMasterXbar__monitor__address   <=  tlMasterXbar__monitor__io_in_a_bits_address  ;
        end
        if (  tlMasterXbar__monitor___d_first_T_3  &~(|  tlMasterXbar__monitor__d_first_counter  ))
        begin
            tlMasterXbar__monitor__opcode_1   <=  tlMasterXbar__monitor__io_in_d_bits_opcode  ;
            tlMasterXbar__monitor__param_1   <=  tlMasterXbar__monitor__io_in_d_bits_param  ;
            tlMasterXbar__monitor__size_1   <=  tlMasterXbar__monitor__io_in_d_bits_size  ;
            tlMasterXbar__monitor__source_1   <=  tlMasterXbar__monitor__io_in_d_bits_source  ;
            tlMasterXbar__monitor__sink   <=  tlMasterXbar__monitor__io_in_d_bits_sink  ;
            tlMasterXbar__monitor__denied   <=  tlMasterXbar__monitor__io_in_d_bits_denied  ;
        end
        if (  tlMasterXbar__monitor__b_first_done  &~(|  tlMasterXbar__monitor__b_first_counter  ))
        begin
            tlMasterXbar__monitor__opcode_2   <=  tlMasterXbar__monitor__io_in_b_bits_opcode  ;
            tlMasterXbar__monitor__param_2   <=  tlMasterXbar__monitor__io_in_b_bits_param  ;
            tlMasterXbar__monitor__size_2   <=  tlMasterXbar__monitor__io_in_b_bits_size  ;
            tlMasterXbar__monitor__source_2   <=  tlMasterXbar__monitor__io_in_b_bits_source  ;
            tlMasterXbar__monitor__address_1   <=  tlMasterXbar__monitor__io_in_b_bits_address  ;
        end
        if (  tlMasterXbar__monitor___c_first_T_1  &~(|  tlMasterXbar__monitor__c_first_counter  ))
        begin
            tlMasterXbar__monitor__opcode_3   <=  tlMasterXbar__monitor__io_in_c_bits_opcode  ;
            tlMasterXbar__monitor__param_3   <=  tlMasterXbar__monitor__io_in_c_bits_param  ;
            tlMasterXbar__monitor__size_3   <=  tlMasterXbar__monitor__io_in_c_bits_size  ;
            tlMasterXbar__monitor__source_3   <=  tlMasterXbar__monitor__io_in_c_bits_source  ;
            tlMasterXbar__monitor__address_2   <=  tlMasterXbar__monitor__io_in_c_bits_address  ;
        end
    end


    wire [ tlMasterXbar__monitor__plusarg_reader__WIDTH -1:0] tlMasterXbar__monitor__plusarg_reader__out;
    wire [ tlMasterXbar__monitor__plusarg_reader_1__WIDTH -1:0] tlMasterXbar__monitor__plusarg_reader_1__out;

    reg[  tlMasterXbar__monitor__plusarg_reader__WIDTH  -1:0]  tlMasterXbar__monitor__plusarg_reader__myplus  ;
    assign   tlMasterXbar__monitor__plusarg_reader__out  =  tlMasterXbar__monitor__plusarg_reader__myplus  ; initial
    begin
        if (!$value$plusargs(  tlMasterXbar__monitor__plusarg_reader__FORMAT  ,  tlMasterXbar__monitor__plusarg_reader__myplus  ))
            tlMasterXbar__monitor__plusarg_reader__myplus   =  tlMasterXbar__monitor__plusarg_reader__DEFAULT  ;
    end



    reg[  tlMasterXbar__monitor__plusarg_reader_1__WIDTH  -1:0]  tlMasterXbar__monitor__plusarg_reader_1__myplus  ;
    assign   tlMasterXbar__monitor__plusarg_reader_1__out  =  tlMasterXbar__monitor__plusarg_reader_1__myplus  ; initial
    begin
        if (!$value$plusargs(  tlMasterXbar__monitor__plusarg_reader_1__FORMAT  ,  tlMasterXbar__monitor__plusarg_reader_1__myplus  ))
            tlMasterXbar__monitor__plusarg_reader_1__myplus   =  tlMasterXbar__monitor__plusarg_reader_1__DEFAULT  ;
    end
    assign tlMasterXbar__monitor___plusarg_reader_out = tlMasterXbar__monitor__plusarg_reader__out;
    assign tlMasterXbar__monitor___plusarg_reader_1_out = tlMasterXbar__monitor__plusarg_reader_1__out;

    assign tlMasterXbar__monitor__clock = tlMasterXbar__clock;
    assign tlMasterXbar__monitor__reset = tlMasterXbar__reset;
    assign tlMasterXbar__monitor__io_in_a_ready = tlMasterXbar__portsAOI_filtered_0_ready;
    assign tlMasterXbar__monitor__io_in_a_valid = tlMasterXbar__auto_in_0_a_valid;
    assign tlMasterXbar__monitor__io_in_a_bits_opcode = tlMasterXbar__auto_in_0_a_bits_opcode;
    assign tlMasterXbar__monitor__io_in_a_bits_param = tlMasterXbar__auto_in_0_a_bits_param;
    assign tlMasterXbar__monitor__io_in_a_bits_size = tlMasterXbar__auto_in_0_a_bits_size;
    assign tlMasterXbar__monitor__io_in_a_bits_source = tlMasterXbar__auto_in_0_a_bits_source;
    assign tlMasterXbar__monitor__io_in_a_bits_address = tlMasterXbar__auto_in_0_a_bits_address;
    assign tlMasterXbar__monitor__io_in_a_bits_mask = tlMasterXbar__auto_in_0_a_bits_mask;
    assign tlMasterXbar__monitor__io_in_b_ready = tlMasterXbar__auto_in_0_b_ready;
    assign tlMasterXbar__monitor__io_in_b_valid = tlMasterXbar__portsBIO_filtered_valid_0;
    assign tlMasterXbar__monitor__io_in_b_bits_opcode = tlMasterXbar__auto_out_b_bits_opcode;
    assign tlMasterXbar__monitor__io_in_b_bits_param = tlMasterXbar__auto_out_b_bits_param;
    assign tlMasterXbar__monitor__io_in_b_bits_size = tlMasterXbar__auto_out_b_bits_size;
    assign tlMasterXbar__monitor__io_in_b_bits_source = tlMasterXbar__auto_out_b_bits_source[0];
    assign tlMasterXbar__monitor__io_in_b_bits_address = tlMasterXbar__auto_out_b_bits_address;
    assign tlMasterXbar__monitor__io_in_b_bits_mask = tlMasterXbar__auto_out_b_bits_mask;
    assign tlMasterXbar__monitor__io_in_b_bits_corrupt = tlMasterXbar__auto_out_b_bits_corrupt;
    assign tlMasterXbar__monitor__io_in_c_ready = tlMasterXbar__auto_out_c_ready;
    assign tlMasterXbar__monitor__io_in_c_valid = tlMasterXbar__auto_in_0_c_valid;
    assign tlMasterXbar__monitor__io_in_c_bits_opcode = tlMasterXbar__auto_in_0_c_bits_opcode;
    assign tlMasterXbar__monitor__io_in_c_bits_param = tlMasterXbar__auto_in_0_c_bits_param;
    assign tlMasterXbar__monitor__io_in_c_bits_size = tlMasterXbar__auto_in_0_c_bits_size;
    assign tlMasterXbar__monitor__io_in_c_bits_source = tlMasterXbar__auto_in_0_c_bits_source;
    assign tlMasterXbar__monitor__io_in_c_bits_address = tlMasterXbar__auto_in_0_c_bits_address;
    assign tlMasterXbar__monitor__io_in_d_ready = tlMasterXbar__auto_in_0_d_ready;
    assign tlMasterXbar__monitor__io_in_d_valid = tlMasterXbar__portsDIO_filtered_0_valid;
    assign tlMasterXbar__monitor__io_in_d_bits_opcode = tlMasterXbar__auto_out_d_bits_opcode;
    assign tlMasterXbar__monitor__io_in_d_bits_param = tlMasterXbar__auto_out_d_bits_param;
    assign tlMasterXbar__monitor__io_in_d_bits_size = tlMasterXbar__auto_out_d_bits_size;
    assign tlMasterXbar__monitor__io_in_d_bits_source = tlMasterXbar__auto_out_d_bits_source[0];
    assign tlMasterXbar__monitor__io_in_d_bits_sink = tlMasterXbar__auto_out_d_bits_sink;
    assign tlMasterXbar__monitor__io_in_d_bits_denied = tlMasterXbar__auto_out_d_bits_denied;
    assign tlMasterXbar__monitor__io_in_d_bits_corrupt = tlMasterXbar__auto_out_d_bits_corrupt;
    assign tlMasterXbar__monitor__io_in_e_ready = tlMasterXbar__auto_out_e_ready;
    assign tlMasterXbar__monitor__io_in_e_valid = tlMasterXbar__auto_in_0_e_valid;
    assign tlMasterXbar__monitor__io_in_e_bits_sink = tlMasterXbar__auto_in_0_e_bits_sink;


    wire  tlMasterXbar__monitor_1__clock;
    wire  tlMasterXbar__monitor_1__reset;
    wire  tlMasterXbar__monitor_1__io_in_a_ready;
    wire  tlMasterXbar__monitor_1__io_in_a_valid;
    wire [31:0] tlMasterXbar__monitor_1__io_in_a_bits_address;
    wire  tlMasterXbar__monitor_1__io_in_d_valid;
    wire [2:0] tlMasterXbar__monitor_1__io_in_d_bits_opcode;
    wire [1:0] tlMasterXbar__monitor_1__io_in_d_bits_param;
    wire [3:0] tlMasterXbar__monitor_1__io_in_d_bits_size;
    wire [1:0] tlMasterXbar__monitor_1__io_in_d_bits_sink;
    wire  tlMasterXbar__monitor_1__io_in_d_bits_denied;
    wire  tlMasterXbar__monitor_1__io_in_d_bits_corrupt;

    wire[31:0]  tlMasterXbar__monitor_1___plusarg_reader_1_out  ;
    wire[31:0]  tlMasterXbar__monitor_1___plusarg_reader_out  ;
    wire  tlMasterXbar__monitor_1___a_first_T_1  =  tlMasterXbar__monitor_1__io_in_a_ready  &  tlMasterXbar__monitor_1__io_in_a_valid  ;
    reg[8:0]  tlMasterXbar__monitor_1__a_first_counter  ;
    reg[31:0]  tlMasterXbar__monitor_1__address  ;
    reg[8:0]  tlMasterXbar__monitor_1__d_first_counter  ;
    reg[2:0]  tlMasterXbar__monitor_1__opcode_1  ;
    reg[1:0]  tlMasterXbar__monitor_1__param_1  ;
    reg[3:0]  tlMasterXbar__monitor_1__size_1  ;
    reg[1:0]  tlMasterXbar__monitor_1__sink  ;
    reg  tlMasterXbar__monitor_1__denied  ;
    reg  tlMasterXbar__monitor_1__inflight  ;
    reg[3:0]  tlMasterXbar__monitor_1__inflight_opcodes  ;
    reg[7:0]  tlMasterXbar__monitor_1__inflight_sizes  ;
    reg[8:0]  tlMasterXbar__monitor_1__a_first_counter_1  ;
    wire  tlMasterXbar__monitor_1__a_first_1  =  tlMasterXbar__monitor_1__a_first_counter_1  ==9'h0;
    reg[8:0]  tlMasterXbar__monitor_1__d_first_counter_1  ;
    wire  tlMasterXbar__monitor_1__d_first_1  =  tlMasterXbar__monitor_1__d_first_counter_1  ==9'h0;
    wire  tlMasterXbar__monitor_1__a_set  =  tlMasterXbar__monitor_1___a_first_T_1  &  tlMasterXbar__monitor_1__a_first_1  ;
    wire  tlMasterXbar__monitor_1__d_release_ack  =  tlMasterXbar__monitor_1__io_in_d_bits_opcode  ==3'h6;
    wire  tlMasterXbar__monitor_1___GEN  =  tlMasterXbar__monitor_1__io_in_d_valid  &  tlMasterXbar__monitor_1__d_first_1  ;
    wire  tlMasterXbar__monitor_1__d_clr  =  tlMasterXbar__monitor_1___GEN  &~  tlMasterXbar__monitor_1__d_release_ack  ;
    reg[2:0]  tlMasterXbar__monitor_1__casez_tmp  ;
    always @(*)
    begin
        casez (  tlMasterXbar__monitor_1__inflight_opcodes  [3:1])
            3 'b000:
                tlMasterXbar__monitor_1__casez_tmp   =3'h0;
            3 'b001:
                tlMasterXbar__monitor_1__casez_tmp   =3'h0;
            3 'b010:
                tlMasterXbar__monitor_1__casez_tmp   =3'h1;
            3 'b011:
                tlMasterXbar__monitor_1__casez_tmp   =3'h1;
            3 'b100:
                tlMasterXbar__monitor_1__casez_tmp   =3'h1;
            3 'b101:
                tlMasterXbar__monitor_1__casez_tmp   =3'h2;
            3 'b110:
                tlMasterXbar__monitor_1__casez_tmp   =3'h4;
            default :
                tlMasterXbar__monitor_1__casez_tmp   =3'h4;
        endcase
    end

    reg[2:0]  tlMasterXbar__monitor_1__casez_tmp_0  ;
    always @(*)
    begin
        casez (  tlMasterXbar__monitor_1__inflight_opcodes  [3:1])
            3 'b000:
                tlMasterXbar__monitor_1__casez_tmp_0   =3'h0;
            3 'b001:
                tlMasterXbar__monitor_1__casez_tmp_0   =3'h0;
            3 'b010:
                tlMasterXbar__monitor_1__casez_tmp_0   =3'h1;
            3 'b011:
                tlMasterXbar__monitor_1__casez_tmp_0   =3'h1;
            3 'b100:
                tlMasterXbar__monitor_1__casez_tmp_0   =3'h1;
            3 'b101:
                tlMasterXbar__monitor_1__casez_tmp_0   =3'h2;
            3 'b110:
                tlMasterXbar__monitor_1__casez_tmp_0   =3'h5;
            default :
                tlMasterXbar__monitor_1__casez_tmp_0   =3'h4;
        endcase
    end

    reg[31:0]  tlMasterXbar__monitor_1__watchdog  ;
    reg  tlMasterXbar__monitor_1__inflight_1  ;
    reg[7:0]  tlMasterXbar__monitor_1__inflight_sizes_1  ;
    reg[8:0]  tlMasterXbar__monitor_1__d_first_counter_2  ;
    wire  tlMasterXbar__monitor_1__d_first_2  =  tlMasterXbar__monitor_1__d_first_counter_2  ==9'h0;
    wire  tlMasterXbar__monitor_1__d_clr_1  =  tlMasterXbar__monitor_1__io_in_d_valid  &  tlMasterXbar__monitor_1__d_first_2  &  tlMasterXbar__monitor_1__d_release_ack  ;
    reg[31:0]  tlMasterXbar__monitor_1__watchdog_1  ;
    wire  tlMasterXbar__monitor_1___GEN_0  =  tlMasterXbar__monitor_1__io_in_a_valid  &~  tlMasterXbar__monitor_1__reset  ;
    wire  tlMasterXbar__monitor_1___GEN_1  =  tlMasterXbar__monitor_1__io_in_d_valid  &  tlMasterXbar__monitor_1__io_in_d_bits_opcode  ==3'h6&~  tlMasterXbar__monitor_1__reset  ;
    wire  tlMasterXbar__monitor_1___GEN_2  =  tlMasterXbar__monitor_1__io_in_d_bits_size  <4'h3;
    wire  tlMasterXbar__monitor_1___GEN_3  =  tlMasterXbar__monitor_1__io_in_d_valid  &  tlMasterXbar__monitor_1__io_in_d_bits_opcode  ==3'h4&~  tlMasterXbar__monitor_1__reset  ;
    wire  tlMasterXbar__monitor_1___GEN_4  =  tlMasterXbar__monitor_1__io_in_d_bits_param  ==2'h2;
    wire  tlMasterXbar__monitor_1___GEN_5  =  tlMasterXbar__monitor_1__io_in_d_valid  &  tlMasterXbar__monitor_1__io_in_d_bits_opcode  ==3'h5&~  tlMasterXbar__monitor_1__reset  ;
    wire  tlMasterXbar__monitor_1___GEN_6  =~  tlMasterXbar__monitor_1__io_in_d_bits_denied  |  tlMasterXbar__monitor_1__io_in_d_bits_corrupt  ;
    wire  tlMasterXbar__monitor_1___GEN_7  =  tlMasterXbar__monitor_1__io_in_d_valid  &  tlMasterXbar__monitor_1__io_in_d_bits_opcode  ==3'h0&~  tlMasterXbar__monitor_1__reset  ;
    wire  tlMasterXbar__monitor_1___GEN_8  =  tlMasterXbar__monitor_1__io_in_d_bits_opcode  ==3'h1;
    wire  tlMasterXbar__monitor_1___GEN_9  =  tlMasterXbar__monitor_1__io_in_d_valid  &  tlMasterXbar__monitor_1___GEN_8  &~  tlMasterXbar__monitor_1__reset  ;
    wire  tlMasterXbar__monitor_1___GEN_10  =  tlMasterXbar__monitor_1__io_in_d_valid  &  tlMasterXbar__monitor_1__io_in_d_bits_opcode  ==3'h2&~  tlMasterXbar__monitor_1__reset  ;
    wire  tlMasterXbar__monitor_1___GEN_11  =  tlMasterXbar__monitor_1__io_in_d_valid  &(|  tlMasterXbar__monitor_1__d_first_counter  )&~  tlMasterXbar__monitor_1__reset  ;
    wire  tlMasterXbar__monitor_1__a_set_wo_ready  =  tlMasterXbar__monitor_1__io_in_a_valid  &  tlMasterXbar__monitor_1__a_first_1  ;
    wire  tlMasterXbar__monitor_1___GEN_12  =  tlMasterXbar__monitor_1__d_clr  &  tlMasterXbar__monitor_1__a_set_wo_ready  &~  tlMasterXbar__monitor_1__reset  ;
    wire  tlMasterXbar__monitor_1___GEN_13  =  tlMasterXbar__monitor_1__d_clr  &~  tlMasterXbar__monitor_1__a_set_wo_ready  &~  tlMasterXbar__monitor_1__reset  ;
    wire[7:0]  tlMasterXbar__monitor_1___GEN_14  ={4'h0,  tlMasterXbar__monitor_1__io_in_d_bits_size  };
    wire  tlMasterXbar__monitor_1___GEN_15  =  tlMasterXbar__monitor_1__d_clr_1  &~  tlMasterXbar__monitor_1__reset  ;
    always @( posedge   tlMasterXbar__monitor_1__clock  )
    begin
        if (  tlMasterXbar__monitor_1___GEN_0  &~({  tlMasterXbar__monitor_1__io_in_a_bits_address  [31:14],~(  tlMasterXbar__monitor_1__io_in_a_bits_address  [13:12])}==20'h0|  tlMasterXbar__monitor_1__io_in_a_bits_address  [31:12]==20'h0|{  tlMasterXbar__monitor_1__io_in_a_bits_address  [31:17],~(  tlMasterXbar__monitor_1__io_in_a_bits_address  [16])}==16'h0|{  tlMasterXbar__monitor_1__io_in_a_bits_address  [31:26],  tlMasterXbar__monitor_1__io_in_a_bits_address  [25:16]^10'h200}==16'h0|{  tlMasterXbar__monitor_1__io_in_a_bits_address  [31:28],~(  tlMasterXbar__monitor_1__io_in_a_bits_address  [27:26])}==6'h0|{  tlMasterXbar__monitor_1__io_in_a_bits_address  [31],~(  tlMasterXbar__monitor_1__io_in_a_bits_address  [30:29])}==3'h0|  tlMasterXbar__monitor_1__io_in_a_bits_address  [31:28]==4'h8))
        begin
            if (1)
                $display("Assertion failed: 'A' channel carries Get type which slave claims it can't support (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_0  &(|(  tlMasterXbar__monitor_1__io_in_a_bits_address  [5:0])))
        begin
            if (1)
                $display("Assertion failed: 'A' channel Get address not aligned to size (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1__io_in_d_valid  &~  tlMasterXbar__monitor_1__reset  &(&  tlMasterXbar__monitor_1__io_in_d_bits_opcode  ))
        begin
            if (1)
                $display("Assertion failed: 'D' channel has invalid opcode (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_1  &  tlMasterXbar__monitor_1___GEN_2  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel ReleaseAck smaller than a beat (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_1  &(|  tlMasterXbar__monitor_1__io_in_d_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'D' channel ReleaseeAck carries invalid param (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_1  &  tlMasterXbar__monitor_1__io_in_d_bits_corrupt  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel ReleaseAck is corrupt (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_1  &  tlMasterXbar__monitor_1__io_in_d_bits_denied  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel ReleaseAck is denied (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_3  &  tlMasterXbar__monitor_1___GEN_2  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel Grant smaller than a beat (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_3  &(&  tlMasterXbar__monitor_1__io_in_d_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'D' channel Grant carries invalid cap param (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_3  &  tlMasterXbar__monitor_1___GEN_4  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel Grant carries toN param (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_3  &  tlMasterXbar__monitor_1__io_in_d_bits_corrupt  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel Grant is corrupt (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_5  &  tlMasterXbar__monitor_1___GEN_2  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel GrantData smaller than a beat (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_5  &(&  tlMasterXbar__monitor_1__io_in_d_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'D' channel GrantData carries invalid cap param (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_5  &  tlMasterXbar__monitor_1___GEN_4  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel GrantData carries toN param (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_5  &~  tlMasterXbar__monitor_1___GEN_6  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel GrantData is denied but not corrupt (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_7  &(|  tlMasterXbar__monitor_1__io_in_d_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'D' channel AccessAck carries invalid param (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_7  &  tlMasterXbar__monitor_1__io_in_d_bits_corrupt  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel AccessAck is corrupt (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_9  &(|  tlMasterXbar__monitor_1__io_in_d_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'D' channel AccessAckData carries invalid param (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_9  &~  tlMasterXbar__monitor_1___GEN_6  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel AccessAckData is denied but not corrupt (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_10  &(|  tlMasterXbar__monitor_1__io_in_d_bits_param  ))
        begin
            if (1)
                $display("Assertion failed: 'D' channel HintAck carries invalid param (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_10  &  tlMasterXbar__monitor_1__io_in_d_bits_corrupt  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel HintAck is corrupt (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1__io_in_a_valid  &(|  tlMasterXbar__monitor_1__a_first_counter  )&~  tlMasterXbar__monitor_1__reset  &  tlMasterXbar__monitor_1__io_in_a_bits_address  !=  tlMasterXbar__monitor_1__address  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel address changed with multibeat operation (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_11  &  tlMasterXbar__monitor_1__io_in_d_bits_opcode  !=  tlMasterXbar__monitor_1__opcode_1  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel opcode changed within multibeat operation (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_11  &  tlMasterXbar__monitor_1__io_in_d_bits_param  !=  tlMasterXbar__monitor_1__param_1  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel param changed within multibeat operation (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_11  &  tlMasterXbar__monitor_1__io_in_d_bits_size  !=  tlMasterXbar__monitor_1__size_1  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel size changed within multibeat operation (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_11  &  tlMasterXbar__monitor_1__io_in_d_bits_sink  !=  tlMasterXbar__monitor_1__sink  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel sink changed with multibeat operation (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_11  &  tlMasterXbar__monitor_1__io_in_d_bits_denied  !=  tlMasterXbar__monitor_1__denied  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel denied changed with multibeat operation (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1__a_set  &~  tlMasterXbar__monitor_1__reset  &  tlMasterXbar__monitor_1__inflight  )
        begin
            if (1)
                $display("Assertion failed: 'A' channel re-used a source ID (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1__d_clr  &~  tlMasterXbar__monitor_1__reset  &~(  tlMasterXbar__monitor_1__inflight  |  tlMasterXbar__monitor_1__a_set_wo_ready  ))
        begin
            if (1)
                $display("Assertion failed: 'D' channel acknowledged for nothing inflight (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_12  &~  tlMasterXbar__monitor_1___GEN_8  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel contains improper opcode response (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_12  &  tlMasterXbar__monitor_1__io_in_d_bits_size  !=4'h6)
        begin
            if (1)
                $display("Assertion failed: 'D' channel contains improper response size (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_13  &~(  tlMasterXbar__monitor_1__io_in_d_bits_opcode  ==  tlMasterXbar__monitor_1__casez_tmp  |  tlMasterXbar__monitor_1__io_in_d_bits_opcode  ==  tlMasterXbar__monitor_1__casez_tmp_0  ))
        begin
            if (1)
                $display("Assertion failed: 'D' channel contains improper opcode response (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_13  &  tlMasterXbar__monitor_1___GEN_14  !={1'h0,  tlMasterXbar__monitor_1__inflight_sizes  [7:1]})
        begin
            if (1)
                $display("Assertion failed: 'D' channel contains improper response size (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN  &  tlMasterXbar__monitor_1__a_first_1  &  tlMasterXbar__monitor_1__io_in_a_valid  &~  tlMasterXbar__monitor_1__d_release_ack  &~  tlMasterXbar__monitor_1__reset  &~  tlMasterXbar__monitor_1__io_in_a_ready  )
        begin
            if (1)
                $display("Assertion failed: ready check\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (~  tlMasterXbar__monitor_1__reset  &~(  tlMasterXbar__monitor_1__a_set_wo_ready  !=  tlMasterXbar__monitor_1__d_clr  |~  tlMasterXbar__monitor_1__a_set_wo_ready  ))
        begin
            if (1)
                $display("Assertion failed: 'A' and 'D' concurrent, despite minlatency 3 (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (~  tlMasterXbar__monitor_1__reset  &~(~  tlMasterXbar__monitor_1__inflight  |  tlMasterXbar__monitor_1___plusarg_reader_out  ==32'h0|  tlMasterXbar__monitor_1__watchdog  <  tlMasterXbar__monitor_1___plusarg_reader_out  ))
        begin
            if (1)
                $display("Assertion failed: TileLink timeout expired (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_15  &~  tlMasterXbar__monitor_1__inflight_1  )
        begin
            if (1)
                $display("Assertion failed: 'D' channel acknowledged for nothing inflight (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (  tlMasterXbar__monitor_1___GEN_15  &  tlMasterXbar__monitor_1___GEN_14  !={1'h0,  tlMasterXbar__monitor_1__inflight_sizes_1  [7:1]})
        begin
            if (1)
                $display("Assertion failed: 'D' channel contains improper response size (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:49 assert(cond, message)\n");
            if (1)
                $display("");
        end
        if (~  tlMasterXbar__monitor_1__reset  &~(~  tlMasterXbar__monitor_1__inflight_1  |  tlMasterXbar__monitor_1___plusarg_reader_1_out  ==32'h0|  tlMasterXbar__monitor_1__watchdog_1  <  tlMasterXbar__monitor_1___plusarg_reader_1_out  ))
        begin
            if (1)
                $display("Assertion failed: TileLink timeout expired (connected at src/main/scala/rocket/Frontend.scala:387:21)\n    at Monitor.scala:42 assert(cond, message)\n");
            if (1)
                $display("");
        end
    end

    wire[26:0]  tlMasterXbar__monitor_1___GEN_16  ={23'h0,  tlMasterXbar__monitor_1__io_in_d_bits_size  };
    wire[26:0]  tlMasterXbar__monitor_1___d_first_beats1_decode_T_1  =27'hFFF<<  tlMasterXbar__monitor_1___GEN_16  ;
    wire[26:0]  tlMasterXbar__monitor_1___d_first_beats1_decode_T_5  =27'hFFF<<  tlMasterXbar__monitor_1___GEN_16  ;
    wire[26:0]  tlMasterXbar__monitor_1___d_first_beats1_decode_T_9  =27'hFFF<<  tlMasterXbar__monitor_1___GEN_16  ;
    always @( posedge   tlMasterXbar__monitor_1__clock  )
    begin
        if (  tlMasterXbar__monitor_1__reset  )
        begin
            tlMasterXbar__monitor_1__a_first_counter   <=9'h0;
            tlMasterXbar__monitor_1__d_first_counter   <=9'h0;
            tlMasterXbar__monitor_1__inflight   <=1'h0;
            tlMasterXbar__monitor_1__inflight_opcodes   <=4'h0;
            tlMasterXbar__monitor_1__inflight_sizes   <=8'h0;
            tlMasterXbar__monitor_1__a_first_counter_1   <=9'h0;
            tlMasterXbar__monitor_1__d_first_counter_1   <=9'h0;
            tlMasterXbar__monitor_1__watchdog   <=32'h0;
            tlMasterXbar__monitor_1__inflight_1   <=1'h0;
            tlMasterXbar__monitor_1__inflight_sizes_1   <=8'h0;
            tlMasterXbar__monitor_1__d_first_counter_2   <=9'h0;
            tlMasterXbar__monitor_1__watchdog_1   <=32'h0;
        end
        else
        begin
            if (  tlMasterXbar__monitor_1___a_first_T_1  )
            begin
                if (|  tlMasterXbar__monitor_1__a_first_counter  )
                    tlMasterXbar__monitor_1__a_first_counter   <=  tlMasterXbar__monitor_1__a_first_counter  -9'h1;
                else
                    tlMasterXbar__monitor_1__a_first_counter   <=9'h0;
                if (  tlMasterXbar__monitor_1__a_first_1  )
                    tlMasterXbar__monitor_1__a_first_counter_1   <=9'h0;
                else
                    tlMasterXbar__monitor_1__a_first_counter_1   <=  tlMasterXbar__monitor_1__a_first_counter_1  -9'h1;
            end
            if (  tlMasterXbar__monitor_1__io_in_d_valid  )
            begin
                if (|  tlMasterXbar__monitor_1__d_first_counter  )
                    tlMasterXbar__monitor_1__d_first_counter   <=  tlMasterXbar__monitor_1__d_first_counter  -9'h1;
                else
                    tlMasterXbar__monitor_1__d_first_counter   <=  tlMasterXbar__monitor_1__io_in_d_bits_opcode  [0] ? ~(  tlMasterXbar__monitor_1___d_first_beats1_decode_T_1  [11:3]):9'h0;
                if (  tlMasterXbar__monitor_1__d_first_1  )
                    tlMasterXbar__monitor_1__d_first_counter_1   <=  tlMasterXbar__monitor_1__io_in_d_bits_opcode  [0] ? ~(  tlMasterXbar__monitor_1___d_first_beats1_decode_T_5  [11:3]):9'h0;
                else
                    tlMasterXbar__monitor_1__d_first_counter_1   <=  tlMasterXbar__monitor_1__d_first_counter_1  -9'h1;
                if (  tlMasterXbar__monitor_1__d_first_2  )
                    tlMasterXbar__monitor_1__d_first_counter_2   <=  tlMasterXbar__monitor_1__io_in_d_bits_opcode  [0] ? ~(  tlMasterXbar__monitor_1___d_first_beats1_decode_T_9  [11:3]):9'h0;
                else
                    tlMasterXbar__monitor_1__d_first_counter_2   <=  tlMasterXbar__monitor_1__d_first_counter_2  -9'h1;
                tlMasterXbar__monitor_1__watchdog_1   <=32'h0;
            end
            else
                tlMasterXbar__monitor_1__watchdog_1   <=  tlMasterXbar__monitor_1__watchdog_1  +32'h1;
            tlMasterXbar__monitor_1__inflight   <=(  tlMasterXbar__monitor_1__inflight  |  tlMasterXbar__monitor_1__a_set  )&~  tlMasterXbar__monitor_1__d_clr  ;
            tlMasterXbar__monitor_1__inflight_opcodes   <=(  tlMasterXbar__monitor_1__inflight_opcodes  |(  tlMasterXbar__monitor_1__a_set   ? 4'h9:4'h0))&~{4{  tlMasterXbar__monitor_1__d_clr  }};
            tlMasterXbar__monitor_1__inflight_sizes   <=(  tlMasterXbar__monitor_1__inflight_sizes  |(  tlMasterXbar__monitor_1__a_set   ? {3'h0,  tlMasterXbar__monitor_1__a_set   ? 5'hD:5'h0}:8'h0))&~{8{  tlMasterXbar__monitor_1__d_clr  }};
            if (  tlMasterXbar__monitor_1___a_first_T_1  |  tlMasterXbar__monitor_1__io_in_d_valid  )
                tlMasterXbar__monitor_1__watchdog   <=32'h0;
            else
                tlMasterXbar__monitor_1__watchdog   <=  tlMasterXbar__monitor_1__watchdog  +32'h1;
            tlMasterXbar__monitor_1__inflight_1   <=  tlMasterXbar__monitor_1__inflight_1  &~  tlMasterXbar__monitor_1__d_clr_1  ;
            tlMasterXbar__monitor_1__inflight_sizes_1   <=  tlMasterXbar__monitor_1__inflight_sizes_1  &~{8{  tlMasterXbar__monitor_1__d_clr_1  }};
        end
        if (  tlMasterXbar__monitor_1___a_first_T_1  &~(|  tlMasterXbar__monitor_1__a_first_counter  ))
            tlMasterXbar__monitor_1__address   <=  tlMasterXbar__monitor_1__io_in_a_bits_address  ;
        if (  tlMasterXbar__monitor_1__io_in_d_valid  &~(|  tlMasterXbar__monitor_1__d_first_counter  ))
        begin
            tlMasterXbar__monitor_1__opcode_1   <=  tlMasterXbar__monitor_1__io_in_d_bits_opcode  ;
            tlMasterXbar__monitor_1__param_1   <=  tlMasterXbar__monitor_1__io_in_d_bits_param  ;
            tlMasterXbar__monitor_1__size_1   <=  tlMasterXbar__monitor_1__io_in_d_bits_size  ;
            tlMasterXbar__monitor_1__sink   <=  tlMasterXbar__monitor_1__io_in_d_bits_sink  ;
            tlMasterXbar__monitor_1__denied   <=  tlMasterXbar__monitor_1__io_in_d_bits_denied  ;
        end
    end


    wire [ tlMasterXbar__monitor_1__plusarg_reader__WIDTH -1:0] tlMasterXbar__monitor_1__plusarg_reader__out;
    wire [ tlMasterXbar__monitor_1__plusarg_reader_1__WIDTH -1:0] tlMasterXbar__monitor_1__plusarg_reader_1__out;

    reg[  tlMasterXbar__monitor_1__plusarg_reader__WIDTH  -1:0]  tlMasterXbar__monitor_1__plusarg_reader__myplus  ;
    assign   tlMasterXbar__monitor_1__plusarg_reader__out  =  tlMasterXbar__monitor_1__plusarg_reader__myplus  ; initial
    begin
        if (!$value$plusargs(  tlMasterXbar__monitor_1__plusarg_reader__FORMAT  ,  tlMasterXbar__monitor_1__plusarg_reader__myplus  ))
            tlMasterXbar__monitor_1__plusarg_reader__myplus   =  tlMasterXbar__monitor_1__plusarg_reader__DEFAULT  ;
    end



    reg[  tlMasterXbar__monitor_1__plusarg_reader_1__WIDTH  -1:0]  tlMasterXbar__monitor_1__plusarg_reader_1__myplus  ;
    assign   tlMasterXbar__monitor_1__plusarg_reader_1__out  =  tlMasterXbar__monitor_1__plusarg_reader_1__myplus  ; initial
    begin
        if (!$value$plusargs(  tlMasterXbar__monitor_1__plusarg_reader_1__FORMAT  ,  tlMasterXbar__monitor_1__plusarg_reader_1__myplus  ))
            tlMasterXbar__monitor_1__plusarg_reader_1__myplus   =  tlMasterXbar__monitor_1__plusarg_reader_1__DEFAULT  ;
    end
    assign tlMasterXbar__monitor_1___plusarg_reader_out = tlMasterXbar__monitor_1__plusarg_reader__out;
    assign tlMasterXbar__monitor_1___plusarg_reader_1_out = tlMasterXbar__monitor_1__plusarg_reader_1__out;

    assign tlMasterXbar__monitor_1__clock = tlMasterXbar__clock;
    assign tlMasterXbar__monitor_1__reset = tlMasterXbar__reset;
    assign tlMasterXbar__monitor_1__io_in_a_ready = tlMasterXbar__portsAOI_filtered_1_0_ready;
    assign tlMasterXbar__monitor_1__io_in_a_valid = tlMasterXbar__auto_in_1_a_valid;
    assign tlMasterXbar__monitor_1__io_in_a_bits_address = tlMasterXbar__auto_in_1_a_bits_address;
    assign tlMasterXbar__monitor_1__io_in_d_valid = tlMasterXbar__portsDIO_filtered_1_valid;
    assign tlMasterXbar__monitor_1__io_in_d_bits_opcode = tlMasterXbar__auto_out_d_bits_opcode;
    assign tlMasterXbar__monitor_1__io_in_d_bits_param = tlMasterXbar__auto_out_d_bits_param;
    assign tlMasterXbar__monitor_1__io_in_d_bits_size = tlMasterXbar__auto_out_d_bits_size;
    assign tlMasterXbar__monitor_1__io_in_d_bits_sink = tlMasterXbar__auto_out_d_bits_sink;
    assign tlMasterXbar__monitor_1__io_in_d_bits_denied = tlMasterXbar__auto_out_d_bits_denied;
    assign tlMasterXbar__monitor_1__io_in_d_bits_corrupt = tlMasterXbar__auto_out_d_bits_corrupt;

    assign   tlMasterXbar__auto_in_1_a_ready  =  tlMasterXbar__portsAOI_filtered_1_0_ready  ;
    assign   tlMasterXbar__auto_in_1_d_valid  =  tlMasterXbar__portsDIO_filtered_1_valid  ;
    assign   tlMasterXbar__auto_in_1_d_bits_opcode  =  tlMasterXbar__auto_out_d_bits_opcode  ;
    assign   tlMasterXbar__auto_in_1_d_bits_size  =  tlMasterXbar__auto_out_d_bits_size  ;
    assign   tlMasterXbar__auto_in_1_d_bits_data  =  tlMasterXbar__auto_out_d_bits_data  ;
    assign   tlMasterXbar__auto_in_1_d_bits_corrupt  =  tlMasterXbar__auto_out_d_bits_corrupt  ;
    assign   tlMasterXbar__auto_in_0_a_ready  =  tlMasterXbar__portsAOI_filtered_0_ready  ;
    assign   tlMasterXbar__auto_in_0_b_valid  =  tlMasterXbar__portsBIO_filtered_valid_0  ;
    assign   tlMasterXbar__auto_in_0_b_bits_param  =  tlMasterXbar__auto_out_b_bits_param  ;
    assign   tlMasterXbar__auto_in_0_b_bits_size  =  tlMasterXbar__auto_out_b_bits_size  ;
    assign   tlMasterXbar__auto_in_0_b_bits_source  =  tlMasterXbar__auto_out_b_bits_source  [0];
    assign   tlMasterXbar__auto_in_0_b_bits_address  =  tlMasterXbar__auto_out_b_bits_address  ;
    assign   tlMasterXbar__auto_in_0_c_ready  =  tlMasterXbar__auto_out_c_ready  ;
    assign   tlMasterXbar__auto_in_0_d_valid  =  tlMasterXbar__portsDIO_filtered_0_valid  ;
    assign   tlMasterXbar__auto_in_0_d_bits_opcode  =  tlMasterXbar__auto_out_d_bits_opcode  ;
    assign   tlMasterXbar__auto_in_0_d_bits_param  =  tlMasterXbar__auto_out_d_bits_param  ;
    assign   tlMasterXbar__auto_in_0_d_bits_size  =  tlMasterXbar__auto_out_d_bits_size  ;
    assign   tlMasterXbar__auto_in_0_d_bits_source  =  tlMasterXbar__auto_out_d_bits_source  [0];
    assign   tlMasterXbar__auto_in_0_d_bits_sink  =  tlMasterXbar__auto_out_d_bits_sink  ;
    assign   tlMasterXbar__auto_in_0_d_bits_denied  =  tlMasterXbar__auto_out_d_bits_denied  ;
    assign   tlMasterXbar__auto_in_0_d_bits_data  =  tlMasterXbar__auto_out_d_bits_data  ;
    assign   tlMasterXbar__auto_in_0_e_ready  =  tlMasterXbar__auto_out_e_ready  ;
    assign   tlMasterXbar__auto_out_a_valid  =  tlMasterXbar__out_0_a_valid  ;
    assign   tlMasterXbar__auto_out_a_bits_opcode  =(  tlMasterXbar__muxState_0   ?   tlMasterXbar__auto_in_0_a_bits_opcode  :3'h0)|{  tlMasterXbar__muxState_1  ,2'h0};
    assign   tlMasterXbar__auto_out_a_bits_param  =  tlMasterXbar__muxState_0   ?   tlMasterXbar__auto_in_0_a_bits_param  :3'h0;
    assign   tlMasterXbar__auto_out_a_bits_size  =(  tlMasterXbar__muxState_0   ?   tlMasterXbar__auto_in_0_a_bits_size  :4'h0)|(  tlMasterXbar__muxState_1   ? 4'h6:4'h0);
    assign   tlMasterXbar__auto_out_a_bits_source  =(  tlMasterXbar__muxState_0   ? {1'h0,  tlMasterXbar__auto_in_0_a_bits_source  }:2'h0)|{  tlMasterXbar__muxState_1  ,1'h0};
    assign   tlMasterXbar__auto_out_a_bits_address  =(  tlMasterXbar__muxState_0   ?   tlMasterXbar__auto_in_0_a_bits_address  :32'h0)|(  tlMasterXbar__muxState_1   ?   tlMasterXbar__auto_in_1_a_bits_address  :32'h0);
    assign   tlMasterXbar__auto_out_a_bits_mask  =(  tlMasterXbar__muxState_0   ?   tlMasterXbar__auto_in_0_a_bits_mask  :8'h0)|{8{  tlMasterXbar__muxState_1  }};
    assign   tlMasterXbar__auto_out_a_bits_data  =  tlMasterXbar__muxState_0   ?   tlMasterXbar__auto_in_0_a_bits_data  :64'h0;
    assign   tlMasterXbar__auto_out_b_ready  =~(  tlMasterXbar__auto_out_b_bits_source  [1])&  tlMasterXbar__auto_in_0_b_ready  ;
    assign   tlMasterXbar__auto_out_c_valid  =  tlMasterXbar__auto_in_0_c_valid  ;
    assign   tlMasterXbar__auto_out_c_bits_opcode  =  tlMasterXbar__auto_in_0_c_bits_opcode  ;
    assign   tlMasterXbar__auto_out_c_bits_param  =  tlMasterXbar__auto_in_0_c_bits_param  ;
    assign   tlMasterXbar__auto_out_c_bits_size  =  tlMasterXbar__auto_in_0_c_bits_size  ;
    assign   tlMasterXbar__auto_out_c_bits_source  ={1'h0,  tlMasterXbar__auto_in_0_c_bits_source  };
    assign   tlMasterXbar__auto_out_c_bits_address  =  tlMasterXbar__auto_in_0_c_bits_address  ;
    assign   tlMasterXbar__auto_out_c_bits_data  =  tlMasterXbar__auto_in_0_c_bits_data  ;
    assign   tlMasterXbar__auto_out_d_ready  =~(  tlMasterXbar__auto_out_d_bits_source  [1])&  tlMasterXbar__auto_in_0_d_ready  |  tlMasterXbar__requestDOI_0_1  ;
    assign   tlMasterXbar__auto_out_e_valid  =  tlMasterXbar__auto_in_0_e_valid  ;
    assign   tlMasterXbar__auto_out_e_bits_sink  =  tlMasterXbar__auto_in_0_e_bits_sink  ;
    assign tlMasterXbar__clock = clock;
    assign tlMasterXbar__reset = reset;
    assign _tlMasterXbar_auto_in_1_a_ready = tlMasterXbar__auto_in_1_a_ready;
    assign tlMasterXbar__auto_in_1_a_valid = _frontend_auto_icache_master_out_a_valid;
    assign tlMasterXbar__auto_in_1_a_bits_address = _frontend_auto_icache_master_out_a_bits_address;
    assign _tlMasterXbar_auto_in_1_d_valid = tlMasterXbar__auto_in_1_d_valid;
    assign _tlMasterXbar_auto_in_1_d_bits_opcode = tlMasterXbar__auto_in_1_d_bits_opcode;
    assign _tlMasterXbar_auto_in_1_d_bits_size = tlMasterXbar__auto_in_1_d_bits_size;
    assign _tlMasterXbar_auto_in_1_d_bits_data = tlMasterXbar__auto_in_1_d_bits_data;
    assign _tlMasterXbar_auto_in_1_d_bits_corrupt = tlMasterXbar__auto_in_1_d_bits_corrupt;
    assign _tlMasterXbar_auto_in_0_a_ready = tlMasterXbar__auto_in_0_a_ready;
    assign tlMasterXbar__auto_in_0_a_valid = _dcache_auto_out_a_valid;
    assign tlMasterXbar__auto_in_0_a_bits_opcode = _dcache_auto_out_a_bits_opcode;
    assign tlMasterXbar__auto_in_0_a_bits_param = _dcache_auto_out_a_bits_param;
    assign tlMasterXbar__auto_in_0_a_bits_size = _dcache_auto_out_a_bits_size;
    assign tlMasterXbar__auto_in_0_a_bits_source = _dcache_auto_out_a_bits_source;
    assign tlMasterXbar__auto_in_0_a_bits_address = _dcache_auto_out_a_bits_address;
    assign tlMasterXbar__auto_in_0_a_bits_mask = _dcache_auto_out_a_bits_mask;
    assign tlMasterXbar__auto_in_0_a_bits_data = _dcache_auto_out_a_bits_data;
    assign tlMasterXbar__auto_in_0_b_ready = _dcache_auto_out_b_ready;
    assign _tlMasterXbar_auto_in_0_b_valid = tlMasterXbar__auto_in_0_b_valid;
    assign _tlMasterXbar_auto_in_0_b_bits_param = tlMasterXbar__auto_in_0_b_bits_param;
    assign _tlMasterXbar_auto_in_0_b_bits_size = tlMasterXbar__auto_in_0_b_bits_size;
    assign _tlMasterXbar_auto_in_0_b_bits_source = tlMasterXbar__auto_in_0_b_bits_source;
    assign _tlMasterXbar_auto_in_0_b_bits_address = tlMasterXbar__auto_in_0_b_bits_address;
    assign _tlMasterXbar_auto_in_0_c_ready = tlMasterXbar__auto_in_0_c_ready;
    assign tlMasterXbar__auto_in_0_c_valid = _dcache_auto_out_c_valid;
    assign tlMasterXbar__auto_in_0_c_bits_opcode = _dcache_auto_out_c_bits_opcode;
    assign tlMasterXbar__auto_in_0_c_bits_param = _dcache_auto_out_c_bits_param;
    assign tlMasterXbar__auto_in_0_c_bits_size = _dcache_auto_out_c_bits_size;
    assign tlMasterXbar__auto_in_0_c_bits_source = _dcache_auto_out_c_bits_source;
    assign tlMasterXbar__auto_in_0_c_bits_address = _dcache_auto_out_c_bits_address;
    assign tlMasterXbar__auto_in_0_c_bits_data = _dcache_auto_out_c_bits_data;
    assign tlMasterXbar__auto_in_0_d_ready = _dcache_auto_out_d_ready;
    assign _tlMasterXbar_auto_in_0_d_valid = tlMasterXbar__auto_in_0_d_valid;
    assign _tlMasterXbar_auto_in_0_d_bits_opcode = tlMasterXbar__auto_in_0_d_bits_opcode;
    assign _tlMasterXbar_auto_in_0_d_bits_param = tlMasterXbar__auto_in_0_d_bits_param;
    assign _tlMasterXbar_auto_in_0_d_bits_size = tlMasterXbar__auto_in_0_d_bits_size;
    assign _tlMasterXbar_auto_in_0_d_bits_source = tlMasterXbar__auto_in_0_d_bits_source;
    assign _tlMasterXbar_auto_in_0_d_bits_sink = tlMasterXbar__auto_in_0_d_bits_sink;
    assign _tlMasterXbar_auto_in_0_d_bits_denied = tlMasterXbar__auto_in_0_d_bits_denied;
    assign _tlMasterXbar_auto_in_0_d_bits_data = tlMasterXbar__auto_in_0_d_bits_data;
    assign _tlMasterXbar_auto_in_0_e_ready = tlMasterXbar__auto_in_0_e_ready;
    assign tlMasterXbar__auto_in_0_e_valid = _dcache_auto_out_e_valid;
    assign tlMasterXbar__auto_in_0_e_bits_sink = _dcache_auto_out_e_bits_sink;
    assign tlMasterXbar__auto_out_a_ready = auto_buffer_out_a_ready;
    assign auto_buffer_out_a_valid = tlMasterXbar__auto_out_a_valid;
    assign auto_buffer_out_a_bits_opcode = tlMasterXbar__auto_out_a_bits_opcode;
    assign auto_buffer_out_a_bits_param = tlMasterXbar__auto_out_a_bits_param;
    assign auto_buffer_out_a_bits_size = tlMasterXbar__auto_out_a_bits_size;
    assign auto_buffer_out_a_bits_source = tlMasterXbar__auto_out_a_bits_source;
    assign auto_buffer_out_a_bits_address = tlMasterXbar__auto_out_a_bits_address;
    assign auto_buffer_out_a_bits_mask = tlMasterXbar__auto_out_a_bits_mask;
    assign auto_buffer_out_a_bits_data = tlMasterXbar__auto_out_a_bits_data;
    assign auto_buffer_out_b_ready = tlMasterXbar__auto_out_b_ready;
    assign tlMasterXbar__auto_out_b_valid = auto_buffer_out_b_valid;
    assign tlMasterXbar__auto_out_b_bits_opcode = auto_buffer_out_b_bits_opcode;
    assign tlMasterXbar__auto_out_b_bits_param = auto_buffer_out_b_bits_param;
    assign tlMasterXbar__auto_out_b_bits_size = auto_buffer_out_b_bits_size;
    assign tlMasterXbar__auto_out_b_bits_source = auto_buffer_out_b_bits_source;
    assign tlMasterXbar__auto_out_b_bits_address = auto_buffer_out_b_bits_address;
    assign tlMasterXbar__auto_out_b_bits_mask = auto_buffer_out_b_bits_mask;
    assign tlMasterXbar__auto_out_b_bits_corrupt = auto_buffer_out_b_bits_corrupt;
    assign tlMasterXbar__auto_out_c_ready = auto_buffer_out_c_ready;
    assign auto_buffer_out_c_valid = tlMasterXbar__auto_out_c_valid;
    assign auto_buffer_out_c_bits_opcode = tlMasterXbar__auto_out_c_bits_opcode;
    assign auto_buffer_out_c_bits_param = tlMasterXbar__auto_out_c_bits_param;
    assign auto_buffer_out_c_bits_size = tlMasterXbar__auto_out_c_bits_size;
    assign auto_buffer_out_c_bits_source = tlMasterXbar__auto_out_c_bits_source;
    assign auto_buffer_out_c_bits_address = tlMasterXbar__auto_out_c_bits_address;
    assign auto_buffer_out_c_bits_data = tlMasterXbar__auto_out_c_bits_data;
    assign auto_buffer_out_d_ready = tlMasterXbar__auto_out_d_ready;
    assign tlMasterXbar__auto_out_d_valid = auto_buffer_out_d_valid;
    assign tlMasterXbar__auto_out_d_bits_opcode = auto_buffer_out_d_bits_opcode;
    assign tlMasterXbar__auto_out_d_bits_param = auto_buffer_out_d_bits_param;
    assign tlMasterXbar__auto_out_d_bits_size = auto_buffer_out_d_bits_size;
    assign tlMasterXbar__auto_out_d_bits_source = auto_buffer_out_d_bits_source;
    assign tlMasterXbar__auto_out_d_bits_sink = auto_buffer_out_d_bits_sink;
    assign tlMasterXbar__auto_out_d_bits_denied = auto_buffer_out_d_bits_denied;
    assign tlMasterXbar__auto_out_d_bits_data = auto_buffer_out_d_bits_data;
    assign tlMasterXbar__auto_out_d_bits_corrupt = auto_buffer_out_d_bits_corrupt;
    assign tlMasterXbar__auto_out_e_ready = auto_buffer_out_e_ready;
    assign auto_buffer_out_e_valid = tlMasterXbar__auto_out_e_valid;
    assign auto_buffer_out_e_bits_sink = tlMasterXbar__auto_out_e_bits_sink;


    wire  intXbar__auto_int_in_2_0;
    wire  intXbar__auto_int_in_1_0;
    wire  intXbar__auto_int_in_1_1;
    wire  intXbar__auto_int_in_0_0;
    wire  intXbar__auto_int_out_0;
    wire  intXbar__auto_int_out_1;
    wire  intXbar__auto_int_out_2;
    wire  intXbar__auto_int_out_3;

    assign   intXbar__auto_int_out_0  =  intXbar__auto_int_in_0_0  ;
    assign   intXbar__auto_int_out_1  =  intXbar__auto_int_in_1_0  ;
    assign   intXbar__auto_int_out_2  =  intXbar__auto_int_in_1_1  ;
    assign   intXbar__auto_int_out_3  =  intXbar__auto_int_in_2_0  ;
    assign intXbar__auto_int_in_2_0 = auto_int_local_in_2_0;
    assign intXbar__auto_int_in_1_0 = auto_int_local_in_1_0;
    assign intXbar__auto_int_in_1_1 = auto_int_local_in_1_1;
    assign intXbar__auto_int_in_0_0 = auto_int_local_in_0_0;
    assign _intXbar_auto_int_out_0 = intXbar__auto_int_out_0;
    assign _intXbar_auto_int_out_1 = intXbar__auto_int_out_1;
    assign _intXbar_auto_int_out_2 = intXbar__auto_int_out_2;
    assign _intXbar_auto_int_out_3 = intXbar__auto_int_out_3;


    wire  dcache__clock;
    wire  dcache__reset;
    wire  dcache__auto_out_a_ready;
    wire  dcache__auto_out_a_valid;
    wire [2:0] dcache__auto_out_a_bits_opcode;
    wire [2:0] dcache__auto_out_a_bits_param;
    wire [3:0] dcache__auto_out_a_bits_size;
    wire  dcache__auto_out_a_bits_source;
    wire [31:0] dcache__auto_out_a_bits_address;
    wire [7:0] dcache__auto_out_a_bits_mask;
    wire [63:0] dcache__auto_out_a_bits_data;
    wire  dcache__auto_out_b_ready;
    wire  dcache__auto_out_b_valid;
    wire [1:0] dcache__auto_out_b_bits_param;
    wire [3:0] dcache__auto_out_b_bits_size;
    wire  dcache__auto_out_b_bits_source;
    wire [31:0] dcache__auto_out_b_bits_address;
    wire  dcache__auto_out_c_ready;
    wire  dcache__auto_out_c_valid;
    wire [2:0] dcache__auto_out_c_bits_opcode;
    wire [2:0] dcache__auto_out_c_bits_param;
    wire [3:0] dcache__auto_out_c_bits_size;
    wire  dcache__auto_out_c_bits_source;
    wire [31:0] dcache__auto_out_c_bits_address;
    wire [63:0] dcache__auto_out_c_bits_data;
    wire  dcache__auto_out_d_ready;
    wire  dcache__auto_out_d_valid;
    wire [2:0] dcache__auto_out_d_bits_opcode;
    wire [1:0] dcache__auto_out_d_bits_param;
    wire [3:0] dcache__auto_out_d_bits_size;
    wire  dcache__auto_out_d_bits_source;
    wire [1:0] dcache__auto_out_d_bits_sink;
    wire  dcache__auto_out_d_bits_denied;
    wire [63:0] dcache__auto_out_d_bits_data;
    wire  dcache__auto_out_e_ready;
    wire  dcache__auto_out_e_valid;
    wire [1:0] dcache__auto_out_e_bits_sink;
    wire  dcache__io_cpu_req_ready;
    wire  dcache__io_cpu_req_valid;
    wire [33:0] dcache__io_cpu_req_bits_addr;
    wire [5:0] dcache__io_cpu_req_bits_tag;
    wire [4:0] dcache__io_cpu_req_bits_cmd;
    wire [1:0] dcache__io_cpu_req_bits_size;
    wire  dcache__io_cpu_req_bits_signed;
    wire  dcache__io_cpu_req_bits_dv;
    wire  dcache__io_cpu_s1_kill;
    wire [63:0] dcache__io_cpu_s1_data_data;
    wire [7:0] dcache__io_cpu_s1_data_mask;
    wire  dcache__io_cpu_s2_nack;
    wire  dcache__io_cpu_resp_valid;
    wire [33:0] dcache__io_cpu_resp_bits_addr;
    wire [5:0] dcache__io_cpu_resp_bits_tag;
    wire [4:0] dcache__io_cpu_resp_bits_cmd;
    wire [1:0] dcache__io_cpu_resp_bits_size;
    wire  dcache__io_cpu_resp_bits_signed;
    wire [1:0] dcache__io_cpu_resp_bits_dprv;
    wire  dcache__io_cpu_resp_bits_dv;
    wire [63:0] dcache__io_cpu_resp_bits_data;
    wire [7:0] dcache__io_cpu_resp_bits_mask;
    wire  dcache__io_cpu_resp_bits_replay;
    wire  dcache__io_cpu_resp_bits_has_data;
    wire [63:0] dcache__io_cpu_resp_bits_data_word_bypass;
    wire [63:0] dcache__io_cpu_resp_bits_data_raw;
    wire [63:0] dcache__io_cpu_resp_bits_store_data;
    wire  dcache__io_cpu_replay_next;
    wire  dcache__io_cpu_s2_xcpt_ma_ld;
    wire  dcache__io_cpu_s2_xcpt_ma_st;
    wire  dcache__io_cpu_s2_xcpt_pf_ld;
    wire  dcache__io_cpu_s2_xcpt_pf_st;
    wire  dcache__io_cpu_s2_xcpt_ae_ld;
    wire  dcache__io_cpu_s2_xcpt_ae_st;
    wire  dcache__io_cpu_ordered;
    wire  dcache__io_cpu_perf_release;
    wire  dcache__io_cpu_perf_grant;
    wire  dcache__io_ptw_req_bits_bits_need_gpa;
    wire  dcache__io_ptw_req_bits_bits_stage2;
    wire  dcache__io_ptw_status_debug;
    wire  dcache__io_ptw_pmp_cfg_l_0;
    wire  dcache__io_ptw_pmp_cfg_l_1;
    wire  dcache__io_ptw_pmp_cfg_l_2;
    wire  dcache__io_ptw_pmp_cfg_l_3;
    wire  dcache__io_ptw_pmp_cfg_l_4;
    wire  dcache__io_ptw_pmp_cfg_l_5;
    wire  dcache__io_ptw_pmp_cfg_l_6;
    wire  dcache__io_ptw_pmp_cfg_l_7;
    wire [1:0] dcache__io_ptw_pmp_cfg_a_0;
    wire [1:0] dcache__io_ptw_pmp_cfg_a_1;
    wire [1:0] dcache__io_ptw_pmp_cfg_a_2;
    wire [1:0] dcache__io_ptw_pmp_cfg_a_3;
    wire [1:0] dcache__io_ptw_pmp_cfg_a_4;
    wire [1:0] dcache__io_ptw_pmp_cfg_a_5;
    wire [1:0] dcache__io_ptw_pmp_cfg_a_6;
    wire [1:0] dcache__io_ptw_pmp_cfg_a_7;
    wire  dcache__io_ptw_pmp_cfg_w_0;
    wire  dcache__io_ptw_pmp_cfg_w_1;
    wire  dcache__io_ptw_pmp_cfg_w_2;
    wire  dcache__io_ptw_pmp_cfg_w_3;
    wire  dcache__io_ptw_pmp_cfg_w_4;
    wire  dcache__io_ptw_pmp_cfg_w_5;
    wire  dcache__io_ptw_pmp_cfg_w_6;
    wire  dcache__io_ptw_pmp_cfg_w_7;
    wire  dcache__io_ptw_pmp_cfg_r_0;
    wire  dcache__io_ptw_pmp_cfg_r_1;
    wire  dcache__io_ptw_pmp_cfg_r_2;
    wire  dcache__io_ptw_pmp_cfg_r_3;
    wire  dcache__io_ptw_pmp_cfg_r_4;
    wire  dcache__io_ptw_pmp_cfg_r_5;
    wire  dcache__io_ptw_pmp_cfg_r_6;
    wire  dcache__io_ptw_pmp_cfg_r_7;
    wire [29:0] dcache__io_ptw_pmp_addr_0;
    wire [29:0] dcache__io_ptw_pmp_addr_1;
    wire [29:0] dcache__io_ptw_pmp_addr_2;
    wire [29:0] dcache__io_ptw_pmp_addr_3;
    wire [29:0] dcache__io_ptw_pmp_addr_4;
    wire [29:0] dcache__io_ptw_pmp_addr_5;
    wire [29:0] dcache__io_ptw_pmp_addr_6;
    wire [29:0] dcache__io_ptw_pmp_addr_7;
    wire [31:0] dcache__io_ptw_pmp_mask_0;
    wire [31:0] dcache__io_ptw_pmp_mask_1;
    wire [31:0] dcache__io_ptw_pmp_mask_2;
    wire [31:0] dcache__io_ptw_pmp_mask_3;
    wire [31:0] dcache__io_ptw_pmp_mask_4;
    wire [31:0] dcache__io_ptw_pmp_mask_5;
    wire [31:0] dcache__io_ptw_pmp_mask_6;
    wire [31:0] dcache__io_ptw_pmp_mask_7;

    wire  dcache__io_cpu_s2_xcpt_ma_st_0  ;
    wire  dcache__io_cpu_s2_xcpt_ma_ld_0  ;
    wire  dcache__io_cpu_s2_xcpt_ae_st_0  ;
    wire  dcache__io_cpu_s2_xcpt_ae_ld_0  ;
    wire  dcache__io_cpu_s2_xcpt_pf_st_0  ;
    wire  dcache__io_cpu_s2_xcpt_pf_ld_0  ;
    wire[21:0]  dcache__metaArb_io_in_bits_data_7  ;
    wire  dcache__metaArb_io_in_valid_4  ;
    wire[11:0]  dcache__dataArb_io_in_bits_addr_2  ;
    wire  dcache__dataArb_io_in_valid_2  ;
    wire[3:0]  dcache__nodeOut_c_bits_size  ;
    wire[2:0]  dcache__nodeOut_c_bits_opcode  ;
    wire  dcache__nodeOut_c_valid  ;
    wire[5:0]  dcache__metaArb_io_in_bits_idx_6  ;
    wire  dcache__metaArb_io_in_valid_6  ;
    wire  dcache__s1_nack  ;
    wire  dcache__dataArb_io_in_bits_write_1  ;
    wire  dcache__dataArb_io_in_valid_1  ;
    wire  dcache__nodeOut_d_ready  ;
    wire[21:0]  dcache__metaArb_io_in_bits_data_3  ;
    wire  dcache__metaArb_io_in_valid_3  ;
    wire[11:0]  dcache__dataArb_io_in_bits_addr_1  ;
    wire[7:0]  dcache__dataArb_io_in_bits_eccMask_0  ;
    wire[63:0]  dcache__dataArb_io_in_bits_wdata_0  ;
    wire[11:0]  dcache___dataArb_io_in_0_bits_wordMask_wordMask_T  ;
    wire  dcache__dataArb_io_in_valid_0  ;
    wire  dcache__pstore_drain  ;
    wire[21:0]  dcache__metaArb_io_in_bits_data_2  ;
    wire[5:0]  dcache__metaArb_io_in_bits_idx_3  ;
    wire[5:0]  dcache__metaArb_io_in_bits_idx_4  ;
    wire  dcache__metaArb_io_in_valid_2  ;
    reg[33:0]  dcache__s2_req_addr  ;
    wire  dcache__readEnable  ;
    wire  dcache__writeEnable  ;
    wire[5:0]  dcache__metaArb_io_in_bits_idx_7  ;
    wire[11:0]  dcache__dataArb_io_in_bits_addr_3  ;
    wire  dcache__dataArb_io_in_valid_3  ;
    reg[5:0]  dcache__flushCounter  ;
    reg  dcache__resetting  ;
    reg[33:0]  dcache__s1_tlb_req_vaddr  ;
    wire[63:0]  dcache___amoalus_0_io_out  ;
    wire[63:0]  dcache___data_io_resp_0  ;
    wire[21:0]  dcache___tag_array_0_ext_RW0_rdata  ;
    wire  dcache___tlb_pmp_io_r  ;
    wire  dcache___tlb_pmp_io_w  ;
    wire  dcache___GEN  =  dcache__metaArb_io_in_valid_2  |  dcache__metaArb_io_in_valid_3  ;
    wire  dcache__metaArb_io_out_bits_write  =  dcache__resetting  |  dcache__metaArb_io_in_valid_2  |  dcache__metaArb_io_in_valid_3  |  dcache__metaArb_io_in_valid_4  ;
    wire  dcache__metaArb__grant_T_2  =  dcache__resetting  |  dcache__metaArb_io_in_valid_2  |  dcache__metaArb_io_in_valid_3  ;
    wire  dcache__metaArb__grant_T_3  =  dcache__metaArb__grant_T_2  |  dcache__metaArb_io_in_valid_4  ;
    wire  dcache__metaArb__grant_T_5  =  dcache__metaArb__grant_T_3  |  dcache__metaArb_io_in_valid_6  ;
    wire  dcache__metaArb_io_out_valid  =  dcache__metaArb__grant_T_5  |  dcache__io_cpu_req_valid  ;
    wire  dcache__dataArb__grant_T  =  dcache__dataArb_io_in_valid_0  |  dcache__dataArb_io_in_valid_1  ;
    wire  dcache__dataArb__grant_T_1  =  dcache__dataArb__grant_T  |  dcache__dataArb_io_in_valid_2  ;
    wire  dcache__dataArb_io_out_valid  =  dcache__dataArb__grant_T_1  |  dcache__dataArb_io_in_valid_3  ;
    reg  dcache__s1_valid  ;
    reg  dcache__s1_probe  ;
    reg[1:0]  dcache__probe_bits_param  ;
    reg[3:0]  dcache__probe_bits_size  ;
    reg  dcache__probe_bits_source  ;
    reg[31:0]  dcache__probe_bits_address  ;
    wire  dcache__s1_valid_masked  =  dcache__s1_valid  &~  dcache__io_cpu_s1_kill  ;
    reg[33:0]  dcache__s1_vaddr  ;
    reg[5:0]  dcache__s1_req_tag  ;
    reg[4:0]  dcache__s1_req_cmd  ;
    reg[1:0]  dcache__s1_req_size  ;
    reg  dcache__s1_req_signed  ;
    reg[1:0]  dcache__s1_req_dprv  ;
    reg  dcache__s1_req_dv  ;
    reg[1:0]  dcache__s1_tlb_req_size  ;
    reg[4:0]  dcache__s1_tlb_req_cmd  ;
    reg[1:0]  dcache__s1_tlb_req_prv  ;
    wire  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_1  =  dcache__s1_req_cmd  ==5'h0;
    wire  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_2  =  dcache__s1_req_cmd  ==5'h10;
    wire  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_3  =  dcache__s1_req_cmd  ==5'h6;
    wire  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_29  =  dcache__s1_req_cmd  ==5'h7;
    wire  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_31  =  dcache__s1_req_cmd  ==5'h4;
    wire  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_32  =  dcache__s1_req_cmd  ==5'h9;
    wire  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_33  =  dcache__s1_req_cmd  ==5'hA;
    wire  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_34  =  dcache__s1_req_cmd  ==5'hB;
    wire  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_38  =  dcache__s1_req_cmd  ==5'h8;
    wire  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_39  =  dcache__s1_req_cmd  ==5'hC;
    wire  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_40  =  dcache__s1_req_cmd  ==5'hD;
    wire  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_41  =  dcache__s1_req_cmd  ==5'hE;
    wire  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_42  =  dcache__s1_req_cmd  ==5'hF;
    wire  dcache__s1_read  =  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_1  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_2  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_3  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_29  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_31  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_32  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_33  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_34  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_38  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_39  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_40  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_41  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_42  ;
    wire  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_26  =  dcache__s1_req_cmd  ==5'h1;
    wire  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_51  =  dcache__s1_req_cmd  ==5'h11;
    wire  dcache__s1_write  =  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_26  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_51  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_29  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_31  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_32  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_33  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_34  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_38  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_39  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_40  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_41  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_42  ;
    reg  dcache__s1_flush_valid  ;
    reg  dcache__cached_grant_wait  ;
    reg  dcache__release_ack_wait  ;
    reg[31:0]  dcache__release_ack_addr  ;
    reg[3:0]  dcache__release_state  ;
    wire  dcache___canAcceptCachedGrant_T  =  dcache__release_state  ==4'h1;
    wire  dcache___inWriteback_T_1  =  dcache__release_state  ==4'h2;
    wire  dcache__inWriteback  =  dcache___canAcceptCachedGrant_T  |  dcache___inWriteback_T_1  ;
    wire  dcache___io_cpu_req_ready_T_4  =  dcache__release_state  ==4'h0&~  dcache__cached_grant_wait  &~  dcache__s1_nack  ;
    reg  dcache__uncachedInFlight_0  ;
    reg[33:0]  dcache__uncachedReqs_addr_0  ;
    reg[5:0]  dcache__uncachedReqs_tag_0  ;
    reg[1:0]  dcache__uncachedReqs_size_0  ;
    reg  dcache__uncachedReqs_signed_0  ;
    wire  dcache___pstore_drain_opportunistic_T  =  dcache__io_cpu_req_bits_cmd  ==5'h0;
    wire  dcache___pstore_drain_opportunistic_T_1  =  dcache__io_cpu_req_bits_cmd  ==5'h10;
    wire  dcache___pstore_drain_opportunistic_T_2  =  dcache__io_cpu_req_bits_cmd  ==5'h6;
    wire  dcache___pstore_drain_opportunistic_T_28  =  dcache__io_cpu_req_bits_cmd  ==5'h7;
    wire  dcache___pstore_drain_opportunistic_T_30  =  dcache__io_cpu_req_bits_cmd  ==5'h4;
    wire  dcache___pstore_drain_opportunistic_T_31  =  dcache__io_cpu_req_bits_cmd  ==5'h9;
    wire  dcache___pstore_drain_opportunistic_T_32  =  dcache__io_cpu_req_bits_cmd  ==5'hA;
    wire  dcache___pstore_drain_opportunistic_T_33  =  dcache__io_cpu_req_bits_cmd  ==5'hB;
    wire  dcache___pstore_drain_opportunistic_T_37  =  dcache__io_cpu_req_bits_cmd  ==5'h8;
    wire  dcache___pstore_drain_opportunistic_T_38  =  dcache__io_cpu_req_bits_cmd  ==5'hC;
    wire  dcache___pstore_drain_opportunistic_T_39  =  dcache__io_cpu_req_bits_cmd  ==5'hD;
    wire  dcache___pstore_drain_opportunistic_T_40  =  dcache__io_cpu_req_bits_cmd  ==5'hE;
    wire  dcache___pstore_drain_opportunistic_T_41  =  dcache__io_cpu_req_bits_cmd  ==5'hF;
    wire  dcache___pstore_drain_opportunistic_T_25  =  dcache__io_cpu_req_bits_cmd  ==5'h1;
    wire  dcache___pstore_drain_opportunistic_res_T_1  =  dcache__io_cpu_req_bits_cmd  ==5'h3;
    wire  dcache___dataArb_io_in_3_valid_res_T_2  =  dcache___pstore_drain_opportunistic_T_25  |  dcache___pstore_drain_opportunistic_res_T_1  ;
    wire  dcache___pstore_drain_opportunistic_T_50  =  dcache__io_cpu_req_bits_cmd  ==5'h11;
    assign   dcache__dataArb_io_in_valid_3  =  dcache__io_cpu_req_valid  &~  dcache___dataArb_io_in_3_valid_res_T_2  ;
    assign   dcache__dataArb_io_in_bits_addr_3  =  dcache__io_cpu_req_bits_addr  [11:0];
    wire  dcache___GEN_0  =  dcache__dataArb__grant_T_1  &(  dcache___pstore_drain_opportunistic_T  |  dcache___pstore_drain_opportunistic_T_1  |  dcache___pstore_drain_opportunistic_T_2  |  dcache___pstore_drain_opportunistic_T_28  |  dcache___pstore_drain_opportunistic_T_30  |  dcache___pstore_drain_opportunistic_T_31  |  dcache___pstore_drain_opportunistic_T_32  |  dcache___pstore_drain_opportunistic_T_33  |  dcache___pstore_drain_opportunistic_T_37  |  dcache___pstore_drain_opportunistic_T_38  |  dcache___pstore_drain_opportunistic_T_39  |  dcache___pstore_drain_opportunistic_T_40  |  dcache___pstore_drain_opportunistic_T_41  );
    reg  dcache__s1_did_read  ;
    assign   dcache__metaArb_io_in_bits_idx_7  =  dcache__io_cpu_req_bits_addr  [11:6];
    assign   dcache__writeEnable  =  dcache__metaArb_io_out_valid  &  dcache__metaArb_io_out_bits_write  ;
    assign   dcache__readEnable  =  dcache__metaArb_io_out_valid  &~  dcache__metaArb_io_out_bits_write  ;
    wire[1:0]  dcache___s1_mask_xwr_T  ={  dcache__s1_vaddr  [0]|(|  dcache__s1_req_size  ),~(  dcache__s1_vaddr  [0])};
    wire[3:0]  dcache___s1_mask_xwr_T_1  ={(  dcache__s1_vaddr  [1] ?   dcache___s1_mask_xwr_T  :2'h0)|{2{  dcache__s1_req_size  [1]}},  dcache__s1_vaddr  [1] ? 2'h0:  dcache___s1_mask_xwr_T  };
    wire[7:0]  dcache__s1_mask_xwr  ={(  dcache__s1_vaddr  [2] ?   dcache___s1_mask_xwr_T_1  :4'h0)|{4{&  dcache__s1_req_size  }},  dcache__s1_vaddr  [2] ? 4'h0:  dcache___s1_mask_xwr_T_1  };
    reg  dcache__s2_valid  ;
    wire  dcache__s2_valid_no_xcpt  =  dcache__s2_valid  &{  dcache__io_cpu_s2_xcpt_ma_ld_0  ,  dcache__io_cpu_s2_xcpt_ma_st_0  ,  dcache__io_cpu_s2_xcpt_pf_ld_0  ,  dcache__io_cpu_s2_xcpt_pf_st_0  ,  dcache__io_cpu_s2_xcpt_ae_ld_0  ,  dcache__io_cpu_s2_xcpt_ae_st_0  }==6'h0;
    reg  dcache__s2_probe  ;
    wire  dcache__releaseInFlight  =  dcache__s1_probe  |  dcache__s2_probe  |(|  dcache__release_state  );
    reg  dcache__s2_not_nacked_in_s1  ;
    wire  dcache__s2_valid_masked  =  dcache__s2_valid_no_xcpt  &  dcache__s2_not_nacked_in_s1  ;
    reg[5:0]  dcache__s2_req_tag  ;
    reg[4:0]  dcache__s2_req_cmd  ;
    reg[1:0]  dcache__s2_req_size  ;
    reg  dcache__s2_req_signed  ;
    reg[1:0]  dcache__s2_req_dprv  ;
    reg  dcache__s2_req_dv  ;
    reg  dcache__s2_tlb_xcpt_pf_ld  ;
    reg  dcache__s2_tlb_xcpt_pf_st  ;
    reg  dcache__s2_tlb_xcpt_ae_ld  ;
    reg  dcache__s2_tlb_xcpt_ae_st  ;
    reg  dcache__s2_tlb_xcpt_ma_ld  ;
    reg  dcache__s2_tlb_xcpt_ma_st  ;
    reg  dcache__s2_pma_cacheable  ;
    reg[33:0]  dcache__s2_uncached_resp_addr  ;
    reg[33:0]  dcache__s2_vaddr_r  ;
    wire  dcache__s2_lr  =  dcache__s2_req_cmd  ==5'h6;
    wire  dcache__s2_sc  =  dcache__s2_req_cmd  ==5'h7;
    wire  dcache___metaArb_io_in_3_bits_data_c_cat_T_28  =  dcache__s2_req_cmd  ==5'h4;
    wire  dcache___metaArb_io_in_3_bits_data_c_cat_T_29  =  dcache__s2_req_cmd  ==5'h9;
    wire  dcache___metaArb_io_in_3_bits_data_c_cat_T_30  =  dcache__s2_req_cmd  ==5'hA;
    wire  dcache___metaArb_io_in_3_bits_data_c_cat_T_31  =  dcache__s2_req_cmd  ==5'hB;
    wire  dcache___metaArb_io_in_3_bits_data_c_cat_T_35  =  dcache__s2_req_cmd  ==5'h8;
    wire  dcache___metaArb_io_in_3_bits_data_c_cat_T_36  =  dcache__s2_req_cmd  ==5'hC;
    wire  dcache___metaArb_io_in_3_bits_data_c_cat_T_37  =  dcache__s2_req_cmd  ==5'hD;
    wire  dcache___metaArb_io_in_3_bits_data_c_cat_T_38  =  dcache__s2_req_cmd  ==5'hE;
    wire  dcache___metaArb_io_in_3_bits_data_c_cat_T_39  =  dcache__s2_req_cmd  ==5'hF;
    wire  dcache__s2_read  =  dcache__s2_req_cmd  ==5'h0|  dcache__s2_req_cmd  ==5'h10|  dcache__s2_lr  |  dcache__s2_sc  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_28  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_29  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_30  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_31  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_35  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_36  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_37  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_38  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_39  ;
    wire  dcache___metaArb_io_in_3_bits_data_c_cat_T_23  =  dcache__s2_req_cmd  ==5'h1;
    wire  dcache___metaArb_io_in_3_bits_data_c_cat_T_24  =  dcache__s2_req_cmd  ==5'h11;
    wire  dcache__s2_write  =  dcache___metaArb_io_in_3_bits_data_c_cat_T_23  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_24  |  dcache__s2_sc  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_28  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_29  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_30  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_31  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_35  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_36  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_37  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_38  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_39  ;
    wire  dcache__s2_readwrite  =  dcache__s2_read  |  dcache__s2_write  ;
    reg  dcache__s2_flush_valid  ;
    reg[21:0]  dcache__s2_meta_corrected_r  ;
    reg[63:0]  dcache__s2_data  ;
    reg[1:0]  dcache__s2_probe_state_state  ;
    reg[1:0]  dcache__s2_hit_state_state  ;
    wire  dcache___metaArb_io_in_3_bits_data_c_cat_T_46  =  dcache__s2_req_cmd  ==5'h3;
    wire[3:0]  dcache___GEN_1  ={  dcache___metaArb_io_in_3_bits_data_c_cat_T_23  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_24  |  dcache__s2_sc  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_28  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_29  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_30  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_31  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_35  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_36  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_37  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_38  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_39  ,  dcache___metaArb_io_in_3_bits_data_c_cat_T_23  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_24  |  dcache__s2_sc  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_28  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_29  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_30  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_31  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_35  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_36  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_37  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_38  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_39  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_46  |  dcache__s2_lr  ,  dcache__s2_hit_state_state  };
    wire  dcache__s2_hit  =  dcache___GEN_1  ==4'h3|  dcache___GEN_1  ==4'h2|  dcache___GEN_1  ==4'h1|  dcache___GEN_1  ==4'h7|  dcache___GEN_1  ==4'h6|(&  dcache___GEN_1  )|  dcache___GEN_1  ==4'hE;
    reg[1:0]  dcache__casez_tmp  ;
    wire[1:0]  dcache___GEN_2  ={1'h0,  dcache___GEN_1  ==4'hC};
    always @(*)
    begin
        casez (  dcache___GEN_1  )
            4 'b0000:
                dcache__casez_tmp   =2'h0;
            4 'b0001:
                dcache__casez_tmp   =2'h1;
            4 'b0010:
                dcache__casez_tmp   =2'h2;
            4 'b0011:
                dcache__casez_tmp   =2'h3;
            4 'b0100:
                dcache__casez_tmp   =2'h1;
            4 'b0101:
                dcache__casez_tmp   =2'h2;
            4 'b0110:
                dcache__casez_tmp   =2'h2;
            4 'b0111:
                dcache__casez_tmp   =2'h3;
            4 'b1000:
                dcache__casez_tmp   =  dcache___GEN_2  ;
            4 'b1001:
                dcache__casez_tmp   =  dcache___GEN_2  ;
            4 'b1010:
                dcache__casez_tmp   =  dcache___GEN_2  ;
            4 'b1011:
                dcache__casez_tmp   =  dcache___GEN_2  ;
            4 'b1100:
                dcache__casez_tmp   =  dcache___GEN_2  ;
            4 'b1101:
                dcache__casez_tmp   =2'h2;
            4 'b1110:
                dcache__casez_tmp   =2'h3;
            default :
                dcache__casez_tmp   =2'h3;
        endcase
    end

    wire  dcache__s2_valid_hit_maybe_flush_pre_data_ecc_and_waw  =  dcache__s2_valid_masked  &  dcache__s2_hit  ;
    wire  dcache__s2_valid_hit_pre_data_ecc_and_waw  =  dcache__s2_valid_hit_maybe_flush_pre_data_ecc_and_waw  &  dcache__s2_readwrite  ;
    wire  dcache__s2_valid_flush_line  =  dcache__s2_valid_hit_maybe_flush_pre_data_ecc_and_waw  &  dcache__s2_req_cmd  ==5'h5&  dcache__s2_req_size  [0];
    wire  dcache__s2_valid_miss  =  dcache__s2_valid_masked  &  dcache__s2_readwrite  &~  dcache__s2_hit  ;
    wire  dcache__s2_valid_cached_miss  =  dcache__s2_valid_miss  &  dcache__s2_pma_cacheable  &~  dcache__uncachedInFlight_0  ;
    wire  dcache__s2_want_victimize  =  dcache__s2_valid_cached_miss  |  dcache__s2_valid_flush_line  |  dcache__s2_flush_valid  ;
    wire  dcache__s2_valid_uncached_pending  =  dcache__s2_valid_miss  &~  dcache__s2_pma_cacheable  &~  dcache__uncachedInFlight_0  ;
    wire[1:0]  dcache__s2_victim_state_state  =(|  dcache__s2_hit_state_state  ) ?   dcache__s2_hit_state_state  :  dcache__s2_meta_corrected_r  [21:20];
    wire[3:0]  dcache___GEN_3  ={  dcache__probe_bits_param  ,  dcache__s2_probe_state_state  };
    wire  dcache___GEN_4  =  dcache___GEN_3  ==4'hB;
    wire  dcache___GEN_5  =  dcache___GEN_3  ==4'h4;
    wire  dcache___GEN_6  =  dcache___GEN_3  ==4'h5;
    wire  dcache___GEN_7  =  dcache___GEN_3  ==4'h6;
    wire  dcache___GEN_8  =  dcache___GEN_3  ==4'h7;
    wire  dcache___GEN_9  =  dcache___GEN_3  ==4'h0;
    wire  dcache___GEN_10  =  dcache___GEN_3  ==4'h1;
    wire  dcache___GEN_11  =  dcache___GEN_3  ==4'h2;
    wire  dcache___GEN_12  =  dcache___GEN_3  ==4'h3;
    wire  dcache__s2_prb_ack_data  =  dcache___GEN_12  |~(  dcache___GEN_11  |  dcache___GEN_10  |  dcache___GEN_9  )&(  dcache___GEN_8  |~(  dcache___GEN_7  |  dcache___GEN_6  |  dcache___GEN_5  )&  dcache___GEN_4  );
    wire  dcache___GEN_13  =  dcache___GEN_12  |  dcache___GEN_11  ;
    wire  dcache__s2_victim_dirty  =&  dcache__s2_victim_state_state  ;
    wire  dcache__io_cpu_s2_nack_0  =  dcache__s2_valid_no_xcpt  &~(  dcache__s2_valid_uncached_pending  &  dcache__auto_out_a_ready  )&~(  dcache__s2_valid_masked  &  dcache__s2_req_cmd  ==5'h17)&~  dcache__s2_valid_hit_pre_data_ecc_and_waw  ;
    assign   dcache__metaArb_io_in_valid_2  =  dcache__s2_valid_hit_pre_data_ecc_and_waw  &  dcache__s2_hit_state_state  !=  dcache__casez_tmp  ;
    wire  dcache___GEN_14  =  dcache__io_cpu_s2_nack_0  |  dcache__metaArb_io_in_valid_2  ;
    assign   dcache__metaArb_io_in_bits_idx_4  =  dcache__probe_bits_address  [11:6];
    assign   dcache__metaArb_io_in_bits_idx_3  =  dcache__s2_req_addr  [11:6];
    assign   dcache__metaArb_io_in_bits_data_2  ={  dcache__casez_tmp  ,  dcache__s2_req_addr  [31:12]};
    reg[6:0]  dcache__lrscCount  ;
    reg[27:0]  dcache__lrscAddr  ;
    wire  dcache__s2_sc_fail  =  dcache__s2_sc  &~((|(  dcache__lrscCount  [6:2]))&  dcache__lrscAddr  ==  dcache__s2_req_addr  [33:6]);
    reg[4:0]  dcache__pstore1_cmd  ;
    reg[33:0]  dcache__pstore1_addr  ;
    reg[63:0]  dcache__pstore1_data  ;
    reg[7:0]  dcache__pstore1_mask  ;
    reg  dcache__pstore1_rmw  ;
    wire  dcache___pstore1_held_T  =  dcache__s2_valid_hit_pre_data_ecc_and_waw  &  dcache__s2_write  ;
    reg  dcache__pstore2_valid  ;
    wire  dcache___pstore_drain_opportunistic_res_T_2  =  dcache___pstore_drain_opportunistic_T_25  |  dcache___pstore_drain_opportunistic_res_T_1  ;
    reg  dcache__pstore_drain_on_miss_REG  ;
    reg  dcache__pstore1_held  ;
    wire  dcache__pstore1_valid_likely  =  dcache__s2_valid  &  dcache__s2_write  |  dcache__pstore1_held  ;
    wire  dcache__pstore1_valid  =  dcache___pstore1_held_T  &~  dcache__s2_sc_fail  |  dcache__pstore1_held  ;
    wire  dcache__pstore_drain_structural  =  dcache__pstore1_valid_likely  &  dcache__pstore2_valid  &(  dcache__s1_valid  &  dcache__s1_write  |  dcache__pstore1_rmw  );
    wire  dcache___dataArb_io_in_0_valid_T_4  =  dcache__s2_valid_hit_pre_data_ecc_and_waw  &  dcache__s2_write  ;
    wire  dcache___dataArb_io_in_0_valid_T_9  =~(  dcache__io_cpu_req_valid  &~  dcache___pstore_drain_opportunistic_res_T_2  )|  dcache__releaseInFlight  |  dcache__pstore_drain_on_miss_REG  ;
    assign   dcache__pstore_drain  =  dcache__pstore_drain_structural  |((  dcache___dataArb_io_in_0_valid_T_4  |  dcache__pstore1_held  )&~  dcache__pstore1_rmw  |  dcache__pstore2_valid  )&  dcache___dataArb_io_in_0_valid_T_9  ;
    reg[33:0]  dcache__pstore2_addr  ;
    reg[7:0]  dcache__pstore2_storegen_data_r  ;
    reg[7:0]  dcache__pstore2_storegen_data_r_1  ;
    reg[7:0]  dcache__pstore2_storegen_data_r_2  ;
    reg[7:0]  dcache__pstore2_storegen_data_r_3  ;
    reg[7:0]  dcache__pstore2_storegen_data_r_4  ;
    reg[7:0]  dcache__pstore2_storegen_data_r_5  ;
    reg[7:0]  dcache__pstore2_storegen_data_r_6  ;
    reg[7:0]  dcache__pstore2_storegen_data_r_7  ;
    reg[7:0]  dcache__pstore2_storegen_mask  ;
    assign   dcache__dataArb_io_in_valid_0  =  dcache__pstore_drain_structural  |((  dcache___dataArb_io_in_0_valid_T_4  |  dcache__pstore1_held  )&~  dcache__pstore1_rmw  |  dcache__pstore2_valid  )&  dcache___dataArb_io_in_0_valid_T_9  ;
    assign   dcache___dataArb_io_in_0_bits_wordMask_wordMask_T  =  dcache__pstore2_valid   ?   dcache__pstore2_addr  [11:0]:  dcache__pstore1_addr  [11:0];
    assign   dcache__dataArb_io_in_bits_wdata_0  =  dcache__pstore2_valid   ? {  dcache__pstore2_storegen_data_r_7  ,  dcache__pstore2_storegen_data_r_6  ,  dcache__pstore2_storegen_data_r_5  ,  dcache__pstore2_storegen_data_r_4  ,  dcache__pstore2_storegen_data_r_3  ,  dcache__pstore2_storegen_data_r_2  ,  dcache__pstore2_storegen_data_r_1  ,  dcache__pstore2_storegen_data_r  }:  dcache__pstore1_data  ;
    assign   dcache__dataArb_io_in_bits_eccMask_0  =  dcache__pstore2_valid   ?   dcache__pstore2_storegen_mask  :  dcache__pstore1_mask  ;
    wire  dcache___GEN_15  =  dcache__s1_valid  &  dcache__s1_read  &(  dcache__pstore1_valid_likely  &  dcache__pstore1_addr  [11:3]==  dcache__s1_vaddr  [11:3]&(  dcache__s1_write   ? (|(  dcache__pstore1_mask  &  dcache__s1_mask_xwr  )):(|(  dcache__pstore1_mask  &  dcache__s1_mask_xwr  )))|  dcache__pstore2_valid  &  dcache__pstore2_addr  [11:3]==  dcache__s1_vaddr  [11:3]&(  dcache__s1_write   ? (|(  dcache__pstore2_storegen_mask  &  dcache__s1_mask_xwr  )):(|(  dcache__pstore2_storegen_mask  &  dcache__s1_mask_xwr  ))));
    wire  dcache__get_a_mask_size  =  dcache__s2_req_size  ==2'h2;
    wire  dcache__get_a_mask_acc  =(&  dcache__s2_req_size  )|  dcache__get_a_mask_size  &~(  dcache__s2_req_addr  [2]);
    wire  dcache__get_a_mask_acc_1  =(&  dcache__s2_req_size  )|  dcache__get_a_mask_size  &  dcache__s2_req_addr  [2];
    wire  dcache__get_a_mask_size_1  =  dcache__s2_req_size  ==2'h1;
    wire  dcache__get_a_mask_eq_2  =~(  dcache__s2_req_addr  [2])&~(  dcache__s2_req_addr  [1]);
    wire  dcache__get_a_mask_acc_2  =  dcache__get_a_mask_acc  |  dcache__get_a_mask_size_1  &  dcache__get_a_mask_eq_2  ;
    wire  dcache__get_a_mask_eq_3  =~(  dcache__s2_req_addr  [2])&  dcache__s2_req_addr  [1];
    wire  dcache__get_a_mask_acc_3  =  dcache__get_a_mask_acc  |  dcache__get_a_mask_size_1  &  dcache__get_a_mask_eq_3  ;
    wire  dcache__get_a_mask_eq_4  =  dcache__s2_req_addr  [2]&~(  dcache__s2_req_addr  [1]);
    wire  dcache__get_a_mask_acc_4  =  dcache__get_a_mask_acc_1  |  dcache__get_a_mask_size_1  &  dcache__get_a_mask_eq_4  ;
    wire  dcache__get_a_mask_eq_5  =  dcache__s2_req_addr  [2]&  dcache__s2_req_addr  [1];
    wire  dcache__get_a_mask_acc_5  =  dcache__get_a_mask_acc_1  |  dcache__get_a_mask_size_1  &  dcache__get_a_mask_eq_5  ;
    wire  dcache__put_a_mask_size  =  dcache__s2_req_size  ==2'h2;
    wire  dcache__put_a_mask_acc  =(&  dcache__s2_req_size  )|  dcache__put_a_mask_size  &~(  dcache__s2_req_addr  [2]);
    wire  dcache__put_a_mask_acc_1  =(&  dcache__s2_req_size  )|  dcache__put_a_mask_size  &  dcache__s2_req_addr  [2];
    wire  dcache__put_a_mask_size_1  =  dcache__s2_req_size  ==2'h1;
    wire  dcache__put_a_mask_eq_2  =~(  dcache__s2_req_addr  [2])&~(  dcache__s2_req_addr  [1]);
    wire  dcache__put_a_mask_acc_2  =  dcache__put_a_mask_acc  |  dcache__put_a_mask_size_1  &  dcache__put_a_mask_eq_2  ;
    wire  dcache__put_a_mask_eq_3  =~(  dcache__s2_req_addr  [2])&  dcache__s2_req_addr  [1];
    wire  dcache__put_a_mask_acc_3  =  dcache__put_a_mask_acc  |  dcache__put_a_mask_size_1  &  dcache__put_a_mask_eq_3  ;
    wire  dcache__put_a_mask_eq_4  =  dcache__s2_req_addr  [2]&~(  dcache__s2_req_addr  [1]);
    wire  dcache__put_a_mask_acc_4  =  dcache__put_a_mask_acc_1  |  dcache__put_a_mask_size_1  &  dcache__put_a_mask_eq_4  ;
    wire  dcache__put_a_mask_eq_5  =  dcache__s2_req_addr  [2]&  dcache__s2_req_addr  [1];
    wire  dcache__put_a_mask_acc_5  =  dcache__put_a_mask_acc_1  |  dcache__put_a_mask_size_1  &  dcache__put_a_mask_eq_5  ;
    wire  dcache__atomics_a_mask_size  =  dcache__s2_req_size  ==2'h2;
    wire  dcache__atomics_a_mask_acc  =(&  dcache__s2_req_size  )|  dcache__atomics_a_mask_size  &~(  dcache__s2_req_addr  [2]);
    wire  dcache__atomics_a_mask_acc_1  =(&  dcache__s2_req_size  )|  dcache__atomics_a_mask_size  &  dcache__s2_req_addr  [2];
    wire  dcache__atomics_a_mask_size_1  =  dcache__s2_req_size  ==2'h1;
    wire  dcache__atomics_a_mask_eq_2  =~(  dcache__s2_req_addr  [2])&~(  dcache__s2_req_addr  [1]);
    wire  dcache__atomics_a_mask_acc_2  =  dcache__atomics_a_mask_acc  |  dcache__atomics_a_mask_size_1  &  dcache__atomics_a_mask_eq_2  ;
    wire  dcache__atomics_a_mask_eq_3  =~(  dcache__s2_req_addr  [2])&  dcache__s2_req_addr  [1];
    wire  dcache__atomics_a_mask_acc_3  =  dcache__atomics_a_mask_acc  |  dcache__atomics_a_mask_size_1  &  dcache__atomics_a_mask_eq_3  ;
    wire  dcache__atomics_a_mask_eq_4  =  dcache__s2_req_addr  [2]&~(  dcache__s2_req_addr  [1]);
    wire  dcache__atomics_a_mask_acc_4  =  dcache__atomics_a_mask_acc_1  |  dcache__atomics_a_mask_size_1  &  dcache__atomics_a_mask_eq_4  ;
    wire  dcache__atomics_a_mask_eq_5  =  dcache__s2_req_addr  [2]&  dcache__s2_req_addr  [1];
    wire  dcache__atomics_a_mask_acc_5  =  dcache__atomics_a_mask_acc_1  |  dcache__atomics_a_mask_size_1  &  dcache__atomics_a_mask_eq_5  ;
    wire  dcache__atomics_a_mask_size_3  =  dcache__s2_req_size  ==2'h2;
    wire  dcache__atomics_a_mask_acc_14  =(&  dcache__s2_req_size  )|  dcache__atomics_a_mask_size_3  &~(  dcache__s2_req_addr  [2]);
    wire  dcache__atomics_a_mask_acc_15  =(&  dcache__s2_req_size  )|  dcache__atomics_a_mask_size_3  &  dcache__s2_req_addr  [2];
    wire  dcache__atomics_a_mask_size_4  =  dcache__s2_req_size  ==2'h1;
    wire  dcache__atomics_a_mask_eq_16  =~(  dcache__s2_req_addr  [2])&~(  dcache__s2_req_addr  [1]);
    wire  dcache__atomics_a_mask_acc_16  =  dcache__atomics_a_mask_acc_14  |  dcache__atomics_a_mask_size_4  &  dcache__atomics_a_mask_eq_16  ;
    wire  dcache__atomics_a_mask_eq_17  =~(  dcache__s2_req_addr  [2])&  dcache__s2_req_addr  [1];
    wire  dcache__atomics_a_mask_acc_17  =  dcache__atomics_a_mask_acc_14  |  dcache__atomics_a_mask_size_4  &  dcache__atomics_a_mask_eq_17  ;
    wire  dcache__atomics_a_mask_eq_18  =  dcache__s2_req_addr  [2]&~(  dcache__s2_req_addr  [1]);
    wire  dcache__atomics_a_mask_acc_18  =  dcache__atomics_a_mask_acc_15  |  dcache__atomics_a_mask_size_4  &  dcache__atomics_a_mask_eq_18  ;
    wire  dcache__atomics_a_mask_eq_19  =  dcache__s2_req_addr  [2]&  dcache__s2_req_addr  [1];
    wire  dcache__atomics_a_mask_acc_19  =  dcache__atomics_a_mask_acc_15  |  dcache__atomics_a_mask_size_4  &  dcache__atomics_a_mask_eq_19  ;
    wire  dcache__atomics_a_mask_size_6  =  dcache__s2_req_size  ==2'h2;
    wire  dcache__atomics_a_mask_acc_28  =(&  dcache__s2_req_size  )|  dcache__atomics_a_mask_size_6  &~(  dcache__s2_req_addr  [2]);
    wire  dcache__atomics_a_mask_acc_29  =(&  dcache__s2_req_size  )|  dcache__atomics_a_mask_size_6  &  dcache__s2_req_addr  [2];
    wire  dcache__atomics_a_mask_size_7  =  dcache__s2_req_size  ==2'h1;
    wire  dcache__atomics_a_mask_eq_30  =~(  dcache__s2_req_addr  [2])&~(  dcache__s2_req_addr  [1]);
    wire  dcache__atomics_a_mask_acc_30  =  dcache__atomics_a_mask_acc_28  |  dcache__atomics_a_mask_size_7  &  dcache__atomics_a_mask_eq_30  ;
    wire  dcache__atomics_a_mask_eq_31  =~(  dcache__s2_req_addr  [2])&  dcache__s2_req_addr  [1];
    wire  dcache__atomics_a_mask_acc_31  =  dcache__atomics_a_mask_acc_28  |  dcache__atomics_a_mask_size_7  &  dcache__atomics_a_mask_eq_31  ;
    wire  dcache__atomics_a_mask_eq_32  =  dcache__s2_req_addr  [2]&~(  dcache__s2_req_addr  [1]);
    wire  dcache__atomics_a_mask_acc_32  =  dcache__atomics_a_mask_acc_29  |  dcache__atomics_a_mask_size_7  &  dcache__atomics_a_mask_eq_32  ;
    wire  dcache__atomics_a_mask_eq_33  =  dcache__s2_req_addr  [2]&  dcache__s2_req_addr  [1];
    wire  dcache__atomics_a_mask_acc_33  =  dcache__atomics_a_mask_acc_29  |  dcache__atomics_a_mask_size_7  &  dcache__atomics_a_mask_eq_33  ;
    wire  dcache__atomics_a_mask_size_9  =  dcache__s2_req_size  ==2'h2;
    wire  dcache__atomics_a_mask_acc_42  =(&  dcache__s2_req_size  )|  dcache__atomics_a_mask_size_9  &~(  dcache__s2_req_addr  [2]);
    wire  dcache__atomics_a_mask_acc_43  =(&  dcache__s2_req_size  )|  dcache__atomics_a_mask_size_9  &  dcache__s2_req_addr  [2];
    wire  dcache__atomics_a_mask_size_10  =  dcache__s2_req_size  ==2'h1;
    wire  dcache__atomics_a_mask_eq_44  =~(  dcache__s2_req_addr  [2])&~(  dcache__s2_req_addr  [1]);
    wire  dcache__atomics_a_mask_acc_44  =  dcache__atomics_a_mask_acc_42  |  dcache__atomics_a_mask_size_10  &  dcache__atomics_a_mask_eq_44  ;
    wire  dcache__atomics_a_mask_eq_45  =~(  dcache__s2_req_addr  [2])&  dcache__s2_req_addr  [1];
    wire  dcache__atomics_a_mask_acc_45  =  dcache__atomics_a_mask_acc_42  |  dcache__atomics_a_mask_size_10  &  dcache__atomics_a_mask_eq_45  ;
    wire  dcache__atomics_a_mask_eq_46  =  dcache__s2_req_addr  [2]&~(  dcache__s2_req_addr  [1]);
    wire  dcache__atomics_a_mask_acc_46  =  dcache__atomics_a_mask_acc_43  |  dcache__atomics_a_mask_size_10  &  dcache__atomics_a_mask_eq_46  ;
    wire  dcache__atomics_a_mask_eq_47  =  dcache__s2_req_addr  [2]&  dcache__s2_req_addr  [1];
    wire  dcache__atomics_a_mask_acc_47  =  dcache__atomics_a_mask_acc_43  |  dcache__atomics_a_mask_size_10  &  dcache__atomics_a_mask_eq_47  ;
    wire  dcache__atomics_a_mask_size_12  =  dcache__s2_req_size  ==2'h2;
    wire  dcache__atomics_a_mask_acc_56  =(&  dcache__s2_req_size  )|  dcache__atomics_a_mask_size_12  &~(  dcache__s2_req_addr  [2]);
    wire  dcache__atomics_a_mask_acc_57  =(&  dcache__s2_req_size  )|  dcache__atomics_a_mask_size_12  &  dcache__s2_req_addr  [2];
    wire  dcache__atomics_a_mask_size_13  =  dcache__s2_req_size  ==2'h1;
    wire  dcache__atomics_a_mask_eq_58  =~(  dcache__s2_req_addr  [2])&~(  dcache__s2_req_addr  [1]);
    wire  dcache__atomics_a_mask_acc_58  =  dcache__atomics_a_mask_acc_56  |  dcache__atomics_a_mask_size_13  &  dcache__atomics_a_mask_eq_58  ;
    wire  dcache__atomics_a_mask_eq_59  =~(  dcache__s2_req_addr  [2])&  dcache__s2_req_addr  [1];
    wire  dcache__atomics_a_mask_acc_59  =  dcache__atomics_a_mask_acc_56  |  dcache__atomics_a_mask_size_13  &  dcache__atomics_a_mask_eq_59  ;
    wire  dcache__atomics_a_mask_eq_60  =  dcache__s2_req_addr  [2]&~(  dcache__s2_req_addr  [1]);
    wire  dcache__atomics_a_mask_acc_60  =  dcache__atomics_a_mask_acc_57  |  dcache__atomics_a_mask_size_13  &  dcache__atomics_a_mask_eq_60  ;
    wire  dcache__atomics_a_mask_eq_61  =  dcache__s2_req_addr  [2]&  dcache__s2_req_addr  [1];
    wire  dcache__atomics_a_mask_acc_61  =  dcache__atomics_a_mask_acc_57  |  dcache__atomics_a_mask_size_13  &  dcache__atomics_a_mask_eq_61  ;
    wire  dcache__atomics_a_mask_size_15  =  dcache__s2_req_size  ==2'h2;
    wire  dcache__atomics_a_mask_acc_70  =(&  dcache__s2_req_size  )|  dcache__atomics_a_mask_size_15  &~(  dcache__s2_req_addr  [2]);
    wire  dcache__atomics_a_mask_acc_71  =(&  dcache__s2_req_size  )|  dcache__atomics_a_mask_size_15  &  dcache__s2_req_addr  [2];
    wire  dcache__atomics_a_mask_size_16  =  dcache__s2_req_size  ==2'h1;
    wire  dcache__atomics_a_mask_eq_72  =~(  dcache__s2_req_addr  [2])&~(  dcache__s2_req_addr  [1]);
    wire  dcache__atomics_a_mask_acc_72  =  dcache__atomics_a_mask_acc_70  |  dcache__atomics_a_mask_size_16  &  dcache__atomics_a_mask_eq_72  ;
    wire  dcache__atomics_a_mask_eq_73  =~(  dcache__s2_req_addr  [2])&  dcache__s2_req_addr  [1];
    wire  dcache__atomics_a_mask_acc_73  =  dcache__atomics_a_mask_acc_70  |  dcache__atomics_a_mask_size_16  &  dcache__atomics_a_mask_eq_73  ;
    wire  dcache__atomics_a_mask_eq_74  =  dcache__s2_req_addr  [2]&~(  dcache__s2_req_addr  [1]);
    wire  dcache__atomics_a_mask_acc_74  =  dcache__atomics_a_mask_acc_71  |  dcache__atomics_a_mask_size_16  &  dcache__atomics_a_mask_eq_74  ;
    wire  dcache__atomics_a_mask_eq_75  =  dcache__s2_req_addr  [2]&  dcache__s2_req_addr  [1];
    wire  dcache__atomics_a_mask_acc_75  =  dcache__atomics_a_mask_acc_71  |  dcache__atomics_a_mask_size_16  &  dcache__atomics_a_mask_eq_75  ;
    wire  dcache__atomics_a_mask_size_18  =  dcache__s2_req_size  ==2'h2;
    wire  dcache__atomics_a_mask_acc_84  =(&  dcache__s2_req_size  )|  dcache__atomics_a_mask_size_18  &~(  dcache__s2_req_addr  [2]);
    wire  dcache__atomics_a_mask_acc_85  =(&  dcache__s2_req_size  )|  dcache__atomics_a_mask_size_18  &  dcache__s2_req_addr  [2];
    wire  dcache__atomics_a_mask_size_19  =  dcache__s2_req_size  ==2'h1;
    wire  dcache__atomics_a_mask_eq_86  =~(  dcache__s2_req_addr  [2])&~(  dcache__s2_req_addr  [1]);
    wire  dcache__atomics_a_mask_acc_86  =  dcache__atomics_a_mask_acc_84  |  dcache__atomics_a_mask_size_19  &  dcache__atomics_a_mask_eq_86  ;
    wire  dcache__atomics_a_mask_eq_87  =~(  dcache__s2_req_addr  [2])&  dcache__s2_req_addr  [1];
    wire  dcache__atomics_a_mask_acc_87  =  dcache__atomics_a_mask_acc_84  |  dcache__atomics_a_mask_size_19  &  dcache__atomics_a_mask_eq_87  ;
    wire  dcache__atomics_a_mask_eq_88  =  dcache__s2_req_addr  [2]&~(  dcache__s2_req_addr  [1]);
    wire  dcache__atomics_a_mask_acc_88  =  dcache__atomics_a_mask_acc_85  |  dcache__atomics_a_mask_size_19  &  dcache__atomics_a_mask_eq_88  ;
    wire  dcache__atomics_a_mask_eq_89  =  dcache__s2_req_addr  [2]&  dcache__s2_req_addr  [1];
    wire  dcache__atomics_a_mask_acc_89  =  dcache__atomics_a_mask_acc_85  |  dcache__atomics_a_mask_size_19  &  dcache__atomics_a_mask_eq_89  ;
    wire  dcache__atomics_a_mask_size_21  =  dcache__s2_req_size  ==2'h2;
    wire  dcache__atomics_a_mask_acc_98  =(&  dcache__s2_req_size  )|  dcache__atomics_a_mask_size_21  &~(  dcache__s2_req_addr  [2]);
    wire  dcache__atomics_a_mask_acc_99  =(&  dcache__s2_req_size  )|  dcache__atomics_a_mask_size_21  &  dcache__s2_req_addr  [2];
    wire  dcache__atomics_a_mask_size_22  =  dcache__s2_req_size  ==2'h1;
    wire  dcache__atomics_a_mask_eq_100  =~(  dcache__s2_req_addr  [2])&~(  dcache__s2_req_addr  [1]);
    wire  dcache__atomics_a_mask_acc_100  =  dcache__atomics_a_mask_acc_98  |  dcache__atomics_a_mask_size_22  &  dcache__atomics_a_mask_eq_100  ;
    wire  dcache__atomics_a_mask_eq_101  =~(  dcache__s2_req_addr  [2])&  dcache__s2_req_addr  [1];
    wire  dcache__atomics_a_mask_acc_101  =  dcache__atomics_a_mask_acc_98  |  dcache__atomics_a_mask_size_22  &  dcache__atomics_a_mask_eq_101  ;
    wire  dcache__atomics_a_mask_eq_102  =  dcache__s2_req_addr  [2]&~(  dcache__s2_req_addr  [1]);
    wire  dcache__atomics_a_mask_acc_102  =  dcache__atomics_a_mask_acc_99  |  dcache__atomics_a_mask_size_22  &  dcache__atomics_a_mask_eq_102  ;
    wire  dcache__atomics_a_mask_eq_103  =  dcache__s2_req_addr  [2]&  dcache__s2_req_addr  [1];
    wire  dcache__atomics_a_mask_acc_103  =  dcache__atomics_a_mask_acc_99  |  dcache__atomics_a_mask_size_22  &  dcache__atomics_a_mask_eq_103  ;
    wire  dcache__atomics_a_mask_size_24  =  dcache__s2_req_size  ==2'h2;
    wire  dcache__atomics_a_mask_acc_112  =(&  dcache__s2_req_size  )|  dcache__atomics_a_mask_size_24  &~(  dcache__s2_req_addr  [2]);
    wire  dcache__atomics_a_mask_acc_113  =(&  dcache__s2_req_size  )|  dcache__atomics_a_mask_size_24  &  dcache__s2_req_addr  [2];
    wire  dcache__atomics_a_mask_size_25  =  dcache__s2_req_size  ==2'h1;
    wire  dcache__atomics_a_mask_eq_114  =~(  dcache__s2_req_addr  [2])&~(  dcache__s2_req_addr  [1]);
    wire  dcache__atomics_a_mask_acc_114  =  dcache__atomics_a_mask_acc_112  |  dcache__atomics_a_mask_size_25  &  dcache__atomics_a_mask_eq_114  ;
    wire  dcache__atomics_a_mask_eq_115  =~(  dcache__s2_req_addr  [2])&  dcache__s2_req_addr  [1];
    wire  dcache__atomics_a_mask_acc_115  =  dcache__atomics_a_mask_acc_112  |  dcache__atomics_a_mask_size_25  &  dcache__atomics_a_mask_eq_115  ;
    wire  dcache__atomics_a_mask_eq_116  =  dcache__s2_req_addr  [2]&~(  dcache__s2_req_addr  [1]);
    wire  dcache__atomics_a_mask_acc_116  =  dcache__atomics_a_mask_acc_113  |  dcache__atomics_a_mask_size_25  &  dcache__atomics_a_mask_eq_116  ;
    wire  dcache__atomics_a_mask_eq_117  =  dcache__s2_req_addr  [2]&  dcache__s2_req_addr  [1];
    wire  dcache__atomics_a_mask_acc_117  =  dcache__atomics_a_mask_acc_113  |  dcache__atomics_a_mask_size_25  &  dcache__atomics_a_mask_eq_117  ;
    wire[7:0]  dcache__atomics_mask  =  dcache___metaArb_io_in_3_bits_data_c_cat_T_39   ? {  dcache__atomics_a_mask_acc_117  |  dcache__atomics_a_mask_eq_117  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_117  |  dcache__atomics_a_mask_eq_117  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_116  |  dcache__atomics_a_mask_eq_116  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_116  |  dcache__atomics_a_mask_eq_116  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_115  |  dcache__atomics_a_mask_eq_115  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_115  |  dcache__atomics_a_mask_eq_115  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_114  |  dcache__atomics_a_mask_eq_114  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_114  |  dcache__atomics_a_mask_eq_114  &~(  dcache__s2_req_addr  [0])}:  dcache___metaArb_io_in_3_bits_data_c_cat_T_38   ? {  dcache__atomics_a_mask_acc_103  |  dcache__atomics_a_mask_eq_103  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_103  |  dcache__atomics_a_mask_eq_103  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_102  |  dcache__atomics_a_mask_eq_102  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_102  |  dcache__atomics_a_mask_eq_102  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_101  |  dcache__atomics_a_mask_eq_101  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_101  |  dcache__atomics_a_mask_eq_101  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_100  |  dcache__atomics_a_mask_eq_100  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_100  |  dcache__atomics_a_mask_eq_100  &~(  dcache__s2_req_addr  [0])}:  dcache___metaArb_io_in_3_bits_data_c_cat_T_37   ? {  dcache__atomics_a_mask_acc_89  |  dcache__atomics_a_mask_eq_89  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_89  |  dcache__atomics_a_mask_eq_89  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_88  |  dcache__atomics_a_mask_eq_88  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_88  |  dcache__atomics_a_mask_eq_88  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_87  |  dcache__atomics_a_mask_eq_87  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_87  |  dcache__atomics_a_mask_eq_87  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_86  |  dcache__atomics_a_mask_eq_86  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_86  |  dcache__atomics_a_mask_eq_86  &~(  dcache__s2_req_addr  [0])}:  dcache___metaArb_io_in_3_bits_data_c_cat_T_36   ? {  dcache__atomics_a_mask_acc_75  |  dcache__atomics_a_mask_eq_75  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_75  |  dcache__atomics_a_mask_eq_75  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_74  |  dcache__atomics_a_mask_eq_74  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_74  |  dcache__atomics_a_mask_eq_74  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_73  |  dcache__atomics_a_mask_eq_73  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_73  |  dcache__atomics_a_mask_eq_73  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_72  |  dcache__atomics_a_mask_eq_72  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_72  |  dcache__atomics_a_mask_eq_72  &~(  dcache__s2_req_addr  [0])}:  dcache___metaArb_io_in_3_bits_data_c_cat_T_35   ? {  dcache__atomics_a_mask_acc_61  |  dcache__atomics_a_mask_eq_61  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_61  |  dcache__atomics_a_mask_eq_61  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_60  |  dcache__atomics_a_mask_eq_60  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_60  |  dcache__atomics_a_mask_eq_60  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_59  |  dcache__atomics_a_mask_eq_59  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_59  |  dcache__atomics_a_mask_eq_59  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_58  |  dcache__atomics_a_mask_eq_58  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_58  |  dcache__atomics_a_mask_eq_58  &~(  dcache__s2_req_addr  [0])}:  dcache___metaArb_io_in_3_bits_data_c_cat_T_31   ? {  dcache__atomics_a_mask_acc_47  |  dcache__atomics_a_mask_eq_47  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_47  |  dcache__atomics_a_mask_eq_47  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_46  |  dcache__atomics_a_mask_eq_46  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_46  |  dcache__atomics_a_mask_eq_46  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_45  |  dcache__atomics_a_mask_eq_45  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_45  |  dcache__atomics_a_mask_eq_45  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_44  |  dcache__atomics_a_mask_eq_44  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_44  |  dcache__atomics_a_mask_eq_44  &~(  dcache__s2_req_addr  [0])}:  dcache___metaArb_io_in_3_bits_data_c_cat_T_30   ? {  dcache__atomics_a_mask_acc_33  |  dcache__atomics_a_mask_eq_33  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_33  |  dcache__atomics_a_mask_eq_33  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_32  |  dcache__atomics_a_mask_eq_32  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_32  |  dcache__atomics_a_mask_eq_32  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_31  |  dcache__atomics_a_mask_eq_31  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_31  |  dcache__atomics_a_mask_eq_31  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_30  |  dcache__atomics_a_mask_eq_30  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_30  |  dcache__atomics_a_mask_eq_30  &~(  dcache__s2_req_addr  [0])}:  dcache___metaArb_io_in_3_bits_data_c_cat_T_29   ? {  dcache__atomics_a_mask_acc_19  |  dcache__atomics_a_mask_eq_19  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_19  |  dcache__atomics_a_mask_eq_19  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_18  |  dcache__atomics_a_mask_eq_18  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_18  |  dcache__atomics_a_mask_eq_18  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_17  |  dcache__atomics_a_mask_eq_17  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_17  |  dcache__atomics_a_mask_eq_17  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_16  |  dcache__atomics_a_mask_eq_16  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_16  |  dcache__atomics_a_mask_eq_16  &~(  dcache__s2_req_addr  [0])}:  dcache___metaArb_io_in_3_bits_data_c_cat_T_28   ? {  dcache__atomics_a_mask_acc_5  |  dcache__atomics_a_mask_eq_5  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_5  |  dcache__atomics_a_mask_eq_5  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_4  |  dcache__atomics_a_mask_eq_4  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_4  |  dcache__atomics_a_mask_eq_4  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_3  |  dcache__atomics_a_mask_eq_3  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_3  |  dcache__atomics_a_mask_eq_3  &~(  dcache__s2_req_addr  [0]),  dcache__atomics_a_mask_acc_2  |  dcache__atomics_a_mask_eq_2  &  dcache__s2_req_addr  [0],  dcache__atomics_a_mask_acc_2  |  dcache__atomics_a_mask_eq_2  &~(  dcache__s2_req_addr  [0])}:8'h0;
    wire  dcache__tl_out_a_valid  =  dcache__s2_valid_uncached_pending  |  dcache__s2_valid_cached_miss  &~(  dcache__release_ack_wait  &(  dcache__s2_req_addr  [20:6]^  dcache__release_ack_addr  [20:6])==15'h0)&~  dcache__s2_victim_dirty  ;
    wire  dcache___GEN_16  =~  dcache__s2_write  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_24  |~  dcache__s2_read  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_39  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_38  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_37  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_36  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_35  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_31  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_30  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_29  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_28  ;
    wire  dcache___io_errors_bus_valid_T  =  dcache__nodeOut_d_ready  &  dcache__auto_out_d_valid  ;
    wire[26:0]  dcache___beats1_decode_T_1  =27'hFFF<<  dcache__auto_out_d_bits_size  ;
    wire[8:0]  dcache__beats1  =  dcache__auto_out_d_bits_opcode  [0] ? ~(  dcache___beats1_decode_T_1  [11:3]):9'h0;
    reg[8:0]  dcache__counter  ;
    wire[8:0]  dcache___counter1_T  =  dcache__counter  -9'h1;
    wire  dcache__d_last  =  dcache__counter  ==9'h1|  dcache__beats1  ==9'h0;
    wire[8:0]  dcache__count  =  dcache__beats1  &~  dcache___counter1_T  ;
    wire  dcache__grantIsUncachedData  =  dcache__auto_out_d_bits_opcode  ==3'h1;
    wire  dcache__grantIsUncached  =  dcache__grantIsUncachedData  |  dcache__auto_out_d_bits_opcode  ==3'h0|  dcache__auto_out_d_bits_opcode  ==3'h2;
    wire  dcache__grantIsRefill  =  dcache__auto_out_d_bits_opcode  ==3'h5;
    wire  dcache__grantIsCached  =  dcache__auto_out_d_bits_opcode  ==3'h4|  dcache__grantIsRefill  ;
    wire  dcache__grantIsVoluntary  =  dcache__auto_out_d_bits_opcode  ==3'h6;
    reg  dcache__grantInProgress  ;
    reg[2:0]  dcache__blockProbeAfterGrantCount  ;
    wire  dcache___metaArb_io_in_4_valid_T  =  dcache__release_state  ==4'h6;
    wire  dcache___nodeOut_c_valid_T_1  =  dcache__release_state  ==4'h9;
    wire  dcache___canAcceptCachedGrant_T_4  =  dcache___canAcceptCachedGrant_T  |  dcache___metaArb_io_in_4_valid_T  |  dcache___nodeOut_c_valid_T_1  ;
    wire  dcache___GEN_17  =  dcache___io_errors_bus_valid_T  &  dcache__grantIsCached  ;
    wire  dcache___GEN_18  =  dcache__auto_out_d_bits_source  &  dcache__d_last  ;
    wire  dcache___GEN_19  =~  dcache___io_errors_bus_valid_T  |  dcache__grantIsCached  |~(  dcache__grantIsUncached  &  dcache__grantIsUncachedData  );
    wire  dcache___GEN_20  =  dcache__grantIsRefill  &  dcache__dataArb_io_in_valid_0  ;
    wire  dcache__nodeOut_e_valid  =~  dcache___GEN_20  &  dcache__auto_out_d_valid  &~(|  dcache__counter  )&  dcache__grantIsCached  &~  dcache___canAcceptCachedGrant_T_4  ;
    assign   dcache__dataArb_io_in_bits_addr_1  ={  dcache__s2_req_addr  [11:6]|  dcache__count  [8:3],  dcache__count  [2:0],3'h0};
    assign   dcache__metaArb_io_in_valid_3  =  dcache__grantIsCached  &  dcache__d_last  &  dcache___io_errors_bus_valid_T  &~  dcache__auto_out_d_bits_denied  ;
    wire[3:0]  dcache___metaArb_io_in_3_bits_data_T_1  ={  dcache___metaArb_io_in_3_bits_data_c_cat_T_23  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_24  |  dcache__s2_sc  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_28  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_29  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_30  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_31  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_35  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_36  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_37  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_38  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_39  ,  dcache___metaArb_io_in_3_bits_data_c_cat_T_23  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_24  |  dcache__s2_sc  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_28  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_29  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_30  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_31  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_35  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_36  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_37  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_38  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_39  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_46  |  dcache__s2_lr  ,  dcache__auto_out_d_bits_param  };
    assign   dcache__metaArb_io_in_bits_data_3  ={  dcache___metaArb_io_in_3_bits_data_T_1  ==4'hC ? 2'h3:  dcache___metaArb_io_in_3_bits_data_T_1  ==4'h4|  dcache___metaArb_io_in_3_bits_data_T_1  ==4'h0 ? 2'h2:{1'h0,  dcache___metaArb_io_in_3_bits_data_T_1  ==4'h1},  dcache__s2_req_addr  [31:12]};
    reg  dcache__blockUncachedGrant  ;
    wire  dcache___GEN_21  =  dcache__grantIsUncachedData  &(  dcache__blockUncachedGrant  |  dcache__s1_valid  );
    assign   dcache__nodeOut_d_ready  =~(  dcache___GEN_21  |  dcache___GEN_20  )&(~  dcache__grantIsCached  |((|  dcache__counter  )|  dcache__auto_out_e_ready  )&~  dcache___canAcceptCachedGrant_T_4  );
    wire  dcache__io_cpu_req_ready_0  =  dcache___GEN_21   ? ~(  dcache__auto_out_d_valid  |  dcache__metaArb__grant_T_5  |  dcache___GEN_0  )&  dcache___io_cpu_req_ready_T_4  :~(  dcache__metaArb__grant_T_5  |  dcache___GEN_0  )&  dcache___io_cpu_req_ready_T_4  ;
    wire  dcache___GEN_22  =  dcache___GEN_21  &  dcache__auto_out_d_valid  ;
    assign   dcache__dataArb_io_in_valid_1  =  dcache___GEN_22  |  dcache__auto_out_d_valid  &  dcache__grantIsRefill  &~  dcache___canAcceptCachedGrant_T_4  ;
    assign   dcache__dataArb_io_in_bits_write_1  =~  dcache___GEN_21  |~  dcache__auto_out_d_valid  ;
    wire  dcache__block_probe_for_core_progress  =(|  dcache__blockProbeAfterGrantCount  )|(|(  dcache__lrscCount  [6:2]));
    wire  dcache__nodeOut_b_ready  =~  dcache__metaArb__grant_T_3  &~(  dcache__block_probe_for_core_progress  |  dcache__releaseInFlight  |  dcache__release_ack_wait  &(  dcache__auto_out_b_bits_address  [20:6]^  dcache__release_ack_addr  [20:6])==15'h0|  dcache__grantInProgress  |  dcache__s1_valid  |  dcache__s2_valid  );
    wire  dcache___io_cpu_perf_release_T  =  dcache__auto_out_c_ready  &  dcache__nodeOut_c_valid  ;
    wire[26:0]  dcache___GEN_23  ={23'h0,  dcache__nodeOut_c_bits_size  };
    wire[26:0]  dcache___beats1_decode_T_5  =27'hFFF<<  dcache___GEN_23  ;
    wire[8:0]  dcache__beats1_1  =  dcache__nodeOut_c_bits_opcode  [0] ? ~(  dcache___beats1_decode_T_5  [11:3]):9'h0;
    reg[8:0]  dcache__counter_1  ;
    wire[8:0]  dcache___counter1_T_1  =  dcache__counter_1  -9'h1;
    wire  dcache__c_first  =  dcache__counter_1  ==9'h0;
    wire  dcache__releaseDone  =(  dcache__counter_1  ==9'h1|  dcache__beats1_1  ==9'h0)&  dcache___io_cpu_perf_release_T  ;
    reg  dcache__s1_release_data_valid  ;
    reg  dcache__s2_release_data_valid  ;
    wire  dcache__releaseRejected  =  dcache__s2_release_data_valid  &~  dcache___io_cpu_perf_release_T  ;
    wire[9:0]  dcache___releaseDataBeat_T_5  ={1'h0,  dcache__beats1_1  &~  dcache___counter1_T_1  }+{8'h0,  dcache__releaseRejected   ? 2'h0:{1'h0,  dcache__s1_release_data_valid  }+{1'h0,  dcache__s2_release_data_valid  }};
    assign   dcache__s1_nack  =  dcache__s2_probe   ?   dcache__s2_prb_ack_data  |(|  dcache__s2_probe_state_state  )|~  dcache__releaseDone  |  dcache___GEN_15  |  dcache___GEN_14  :  dcache___GEN_15  |  dcache___GEN_14  ;
    wire  dcache___GEN_24  =  dcache__release_state  ==4'h4;
    assign   dcache__metaArb_io_in_valid_6  =  dcache___GEN_24  |  dcache__auto_out_b_valid  &(~  dcache__block_probe_for_core_progress  |(|  dcache__lrscCount  )&~(|(  dcache__lrscCount  [6:2])));
    assign   dcache__metaArb_io_in_bits_idx_6  =  dcache___GEN_24   ?   dcache__metaArb_io_in_bits_idx_4  :  dcache__auto_out_b_bits_address  [11:6];
    wire  dcache___GEN_25  =  dcache__release_state  ==4'h5;
    wire  dcache___GEN_26  =  dcache__release_state  ==4'h3;
    assign   dcache__nodeOut_c_valid  =  dcache___GEN_26  |  dcache___GEN_25  |  dcache__s2_probe  &~  dcache__s2_prb_ack_data  |  dcache__s2_release_data_valid  &~(  dcache__c_first  &  dcache__release_ack_wait  );
    wire  dcache___GEN_27  =  dcache___canAcceptCachedGrant_T  |  dcache___metaArb_io_in_4_valid_T  |  dcache___nodeOut_c_valid_T_1  ;
    assign   dcache__nodeOut_c_bits_opcode  =  dcache___GEN_27   ? {2'h3,~  dcache___nodeOut_c_valid_T_1  }:{2'h2,  dcache___inWriteback_T_1  };
    assign   dcache__nodeOut_c_bits_size  =  dcache___GEN_27   ? 4'h6:  dcache__probe_bits_size  ;
    assign   dcache__dataArb_io_in_valid_2  =  dcache__inWriteback  &  dcache___releaseDataBeat_T_5  <10'h8;
    assign   dcache__dataArb_io_in_bits_addr_2  ={  dcache__metaArb_io_in_bits_idx_4  ,  dcache___releaseDataBeat_T_5  [2:0],3'h0};
    assign   dcache__metaArb_io_in_valid_4  =  dcache___metaArb_io_in_4_valid_T  |  dcache__release_state  ==4'h7;
    assign   dcache__metaArb_io_in_bits_data_7  ={  dcache___GEN_27   ? 2'h0:  dcache___GEN_13   ? 2'h2:  dcache___GEN_10   ? 2'h1:  dcache___GEN_9   ? 2'h0:{1'h0,  dcache___GEN_8  |  dcache___GEN_7  |  dcache___GEN_6  },  dcache__probe_bits_address  [31:12]};
    reg  dcache__io_cpu_s2_xcpt_REG  ;
    assign   dcache__io_cpu_s2_xcpt_pf_ld_0  =  dcache__io_cpu_s2_xcpt_REG  &  dcache__s2_tlb_xcpt_pf_ld  ;
    assign   dcache__io_cpu_s2_xcpt_pf_st_0  =  dcache__io_cpu_s2_xcpt_REG  &  dcache__s2_tlb_xcpt_pf_st  ;
    assign   dcache__io_cpu_s2_xcpt_ae_ld_0  =  dcache__io_cpu_s2_xcpt_REG  &  dcache__s2_tlb_xcpt_ae_ld  ;
    assign   dcache__io_cpu_s2_xcpt_ae_st_0  =  dcache__io_cpu_s2_xcpt_REG  &  dcache__s2_tlb_xcpt_ae_st  ;
    assign   dcache__io_cpu_s2_xcpt_ma_ld_0  =  dcache__io_cpu_s2_xcpt_REG  &  dcache__s2_tlb_xcpt_ma_ld  ;
    assign   dcache__io_cpu_s2_xcpt_ma_st_0  =  dcache__io_cpu_s2_xcpt_REG  &  dcache__s2_tlb_xcpt_ma_st  ;
    reg  dcache__doUncachedResp  ;
    wire  dcache__io_cpu_replay_next_0  =  dcache___io_errors_bus_valid_T  &  dcache__grantIsUncachedData  ;
    wire  dcache___GEN_28  =  dcache___io_errors_bus_valid_T  &~  dcache__grantIsCached  ;
    always @( posedge   dcache__clock  )
    begin
        if (~  dcache__reset  &~(~(  dcache___pstore_drain_opportunistic_T  |  dcache___pstore_drain_opportunistic_T_1  |  dcache___pstore_drain_opportunistic_T_2  |  dcache___pstore_drain_opportunistic_T_28  |  dcache___pstore_drain_opportunistic_T_30  |  dcache___pstore_drain_opportunistic_T_31  |  dcache___pstore_drain_opportunistic_T_32  |  dcache___pstore_drain_opportunistic_T_33  |  dcache___pstore_drain_opportunistic_T_37  |  dcache___pstore_drain_opportunistic_T_38  |  dcache___pstore_drain_opportunistic_T_39  |  dcache___pstore_drain_opportunistic_T_40  |  dcache___pstore_drain_opportunistic_T_41  |(  dcache___pstore_drain_opportunistic_T_25  |  dcache___pstore_drain_opportunistic_T_50  |  dcache___pstore_drain_opportunistic_T_28  |  dcache___pstore_drain_opportunistic_T_30  |  dcache___pstore_drain_opportunistic_T_31  |  dcache___pstore_drain_opportunistic_T_32  |  dcache___pstore_drain_opportunistic_T_33  |  dcache___pstore_drain_opportunistic_T_37  |  dcache___pstore_drain_opportunistic_T_38  |  dcache___pstore_drain_opportunistic_T_39  |  dcache___pstore_drain_opportunistic_T_40  |  dcache___pstore_drain_opportunistic_T_41  )&  dcache___pstore_drain_opportunistic_T_50  )|~  dcache___dataArb_io_in_3_valid_res_T_2  ))
        begin
            if (1)
                $display("Assertion failed\n    at DCache.scala:1162 assert(!needsRead(req) || res)\n");
            if (1)
                $display("");
        end
        if (~  dcache__reset  &~(~(  dcache__s1_valid_masked  &  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_51  )|(&(  dcache__s1_mask_xwr  |~  dcache__io_cpu_s1_data_mask  ))))
        begin
            if (1)
                $display("Assertion failed\n    at DCache.scala:306 assert(!(s1_valid_masked && s1_req.cmd === M_PWR) || (s1_mask_xwr | ~io.cpu.s1_data.mask).andR)\n");
            if (1)
                $display("");
        end
        if (~  dcache__reset  &~(~(  dcache___pstore_drain_opportunistic_T  |  dcache___pstore_drain_opportunistic_T_1  |  dcache___pstore_drain_opportunistic_T_2  |  dcache___pstore_drain_opportunistic_T_28  |  dcache___pstore_drain_opportunistic_T_30  |  dcache___pstore_drain_opportunistic_T_31  |  dcache___pstore_drain_opportunistic_T_32  |  dcache___pstore_drain_opportunistic_T_33  |  dcache___pstore_drain_opportunistic_T_37  |  dcache___pstore_drain_opportunistic_T_38  |  dcache___pstore_drain_opportunistic_T_39  |  dcache___pstore_drain_opportunistic_T_40  |  dcache___pstore_drain_opportunistic_T_41  |(  dcache___pstore_drain_opportunistic_T_25  |  dcache___pstore_drain_opportunistic_T_50  |  dcache___pstore_drain_opportunistic_T_28  |  dcache___pstore_drain_opportunistic_T_30  |  dcache___pstore_drain_opportunistic_T_31  |  dcache___pstore_drain_opportunistic_T_32  |  dcache___pstore_drain_opportunistic_T_33  |  dcache___pstore_drain_opportunistic_T_37  |  dcache___pstore_drain_opportunistic_T_38  |  dcache___pstore_drain_opportunistic_T_39  |  dcache___pstore_drain_opportunistic_T_40  |  dcache___pstore_drain_opportunistic_T_41  )&  dcache___pstore_drain_opportunistic_T_50  )|~  dcache___pstore_drain_opportunistic_res_T_2  ))
        begin
            if (1)
                $display("Assertion failed\n    at DCache.scala:1162 assert(!needsRead(req) || res)\n");
            if (1)
                $display("");
        end
        if (~  dcache__reset  &~(  dcache__pstore1_rmw  |(  dcache___dataArb_io_in_0_valid_T_4  |  dcache__pstore1_held  )==  dcache__pstore1_valid  ))
        begin
            if (1)
                $display("Assertion failed\n    at DCache.scala:487 assert(pstore1_rmw || pstore1_valid_not_rmw(io.cpu.s2_kill) === pstore1_valid)\n");
            if (1)
                $display("");
        end
        if (  dcache___GEN_17  &~  dcache__reset  &~  dcache__cached_grant_wait  )
        begin
            if (1)
                $display("Assertion failed: A GrantData was unexpected by the dcache.\n    at DCache.scala:654 assert(cached_grant_wait, \"A GrantData was unexpected by the dcache.\")\n");
            if (1)
                $display("");
        end
        if (  dcache___GEN_28  &  dcache__grantIsUncached  &  dcache___GEN_18  &~  dcache__reset  &~  dcache__uncachedInFlight_0  )
        begin
            if (1)
                $display("Assertion failed: An AccessAck was unexpected by the dcache.\n    at DCache.scala:664 assert(f, \"An AccessAck was unexpected by the dcache.\") // TODO must handle Ack coming back on same cycle!\n");
            if (1)
                $display("");
        end
        if (  dcache___GEN_28  &~  dcache__grantIsUncached  &  dcache__grantIsVoluntary  &~  dcache__reset  &~  dcache__release_ack_wait  )
        begin
            if (1)
                $display("Assertion failed: A ReleaseAck was unexpected by the dcache.\n    at DCache.scala:685 assert(release_ack_wait, \"A ReleaseAck was unexpected by the dcache.\") // TODO should handle Ack coming back on same cycle!\n");
            if (1)
                $display("");
        end
        if (~  dcache__reset  &(  dcache__auto_out_e_ready  &  dcache__nodeOut_e_valid  )!=(  dcache___io_errors_bus_valid_T  &~(|  dcache__counter  )&  dcache__grantIsCached  ))
        begin
            if (1)
                $display("Assertion failed\n    at DCache.scala:693 assert(tl_out.e.fire === (tl_out.d.fire && d_first && grantIsCached))\n");
            if (1)
                $display("");
        end
        if (  dcache__s2_want_victimize  &~  dcache__reset  &~(  dcache__s2_valid_flush_line  |  dcache__s2_flush_valid  |  dcache__io_cpu_s2_nack_0  ))
        begin
            if (1)
                $display("Assertion failed\n    at DCache.scala:794 assert(s2_valid_flush_line || s2_flush_valid || io.cpu.s2_nack)\n");
            if (1)
                $display("");
        end
        if (  dcache__doUncachedResp  &~  dcache__reset  &  dcache__s2_valid_hit_pre_data_ecc_and_waw  )
        begin
            if (1)
                $display("Assertion failed\n    at DCache.scala:928 assert(!s2_valid_hit)\n");
            if (1)
                $display("");
        end
    end

    wire[31:0]  dcache__io_cpu_resp_bits_data_zeroed  =  dcache__s2_req_addr  [2] ?   dcache__s2_data  [63:32]:  dcache__s2_data  [31:0];
    wire  dcache___io_cpu_resp_bits_data_word_bypass_T_1  =  dcache__s2_req_size  ==2'h2;
    wire[15:0]  dcache__io_cpu_resp_bits_data_zeroed_1  =  dcache__s2_req_addr  [1] ?   dcache__io_cpu_resp_bits_data_zeroed  [31:16]:  dcache__io_cpu_resp_bits_data_zeroed  [15:0];
    wire[7:0]  dcache__io_cpu_resp_bits_data_zeroed_2  =  dcache__s2_sc   ? 8'h0:  dcache__s2_req_addr  [0] ?   dcache__io_cpu_resp_bits_data_zeroed_1  [15:8]:  dcache__io_cpu_resp_bits_data_zeroed_1  [7:0];
    wire[31:0]  dcache__io_cpu_resp_bits_data_word_bypass_zeroed  =  dcache__s2_req_addr  [2] ?   dcache__s2_data  [63:32]:  dcache__s2_data  [31:0];
    reg  dcache__REG  ;
    wire[26:0]  dcache___io_cpu_perf_release_beats1_decode_T_1  =27'hFFF<<  dcache___GEN_23  ;
    wire[8:0]  dcache__io_cpu_perf_release_beats1  =  dcache__nodeOut_c_bits_opcode  [0] ? ~(  dcache___io_cpu_perf_release_beats1_decode_T_1  [11:3]):9'h0;
    reg[8:0]  dcache__io_cpu_perf_release_counter  ;
    wire[3:0]  dcache___release_state_T_14  =  dcache__s2_victim_dirty  &~(  dcache__s2_valid_flush_line  &  dcache__s2_req_size  [1]) ? 4'h1:4'h6;
    wire[3:0]  dcache___release_state_T_15  ={1'h0,  dcache__releaseDone  ,2'h3};
    wire[3:0]  dcache___GEN_29  =  dcache__s2_prb_ack_data   ? 4'h2:(|  dcache__s2_probe_state_state  ) ? 4'h3:4'h5;
    wire[3:0]  dcache___GEN_30  =  dcache__s2_want_victimize   ?   dcache___release_state_T_14  :  dcache__release_state  ;
    wire[3:0]  dcache___GEN_31  =  dcache__s2_probe   ?   dcache___GEN_29  :  dcache___GEN_30  ;
    wire  dcache___GEN_32  =  dcache___io_errors_bus_valid_T  &  dcache__grantIsCached  &  dcache__d_last  ;
    wire  dcache___GEN_33  =  dcache___GEN_24  &~  dcache__metaArb__grant_T_3  ;
    wire[6:0]  dcache__flushCounterNext  ={1'h0,  dcache__flushCounter  }+7'h1;
    wire  dcache___GEN_34  =  dcache___GEN_25  &  dcache__releaseDone  |  dcache___GEN_33  ;
    wire[33:0]  dcache__s0_req_addr  ={  dcache__resetting   ? {  dcache__io_cpu_req_bits_addr  [33:12],  dcache__flushCounter  }:  dcache___GEN   ? {  dcache__io_cpu_req_bits_addr  [33:12],  dcache__s2_req_addr  [11:6]}:  dcache__metaArb_io_in_valid_4   ? {  dcache__io_cpu_req_bits_addr  [33:12],  dcache__probe_bits_address  [11:6]}:  dcache__metaArb_io_in_valid_6   ? {  dcache__io_cpu_req_bits_addr  [33:32],  dcache___GEN_24   ?   dcache__probe_bits_address  [31:6]:  dcache__auto_out_b_bits_address  [31:6]}:  dcache__io_cpu_req_bits_addr  [33:6],  dcache__io_cpu_req_bits_addr  [5:0]};
    wire[9:0]  dcache___GEN_35  =  dcache__s1_tlb_req_vaddr  [25:16]^10'h200;
    wire[3:0]  dcache___GEN_36  =  dcache__s1_tlb_req_vaddr  [31:28]^4'h8;
    wire  dcache__tlb_legal_address  ={  dcache__s1_tlb_req_vaddr  [33:14],~(  dcache__s1_tlb_req_vaddr  [13:12])}==22'h0|{  dcache__s1_tlb_req_vaddr  [33:28],~(  dcache__s1_tlb_req_vaddr  [27:26])}==8'h0|{  dcache__s1_tlb_req_vaddr  [33:26],  dcache___GEN_35  }==18'h0|~(|(  dcache__s1_tlb_req_vaddr  [33:12]))|{  dcache__s1_tlb_req_vaddr  [33:17],~(  dcache__s1_tlb_req_vaddr  [16])}==18'h0|{  dcache__s1_tlb_req_vaddr  [33:32],  dcache___GEN_36  }==6'h0|{  dcache__s1_tlb_req_vaddr  [33:31],~(  dcache__s1_tlb_req_vaddr  [30:29])}==5'h0;
    wire  dcache__tlb_cacheable  =  dcache__tlb_legal_address  &~(  dcache___GEN_36  [3]);
    wire  dcache__tlb_deny_access_to_debug  =~  dcache__io_ptw_status_debug  &~(|(  dcache__s1_tlb_req_vaddr  [33:12]));
    wire[3:0]  dcache___GEN_37  ={  dcache__s1_tlb_req_vaddr  [31:30],  dcache__s1_tlb_req_vaddr  [27],  dcache__s1_tlb_req_vaddr  [16]};
    wire[2:0]  dcache___GEN_38  ={  dcache__s1_tlb_req_vaddr  [31:30],~(  dcache__s1_tlb_req_vaddr  [27])};
    wire[1:0]  dcache___GEN_39  ={  dcache__s1_tlb_req_vaddr  [31],~(  dcache__s1_tlb_req_vaddr  [30])};
    wire[3:0]  dcache___GEN_40  =  dcache__s1_tlb_req_vaddr  [3:0]&(4'h1<<  dcache__s1_tlb_req_size  )-4'h1;
    wire  dcache__tlb__cmd_lrsc_T  =  dcache__s1_tlb_req_cmd  ==5'h6;
    wire  dcache__tlb__cmd_lrsc_T_1  =  dcache__s1_tlb_req_cmd  ==5'h7;
    wire  dcache__tlb__cmd_read_T_7  =  dcache__s1_tlb_req_cmd  ==5'h4;
    wire  dcache__tlb__cmd_read_T_8  =  dcache__s1_tlb_req_cmd  ==5'h9;
    wire  dcache__tlb__cmd_read_T_9  =  dcache__s1_tlb_req_cmd  ==5'hA;
    wire  dcache__tlb__cmd_read_T_10  =  dcache__s1_tlb_req_cmd  ==5'hB;
    wire  dcache__tlb__cmd_read_T_14  =  dcache__s1_tlb_req_cmd  ==5'h8;
    wire  dcache__tlb__cmd_read_T_15  =  dcache__s1_tlb_req_cmd  ==5'hC;
    wire  dcache__tlb__cmd_read_T_16  =  dcache__s1_tlb_req_cmd  ==5'hD;
    wire  dcache__tlb__cmd_read_T_17  =  dcache__s1_tlb_req_cmd  ==5'hE;
    wire  dcache__tlb__cmd_read_T_18  =  dcache__s1_tlb_req_cmd  ==5'hF;
    wire  dcache__tlb_cmd_put_partial  =  dcache__s1_tlb_req_cmd  ==5'h11;
    wire  dcache__tlb_cmd_read  =  dcache__s1_tlb_req_cmd  ==5'h0|  dcache__s1_tlb_req_cmd  ==5'h10|  dcache__tlb__cmd_lrsc_T  |  dcache__tlb__cmd_lrsc_T_1  |  dcache__tlb__cmd_read_T_7  |  dcache__tlb__cmd_read_T_8  |  dcache__tlb__cmd_read_T_9  |  dcache__tlb__cmd_read_T_10  |  dcache__tlb__cmd_read_T_14  |  dcache__tlb__cmd_read_T_15  |  dcache__tlb__cmd_read_T_16  |  dcache__tlb__cmd_read_T_17  |  dcache__tlb__cmd_read_T_18  ;
    wire  dcache__tlb_cmd_write  =  dcache__s1_tlb_req_cmd  ==5'h1|  dcache__tlb_cmd_put_partial  |  dcache__tlb__cmd_lrsc_T_1  |  dcache__tlb__cmd_read_T_7  |  dcache__tlb__cmd_read_T_8  |  dcache__tlb__cmd_read_T_9  |  dcache__tlb__cmd_read_T_10  |  dcache__tlb__cmd_read_T_14  |  dcache__tlb__cmd_read_T_15  |  dcache__tlb__cmd_read_T_16  |  dcache__tlb__cmd_read_T_17  |  dcache__tlb__cmd_read_T_18  ;
    wire  dcache__tlb_ae_array  =(|  dcache___GEN_40  )&  dcache__tlb_legal_address  &({  dcache__s1_tlb_req_vaddr  [31:30],  dcache__s1_tlb_req_vaddr  [27],  dcache__s1_tlb_req_vaddr  [25],  dcache__s1_tlb_req_vaddr  [16],  dcache__s1_tlb_req_vaddr  [13]}==6'h0|{  dcache__s1_tlb_req_vaddr  [31:30],  dcache__s1_tlb_req_vaddr  [27],  dcache___GEN_35  [9],  dcache__s1_tlb_req_vaddr  [16]}==5'h0|~(|  dcache___GEN_38  )|~(|  dcache___GEN_39  ))|(  dcache__tlb__cmd_lrsc_T  |  dcache__tlb__cmd_lrsc_T_1  )&~  dcache__tlb_cacheable  ;
    wire[1:0]  dcache___s2_data_T_1  =  dcache__io_cpu_replay_next_0  |  dcache__inWriteback  |  dcache__s1_did_read   ? (  dcache___GEN_19   ? 2'h1:2'h2):2'h0;
    wire  dcache___probe_bits_T  =  dcache__nodeOut_b_ready  &  dcache__auto_out_b_valid  ;
    wire  dcache__s1_valid_not_nacked  =  dcache__s1_valid  &~  dcache__s1_nack  ;
    wire  dcache___s1_meta_hit_state_T_2  =  dcache___tag_array_0_ext_RW0_rdata  [19:0]==  dcache__s1_tlb_req_vaddr  [31:12]&~  dcache__s1_flush_valid  ;
    wire  dcache___s2_victim_way_T  =  dcache__s1_valid_not_nacked  |  dcache__s1_flush_valid  ;
    wire  dcache___GEN_41  =  dcache__s2_valid_hit_pre_data_ecc_and_waw  &  dcache__s2_lr  &~  dcache__cached_grant_wait  |  dcache__s2_valid_cached_miss  ;
    wire  dcache__advance_pstore1  =  dcache__pstore1_valid  &  dcache__pstore2_valid  ==  dcache__pstore_drain  ;
    wire  dcache___io_cpu_perf_acquire_T  =  dcache__auto_out_a_ready  &  dcache__tl_out_a_valid  ;
    wire  dcache___GEN_42  =  dcache___io_cpu_perf_acquire_T  &~  dcache__s2_pma_cacheable  ;
    wire  dcache___GEN_43  =  dcache___GEN_27  &  dcache___io_cpu_perf_release_T  &  dcache__c_first  ;
    always @( posedge   dcache__clock  )
    begin
        if (  dcache__reset  )
        begin
            dcache__s1_valid   <=1'h0;
            dcache__s1_probe   <=1'h0;
            dcache__cached_grant_wait   <=1'h0;
            dcache__resetting   <=1'h0;
            dcache__flushCounter   <=6'h0;
            dcache__release_ack_wait   <=1'h0;
            dcache__release_state   <=4'h0;
            dcache__uncachedInFlight_0   <=1'h0;
            dcache__s2_valid   <=1'h0;
            dcache__s2_probe   <=1'h0;
            dcache__lrscCount   <=7'h0;
            dcache__pstore2_valid   <=1'h0;
            dcache__pstore1_held   <=1'h0;
            dcache__counter   <=9'h0;
            dcache__grantInProgress   <=1'h0;
            dcache__blockProbeAfterGrantCount   <=3'h0;
            dcache__counter_1   <=9'h0;
            dcache__io_cpu_perf_release_counter   <=9'h0;
        end
        else
        begin
            dcache__s1_valid   <=  dcache__io_cpu_req_ready_0  &  dcache__io_cpu_req_valid  ;
            dcache__s1_probe   <=  dcache___GEN_33  |  dcache___probe_bits_T  ;
            dcache__cached_grant_wait   <=~  dcache___GEN_32  &(  dcache___io_cpu_perf_acquire_T  &  dcache__s2_pma_cacheable  |  dcache__cached_grant_wait  );
            dcache__resetting   <=~(  dcache__resetting  &  dcache__flushCounterNext  [6])&(  dcache__REG  |  dcache__resetting  );
            if (  dcache__resetting  )
                dcache__flushCounter   <=  dcache__flushCounterNext  [5:0];
            dcache__release_ack_wait   <=  dcache___GEN_43  |(~  dcache___io_errors_bus_valid_T  |  dcache__grantIsCached  |  dcache__grantIsUncached  |~  dcache__grantIsVoluntary  )&  dcache__release_ack_wait  ;
            if (~  dcache__metaArb__grant_T_2  &  dcache__metaArb_io_in_valid_4  )
                dcache__release_state   <=4'h0;
            else
                if (  dcache___GEN_27  )
                begin
                    if (  dcache__releaseDone  )
                        dcache__release_state   <=4'h6;
                    else
                        if (  dcache___GEN_26  )
                            dcache__release_state   <=  dcache___inWriteback_T_1   ? (  dcache___GEN_34   ? 4'h0:  dcache___GEN_31  ):  dcache___GEN_25   ? (  dcache__releaseDone  |  dcache___GEN_33   ? 4'h0:  dcache___GEN_31  ):  dcache___GEN_33   ? 4'h0:  dcache__s2_probe   ? (  dcache__s2_prb_ack_data   ? 4'h2:(|  dcache__s2_probe_state_state  ) ? 4'h3:  dcache__releaseDone   ? 4'h0:4'h5):  dcache___GEN_30  ;
                        else
                            if (  dcache___GEN_34  )
                                dcache__release_state   <=4'h0;
                            else
                                if (  dcache__s2_probe  )
                                begin
                                    if (  dcache__s2_prb_ack_data  )
                                        dcache__release_state   <=4'h2;
                                    else
                                        if (|  dcache__s2_probe_state_state  )
                                            dcache__release_state   <=  dcache___release_state_T_15  ;
                                        else
                                            if (  dcache__releaseDone  )
                                                dcache__release_state   <=4'h0;
                                            else
                                                dcache__release_state   <=4'h5;
                                end
                                else
                                    if (  dcache__s2_want_victimize  )
                                        dcache__release_state   <=  dcache___release_state_T_14  ;
                end
                else
                    if (  dcache___inWriteback_T_1  )
                    begin
                        if (  dcache__releaseDone  )
                            dcache__release_state   <=4'h7;
                        else
                            if (  dcache___GEN_34  )
                                dcache__release_state   <=4'h0;
                            else
                                if (  dcache__s2_probe  )
                                    dcache__release_state   <=  dcache___GEN_29  ;
                                else
                                    if (  dcache__s2_want_victimize  )
                                        dcache__release_state   <=  dcache___release_state_T_14  ;
                    end
                    else
                        if (  dcache___GEN_26  )
                        begin
                            if (  dcache__releaseDone  )
                                dcache__release_state   <=4'h7;
                            else
                                if (  dcache___GEN_34  )
                                    dcache__release_state   <=4'h0;
                                else
                                    if (  dcache__s2_probe  )
                                        dcache__release_state   <=  dcache___GEN_29  ;
                                    else
                                        if (  dcache__s2_want_victimize  )
                                            dcache__release_state   <=  dcache___release_state_T_14  ;
                        end
                        else
                            if (  dcache___GEN_34  )
                                dcache__release_state   <=4'h0;
                            else
                                if (  dcache__s2_probe  )
                                begin
                                    if (  dcache__s2_prb_ack_data  )
                                        dcache__release_state   <=4'h2;
                                    else
                                        if (|  dcache__s2_probe_state_state  )
                                            dcache__release_state   <=  dcache___release_state_T_15  ;
                                        else
                                            if (  dcache__releaseDone  )
                                                dcache__release_state   <=4'h0;
                                            else
                                                dcache__release_state   <=4'h5;
                                end
                                else
                                    if (  dcache__s2_want_victimize  )
                                        dcache__release_state   <=  dcache___release_state_T_14  ;
            dcache__uncachedInFlight_0   <=(~  dcache___io_errors_bus_valid_T  |  dcache__grantIsCached  |~(  dcache__grantIsUncached  &  dcache___GEN_18  ))&(  dcache___GEN_42  |  dcache__uncachedInFlight_0  );
            dcache__s2_valid   <=  dcache__s1_valid_masked  &~(  dcache__s1_req_cmd  ==5'h14|  dcache__s1_req_cmd  ==5'h15|  dcache__s1_req_cmd  ==5'h16);
            dcache__s2_probe   <=  dcache__s1_probe  ;
            if (  dcache__s1_probe  )
                dcache__lrscCount   <=7'h0;
            else
                if (  dcache__s2_valid_masked  &(|(  dcache__lrscCount  [6:2])))
                    dcache__lrscCount   <=7'h3;
                else
                    if (|  dcache__lrscCount  )
                        dcache__lrscCount   <=  dcache__lrscCount  -7'h1;
                    else
                        if (  dcache___GEN_41  )
                            dcache__lrscCount   <=  dcache__s2_hit   ? 7'h4F:7'h0;
            dcache__pstore2_valid   <=  dcache__pstore2_valid  &~  dcache__pstore_drain  |  dcache__advance_pstore1  ;
            dcache__pstore1_held   <=(  dcache___pstore1_held_T  &~  dcache__s2_sc_fail  |  dcache__pstore1_held  )&  dcache__pstore2_valid  &~  dcache__pstore_drain  ;
            if (  dcache___io_errors_bus_valid_T  )
            begin
                if (|  dcache__counter  )
                    dcache__counter   <=  dcache___counter1_T  ;
                else
                    dcache__counter   <=  dcache__beats1  ;
            end
            if (  dcache___GEN_17  )
                dcache__grantInProgress   <=~  dcache__d_last  ;
            if (  dcache___GEN_32  )
                dcache__blockProbeAfterGrantCount   <=3'h7;
            else
                if (|  dcache__blockProbeAfterGrantCount  )
                    dcache__blockProbeAfterGrantCount   <=  dcache__blockProbeAfterGrantCount  -3'h1;
            if (  dcache___io_cpu_perf_release_T  )
            begin
                if (  dcache__c_first  )
                    dcache__counter_1   <=  dcache__beats1_1  ;
                else
                    dcache__counter_1   <=  dcache___counter1_T_1  ;
                if (  dcache__io_cpu_perf_release_counter  ==9'h0)
                    dcache__io_cpu_perf_release_counter   <=  dcache__io_cpu_perf_release_beats1  ;
                else
                    dcache__io_cpu_perf_release_counter   <=  dcache__io_cpu_perf_release_counter  -9'h1;
            end
        end
        if (  dcache__s2_want_victimize  )
        begin
            dcache__probe_bits_param   <=2'h0;
            dcache__probe_bits_size   <=4'h0;
            dcache__probe_bits_address   <={  dcache__s2_valid_flush_line   ?   dcache__s2_req_addr  [31:12]:  dcache__s2_meta_corrected_r  [19:0],  dcache__s2_req_addr  [11:6],6'h0};
        end
        else
            if (  dcache___probe_bits_T  )
            begin
                dcache__probe_bits_param   <=  dcache__auto_out_b_bits_param  ;
                dcache__probe_bits_size   <=  dcache__auto_out_b_bits_size  ;
                dcache__probe_bits_address   <=  dcache__auto_out_b_bits_address  ;
            end
        dcache__probe_bits_source   <=~  dcache__s2_want_victimize  &(  dcache___probe_bits_T   ?   dcache__auto_out_b_bits_source  :  dcache__probe_bits_source  );
        if (  dcache__metaArb_io_out_valid  &~  dcache__metaArb_io_out_bits_write  )
        begin
            dcache__s1_vaddr   <=  dcache__s0_req_addr  ;
            dcache__s1_req_tag   <=  dcache__io_cpu_req_bits_tag  ;
            dcache__s1_req_cmd   <=  dcache__io_cpu_req_bits_cmd  ;
            dcache__s1_req_size   <=  dcache__io_cpu_req_bits_size  ;
            dcache__s1_req_signed   <=  dcache__io_cpu_req_bits_signed  ;
            dcache__s1_req_dprv   <=2'h3;
            dcache__s1_req_dv   <=  dcache__io_cpu_req_bits_dv  ;
            dcache__s1_tlb_req_vaddr   <=  dcache__s0_req_addr  ;
            dcache__s1_tlb_req_size   <=  dcache__io_cpu_req_bits_size  ;
            dcache__s1_tlb_req_cmd   <=  dcache__io_cpu_req_bits_cmd  ;
            dcache__s1_tlb_req_prv   <=2'h3;
            dcache__s1_did_read   <=~  dcache__dataArb__grant_T_1  &  dcache__io_cpu_req_valid  &(  dcache___pstore_drain_opportunistic_T  |  dcache___pstore_drain_opportunistic_T_1  |  dcache___pstore_drain_opportunistic_T_2  |  dcache___pstore_drain_opportunistic_T_28  |  dcache___pstore_drain_opportunistic_T_30  |  dcache___pstore_drain_opportunistic_T_31  |  dcache___pstore_drain_opportunistic_T_32  |  dcache___pstore_drain_opportunistic_T_33  |  dcache___pstore_drain_opportunistic_T_37  |  dcache___pstore_drain_opportunistic_T_38  |  dcache___pstore_drain_opportunistic_T_39  |  dcache___pstore_drain_opportunistic_T_40  |  dcache___pstore_drain_opportunistic_T_41  |(  dcache___pstore_drain_opportunistic_T_25  |  dcache___pstore_drain_opportunistic_T_50  |  dcache___pstore_drain_opportunistic_T_28  |  dcache___pstore_drain_opportunistic_T_30  |  dcache___pstore_drain_opportunistic_T_31  |  dcache___pstore_drain_opportunistic_T_32  |  dcache___pstore_drain_opportunistic_T_33  |  dcache___pstore_drain_opportunistic_T_37  |  dcache___pstore_drain_opportunistic_T_38  |  dcache___pstore_drain_opportunistic_T_39  |  dcache___pstore_drain_opportunistic_T_40  |  dcache___pstore_drain_opportunistic_T_41  )&  dcache___pstore_drain_opportunistic_T_50  );
        end
        dcache__s1_flush_valid   <=1'h0;
        if (  dcache___GEN_43  )
            dcache__release_ack_addr   <=  dcache__probe_bits_address  ;
        if (  dcache___GEN_42  )
        begin
            dcache__uncachedReqs_addr_0   <=  dcache__s2_req_addr  ;
            dcache__uncachedReqs_tag_0   <=  dcache__s2_req_tag  ;
            dcache__uncachedReqs_size_0   <=  dcache__s2_req_size  ;
            dcache__uncachedReqs_signed_0   <=  dcache__s2_req_signed  ;
        end
        dcache__s2_not_nacked_in_s1   <=~  dcache__s1_nack  ;
        if (  dcache___GEN_19  )
        begin
            if (  dcache___s2_victim_way_T  )
            begin
                dcache__s2_req_addr   <={2'h0,  dcache__s1_tlb_req_vaddr  [31:12],  dcache__s1_vaddr  [11:0]};
                dcache__s2_req_tag   <=  dcache__s1_req_tag  ;
                dcache__s2_req_cmd   <=  dcache__s1_req_cmd  ;
                dcache__s2_req_size   <=  dcache__s1_req_size  ;
                dcache__s2_req_signed   <=  dcache__s1_req_signed  ;
            end
        end
        else
        begin
            dcache__s2_req_addr   <={2'h0,  dcache__s1_tlb_req_vaddr  [31:12],  dcache__s1_vaddr  [11:3],  dcache__uncachedReqs_addr_0  [2:0]};
            dcache__s2_req_tag   <=  dcache__uncachedReqs_tag_0  ;
            dcache__s2_req_cmd   <=5'h0;
            dcache__s2_req_size   <=  dcache__uncachedReqs_size_0  ;
            dcache__s2_req_signed   <=  dcache__uncachedReqs_signed_0  ;
        end
        if (  dcache___s2_victim_way_T  )
        begin
            dcache__s2_req_dprv   <=  dcache__s1_req_dprv  ;
            dcache__s2_req_dv   <=  dcache__s1_req_dv  ;
            dcache__s2_tlb_xcpt_ae_ld   <=  dcache__tlb_cmd_read  &(  dcache__tlb_ae_array  |~(  dcache__tlb_legal_address  &~  dcache__tlb_deny_access_to_debug  &  dcache___tlb_pmp_io_r  ));
            dcache__s2_tlb_xcpt_ae_st   <=(  dcache__tlb_cmd_write  |  dcache__s1_tlb_req_cmd  ==5'h5|  dcache__s1_tlb_req_cmd  ==5'h17)&(  dcache__tlb_ae_array  |~(  dcache__tlb_legal_address  &(~(|  dcache___GEN_37  )|~(|  dcache___GEN_38  )|~(|  dcache___GEN_39  )|~(|(  dcache___GEN_36  [3:2])))&~  dcache__tlb_deny_access_to_debug  &  dcache___tlb_pmp_io_w  ))|  dcache__tlb_cmd_put_partial  &~(  dcache__tlb_legal_address  &(~(|  dcache___GEN_37  )|~(|  dcache___GEN_38  )|~(|  dcache___GEN_39  )|~(|(  dcache___GEN_36  [3:2])))|  dcache__tlb_cacheable  )|(  dcache__tlb__cmd_read_T_7  |  dcache__tlb__cmd_read_T_8  |  dcache__tlb__cmd_read_T_9  |  dcache__tlb__cmd_read_T_10  )&~(  dcache__tlb_legal_address  &(~(|  dcache___GEN_37  )|~(|  dcache___GEN_38  ))|  dcache__tlb_cacheable  )|(  dcache__tlb__cmd_read_T_14  |  dcache__tlb__cmd_read_T_15  |  dcache__tlb__cmd_read_T_16  |  dcache__tlb__cmd_read_T_17  |  dcache__tlb__cmd_read_T_18  )&~(  dcache__tlb_legal_address  &(~(|  dcache___GEN_37  )|~(|  dcache___GEN_38  ))|  dcache__tlb_cacheable  );
            dcache__s2_tlb_xcpt_ma_ld   <=(|  dcache___GEN_40  )&  dcache__tlb_cmd_read  ;
            dcache__s2_tlb_xcpt_ma_st   <=(|  dcache___GEN_40  )&  dcache__tlb_cmd_write  ;
            dcache__s2_pma_cacheable   <=  dcache__tlb_cacheable  ;
            dcache__s2_vaddr_r   <=  dcache__s1_vaddr  ;
            if (  dcache___s1_meta_hit_state_T_2  )
                dcache__s2_hit_state_state   <=  dcache___tag_array_0_ext_RW0_rdata  [21:20];
            else
                dcache__s2_hit_state_state   <=2'h0;
        end
        dcache__s2_tlb_xcpt_pf_ld   <=~  dcache___s2_victim_way_T  &  dcache__s2_tlb_xcpt_pf_ld  ;
        dcache__s2_tlb_xcpt_pf_st   <=~  dcache___s2_victim_way_T  &  dcache__s2_tlb_xcpt_pf_st  ;
        if (  dcache___GEN_19  )
        begin
        end
        else
            dcache__s2_uncached_resp_addr   <=  dcache__uncachedReqs_addr_0  ;
        dcache__s2_flush_valid   <=  dcache__s1_flush_valid  ;
        if (  dcache___s2_victim_way_T  |  dcache__s1_probe  )
            dcache__s2_meta_corrected_r   <=  dcache___tag_array_0_ext_RW0_rdata  ;
        if (  dcache__s1_valid  |  dcache__inWriteback  |  dcache__io_cpu_replay_next_0  )
            dcache__s2_data   <=(  dcache___s2_data_T_1  [0] ?   dcache___data_io_resp_0  :64'h0)|(  dcache___s2_data_T_1  [1] ?   dcache__auto_out_d_bits_data  :64'h0);
        if (  dcache__s1_probe  )
        begin
            if (  dcache___s1_meta_hit_state_T_2  )
                dcache__s2_probe_state_state   <=  dcache___tag_array_0_ext_RW0_rdata  [21:20];
            else
                dcache__s2_probe_state_state   <=2'h0;
        end
        if (  dcache___GEN_41  )
            dcache__lrscAddr   <=  dcache__s2_req_addr  [33:6];
        if (  dcache__s1_valid_not_nacked  &  dcache__s1_write  )
        begin
            dcache__pstore1_cmd   <=  dcache__s1_req_cmd  ;
            dcache__pstore1_addr   <=  dcache__s1_vaddr  ;
            dcache__pstore1_data   <=  dcache__io_cpu_s1_data_data  ;
            dcache__pstore1_mask   <=  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_51   ?   dcache__io_cpu_s1_data_mask  :  dcache__s1_mask_xwr  ;
            dcache__pstore1_rmw   <=  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_1  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_2  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_3  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_29  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_31  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_32  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_33  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_34  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_38  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_39  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_40  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_41  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_42  |(  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_26  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_51  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_29  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_31  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_32  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_33  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_34  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_38  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_39  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_40  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_41  |  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_42  )&  dcache___io_cpu_perf_canAcceptLoadThenLoad_T_51  ;
        end
        dcache__pstore_drain_on_miss_REG   <=  dcache__io_cpu_s2_nack_0  ;
        if (  dcache__advance_pstore1  )
        begin
            dcache__pstore2_addr   <=  dcache__pstore1_addr  ;
            dcache__pstore2_storegen_data_r   <=  dcache___amoalus_0_io_out  [7:0];
            dcache__pstore2_storegen_data_r_1   <=  dcache___amoalus_0_io_out  [15:8];
            dcache__pstore2_storegen_data_r_2   <=  dcache___amoalus_0_io_out  [23:16];
            dcache__pstore2_storegen_data_r_3   <=  dcache___amoalus_0_io_out  [31:24];
            dcache__pstore2_storegen_data_r_4   <=  dcache___amoalus_0_io_out  [39:32];
            dcache__pstore2_storegen_data_r_5   <=  dcache___amoalus_0_io_out  [47:40];
            dcache__pstore2_storegen_data_r_6   <=  dcache___amoalus_0_io_out  [55:48];
            dcache__pstore2_storegen_data_r_7   <=  dcache___amoalus_0_io_out  [63:56];
            dcache__pstore2_storegen_mask   <=  dcache__pstore1_mask  ;
        end
        if (  dcache___GEN_22  )
            dcache__blockUncachedGrant   <=  dcache__dataArb_io_in_valid_0  ;
        else
            dcache__blockUncachedGrant   <=  dcache__dataArb_io_out_valid  ;
        dcache__s1_release_data_valid   <=~  dcache__dataArb__grant_T  &  dcache__dataArb_io_in_valid_2  ;
        dcache__s2_release_data_valid   <=  dcache__s1_release_data_valid  &~  dcache__releaseRejected  ;
        dcache__io_cpu_s2_xcpt_REG   <=  dcache__s1_valid  &~  dcache__io_cpu_s1_kill  &(  dcache__s1_read  |  dcache__s1_write  |  dcache__s1_req_cmd  ==5'h5&  dcache__s1_req_size  [0]|  dcache__s1_req_cmd  ==5'h17)&~  dcache__s1_nack  ;
        dcache__doUncachedResp   <=  dcache__io_cpu_replay_next_0  ;
        dcache__REG   <=  dcache__reset  ;
    end


    wire [1:0] dcache__tlb_pmp__io_prv;
    wire  dcache__tlb_pmp__io_pmp_cfg_l_0;
    wire  dcache__tlb_pmp__io_pmp_cfg_l_1;
    wire  dcache__tlb_pmp__io_pmp_cfg_l_2;
    wire  dcache__tlb_pmp__io_pmp_cfg_l_3;
    wire  dcache__tlb_pmp__io_pmp_cfg_l_4;
    wire  dcache__tlb_pmp__io_pmp_cfg_l_5;
    wire  dcache__tlb_pmp__io_pmp_cfg_l_6;
    wire  dcache__tlb_pmp__io_pmp_cfg_l_7;
    wire [1:0] dcache__tlb_pmp__io_pmp_cfg_a_0;
    wire [1:0] dcache__tlb_pmp__io_pmp_cfg_a_1;
    wire [1:0] dcache__tlb_pmp__io_pmp_cfg_a_2;
    wire [1:0] dcache__tlb_pmp__io_pmp_cfg_a_3;
    wire [1:0] dcache__tlb_pmp__io_pmp_cfg_a_4;
    wire [1:0] dcache__tlb_pmp__io_pmp_cfg_a_5;
    wire [1:0] dcache__tlb_pmp__io_pmp_cfg_a_6;
    wire [1:0] dcache__tlb_pmp__io_pmp_cfg_a_7;
    wire  dcache__tlb_pmp__io_pmp_cfg_w_0;
    wire  dcache__tlb_pmp__io_pmp_cfg_w_1;
    wire  dcache__tlb_pmp__io_pmp_cfg_w_2;
    wire  dcache__tlb_pmp__io_pmp_cfg_w_3;
    wire  dcache__tlb_pmp__io_pmp_cfg_w_4;
    wire  dcache__tlb_pmp__io_pmp_cfg_w_5;
    wire  dcache__tlb_pmp__io_pmp_cfg_w_6;
    wire  dcache__tlb_pmp__io_pmp_cfg_w_7;
    wire  dcache__tlb_pmp__io_pmp_cfg_r_0;
    wire  dcache__tlb_pmp__io_pmp_cfg_r_1;
    wire  dcache__tlb_pmp__io_pmp_cfg_r_2;
    wire  dcache__tlb_pmp__io_pmp_cfg_r_3;
    wire  dcache__tlb_pmp__io_pmp_cfg_r_4;
    wire  dcache__tlb_pmp__io_pmp_cfg_r_5;
    wire  dcache__tlb_pmp__io_pmp_cfg_r_6;
    wire  dcache__tlb_pmp__io_pmp_cfg_r_7;
    wire [29:0] dcache__tlb_pmp__io_pmp_addr_0;
    wire [29:0] dcache__tlb_pmp__io_pmp_addr_1;
    wire [29:0] dcache__tlb_pmp__io_pmp_addr_2;
    wire [29:0] dcache__tlb_pmp__io_pmp_addr_3;
    wire [29:0] dcache__tlb_pmp__io_pmp_addr_4;
    wire [29:0] dcache__tlb_pmp__io_pmp_addr_5;
    wire [29:0] dcache__tlb_pmp__io_pmp_addr_6;
    wire [29:0] dcache__tlb_pmp__io_pmp_addr_7;
    wire [31:0] dcache__tlb_pmp__io_pmp_mask_0;
    wire [31:0] dcache__tlb_pmp__io_pmp_mask_1;
    wire [31:0] dcache__tlb_pmp__io_pmp_mask_2;
    wire [31:0] dcache__tlb_pmp__io_pmp_mask_3;
    wire [31:0] dcache__tlb_pmp__io_pmp_mask_4;
    wire [31:0] dcache__tlb_pmp__io_pmp_mask_5;
    wire [31:0] dcache__tlb_pmp__io_pmp_mask_6;
    wire [31:0] dcache__tlb_pmp__io_pmp_mask_7;
    wire [31:0] dcache__tlb_pmp__io_addr;
    wire [1:0] dcache__tlb_pmp__io_size;
    wire  dcache__tlb_pmp__io_r;
    wire  dcache__tlb_pmp__io_w;

    wire[5:0]  dcache__tlb_pmp___GEN  ={4'h0,  dcache__tlb_pmp__io_size  };
    wire[5:0]  dcache__tlb_pmp___res_hit_lsbMask_T_1  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire[5:0]  dcache__tlb_pmp___res_hit_T_4  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire  dcache__tlb_pmp__res_hit  =  dcache__tlb_pmp__io_pmp_cfg_a_7  [1] ? ((  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_7  [29:1])&~(  dcache__tlb_pmp__io_pmp_mask_7  [31:3]))==29'h0&((  dcache__tlb_pmp__io_addr  [2:0]^{  dcache__tlb_pmp__io_pmp_addr_7  [0],2'h0})&~(  dcache__tlb_pmp__io_pmp_mask_7  [2:0]|~(  dcache__tlb_pmp___res_hit_lsbMask_T_1  [2:0])))==3'h0:  dcache__tlb_pmp__io_pmp_cfg_a_7  [0]&~(  dcache__tlb_pmp__io_addr  [31:3]<  dcache__tlb_pmp__io_pmp_addr_6  [29:1]|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_6  [29:1])==29'h0&(  dcache__tlb_pmp__io_addr  [2:0]|~(  dcache__tlb_pmp___res_hit_T_4  [2:0]))<{  dcache__tlb_pmp__io_pmp_addr_6  [0],2'h0})&(  dcache__tlb_pmp__io_addr  [31:3]<  dcache__tlb_pmp__io_pmp_addr_7  [29:1]|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_7  [29:1])==29'h0&  dcache__tlb_pmp__io_addr  [2:0]<{  dcache__tlb_pmp__io_pmp_addr_7  [0],2'h0});
    wire  dcache__tlb_pmp__res_ignore  =  dcache__tlb_pmp__io_prv  [1]&~  dcache__tlb_pmp__io_pmp_cfg_l_7  ;
    wire[5:0]  dcache__tlb_pmp___res_aligned_lsbMask_T_1  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire[2:0]  dcache__tlb_pmp__res_aligned_lsbMask  =~(  dcache__tlb_pmp___res_aligned_lsbMask_T_1  [2:0]);
    wire  dcache__tlb_pmp__res_aligned  =  dcache__tlb_pmp__io_pmp_cfg_a_7  [1] ? (  dcache__tlb_pmp__res_aligned_lsbMask  &~(  dcache__tlb_pmp__io_pmp_mask_7  [2:0]))==3'h0:~((  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_6  [29:1])==29'h0&  dcache__tlb_pmp__io_pmp_addr_6  [0]&~(  dcache__tlb_pmp__io_addr  [2])|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_7  [29:1])==29'h0&  dcache__tlb_pmp__io_pmp_addr_7  [0]&(  dcache__tlb_pmp__io_addr  [2]|  dcache__tlb_pmp__res_aligned_lsbMask  [2]));
    wire[5:0]  dcache__tlb_pmp___res_hit_lsbMask_T_5  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire[5:0]  dcache__tlb_pmp___res_hit_T_18  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire  dcache__tlb_pmp__res_hit_1  =  dcache__tlb_pmp__io_pmp_cfg_a_6  [1] ? ((  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_6  [29:1])&~(  dcache__tlb_pmp__io_pmp_mask_6  [31:3]))==29'h0&((  dcache__tlb_pmp__io_addr  [2:0]^{  dcache__tlb_pmp__io_pmp_addr_6  [0],2'h0})&~(  dcache__tlb_pmp__io_pmp_mask_6  [2:0]|~(  dcache__tlb_pmp___res_hit_lsbMask_T_5  [2:0])))==3'h0:  dcache__tlb_pmp__io_pmp_cfg_a_6  [0]&~(  dcache__tlb_pmp__io_addr  [31:3]<  dcache__tlb_pmp__io_pmp_addr_5  [29:1]|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_5  [29:1])==29'h0&(  dcache__tlb_pmp__io_addr  [2:0]|~(  dcache__tlb_pmp___res_hit_T_18  [2:0]))<{  dcache__tlb_pmp__io_pmp_addr_5  [0],2'h0})&(  dcache__tlb_pmp__io_addr  [31:3]<  dcache__tlb_pmp__io_pmp_addr_6  [29:1]|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_6  [29:1])==29'h0&  dcache__tlb_pmp__io_addr  [2:0]<{  dcache__tlb_pmp__io_pmp_addr_6  [0],2'h0});
    wire  dcache__tlb_pmp__res_ignore_1  =  dcache__tlb_pmp__io_prv  [1]&~  dcache__tlb_pmp__io_pmp_cfg_l_6  ;
    wire[5:0]  dcache__tlb_pmp___res_aligned_lsbMask_T_4  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire[2:0]  dcache__tlb_pmp__res_aligned_lsbMask_1  =~(  dcache__tlb_pmp___res_aligned_lsbMask_T_4  [2:0]);
    wire  dcache__tlb_pmp__res_aligned_1  =  dcache__tlb_pmp__io_pmp_cfg_a_6  [1] ? (  dcache__tlb_pmp__res_aligned_lsbMask_1  &~(  dcache__tlb_pmp__io_pmp_mask_6  [2:0]))==3'h0:~((  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_5  [29:1])==29'h0&  dcache__tlb_pmp__io_pmp_addr_5  [0]&~(  dcache__tlb_pmp__io_addr  [2])|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_6  [29:1])==29'h0&  dcache__tlb_pmp__io_pmp_addr_6  [0]&(  dcache__tlb_pmp__io_addr  [2]|  dcache__tlb_pmp__res_aligned_lsbMask_1  [2]));
    wire[5:0]  dcache__tlb_pmp___res_hit_lsbMask_T_9  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire[5:0]  dcache__tlb_pmp___res_hit_T_32  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire  dcache__tlb_pmp__res_hit_2  =  dcache__tlb_pmp__io_pmp_cfg_a_5  [1] ? ((  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_5  [29:1])&~(  dcache__tlb_pmp__io_pmp_mask_5  [31:3]))==29'h0&((  dcache__tlb_pmp__io_addr  [2:0]^{  dcache__tlb_pmp__io_pmp_addr_5  [0],2'h0})&~(  dcache__tlb_pmp__io_pmp_mask_5  [2:0]|~(  dcache__tlb_pmp___res_hit_lsbMask_T_9  [2:0])))==3'h0:  dcache__tlb_pmp__io_pmp_cfg_a_5  [0]&~(  dcache__tlb_pmp__io_addr  [31:3]<  dcache__tlb_pmp__io_pmp_addr_4  [29:1]|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_4  [29:1])==29'h0&(  dcache__tlb_pmp__io_addr  [2:0]|~(  dcache__tlb_pmp___res_hit_T_32  [2:0]))<{  dcache__tlb_pmp__io_pmp_addr_4  [0],2'h0})&(  dcache__tlb_pmp__io_addr  [31:3]<  dcache__tlb_pmp__io_pmp_addr_5  [29:1]|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_5  [29:1])==29'h0&  dcache__tlb_pmp__io_addr  [2:0]<{  dcache__tlb_pmp__io_pmp_addr_5  [0],2'h0});
    wire  dcache__tlb_pmp__res_ignore_2  =  dcache__tlb_pmp__io_prv  [1]&~  dcache__tlb_pmp__io_pmp_cfg_l_5  ;
    wire[5:0]  dcache__tlb_pmp___res_aligned_lsbMask_T_7  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire[2:0]  dcache__tlb_pmp__res_aligned_lsbMask_2  =~(  dcache__tlb_pmp___res_aligned_lsbMask_T_7  [2:0]);
    wire  dcache__tlb_pmp__res_aligned_2  =  dcache__tlb_pmp__io_pmp_cfg_a_5  [1] ? (  dcache__tlb_pmp__res_aligned_lsbMask_2  &~(  dcache__tlb_pmp__io_pmp_mask_5  [2:0]))==3'h0:~((  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_4  [29:1])==29'h0&  dcache__tlb_pmp__io_pmp_addr_4  [0]&~(  dcache__tlb_pmp__io_addr  [2])|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_5  [29:1])==29'h0&  dcache__tlb_pmp__io_pmp_addr_5  [0]&(  dcache__tlb_pmp__io_addr  [2]|  dcache__tlb_pmp__res_aligned_lsbMask_2  [2]));
    wire[5:0]  dcache__tlb_pmp___res_hit_lsbMask_T_13  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire[5:0]  dcache__tlb_pmp___res_hit_T_46  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire  dcache__tlb_pmp__res_hit_3  =  dcache__tlb_pmp__io_pmp_cfg_a_4  [1] ? ((  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_4  [29:1])&~(  dcache__tlb_pmp__io_pmp_mask_4  [31:3]))==29'h0&((  dcache__tlb_pmp__io_addr  [2:0]^{  dcache__tlb_pmp__io_pmp_addr_4  [0],2'h0})&~(  dcache__tlb_pmp__io_pmp_mask_4  [2:0]|~(  dcache__tlb_pmp___res_hit_lsbMask_T_13  [2:0])))==3'h0:  dcache__tlb_pmp__io_pmp_cfg_a_4  [0]&~(  dcache__tlb_pmp__io_addr  [31:3]<  dcache__tlb_pmp__io_pmp_addr_3  [29:1]|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_3  [29:1])==29'h0&(  dcache__tlb_pmp__io_addr  [2:0]|~(  dcache__tlb_pmp___res_hit_T_46  [2:0]))<{  dcache__tlb_pmp__io_pmp_addr_3  [0],2'h0})&(  dcache__tlb_pmp__io_addr  [31:3]<  dcache__tlb_pmp__io_pmp_addr_4  [29:1]|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_4  [29:1])==29'h0&  dcache__tlb_pmp__io_addr  [2:0]<{  dcache__tlb_pmp__io_pmp_addr_4  [0],2'h0});
    wire  dcache__tlb_pmp__res_ignore_3  =  dcache__tlb_pmp__io_prv  [1]&~  dcache__tlb_pmp__io_pmp_cfg_l_4  ;
    wire[5:0]  dcache__tlb_pmp___res_aligned_lsbMask_T_10  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire[2:0]  dcache__tlb_pmp__res_aligned_lsbMask_3  =~(  dcache__tlb_pmp___res_aligned_lsbMask_T_10  [2:0]);
    wire  dcache__tlb_pmp__res_aligned_3  =  dcache__tlb_pmp__io_pmp_cfg_a_4  [1] ? (  dcache__tlb_pmp__res_aligned_lsbMask_3  &~(  dcache__tlb_pmp__io_pmp_mask_4  [2:0]))==3'h0:~((  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_3  [29:1])==29'h0&  dcache__tlb_pmp__io_pmp_addr_3  [0]&~(  dcache__tlb_pmp__io_addr  [2])|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_4  [29:1])==29'h0&  dcache__tlb_pmp__io_pmp_addr_4  [0]&(  dcache__tlb_pmp__io_addr  [2]|  dcache__tlb_pmp__res_aligned_lsbMask_3  [2]));
    wire[5:0]  dcache__tlb_pmp___res_hit_lsbMask_T_17  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire[5:0]  dcache__tlb_pmp___res_hit_T_60  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire  dcache__tlb_pmp__res_hit_4  =  dcache__tlb_pmp__io_pmp_cfg_a_3  [1] ? ((  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_3  [29:1])&~(  dcache__tlb_pmp__io_pmp_mask_3  [31:3]))==29'h0&((  dcache__tlb_pmp__io_addr  [2:0]^{  dcache__tlb_pmp__io_pmp_addr_3  [0],2'h0})&~(  dcache__tlb_pmp__io_pmp_mask_3  [2:0]|~(  dcache__tlb_pmp___res_hit_lsbMask_T_17  [2:0])))==3'h0:  dcache__tlb_pmp__io_pmp_cfg_a_3  [0]&~(  dcache__tlb_pmp__io_addr  [31:3]<  dcache__tlb_pmp__io_pmp_addr_2  [29:1]|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_2  [29:1])==29'h0&(  dcache__tlb_pmp__io_addr  [2:0]|~(  dcache__tlb_pmp___res_hit_T_60  [2:0]))<{  dcache__tlb_pmp__io_pmp_addr_2  [0],2'h0})&(  dcache__tlb_pmp__io_addr  [31:3]<  dcache__tlb_pmp__io_pmp_addr_3  [29:1]|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_3  [29:1])==29'h0&  dcache__tlb_pmp__io_addr  [2:0]<{  dcache__tlb_pmp__io_pmp_addr_3  [0],2'h0});
    wire  dcache__tlb_pmp__res_ignore_4  =  dcache__tlb_pmp__io_prv  [1]&~  dcache__tlb_pmp__io_pmp_cfg_l_3  ;
    wire[5:0]  dcache__tlb_pmp___res_aligned_lsbMask_T_13  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire[2:0]  dcache__tlb_pmp__res_aligned_lsbMask_4  =~(  dcache__tlb_pmp___res_aligned_lsbMask_T_13  [2:0]);
    wire  dcache__tlb_pmp__res_aligned_4  =  dcache__tlb_pmp__io_pmp_cfg_a_3  [1] ? (  dcache__tlb_pmp__res_aligned_lsbMask_4  &~(  dcache__tlb_pmp__io_pmp_mask_3  [2:0]))==3'h0:~((  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_2  [29:1])==29'h0&  dcache__tlb_pmp__io_pmp_addr_2  [0]&~(  dcache__tlb_pmp__io_addr  [2])|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_3  [29:1])==29'h0&  dcache__tlb_pmp__io_pmp_addr_3  [0]&(  dcache__tlb_pmp__io_addr  [2]|  dcache__tlb_pmp__res_aligned_lsbMask_4  [2]));
    wire[5:0]  dcache__tlb_pmp___res_hit_lsbMask_T_21  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire[5:0]  dcache__tlb_pmp___res_hit_T_74  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire  dcache__tlb_pmp__res_hit_5  =  dcache__tlb_pmp__io_pmp_cfg_a_2  [1] ? ((  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_2  [29:1])&~(  dcache__tlb_pmp__io_pmp_mask_2  [31:3]))==29'h0&((  dcache__tlb_pmp__io_addr  [2:0]^{  dcache__tlb_pmp__io_pmp_addr_2  [0],2'h0})&~(  dcache__tlb_pmp__io_pmp_mask_2  [2:0]|~(  dcache__tlb_pmp___res_hit_lsbMask_T_21  [2:0])))==3'h0:  dcache__tlb_pmp__io_pmp_cfg_a_2  [0]&~(  dcache__tlb_pmp__io_addr  [31:3]<  dcache__tlb_pmp__io_pmp_addr_1  [29:1]|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_1  [29:1])==29'h0&(  dcache__tlb_pmp__io_addr  [2:0]|~(  dcache__tlb_pmp___res_hit_T_74  [2:0]))<{  dcache__tlb_pmp__io_pmp_addr_1  [0],2'h0})&(  dcache__tlb_pmp__io_addr  [31:3]<  dcache__tlb_pmp__io_pmp_addr_2  [29:1]|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_2  [29:1])==29'h0&  dcache__tlb_pmp__io_addr  [2:0]<{  dcache__tlb_pmp__io_pmp_addr_2  [0],2'h0});
    wire  dcache__tlb_pmp__res_ignore_5  =  dcache__tlb_pmp__io_prv  [1]&~  dcache__tlb_pmp__io_pmp_cfg_l_2  ;
    wire[5:0]  dcache__tlb_pmp___res_aligned_lsbMask_T_16  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire[2:0]  dcache__tlb_pmp__res_aligned_lsbMask_5  =~(  dcache__tlb_pmp___res_aligned_lsbMask_T_16  [2:0]);
    wire  dcache__tlb_pmp__res_aligned_5  =  dcache__tlb_pmp__io_pmp_cfg_a_2  [1] ? (  dcache__tlb_pmp__res_aligned_lsbMask_5  &~(  dcache__tlb_pmp__io_pmp_mask_2  [2:0]))==3'h0:~((  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_1  [29:1])==29'h0&  dcache__tlb_pmp__io_pmp_addr_1  [0]&~(  dcache__tlb_pmp__io_addr  [2])|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_2  [29:1])==29'h0&  dcache__tlb_pmp__io_pmp_addr_2  [0]&(  dcache__tlb_pmp__io_addr  [2]|  dcache__tlb_pmp__res_aligned_lsbMask_5  [2]));
    wire[5:0]  dcache__tlb_pmp___res_hit_lsbMask_T_25  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire[5:0]  dcache__tlb_pmp___res_hit_T_88  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire  dcache__tlb_pmp__res_hit_6  =  dcache__tlb_pmp__io_pmp_cfg_a_1  [1] ? ((  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_1  [29:1])&~(  dcache__tlb_pmp__io_pmp_mask_1  [31:3]))==29'h0&((  dcache__tlb_pmp__io_addr  [2:0]^{  dcache__tlb_pmp__io_pmp_addr_1  [0],2'h0})&~(  dcache__tlb_pmp__io_pmp_mask_1  [2:0]|~(  dcache__tlb_pmp___res_hit_lsbMask_T_25  [2:0])))==3'h0:  dcache__tlb_pmp__io_pmp_cfg_a_1  [0]&~(  dcache__tlb_pmp__io_addr  [31:3]<  dcache__tlb_pmp__io_pmp_addr_0  [29:1]|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_0  [29:1])==29'h0&(  dcache__tlb_pmp__io_addr  [2:0]|~(  dcache__tlb_pmp___res_hit_T_88  [2:0]))<{  dcache__tlb_pmp__io_pmp_addr_0  [0],2'h0})&(  dcache__tlb_pmp__io_addr  [31:3]<  dcache__tlb_pmp__io_pmp_addr_1  [29:1]|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_1  [29:1])==29'h0&  dcache__tlb_pmp__io_addr  [2:0]<{  dcache__tlb_pmp__io_pmp_addr_1  [0],2'h0});
    wire  dcache__tlb_pmp__res_ignore_6  =  dcache__tlb_pmp__io_prv  [1]&~  dcache__tlb_pmp__io_pmp_cfg_l_1  ;
    wire[5:0]  dcache__tlb_pmp___res_aligned_lsbMask_T_19  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire[2:0]  dcache__tlb_pmp__res_aligned_lsbMask_6  =~(  dcache__tlb_pmp___res_aligned_lsbMask_T_19  [2:0]);
    wire  dcache__tlb_pmp__res_aligned_6  =  dcache__tlb_pmp__io_pmp_cfg_a_1  [1] ? (  dcache__tlb_pmp__res_aligned_lsbMask_6  &~(  dcache__tlb_pmp__io_pmp_mask_1  [2:0]))==3'h0:~((  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_0  [29:1])==29'h0&  dcache__tlb_pmp__io_pmp_addr_0  [0]&~(  dcache__tlb_pmp__io_addr  [2])|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_1  [29:1])==29'h0&  dcache__tlb_pmp__io_pmp_addr_1  [0]&(  dcache__tlb_pmp__io_addr  [2]|  dcache__tlb_pmp__res_aligned_lsbMask_6  [2]));
    wire[5:0]  dcache__tlb_pmp___res_hit_lsbMask_T_29  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire  dcache__tlb_pmp__res_hit_7  =  dcache__tlb_pmp__io_pmp_cfg_a_0  [1] ? ((  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_0  [29:1])&~(  dcache__tlb_pmp__io_pmp_mask_0  [31:3]))==29'h0&((  dcache__tlb_pmp__io_addr  [2:0]^{  dcache__tlb_pmp__io_pmp_addr_0  [0],2'h0})&~(  dcache__tlb_pmp__io_pmp_mask_0  [2:0]|~(  dcache__tlb_pmp___res_hit_lsbMask_T_29  [2:0])))==3'h0:  dcache__tlb_pmp__io_pmp_cfg_a_0  [0]&(  dcache__tlb_pmp__io_addr  [31:3]<  dcache__tlb_pmp__io_pmp_addr_0  [29:1]|(  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_0  [29:1])==29'h0&  dcache__tlb_pmp__io_addr  [2:0]<{  dcache__tlb_pmp__io_pmp_addr_0  [0],2'h0});
    wire  dcache__tlb_pmp__res_ignore_7  =  dcache__tlb_pmp__io_prv  [1]&~  dcache__tlb_pmp__io_pmp_cfg_l_0  ;
    wire[5:0]  dcache__tlb_pmp___res_aligned_lsbMask_T_22  =6'h7<<  dcache__tlb_pmp___GEN  ;
    wire[2:0]  dcache__tlb_pmp__res_aligned_lsbMask_7  =~(  dcache__tlb_pmp___res_aligned_lsbMask_T_22  [2:0]);
    wire  dcache__tlb_pmp__res_aligned_7  =  dcache__tlb_pmp__io_pmp_cfg_a_0  [1] ? (  dcache__tlb_pmp__res_aligned_lsbMask_7  &~(  dcache__tlb_pmp__io_pmp_mask_0  [2:0]))==3'h0:~((  dcache__tlb_pmp__io_addr  [31:3]^  dcache__tlb_pmp__io_pmp_addr_0  [29:1])==29'h0&  dcache__tlb_pmp__io_pmp_addr_0  [0]&(  dcache__tlb_pmp__io_addr  [2]|  dcache__tlb_pmp__res_aligned_lsbMask_7  [2]));
    assign   dcache__tlb_pmp__io_r  =  dcache__tlb_pmp__res_hit_7   ?   dcache__tlb_pmp__res_aligned_7  &(  dcache__tlb_pmp__io_pmp_cfg_r_0  |  dcache__tlb_pmp__res_ignore_7  ):  dcache__tlb_pmp__res_hit_6   ?   dcache__tlb_pmp__res_aligned_6  &(  dcache__tlb_pmp__io_pmp_cfg_r_1  |  dcache__tlb_pmp__res_ignore_6  ):  dcache__tlb_pmp__res_hit_5   ?   dcache__tlb_pmp__res_aligned_5  &(  dcache__tlb_pmp__io_pmp_cfg_r_2  |  dcache__tlb_pmp__res_ignore_5  ):  dcache__tlb_pmp__res_hit_4   ?   dcache__tlb_pmp__res_aligned_4  &(  dcache__tlb_pmp__io_pmp_cfg_r_3  |  dcache__tlb_pmp__res_ignore_4  ):  dcache__tlb_pmp__res_hit_3   ?   dcache__tlb_pmp__res_aligned_3  &(  dcache__tlb_pmp__io_pmp_cfg_r_4  |  dcache__tlb_pmp__res_ignore_3  ):  dcache__tlb_pmp__res_hit_2   ?   dcache__tlb_pmp__res_aligned_2  &(  dcache__tlb_pmp__io_pmp_cfg_r_5  |  dcache__tlb_pmp__res_ignore_2  ):  dcache__tlb_pmp__res_hit_1   ?   dcache__tlb_pmp__res_aligned_1  &(  dcache__tlb_pmp__io_pmp_cfg_r_6  |  dcache__tlb_pmp__res_ignore_1  ):  dcache__tlb_pmp__res_hit   ?   dcache__tlb_pmp__res_aligned  &(  dcache__tlb_pmp__io_pmp_cfg_r_7  |  dcache__tlb_pmp__res_ignore  ):  dcache__tlb_pmp__io_prv  [1];
    assign   dcache__tlb_pmp__io_w  =  dcache__tlb_pmp__res_hit_7   ?   dcache__tlb_pmp__res_aligned_7  &(  dcache__tlb_pmp__io_pmp_cfg_w_0  |  dcache__tlb_pmp__res_ignore_7  ):  dcache__tlb_pmp__res_hit_6   ?   dcache__tlb_pmp__res_aligned_6  &(  dcache__tlb_pmp__io_pmp_cfg_w_1  |  dcache__tlb_pmp__res_ignore_6  ):  dcache__tlb_pmp__res_hit_5   ?   dcache__tlb_pmp__res_aligned_5  &(  dcache__tlb_pmp__io_pmp_cfg_w_2  |  dcache__tlb_pmp__res_ignore_5  ):  dcache__tlb_pmp__res_hit_4   ?   dcache__tlb_pmp__res_aligned_4  &(  dcache__tlb_pmp__io_pmp_cfg_w_3  |  dcache__tlb_pmp__res_ignore_4  ):  dcache__tlb_pmp__res_hit_3   ?   dcache__tlb_pmp__res_aligned_3  &(  dcache__tlb_pmp__io_pmp_cfg_w_4  |  dcache__tlb_pmp__res_ignore_3  ):  dcache__tlb_pmp__res_hit_2   ?   dcache__tlb_pmp__res_aligned_2  &(  dcache__tlb_pmp__io_pmp_cfg_w_5  |  dcache__tlb_pmp__res_ignore_2  ):  dcache__tlb_pmp__res_hit_1   ?   dcache__tlb_pmp__res_aligned_1  &(  dcache__tlb_pmp__io_pmp_cfg_w_6  |  dcache__tlb_pmp__res_ignore_1  ):  dcache__tlb_pmp__res_hit   ?   dcache__tlb_pmp__res_aligned  &(  dcache__tlb_pmp__io_pmp_cfg_w_7  |  dcache__tlb_pmp__res_ignore  ):  dcache__tlb_pmp__io_prv  [1];
    assign dcache__tlb_pmp__io_prv = dcache__s1_tlb_req_prv;
    assign dcache__tlb_pmp__io_pmp_cfg_l_0 = dcache__io_ptw_pmp_cfg_l_0;
    assign dcache__tlb_pmp__io_pmp_cfg_l_1 = dcache__io_ptw_pmp_cfg_l_1;
    assign dcache__tlb_pmp__io_pmp_cfg_l_2 = dcache__io_ptw_pmp_cfg_l_2;
    assign dcache__tlb_pmp__io_pmp_cfg_l_3 = dcache__io_ptw_pmp_cfg_l_3;
    assign dcache__tlb_pmp__io_pmp_cfg_l_4 = dcache__io_ptw_pmp_cfg_l_4;
    assign dcache__tlb_pmp__io_pmp_cfg_l_5 = dcache__io_ptw_pmp_cfg_l_5;
    assign dcache__tlb_pmp__io_pmp_cfg_l_6 = dcache__io_ptw_pmp_cfg_l_6;
    assign dcache__tlb_pmp__io_pmp_cfg_l_7 = dcache__io_ptw_pmp_cfg_l_7;
    assign dcache__tlb_pmp__io_pmp_cfg_a_0 = dcache__io_ptw_pmp_cfg_a_0;
    assign dcache__tlb_pmp__io_pmp_cfg_a_1 = dcache__io_ptw_pmp_cfg_a_1;
    assign dcache__tlb_pmp__io_pmp_cfg_a_2 = dcache__io_ptw_pmp_cfg_a_2;
    assign dcache__tlb_pmp__io_pmp_cfg_a_3 = dcache__io_ptw_pmp_cfg_a_3;
    assign dcache__tlb_pmp__io_pmp_cfg_a_4 = dcache__io_ptw_pmp_cfg_a_4;
    assign dcache__tlb_pmp__io_pmp_cfg_a_5 = dcache__io_ptw_pmp_cfg_a_5;
    assign dcache__tlb_pmp__io_pmp_cfg_a_6 = dcache__io_ptw_pmp_cfg_a_6;
    assign dcache__tlb_pmp__io_pmp_cfg_a_7 = dcache__io_ptw_pmp_cfg_a_7;
    assign dcache__tlb_pmp__io_pmp_cfg_w_0 = dcache__io_ptw_pmp_cfg_w_0;
    assign dcache__tlb_pmp__io_pmp_cfg_w_1 = dcache__io_ptw_pmp_cfg_w_1;
    assign dcache__tlb_pmp__io_pmp_cfg_w_2 = dcache__io_ptw_pmp_cfg_w_2;
    assign dcache__tlb_pmp__io_pmp_cfg_w_3 = dcache__io_ptw_pmp_cfg_w_3;
    assign dcache__tlb_pmp__io_pmp_cfg_w_4 = dcache__io_ptw_pmp_cfg_w_4;
    assign dcache__tlb_pmp__io_pmp_cfg_w_5 = dcache__io_ptw_pmp_cfg_w_5;
    assign dcache__tlb_pmp__io_pmp_cfg_w_6 = dcache__io_ptw_pmp_cfg_w_6;
    assign dcache__tlb_pmp__io_pmp_cfg_w_7 = dcache__io_ptw_pmp_cfg_w_7;
    assign dcache__tlb_pmp__io_pmp_cfg_r_0 = dcache__io_ptw_pmp_cfg_r_0;
    assign dcache__tlb_pmp__io_pmp_cfg_r_1 = dcache__io_ptw_pmp_cfg_r_1;
    assign dcache__tlb_pmp__io_pmp_cfg_r_2 = dcache__io_ptw_pmp_cfg_r_2;
    assign dcache__tlb_pmp__io_pmp_cfg_r_3 = dcache__io_ptw_pmp_cfg_r_3;
    assign dcache__tlb_pmp__io_pmp_cfg_r_4 = dcache__io_ptw_pmp_cfg_r_4;
    assign dcache__tlb_pmp__io_pmp_cfg_r_5 = dcache__io_ptw_pmp_cfg_r_5;
    assign dcache__tlb_pmp__io_pmp_cfg_r_6 = dcache__io_ptw_pmp_cfg_r_6;
    assign dcache__tlb_pmp__io_pmp_cfg_r_7 = dcache__io_ptw_pmp_cfg_r_7;
    assign dcache__tlb_pmp__io_pmp_addr_0 = dcache__io_ptw_pmp_addr_0;
    assign dcache__tlb_pmp__io_pmp_addr_1 = dcache__io_ptw_pmp_addr_1;
    assign dcache__tlb_pmp__io_pmp_addr_2 = dcache__io_ptw_pmp_addr_2;
    assign dcache__tlb_pmp__io_pmp_addr_3 = dcache__io_ptw_pmp_addr_3;
    assign dcache__tlb_pmp__io_pmp_addr_4 = dcache__io_ptw_pmp_addr_4;
    assign dcache__tlb_pmp__io_pmp_addr_5 = dcache__io_ptw_pmp_addr_5;
    assign dcache__tlb_pmp__io_pmp_addr_6 = dcache__io_ptw_pmp_addr_6;
    assign dcache__tlb_pmp__io_pmp_addr_7 = dcache__io_ptw_pmp_addr_7;
    assign dcache__tlb_pmp__io_pmp_mask_0 = dcache__io_ptw_pmp_mask_0;
    assign dcache__tlb_pmp__io_pmp_mask_1 = dcache__io_ptw_pmp_mask_1;
    assign dcache__tlb_pmp__io_pmp_mask_2 = dcache__io_ptw_pmp_mask_2;
    assign dcache__tlb_pmp__io_pmp_mask_3 = dcache__io_ptw_pmp_mask_3;
    assign dcache__tlb_pmp__io_pmp_mask_4 = dcache__io_ptw_pmp_mask_4;
    assign dcache__tlb_pmp__io_pmp_mask_5 = dcache__io_ptw_pmp_mask_5;
    assign dcache__tlb_pmp__io_pmp_mask_6 = dcache__io_ptw_pmp_mask_6;
    assign dcache__tlb_pmp__io_pmp_mask_7 = dcache__io_ptw_pmp_mask_7;
    assign dcache__tlb_pmp__io_addr = dcache__s1_tlb_req_vaddr[31:0];
    assign dcache__tlb_pmp__io_size = dcache__s1_tlb_req_size;
    assign dcache___tlb_pmp_io_r = dcache__tlb_pmp__io_r;
    assign dcache___tlb_pmp_io_w = dcache__tlb_pmp__io_w;


    wire  dcache__tlb_entries_barrier__io_x_u;
    wire  dcache__tlb_entries_barrier__io_x_ae_ptw;
    wire  dcache__tlb_entries_barrier__io_x_ae_final;
    wire  dcache__tlb_entries_barrier__io_x_pf;
    wire  dcache__tlb_entries_barrier__io_x_gf;
    wire  dcache__tlb_entries_barrier__io_x_sw;
    wire  dcache__tlb_entries_barrier__io_x_sx;
    wire  dcache__tlb_entries_barrier__io_x_sr;
    wire  dcache__tlb_entries_barrier__io_x_pw;
    wire  dcache__tlb_entries_barrier__io_x_px;
    wire  dcache__tlb_entries_barrier__io_x_pr;
    wire  dcache__tlb_entries_barrier__io_x_ppp;
    wire  dcache__tlb_entries_barrier__io_x_pal;
    wire  dcache__tlb_entries_barrier__io_x_paa;
    wire  dcache__tlb_entries_barrier__io_x_eff;
    wire  dcache__tlb_entries_barrier__io_x_c;
    wire  dcache__tlb_entries_barrier__io_y_u;
    wire  dcache__tlb_entries_barrier__io_y_ae_ptw;
    wire  dcache__tlb_entries_barrier__io_y_ae_final;
    wire  dcache__tlb_entries_barrier__io_y_pf;
    wire  dcache__tlb_entries_barrier__io_y_gf;
    wire  dcache__tlb_entries_barrier__io_y_sw;
    wire  dcache__tlb_entries_barrier__io_y_sx;
    wire  dcache__tlb_entries_barrier__io_y_sr;
    wire  dcache__tlb_entries_barrier__io_y_pw;
    wire  dcache__tlb_entries_barrier__io_y_px;
    wire  dcache__tlb_entries_barrier__io_y_pr;
    wire  dcache__tlb_entries_barrier__io_y_ppp;
    wire  dcache__tlb_entries_barrier__io_y_pal;
    wire  dcache__tlb_entries_barrier__io_y_paa;
    wire  dcache__tlb_entries_barrier__io_y_eff;
    wire  dcache__tlb_entries_barrier__io_y_c;
    wire  dcache__tlb_entries_barrier_1__io_x_u;
    wire  dcache__tlb_entries_barrier_1__io_x_ae_ptw;
    wire  dcache__tlb_entries_barrier_1__io_x_ae_final;
    wire  dcache__tlb_entries_barrier_1__io_x_pf;
    wire  dcache__tlb_entries_barrier_1__io_x_gf;
    wire  dcache__tlb_entries_barrier_1__io_x_sw;
    wire  dcache__tlb_entries_barrier_1__io_x_sx;
    wire  dcache__tlb_entries_barrier_1__io_x_sr;
    wire  dcache__tlb_entries_barrier_1__io_x_pw;
    wire  dcache__tlb_entries_barrier_1__io_x_px;
    wire  dcache__tlb_entries_barrier_1__io_x_pr;
    wire  dcache__tlb_entries_barrier_1__io_x_ppp;
    wire  dcache__tlb_entries_barrier_1__io_x_pal;
    wire  dcache__tlb_entries_barrier_1__io_x_paa;
    wire  dcache__tlb_entries_barrier_1__io_x_eff;
    wire  dcache__tlb_entries_barrier_1__io_x_c;
    wire  dcache__tlb_entries_barrier_1__io_y_u;
    wire  dcache__tlb_entries_barrier_1__io_y_ae_ptw;
    wire  dcache__tlb_entries_barrier_1__io_y_ae_final;
    wire  dcache__tlb_entries_barrier_1__io_y_pf;
    wire  dcache__tlb_entries_barrier_1__io_y_gf;
    wire  dcache__tlb_entries_barrier_1__io_y_sw;
    wire  dcache__tlb_entries_barrier_1__io_y_sx;
    wire  dcache__tlb_entries_barrier_1__io_y_sr;
    wire  dcache__tlb_entries_barrier_1__io_y_pw;
    wire  dcache__tlb_entries_barrier_1__io_y_px;
    wire  dcache__tlb_entries_barrier_1__io_y_pr;
    wire  dcache__tlb_entries_barrier_1__io_y_ppp;
    wire  dcache__tlb_entries_barrier_1__io_y_pal;
    wire  dcache__tlb_entries_barrier_1__io_y_paa;
    wire  dcache__tlb_entries_barrier_1__io_y_eff;
    wire  dcache__tlb_entries_barrier_1__io_y_c;
    wire  dcache__tlb_entries_barrier_2__io_x_u;
    wire  dcache__tlb_entries_barrier_2__io_x_ae_ptw;
    wire  dcache__tlb_entries_barrier_2__io_x_ae_final;
    wire  dcache__tlb_entries_barrier_2__io_x_pf;
    wire  dcache__tlb_entries_barrier_2__io_x_gf;
    wire  dcache__tlb_entries_barrier_2__io_x_sw;
    wire  dcache__tlb_entries_barrier_2__io_x_sx;
    wire  dcache__tlb_entries_barrier_2__io_x_sr;
    wire  dcache__tlb_entries_barrier_2__io_x_pw;
    wire  dcache__tlb_entries_barrier_2__io_x_px;
    wire  dcache__tlb_entries_barrier_2__io_x_pr;
    wire  dcache__tlb_entries_barrier_2__io_x_ppp;
    wire  dcache__tlb_entries_barrier_2__io_x_pal;
    wire  dcache__tlb_entries_barrier_2__io_x_paa;
    wire  dcache__tlb_entries_barrier_2__io_x_eff;
    wire  dcache__tlb_entries_barrier_2__io_x_c;
    wire  dcache__tlb_entries_barrier_2__io_y_u;
    wire  dcache__tlb_entries_barrier_2__io_y_ae_ptw;
    wire  dcache__tlb_entries_barrier_2__io_y_ae_final;
    wire  dcache__tlb_entries_barrier_2__io_y_pf;
    wire  dcache__tlb_entries_barrier_2__io_y_gf;
    wire  dcache__tlb_entries_barrier_2__io_y_sw;
    wire  dcache__tlb_entries_barrier_2__io_y_sx;
    wire  dcache__tlb_entries_barrier_2__io_y_sr;
    wire  dcache__tlb_entries_barrier_2__io_y_pw;
    wire  dcache__tlb_entries_barrier_2__io_y_px;
    wire  dcache__tlb_entries_barrier_2__io_y_pr;
    wire  dcache__tlb_entries_barrier_2__io_y_ppp;
    wire  dcache__tlb_entries_barrier_2__io_y_pal;
    wire  dcache__tlb_entries_barrier_2__io_y_paa;
    wire  dcache__tlb_entries_barrier_2__io_y_eff;
    wire  dcache__tlb_entries_barrier_2__io_y_c;
    wire  dcache__tlb_entries_barrier_3__io_x_u;
    wire  dcache__tlb_entries_barrier_3__io_x_ae_ptw;
    wire  dcache__tlb_entries_barrier_3__io_x_ae_final;
    wire  dcache__tlb_entries_barrier_3__io_x_pf;
    wire  dcache__tlb_entries_barrier_3__io_x_gf;
    wire  dcache__tlb_entries_barrier_3__io_x_sw;
    wire  dcache__tlb_entries_barrier_3__io_x_sx;
    wire  dcache__tlb_entries_barrier_3__io_x_sr;
    wire  dcache__tlb_entries_barrier_3__io_x_pw;
    wire  dcache__tlb_entries_barrier_3__io_x_px;
    wire  dcache__tlb_entries_barrier_3__io_x_pr;
    wire  dcache__tlb_entries_barrier_3__io_x_ppp;
    wire  dcache__tlb_entries_barrier_3__io_x_pal;
    wire  dcache__tlb_entries_barrier_3__io_x_paa;
    wire  dcache__tlb_entries_barrier_3__io_x_eff;
    wire  dcache__tlb_entries_barrier_3__io_x_c;
    wire  dcache__tlb_entries_barrier_3__io_y_u;
    wire  dcache__tlb_entries_barrier_3__io_y_ae_ptw;
    wire  dcache__tlb_entries_barrier_3__io_y_ae_final;
    wire  dcache__tlb_entries_barrier_3__io_y_pf;
    wire  dcache__tlb_entries_barrier_3__io_y_gf;
    wire  dcache__tlb_entries_barrier_3__io_y_sw;
    wire  dcache__tlb_entries_barrier_3__io_y_sx;
    wire  dcache__tlb_entries_barrier_3__io_y_sr;
    wire  dcache__tlb_entries_barrier_3__io_y_pw;
    wire  dcache__tlb_entries_barrier_3__io_y_px;
    wire  dcache__tlb_entries_barrier_3__io_y_pr;
    wire  dcache__tlb_entries_barrier_3__io_y_ppp;
    wire  dcache__tlb_entries_barrier_3__io_y_pal;
    wire  dcache__tlb_entries_barrier_3__io_y_paa;
    wire  dcache__tlb_entries_barrier_3__io_y_eff;
    wire  dcache__tlb_entries_barrier_3__io_y_c;
    wire  dcache__tlb_entries_barrier_4__io_x_u;
    wire  dcache__tlb_entries_barrier_4__io_x_ae_ptw;
    wire  dcache__tlb_entries_barrier_4__io_x_ae_final;
    wire  dcache__tlb_entries_barrier_4__io_x_pf;
    wire  dcache__tlb_entries_barrier_4__io_x_gf;
    wire  dcache__tlb_entries_barrier_4__io_x_sw;
    wire  dcache__tlb_entries_barrier_4__io_x_sx;
    wire  dcache__tlb_entries_barrier_4__io_x_sr;
    wire  dcache__tlb_entries_barrier_4__io_x_pw;
    wire  dcache__tlb_entries_barrier_4__io_x_px;
    wire  dcache__tlb_entries_barrier_4__io_x_pr;
    wire  dcache__tlb_entries_barrier_4__io_x_ppp;
    wire  dcache__tlb_entries_barrier_4__io_x_pal;
    wire  dcache__tlb_entries_barrier_4__io_x_paa;
    wire  dcache__tlb_entries_barrier_4__io_x_eff;
    wire  dcache__tlb_entries_barrier_4__io_x_c;
    wire  dcache__tlb_entries_barrier_4__io_y_u;
    wire  dcache__tlb_entries_barrier_4__io_y_ae_ptw;
    wire  dcache__tlb_entries_barrier_4__io_y_ae_final;
    wire  dcache__tlb_entries_barrier_4__io_y_pf;
    wire  dcache__tlb_entries_barrier_4__io_y_gf;
    wire  dcache__tlb_entries_barrier_4__io_y_sw;
    wire  dcache__tlb_entries_barrier_4__io_y_sx;
    wire  dcache__tlb_entries_barrier_4__io_y_sr;
    wire  dcache__tlb_entries_barrier_4__io_y_pw;
    wire  dcache__tlb_entries_barrier_4__io_y_px;
    wire  dcache__tlb_entries_barrier_4__io_y_pr;
    wire  dcache__tlb_entries_barrier_4__io_y_ppp;
    wire  dcache__tlb_entries_barrier_4__io_y_pal;
    wire  dcache__tlb_entries_barrier_4__io_y_paa;
    wire  dcache__tlb_entries_barrier_4__io_y_eff;
    wire  dcache__tlb_entries_barrier_4__io_y_c;
    wire  dcache__tlb_entries_barrier_5__io_x_u;
    wire  dcache__tlb_entries_barrier_5__io_x_ae_ptw;
    wire  dcache__tlb_entries_barrier_5__io_x_ae_final;
    wire  dcache__tlb_entries_barrier_5__io_x_pf;
    wire  dcache__tlb_entries_barrier_5__io_x_gf;
    wire  dcache__tlb_entries_barrier_5__io_x_sw;
    wire  dcache__tlb_entries_barrier_5__io_x_sx;
    wire  dcache__tlb_entries_barrier_5__io_x_sr;
    wire  dcache__tlb_entries_barrier_5__io_x_pw;
    wire  dcache__tlb_entries_barrier_5__io_x_px;
    wire  dcache__tlb_entries_barrier_5__io_x_pr;
    wire  dcache__tlb_entries_barrier_5__io_x_ppp;
    wire  dcache__tlb_entries_barrier_5__io_x_pal;
    wire  dcache__tlb_entries_barrier_5__io_x_paa;
    wire  dcache__tlb_entries_barrier_5__io_x_eff;
    wire  dcache__tlb_entries_barrier_5__io_x_c;
    wire  dcache__tlb_entries_barrier_5__io_y_u;
    wire  dcache__tlb_entries_barrier_5__io_y_ae_ptw;
    wire  dcache__tlb_entries_barrier_5__io_y_ae_final;
    wire  dcache__tlb_entries_barrier_5__io_y_pf;
    wire  dcache__tlb_entries_barrier_5__io_y_gf;
    wire  dcache__tlb_entries_barrier_5__io_y_sw;
    wire  dcache__tlb_entries_barrier_5__io_y_sx;
    wire  dcache__tlb_entries_barrier_5__io_y_sr;
    wire  dcache__tlb_entries_barrier_5__io_y_pw;
    wire  dcache__tlb_entries_barrier_5__io_y_px;
    wire  dcache__tlb_entries_barrier_5__io_y_pr;
    wire  dcache__tlb_entries_barrier_5__io_y_ppp;
    wire  dcache__tlb_entries_barrier_5__io_y_pal;
    wire  dcache__tlb_entries_barrier_5__io_y_paa;
    wire  dcache__tlb_entries_barrier_5__io_y_eff;
    wire  dcache__tlb_entries_barrier_5__io_y_c;
    wire  dcache__pma_checker_entries_barrier__io_x_u;
    wire  dcache__pma_checker_entries_barrier__io_x_ae_ptw;
    wire  dcache__pma_checker_entries_barrier__io_x_ae_final;
    wire  dcache__pma_checker_entries_barrier__io_x_pf;
    wire  dcache__pma_checker_entries_barrier__io_x_gf;
    wire  dcache__pma_checker_entries_barrier__io_x_sw;
    wire  dcache__pma_checker_entries_barrier__io_x_sx;
    wire  dcache__pma_checker_entries_barrier__io_x_sr;
    wire  dcache__pma_checker_entries_barrier__io_x_pw;
    wire  dcache__pma_checker_entries_barrier__io_x_px;
    wire  dcache__pma_checker_entries_barrier__io_x_pr;
    wire  dcache__pma_checker_entries_barrier__io_x_ppp;
    wire  dcache__pma_checker_entries_barrier__io_x_pal;
    wire  dcache__pma_checker_entries_barrier__io_x_paa;
    wire  dcache__pma_checker_entries_barrier__io_x_eff;
    wire  dcache__pma_checker_entries_barrier__io_x_c;
    wire  dcache__pma_checker_entries_barrier__io_y_u;
    wire  dcache__pma_checker_entries_barrier__io_y_ae_ptw;
    wire  dcache__pma_checker_entries_barrier__io_y_ae_final;
    wire  dcache__pma_checker_entries_barrier__io_y_pf;
    wire  dcache__pma_checker_entries_barrier__io_y_gf;
    wire  dcache__pma_checker_entries_barrier__io_y_sw;
    wire  dcache__pma_checker_entries_barrier__io_y_sx;
    wire  dcache__pma_checker_entries_barrier__io_y_sr;
    wire  dcache__pma_checker_entries_barrier__io_y_pw;
    wire  dcache__pma_checker_entries_barrier__io_y_px;
    wire  dcache__pma_checker_entries_barrier__io_y_pr;
    wire  dcache__pma_checker_entries_barrier__io_y_ppp;
    wire  dcache__pma_checker_entries_barrier__io_y_pal;
    wire  dcache__pma_checker_entries_barrier__io_y_paa;
    wire  dcache__pma_checker_entries_barrier__io_y_eff;
    wire  dcache__pma_checker_entries_barrier__io_y_c;
    wire  dcache__pma_checker_entries_barrier_1__io_x_u;
    wire  dcache__pma_checker_entries_barrier_1__io_x_ae_ptw;
    wire  dcache__pma_checker_entries_barrier_1__io_x_ae_final;
    wire  dcache__pma_checker_entries_barrier_1__io_x_pf;
    wire  dcache__pma_checker_entries_barrier_1__io_x_gf;
    wire  dcache__pma_checker_entries_barrier_1__io_x_sw;
    wire  dcache__pma_checker_entries_barrier_1__io_x_sx;
    wire  dcache__pma_checker_entries_barrier_1__io_x_sr;
    wire  dcache__pma_checker_entries_barrier_1__io_x_pw;
    wire  dcache__pma_checker_entries_barrier_1__io_x_px;
    wire  dcache__pma_checker_entries_barrier_1__io_x_pr;
    wire  dcache__pma_checker_entries_barrier_1__io_x_ppp;
    wire  dcache__pma_checker_entries_barrier_1__io_x_pal;
    wire  dcache__pma_checker_entries_barrier_1__io_x_paa;
    wire  dcache__pma_checker_entries_barrier_1__io_x_eff;
    wire  dcache__pma_checker_entries_barrier_1__io_x_c;
    wire  dcache__pma_checker_entries_barrier_1__io_y_u;
    wire  dcache__pma_checker_entries_barrier_1__io_y_ae_ptw;
    wire  dcache__pma_checker_entries_barrier_1__io_y_ae_final;
    wire  dcache__pma_checker_entries_barrier_1__io_y_pf;
    wire  dcache__pma_checker_entries_barrier_1__io_y_gf;
    wire  dcache__pma_checker_entries_barrier_1__io_y_sw;
    wire  dcache__pma_checker_entries_barrier_1__io_y_sx;
    wire  dcache__pma_checker_entries_barrier_1__io_y_sr;
    wire  dcache__pma_checker_entries_barrier_1__io_y_pw;
    wire  dcache__pma_checker_entries_barrier_1__io_y_px;
    wire  dcache__pma_checker_entries_barrier_1__io_y_pr;
    wire  dcache__pma_checker_entries_barrier_1__io_y_ppp;
    wire  dcache__pma_checker_entries_barrier_1__io_y_pal;
    wire  dcache__pma_checker_entries_barrier_1__io_y_paa;
    wire  dcache__pma_checker_entries_barrier_1__io_y_eff;
    wire  dcache__pma_checker_entries_barrier_1__io_y_c;
    wire  dcache__pma_checker_entries_barrier_2__io_x_u;
    wire  dcache__pma_checker_entries_barrier_2__io_x_ae_ptw;
    wire  dcache__pma_checker_entries_barrier_2__io_x_ae_final;
    wire  dcache__pma_checker_entries_barrier_2__io_x_pf;
    wire  dcache__pma_checker_entries_barrier_2__io_x_gf;
    wire  dcache__pma_checker_entries_barrier_2__io_x_sw;
    wire  dcache__pma_checker_entries_barrier_2__io_x_sx;
    wire  dcache__pma_checker_entries_barrier_2__io_x_sr;
    wire  dcache__pma_checker_entries_barrier_2__io_x_pw;
    wire  dcache__pma_checker_entries_barrier_2__io_x_px;
    wire  dcache__pma_checker_entries_barrier_2__io_x_pr;
    wire  dcache__pma_checker_entries_barrier_2__io_x_ppp;
    wire  dcache__pma_checker_entries_barrier_2__io_x_pal;
    wire  dcache__pma_checker_entries_barrier_2__io_x_paa;
    wire  dcache__pma_checker_entries_barrier_2__io_x_eff;
    wire  dcache__pma_checker_entries_barrier_2__io_x_c;
    wire  dcache__pma_checker_entries_barrier_2__io_y_u;
    wire  dcache__pma_checker_entries_barrier_2__io_y_ae_ptw;
    wire  dcache__pma_checker_entries_barrier_2__io_y_ae_final;
    wire  dcache__pma_checker_entries_barrier_2__io_y_pf;
    wire  dcache__pma_checker_entries_barrier_2__io_y_gf;
    wire  dcache__pma_checker_entries_barrier_2__io_y_sw;
    wire  dcache__pma_checker_entries_barrier_2__io_y_sx;
    wire  dcache__pma_checker_entries_barrier_2__io_y_sr;
    wire  dcache__pma_checker_entries_barrier_2__io_y_pw;
    wire  dcache__pma_checker_entries_barrier_2__io_y_px;
    wire  dcache__pma_checker_entries_barrier_2__io_y_pr;
    wire  dcache__pma_checker_entries_barrier_2__io_y_ppp;
    wire  dcache__pma_checker_entries_barrier_2__io_y_pal;
    wire  dcache__pma_checker_entries_barrier_2__io_y_paa;
    wire  dcache__pma_checker_entries_barrier_2__io_y_eff;
    wire  dcache__pma_checker_entries_barrier_2__io_y_c;
    wire  dcache__pma_checker_entries_barrier_3__io_x_u;
    wire  dcache__pma_checker_entries_barrier_3__io_x_ae_ptw;
    wire  dcache__pma_checker_entries_barrier_3__io_x_ae_final;
    wire  dcache__pma_checker_entries_barrier_3__io_x_pf;
    wire  dcache__pma_checker_entries_barrier_3__io_x_gf;
    wire  dcache__pma_checker_entries_barrier_3__io_x_sw;
    wire  dcache__pma_checker_entries_barrier_3__io_x_sx;
    wire  dcache__pma_checker_entries_barrier_3__io_x_sr;
    wire  dcache__pma_checker_entries_barrier_3__io_x_pw;
    wire  dcache__pma_checker_entries_barrier_3__io_x_px;
    wire  dcache__pma_checker_entries_barrier_3__io_x_pr;
    wire  dcache__pma_checker_entries_barrier_3__io_x_ppp;
    wire  dcache__pma_checker_entries_barrier_3__io_x_pal;
    wire  dcache__pma_checker_entries_barrier_3__io_x_paa;
    wire  dcache__pma_checker_entries_barrier_3__io_x_eff;
    wire  dcache__pma_checker_entries_barrier_3__io_x_c;
    wire  dcache__pma_checker_entries_barrier_3__io_y_u;
    wire  dcache__pma_checker_entries_barrier_3__io_y_ae_ptw;
    wire  dcache__pma_checker_entries_barrier_3__io_y_ae_final;
    wire  dcache__pma_checker_entries_barrier_3__io_y_pf;
    wire  dcache__pma_checker_entries_barrier_3__io_y_gf;
    wire  dcache__pma_checker_entries_barrier_3__io_y_sw;
    wire  dcache__pma_checker_entries_barrier_3__io_y_sx;
    wire  dcache__pma_checker_entries_barrier_3__io_y_sr;
    wire  dcache__pma_checker_entries_barrier_3__io_y_pw;
    wire  dcache__pma_checker_entries_barrier_3__io_y_px;
    wire  dcache__pma_checker_entries_barrier_3__io_y_pr;
    wire  dcache__pma_checker_entries_barrier_3__io_y_ppp;
    wire  dcache__pma_checker_entries_barrier_3__io_y_pal;
    wire  dcache__pma_checker_entries_barrier_3__io_y_paa;
    wire  dcache__pma_checker_entries_barrier_3__io_y_eff;
    wire  dcache__pma_checker_entries_barrier_3__io_y_c;
    wire  dcache__pma_checker_entries_barrier_4__io_x_u;
    wire  dcache__pma_checker_entries_barrier_4__io_x_ae_ptw;
    wire  dcache__pma_checker_entries_barrier_4__io_x_ae_final;
    wire  dcache__pma_checker_entries_barrier_4__io_x_pf;
    wire  dcache__pma_checker_entries_barrier_4__io_x_gf;
    wire  dcache__pma_checker_entries_barrier_4__io_x_sw;
    wire  dcache__pma_checker_entries_barrier_4__io_x_sx;
    wire  dcache__pma_checker_entries_barrier_4__io_x_sr;
    wire  dcache__pma_checker_entries_barrier_4__io_x_pw;
    wire  dcache__pma_checker_entries_barrier_4__io_x_px;
    wire  dcache__pma_checker_entries_barrier_4__io_x_pr;
    wire  dcache__pma_checker_entries_barrier_4__io_x_ppp;
    wire  dcache__pma_checker_entries_barrier_4__io_x_pal;
    wire  dcache__pma_checker_entries_barrier_4__io_x_paa;
    wire  dcache__pma_checker_entries_barrier_4__io_x_eff;
    wire  dcache__pma_checker_entries_barrier_4__io_x_c;
    wire  dcache__pma_checker_entries_barrier_4__io_y_u;
    wire  dcache__pma_checker_entries_barrier_4__io_y_ae_ptw;
    wire  dcache__pma_checker_entries_barrier_4__io_y_ae_final;
    wire  dcache__pma_checker_entries_barrier_4__io_y_pf;
    wire  dcache__pma_checker_entries_barrier_4__io_y_gf;
    wire  dcache__pma_checker_entries_barrier_4__io_y_sw;
    wire  dcache__pma_checker_entries_barrier_4__io_y_sx;
    wire  dcache__pma_checker_entries_barrier_4__io_y_sr;
    wire  dcache__pma_checker_entries_barrier_4__io_y_pw;
    wire  dcache__pma_checker_entries_barrier_4__io_y_px;
    wire  dcache__pma_checker_entries_barrier_4__io_y_pr;
    wire  dcache__pma_checker_entries_barrier_4__io_y_ppp;
    wire  dcache__pma_checker_entries_barrier_4__io_y_pal;
    wire  dcache__pma_checker_entries_barrier_4__io_y_paa;
    wire  dcache__pma_checker_entries_barrier_4__io_y_eff;
    wire  dcache__pma_checker_entries_barrier_4__io_y_c;

    assign   dcache__tlb_entries_barrier__io_y_u  =  dcache__tlb_entries_barrier__io_x_u  ;
    assign   dcache__tlb_entries_barrier__io_y_ae_ptw  =  dcache__tlb_entries_barrier__io_x_ae_ptw  ;
    assign   dcache__tlb_entries_barrier__io_y_ae_final  =  dcache__tlb_entries_barrier__io_x_ae_final  ;
    assign   dcache__tlb_entries_barrier__io_y_pf  =  dcache__tlb_entries_barrier__io_x_pf  ;
    assign   dcache__tlb_entries_barrier__io_y_gf  =  dcache__tlb_entries_barrier__io_x_gf  ;
    assign   dcache__tlb_entries_barrier__io_y_sw  =  dcache__tlb_entries_barrier__io_x_sw  ;
    assign   dcache__tlb_entries_barrier__io_y_sx  =  dcache__tlb_entries_barrier__io_x_sx  ;
    assign   dcache__tlb_entries_barrier__io_y_sr  =  dcache__tlb_entries_barrier__io_x_sr  ;
    assign   dcache__tlb_entries_barrier__io_y_pw  =  dcache__tlb_entries_barrier__io_x_pw  ;
    assign   dcache__tlb_entries_barrier__io_y_px  =  dcache__tlb_entries_barrier__io_x_px  ;
    assign   dcache__tlb_entries_barrier__io_y_pr  =  dcache__tlb_entries_barrier__io_x_pr  ;
    assign   dcache__tlb_entries_barrier__io_y_ppp  =  dcache__tlb_entries_barrier__io_x_ppp  ;
    assign   dcache__tlb_entries_barrier__io_y_pal  =  dcache__tlb_entries_barrier__io_x_pal  ;
    assign   dcache__tlb_entries_barrier__io_y_paa  =  dcache__tlb_entries_barrier__io_x_paa  ;
    assign   dcache__tlb_entries_barrier__io_y_eff  =  dcache__tlb_entries_barrier__io_x_eff  ;
    assign   dcache__tlb_entries_barrier__io_y_c  =  dcache__tlb_entries_barrier__io_x_c  ;



    assign   dcache__tlb_entries_barrier_1__io_y_u  =  dcache__tlb_entries_barrier_1__io_x_u  ;
    assign   dcache__tlb_entries_barrier_1__io_y_ae_ptw  =  dcache__tlb_entries_barrier_1__io_x_ae_ptw  ;
    assign   dcache__tlb_entries_barrier_1__io_y_ae_final  =  dcache__tlb_entries_barrier_1__io_x_ae_final  ;
    assign   dcache__tlb_entries_barrier_1__io_y_pf  =  dcache__tlb_entries_barrier_1__io_x_pf  ;
    assign   dcache__tlb_entries_barrier_1__io_y_gf  =  dcache__tlb_entries_barrier_1__io_x_gf  ;
    assign   dcache__tlb_entries_barrier_1__io_y_sw  =  dcache__tlb_entries_barrier_1__io_x_sw  ;
    assign   dcache__tlb_entries_barrier_1__io_y_sx  =  dcache__tlb_entries_barrier_1__io_x_sx  ;
    assign   dcache__tlb_entries_barrier_1__io_y_sr  =  dcache__tlb_entries_barrier_1__io_x_sr  ;
    assign   dcache__tlb_entries_barrier_1__io_y_pw  =  dcache__tlb_entries_barrier_1__io_x_pw  ;
    assign   dcache__tlb_entries_barrier_1__io_y_px  =  dcache__tlb_entries_barrier_1__io_x_px  ;
    assign   dcache__tlb_entries_barrier_1__io_y_pr  =  dcache__tlb_entries_barrier_1__io_x_pr  ;
    assign   dcache__tlb_entries_barrier_1__io_y_ppp  =  dcache__tlb_entries_barrier_1__io_x_ppp  ;
    assign   dcache__tlb_entries_barrier_1__io_y_pal  =  dcache__tlb_entries_barrier_1__io_x_pal  ;
    assign   dcache__tlb_entries_barrier_1__io_y_paa  =  dcache__tlb_entries_barrier_1__io_x_paa  ;
    assign   dcache__tlb_entries_barrier_1__io_y_eff  =  dcache__tlb_entries_barrier_1__io_x_eff  ;
    assign   dcache__tlb_entries_barrier_1__io_y_c  =  dcache__tlb_entries_barrier_1__io_x_c  ;



    assign   dcache__tlb_entries_barrier_2__io_y_u  =  dcache__tlb_entries_barrier_2__io_x_u  ;
    assign   dcache__tlb_entries_barrier_2__io_y_ae_ptw  =  dcache__tlb_entries_barrier_2__io_x_ae_ptw  ;
    assign   dcache__tlb_entries_barrier_2__io_y_ae_final  =  dcache__tlb_entries_barrier_2__io_x_ae_final  ;
    assign   dcache__tlb_entries_barrier_2__io_y_pf  =  dcache__tlb_entries_barrier_2__io_x_pf  ;
    assign   dcache__tlb_entries_barrier_2__io_y_gf  =  dcache__tlb_entries_barrier_2__io_x_gf  ;
    assign   dcache__tlb_entries_barrier_2__io_y_sw  =  dcache__tlb_entries_barrier_2__io_x_sw  ;
    assign   dcache__tlb_entries_barrier_2__io_y_sx  =  dcache__tlb_entries_barrier_2__io_x_sx  ;
    assign   dcache__tlb_entries_barrier_2__io_y_sr  =  dcache__tlb_entries_barrier_2__io_x_sr  ;
    assign   dcache__tlb_entries_barrier_2__io_y_pw  =  dcache__tlb_entries_barrier_2__io_x_pw  ;
    assign   dcache__tlb_entries_barrier_2__io_y_px  =  dcache__tlb_entries_barrier_2__io_x_px  ;
    assign   dcache__tlb_entries_barrier_2__io_y_pr  =  dcache__tlb_entries_barrier_2__io_x_pr  ;
    assign   dcache__tlb_entries_barrier_2__io_y_ppp  =  dcache__tlb_entries_barrier_2__io_x_ppp  ;
    assign   dcache__tlb_entries_barrier_2__io_y_pal  =  dcache__tlb_entries_barrier_2__io_x_pal  ;
    assign   dcache__tlb_entries_barrier_2__io_y_paa  =  dcache__tlb_entries_barrier_2__io_x_paa  ;
    assign   dcache__tlb_entries_barrier_2__io_y_eff  =  dcache__tlb_entries_barrier_2__io_x_eff  ;
    assign   dcache__tlb_entries_barrier_2__io_y_c  =  dcache__tlb_entries_barrier_2__io_x_c  ;



    assign   dcache__tlb_entries_barrier_3__io_y_u  =  dcache__tlb_entries_barrier_3__io_x_u  ;
    assign   dcache__tlb_entries_barrier_3__io_y_ae_ptw  =  dcache__tlb_entries_barrier_3__io_x_ae_ptw  ;
    assign   dcache__tlb_entries_barrier_3__io_y_ae_final  =  dcache__tlb_entries_barrier_3__io_x_ae_final  ;
    assign   dcache__tlb_entries_barrier_3__io_y_pf  =  dcache__tlb_entries_barrier_3__io_x_pf  ;
    assign   dcache__tlb_entries_barrier_3__io_y_gf  =  dcache__tlb_entries_barrier_3__io_x_gf  ;
    assign   dcache__tlb_entries_barrier_3__io_y_sw  =  dcache__tlb_entries_barrier_3__io_x_sw  ;
    assign   dcache__tlb_entries_barrier_3__io_y_sx  =  dcache__tlb_entries_barrier_3__io_x_sx  ;
    assign   dcache__tlb_entries_barrier_3__io_y_sr  =  dcache__tlb_entries_barrier_3__io_x_sr  ;
    assign   dcache__tlb_entries_barrier_3__io_y_pw  =  dcache__tlb_entries_barrier_3__io_x_pw  ;
    assign   dcache__tlb_entries_barrier_3__io_y_px  =  dcache__tlb_entries_barrier_3__io_x_px  ;
    assign   dcache__tlb_entries_barrier_3__io_y_pr  =  dcache__tlb_entries_barrier_3__io_x_pr  ;
    assign   dcache__tlb_entries_barrier_3__io_y_ppp  =  dcache__tlb_entries_barrier_3__io_x_ppp  ;
    assign   dcache__tlb_entries_barrier_3__io_y_pal  =  dcache__tlb_entries_barrier_3__io_x_pal  ;
    assign   dcache__tlb_entries_barrier_3__io_y_paa  =  dcache__tlb_entries_barrier_3__io_x_paa  ;
    assign   dcache__tlb_entries_barrier_3__io_y_eff  =  dcache__tlb_entries_barrier_3__io_x_eff  ;
    assign   dcache__tlb_entries_barrier_3__io_y_c  =  dcache__tlb_entries_barrier_3__io_x_c  ;



    assign   dcache__tlb_entries_barrier_4__io_y_u  =  dcache__tlb_entries_barrier_4__io_x_u  ;
    assign   dcache__tlb_entries_barrier_4__io_y_ae_ptw  =  dcache__tlb_entries_barrier_4__io_x_ae_ptw  ;
    assign   dcache__tlb_entries_barrier_4__io_y_ae_final  =  dcache__tlb_entries_barrier_4__io_x_ae_final  ;
    assign   dcache__tlb_entries_barrier_4__io_y_pf  =  dcache__tlb_entries_barrier_4__io_x_pf  ;
    assign   dcache__tlb_entries_barrier_4__io_y_gf  =  dcache__tlb_entries_barrier_4__io_x_gf  ;
    assign   dcache__tlb_entries_barrier_4__io_y_sw  =  dcache__tlb_entries_barrier_4__io_x_sw  ;
    assign   dcache__tlb_entries_barrier_4__io_y_sx  =  dcache__tlb_entries_barrier_4__io_x_sx  ;
    assign   dcache__tlb_entries_barrier_4__io_y_sr  =  dcache__tlb_entries_barrier_4__io_x_sr  ;
    assign   dcache__tlb_entries_barrier_4__io_y_pw  =  dcache__tlb_entries_barrier_4__io_x_pw  ;
    assign   dcache__tlb_entries_barrier_4__io_y_px  =  dcache__tlb_entries_barrier_4__io_x_px  ;
    assign   dcache__tlb_entries_barrier_4__io_y_pr  =  dcache__tlb_entries_barrier_4__io_x_pr  ;
    assign   dcache__tlb_entries_barrier_4__io_y_ppp  =  dcache__tlb_entries_barrier_4__io_x_ppp  ;
    assign   dcache__tlb_entries_barrier_4__io_y_pal  =  dcache__tlb_entries_barrier_4__io_x_pal  ;
    assign   dcache__tlb_entries_barrier_4__io_y_paa  =  dcache__tlb_entries_barrier_4__io_x_paa  ;
    assign   dcache__tlb_entries_barrier_4__io_y_eff  =  dcache__tlb_entries_barrier_4__io_x_eff  ;
    assign   dcache__tlb_entries_barrier_4__io_y_c  =  dcache__tlb_entries_barrier_4__io_x_c  ;



    assign   dcache__tlb_entries_barrier_5__io_y_u  =  dcache__tlb_entries_barrier_5__io_x_u  ;
    assign   dcache__tlb_entries_barrier_5__io_y_ae_ptw  =  dcache__tlb_entries_barrier_5__io_x_ae_ptw  ;
    assign   dcache__tlb_entries_barrier_5__io_y_ae_final  =  dcache__tlb_entries_barrier_5__io_x_ae_final  ;
    assign   dcache__tlb_entries_barrier_5__io_y_pf  =  dcache__tlb_entries_barrier_5__io_x_pf  ;
    assign   dcache__tlb_entries_barrier_5__io_y_gf  =  dcache__tlb_entries_barrier_5__io_x_gf  ;
    assign   dcache__tlb_entries_barrier_5__io_y_sw  =  dcache__tlb_entries_barrier_5__io_x_sw  ;
    assign   dcache__tlb_entries_barrier_5__io_y_sx  =  dcache__tlb_entries_barrier_5__io_x_sx  ;
    assign   dcache__tlb_entries_barrier_5__io_y_sr  =  dcache__tlb_entries_barrier_5__io_x_sr  ;
    assign   dcache__tlb_entries_barrier_5__io_y_pw  =  dcache__tlb_entries_barrier_5__io_x_pw  ;
    assign   dcache__tlb_entries_barrier_5__io_y_px  =  dcache__tlb_entries_barrier_5__io_x_px  ;
    assign   dcache__tlb_entries_barrier_5__io_y_pr  =  dcache__tlb_entries_barrier_5__io_x_pr  ;
    assign   dcache__tlb_entries_barrier_5__io_y_ppp  =  dcache__tlb_entries_barrier_5__io_x_ppp  ;
    assign   dcache__tlb_entries_barrier_5__io_y_pal  =  dcache__tlb_entries_barrier_5__io_x_pal  ;
    assign   dcache__tlb_entries_barrier_5__io_y_paa  =  dcache__tlb_entries_barrier_5__io_x_paa  ;
    assign   dcache__tlb_entries_barrier_5__io_y_eff  =  dcache__tlb_entries_barrier_5__io_x_eff  ;
    assign   dcache__tlb_entries_barrier_5__io_y_c  =  dcache__tlb_entries_barrier_5__io_x_c  ;



    assign   dcache__pma_checker_entries_barrier__io_y_u  =  dcache__pma_checker_entries_barrier__io_x_u  ;
    assign   dcache__pma_checker_entries_barrier__io_y_ae_ptw  =  dcache__pma_checker_entries_barrier__io_x_ae_ptw  ;
    assign   dcache__pma_checker_entries_barrier__io_y_ae_final  =  dcache__pma_checker_entries_barrier__io_x_ae_final  ;
    assign   dcache__pma_checker_entries_barrier__io_y_pf  =  dcache__pma_checker_entries_barrier__io_x_pf  ;
    assign   dcache__pma_checker_entries_barrier__io_y_gf  =  dcache__pma_checker_entries_barrier__io_x_gf  ;
    assign   dcache__pma_checker_entries_barrier__io_y_sw  =  dcache__pma_checker_entries_barrier__io_x_sw  ;
    assign   dcache__pma_checker_entries_barrier__io_y_sx  =  dcache__pma_checker_entries_barrier__io_x_sx  ;
    assign   dcache__pma_checker_entries_barrier__io_y_sr  =  dcache__pma_checker_entries_barrier__io_x_sr  ;
    assign   dcache__pma_checker_entries_barrier__io_y_pw  =  dcache__pma_checker_entries_barrier__io_x_pw  ;
    assign   dcache__pma_checker_entries_barrier__io_y_px  =  dcache__pma_checker_entries_barrier__io_x_px  ;
    assign   dcache__pma_checker_entries_barrier__io_y_pr  =  dcache__pma_checker_entries_barrier__io_x_pr  ;
    assign   dcache__pma_checker_entries_barrier__io_y_ppp  =  dcache__pma_checker_entries_barrier__io_x_ppp  ;
    assign   dcache__pma_checker_entries_barrier__io_y_pal  =  dcache__pma_checker_entries_barrier__io_x_pal  ;
    assign   dcache__pma_checker_entries_barrier__io_y_paa  =  dcache__pma_checker_entries_barrier__io_x_paa  ;
    assign   dcache__pma_checker_entries_barrier__io_y_eff  =  dcache__pma_checker_entries_barrier__io_x_eff  ;
    assign   dcache__pma_checker_entries_barrier__io_y_c  =  dcache__pma_checker_entries_barrier__io_x_c  ;



    assign   dcache__pma_checker_entries_barrier_1__io_y_u  =  dcache__pma_checker_entries_barrier_1__io_x_u  ;
    assign   dcache__pma_checker_entries_barrier_1__io_y_ae_ptw  =  dcache__pma_checker_entries_barrier_1__io_x_ae_ptw  ;
    assign   dcache__pma_checker_entries_barrier_1__io_y_ae_final  =  dcache__pma_checker_entries_barrier_1__io_x_ae_final  ;
    assign   dcache__pma_checker_entries_barrier_1__io_y_pf  =  dcache__pma_checker_entries_barrier_1__io_x_pf  ;
    assign   dcache__pma_checker_entries_barrier_1__io_y_gf  =  dcache__pma_checker_entries_barrier_1__io_x_gf  ;
    assign   dcache__pma_checker_entries_barrier_1__io_y_sw  =  dcache__pma_checker_entries_barrier_1__io_x_sw  ;
    assign   dcache__pma_checker_entries_barrier_1__io_y_sx  =  dcache__pma_checker_entries_barrier_1__io_x_sx  ;
    assign   dcache__pma_checker_entries_barrier_1__io_y_sr  =  dcache__pma_checker_entries_barrier_1__io_x_sr  ;
    assign   dcache__pma_checker_entries_barrier_1__io_y_pw  =  dcache__pma_checker_entries_barrier_1__io_x_pw  ;
    assign   dcache__pma_checker_entries_barrier_1__io_y_px  =  dcache__pma_checker_entries_barrier_1__io_x_px  ;
    assign   dcache__pma_checker_entries_barrier_1__io_y_pr  =  dcache__pma_checker_entries_barrier_1__io_x_pr  ;
    assign   dcache__pma_checker_entries_barrier_1__io_y_ppp  =  dcache__pma_checker_entries_barrier_1__io_x_ppp  ;
    assign   dcache__pma_checker_entries_barrier_1__io_y_pal  =  dcache__pma_checker_entries_barrier_1__io_x_pal  ;
    assign   dcache__pma_checker_entries_barrier_1__io_y_paa  =  dcache__pma_checker_entries_barrier_1__io_x_paa  ;
    assign   dcache__pma_checker_entries_barrier_1__io_y_eff  =  dcache__pma_checker_entries_barrier_1__io_x_eff  ;
    assign   dcache__pma_checker_entries_barrier_1__io_y_c  =  dcache__pma_checker_entries_barrier_1__io_x_c  ;



    assign   dcache__pma_checker_entries_barrier_2__io_y_u  =  dcache__pma_checker_entries_barrier_2__io_x_u  ;
    assign   dcache__pma_checker_entries_barrier_2__io_y_ae_ptw  =  dcache__pma_checker_entries_barrier_2__io_x_ae_ptw  ;
    assign   dcache__pma_checker_entries_barrier_2__io_y_ae_final  =  dcache__pma_checker_entries_barrier_2__io_x_ae_final  ;
    assign   dcache__pma_checker_entries_barrier_2__io_y_pf  =  dcache__pma_checker_entries_barrier_2__io_x_pf  ;
    assign   dcache__pma_checker_entries_barrier_2__io_y_gf  =  dcache__pma_checker_entries_barrier_2__io_x_gf  ;
    assign   dcache__pma_checker_entries_barrier_2__io_y_sw  =  dcache__pma_checker_entries_barrier_2__io_x_sw  ;
    assign   dcache__pma_checker_entries_barrier_2__io_y_sx  =  dcache__pma_checker_entries_barrier_2__io_x_sx  ;
    assign   dcache__pma_checker_entries_barrier_2__io_y_sr  =  dcache__pma_checker_entries_barrier_2__io_x_sr  ;
    assign   dcache__pma_checker_entries_barrier_2__io_y_pw  =  dcache__pma_checker_entries_barrier_2__io_x_pw  ;
    assign   dcache__pma_checker_entries_barrier_2__io_y_px  =  dcache__pma_checker_entries_barrier_2__io_x_px  ;
    assign   dcache__pma_checker_entries_barrier_2__io_y_pr  =  dcache__pma_checker_entries_barrier_2__io_x_pr  ;
    assign   dcache__pma_checker_entries_barrier_2__io_y_ppp  =  dcache__pma_checker_entries_barrier_2__io_x_ppp  ;
    assign   dcache__pma_checker_entries_barrier_2__io_y_pal  =  dcache__pma_checker_entries_barrier_2__io_x_pal  ;
    assign   dcache__pma_checker_entries_barrier_2__io_y_paa  =  dcache__pma_checker_entries_barrier_2__io_x_paa  ;
    assign   dcache__pma_checker_entries_barrier_2__io_y_eff  =  dcache__pma_checker_entries_barrier_2__io_x_eff  ;
    assign   dcache__pma_checker_entries_barrier_2__io_y_c  =  dcache__pma_checker_entries_barrier_2__io_x_c  ;



    assign   dcache__pma_checker_entries_barrier_3__io_y_u  =  dcache__pma_checker_entries_barrier_3__io_x_u  ;
    assign   dcache__pma_checker_entries_barrier_3__io_y_ae_ptw  =  dcache__pma_checker_entries_barrier_3__io_x_ae_ptw  ;
    assign   dcache__pma_checker_entries_barrier_3__io_y_ae_final  =  dcache__pma_checker_entries_barrier_3__io_x_ae_final  ;
    assign   dcache__pma_checker_entries_barrier_3__io_y_pf  =  dcache__pma_checker_entries_barrier_3__io_x_pf  ;
    assign   dcache__pma_checker_entries_barrier_3__io_y_gf  =  dcache__pma_checker_entries_barrier_3__io_x_gf  ;
    assign   dcache__pma_checker_entries_barrier_3__io_y_sw  =  dcache__pma_checker_entries_barrier_3__io_x_sw  ;
    assign   dcache__pma_checker_entries_barrier_3__io_y_sx  =  dcache__pma_checker_entries_barrier_3__io_x_sx  ;
    assign   dcache__pma_checker_entries_barrier_3__io_y_sr  =  dcache__pma_checker_entries_barrier_3__io_x_sr  ;
    assign   dcache__pma_checker_entries_barrier_3__io_y_pw  =  dcache__pma_checker_entries_barrier_3__io_x_pw  ;
    assign   dcache__pma_checker_entries_barrier_3__io_y_px  =  dcache__pma_checker_entries_barrier_3__io_x_px  ;
    assign   dcache__pma_checker_entries_barrier_3__io_y_pr  =  dcache__pma_checker_entries_barrier_3__io_x_pr  ;
    assign   dcache__pma_checker_entries_barrier_3__io_y_ppp  =  dcache__pma_checker_entries_barrier_3__io_x_ppp  ;
    assign   dcache__pma_checker_entries_barrier_3__io_y_pal  =  dcache__pma_checker_entries_barrier_3__io_x_pal  ;
    assign   dcache__pma_checker_entries_barrier_3__io_y_paa  =  dcache__pma_checker_entries_barrier_3__io_x_paa  ;
    assign   dcache__pma_checker_entries_barrier_3__io_y_eff  =  dcache__pma_checker_entries_barrier_3__io_x_eff  ;
    assign   dcache__pma_checker_entries_barrier_3__io_y_c  =  dcache__pma_checker_entries_barrier_3__io_x_c  ;



    assign   dcache__pma_checker_entries_barrier_4__io_y_u  =  dcache__pma_checker_entries_barrier_4__io_x_u  ;
    assign   dcache__pma_checker_entries_barrier_4__io_y_ae_ptw  =  dcache__pma_checker_entries_barrier_4__io_x_ae_ptw  ;
    assign   dcache__pma_checker_entries_barrier_4__io_y_ae_final  =  dcache__pma_checker_entries_barrier_4__io_x_ae_final  ;
    assign   dcache__pma_checker_entries_barrier_4__io_y_pf  =  dcache__pma_checker_entries_barrier_4__io_x_pf  ;
    assign   dcache__pma_checker_entries_barrier_4__io_y_gf  =  dcache__pma_checker_entries_barrier_4__io_x_gf  ;
    assign   dcache__pma_checker_entries_barrier_4__io_y_sw  =  dcache__pma_checker_entries_barrier_4__io_x_sw  ;
    assign   dcache__pma_checker_entries_barrier_4__io_y_sx  =  dcache__pma_checker_entries_barrier_4__io_x_sx  ;
    assign   dcache__pma_checker_entries_barrier_4__io_y_sr  =  dcache__pma_checker_entries_barrier_4__io_x_sr  ;
    assign   dcache__pma_checker_entries_barrier_4__io_y_pw  =  dcache__pma_checker_entries_barrier_4__io_x_pw  ;
    assign   dcache__pma_checker_entries_barrier_4__io_y_px  =  dcache__pma_checker_entries_barrier_4__io_x_px  ;
    assign   dcache__pma_checker_entries_barrier_4__io_y_pr  =  dcache__pma_checker_entries_barrier_4__io_x_pr  ;
    assign   dcache__pma_checker_entries_barrier_4__io_y_ppp  =  dcache__pma_checker_entries_barrier_4__io_x_ppp  ;
    assign   dcache__pma_checker_entries_barrier_4__io_y_pal  =  dcache__pma_checker_entries_barrier_4__io_x_pal  ;
    assign   dcache__pma_checker_entries_barrier_4__io_y_paa  =  dcache__pma_checker_entries_barrier_4__io_x_paa  ;
    assign   dcache__pma_checker_entries_barrier_4__io_y_eff  =  dcache__pma_checker_entries_barrier_4__io_x_eff  ;
    assign   dcache__pma_checker_entries_barrier_4__io_y_c  =  dcache__pma_checker_entries_barrier_4__io_x_c  ;
    assign dcache__tlb_entries_barrier__io_x_u = 1'h0;
    assign dcache__tlb_entries_barrier__io_x_ae_ptw = 1'h0;
    assign dcache__tlb_entries_barrier__io_x_ae_final = 1'h0;
    assign dcache__tlb_entries_barrier__io_x_pf = 1'h0;
    assign dcache__tlb_entries_barrier__io_x_gf = 1'h0;
    assign dcache__tlb_entries_barrier__io_x_sw = 1'h0;
    assign dcache__tlb_entries_barrier__io_x_sx = 1'h0;
    assign dcache__tlb_entries_barrier__io_x_sr = 1'h0;
    assign dcache__tlb_entries_barrier__io_x_pw = 1'h0;
    assign dcache__tlb_entries_barrier__io_x_px = 1'h0;
    assign dcache__tlb_entries_barrier__io_x_pr = 1'h0;
    assign dcache__tlb_entries_barrier__io_x_ppp = 1'h0;
    assign dcache__tlb_entries_barrier__io_x_pal = 1'h0;
    assign dcache__tlb_entries_barrier__io_x_paa = 1'h0;
    assign dcache__tlb_entries_barrier__io_x_eff = 1'h0;
    assign dcache__tlb_entries_barrier__io_x_c = 1'h0;
    assign dcache__tlb_entries_barrier_1__io_x_u = 1'h0;
    assign dcache__tlb_entries_barrier_1__io_x_ae_ptw = 1'h0;
    assign dcache__tlb_entries_barrier_1__io_x_ae_final = 1'h0;
    assign dcache__tlb_entries_barrier_1__io_x_pf = 1'h0;
    assign dcache__tlb_entries_barrier_1__io_x_gf = 1'h0;
    assign dcache__tlb_entries_barrier_1__io_x_sw = 1'h0;
    assign dcache__tlb_entries_barrier_1__io_x_sx = 1'h0;
    assign dcache__tlb_entries_barrier_1__io_x_sr = 1'h0;
    assign dcache__tlb_entries_barrier_1__io_x_pw = 1'h0;
    assign dcache__tlb_entries_barrier_1__io_x_px = 1'h0;
    assign dcache__tlb_entries_barrier_1__io_x_pr = 1'h0;
    assign dcache__tlb_entries_barrier_1__io_x_ppp = 1'h0;
    assign dcache__tlb_entries_barrier_1__io_x_pal = 1'h0;
    assign dcache__tlb_entries_barrier_1__io_x_paa = 1'h0;
    assign dcache__tlb_entries_barrier_1__io_x_eff = 1'h0;
    assign dcache__tlb_entries_barrier_1__io_x_c = 1'h0;
    assign dcache__tlb_entries_barrier_2__io_x_u = 1'h0;
    assign dcache__tlb_entries_barrier_2__io_x_ae_ptw = 1'h0;
    assign dcache__tlb_entries_barrier_2__io_x_ae_final = 1'h0;
    assign dcache__tlb_entries_barrier_2__io_x_pf = 1'h0;
    assign dcache__tlb_entries_barrier_2__io_x_gf = 1'h0;
    assign dcache__tlb_entries_barrier_2__io_x_sw = 1'h0;
    assign dcache__tlb_entries_barrier_2__io_x_sx = 1'h0;
    assign dcache__tlb_entries_barrier_2__io_x_sr = 1'h0;
    assign dcache__tlb_entries_barrier_2__io_x_pw = 1'h0;
    assign dcache__tlb_entries_barrier_2__io_x_px = 1'h0;
    assign dcache__tlb_entries_barrier_2__io_x_pr = 1'h0;
    assign dcache__tlb_entries_barrier_2__io_x_ppp = 1'h0;
    assign dcache__tlb_entries_barrier_2__io_x_pal = 1'h0;
    assign dcache__tlb_entries_barrier_2__io_x_paa = 1'h0;
    assign dcache__tlb_entries_barrier_2__io_x_eff = 1'h0;
    assign dcache__tlb_entries_barrier_2__io_x_c = 1'h0;
    assign dcache__tlb_entries_barrier_3__io_x_u = 1'h0;
    assign dcache__tlb_entries_barrier_3__io_x_ae_ptw = 1'h0;
    assign dcache__tlb_entries_barrier_3__io_x_ae_final = 1'h0;
    assign dcache__tlb_entries_barrier_3__io_x_pf = 1'h0;
    assign dcache__tlb_entries_barrier_3__io_x_gf = 1'h0;
    assign dcache__tlb_entries_barrier_3__io_x_sw = 1'h0;
    assign dcache__tlb_entries_barrier_3__io_x_sx = 1'h0;
    assign dcache__tlb_entries_barrier_3__io_x_sr = 1'h0;
    assign dcache__tlb_entries_barrier_3__io_x_pw = 1'h0;
    assign dcache__tlb_entries_barrier_3__io_x_px = 1'h0;
    assign dcache__tlb_entries_barrier_3__io_x_pr = 1'h0;
    assign dcache__tlb_entries_barrier_3__io_x_ppp = 1'h0;
    assign dcache__tlb_entries_barrier_3__io_x_pal = 1'h0;
    assign dcache__tlb_entries_barrier_3__io_x_paa = 1'h0;
    assign dcache__tlb_entries_barrier_3__io_x_eff = 1'h0;
    assign dcache__tlb_entries_barrier_3__io_x_c = 1'h0;
    assign dcache__tlb_entries_barrier_4__io_x_u = 1'h0;
    assign dcache__tlb_entries_barrier_4__io_x_ae_ptw = 1'h0;
    assign dcache__tlb_entries_barrier_4__io_x_ae_final = 1'h0;
    assign dcache__tlb_entries_barrier_4__io_x_pf = 1'h0;
    assign dcache__tlb_entries_barrier_4__io_x_gf = 1'h0;
    assign dcache__tlb_entries_barrier_4__io_x_sw = 1'h0;
    assign dcache__tlb_entries_barrier_4__io_x_sx = 1'h0;
    assign dcache__tlb_entries_barrier_4__io_x_sr = 1'h0;
    assign dcache__tlb_entries_barrier_4__io_x_pw = 1'h0;
    assign dcache__tlb_entries_barrier_4__io_x_px = 1'h0;
    assign dcache__tlb_entries_barrier_4__io_x_pr = 1'h0;
    assign dcache__tlb_entries_barrier_4__io_x_ppp = 1'h0;
    assign dcache__tlb_entries_barrier_4__io_x_pal = 1'h0;
    assign dcache__tlb_entries_barrier_4__io_x_paa = 1'h0;
    assign dcache__tlb_entries_barrier_4__io_x_eff = 1'h0;
    assign dcache__tlb_entries_barrier_4__io_x_c = 1'h0;
    assign dcache__tlb_entries_barrier_5__io_x_u = 1'h0;
    assign dcache__tlb_entries_barrier_5__io_x_ae_ptw = 1'h0;
    assign dcache__tlb_entries_barrier_5__io_x_ae_final = 1'h0;
    assign dcache__tlb_entries_barrier_5__io_x_pf = 1'h0;
    assign dcache__tlb_entries_barrier_5__io_x_gf = 1'h0;
    assign dcache__tlb_entries_barrier_5__io_x_sw = 1'h0;
    assign dcache__tlb_entries_barrier_5__io_x_sx = 1'h0;
    assign dcache__tlb_entries_barrier_5__io_x_sr = 1'h0;
    assign dcache__tlb_entries_barrier_5__io_x_pw = 1'h0;
    assign dcache__tlb_entries_barrier_5__io_x_px = 1'h0;
    assign dcache__tlb_entries_barrier_5__io_x_pr = 1'h0;
    assign dcache__tlb_entries_barrier_5__io_x_ppp = 1'h0;
    assign dcache__tlb_entries_barrier_5__io_x_pal = 1'h0;
    assign dcache__tlb_entries_barrier_5__io_x_paa = 1'h0;
    assign dcache__tlb_entries_barrier_5__io_x_eff = 1'h0;
    assign dcache__tlb_entries_barrier_5__io_x_c = 1'h0;
    assign dcache__pma_checker_entries_barrier__io_x_u = 1'h0;
    assign dcache__pma_checker_entries_barrier__io_x_ae_ptw = 1'h0;
    assign dcache__pma_checker_entries_barrier__io_x_ae_final = 1'h0;
    assign dcache__pma_checker_entries_barrier__io_x_pf = 1'h0;
    assign dcache__pma_checker_entries_barrier__io_x_gf = 1'h0;
    assign dcache__pma_checker_entries_barrier__io_x_sw = 1'h0;
    assign dcache__pma_checker_entries_barrier__io_x_sx = 1'h0;
    assign dcache__pma_checker_entries_barrier__io_x_sr = 1'h0;
    assign dcache__pma_checker_entries_barrier__io_x_pw = 1'h0;
    assign dcache__pma_checker_entries_barrier__io_x_px = 1'h0;
    assign dcache__pma_checker_entries_barrier__io_x_pr = 1'h0;
    assign dcache__pma_checker_entries_barrier__io_x_ppp = 1'h0;
    assign dcache__pma_checker_entries_barrier__io_x_pal = 1'h0;
    assign dcache__pma_checker_entries_barrier__io_x_paa = 1'h0;
    assign dcache__pma_checker_entries_barrier__io_x_eff = 1'h0;
    assign dcache__pma_checker_entries_barrier__io_x_c = 1'h0;
    assign dcache__pma_checker_entries_barrier_1__io_x_u = 1'h0;
    assign dcache__pma_checker_entries_barrier_1__io_x_ae_ptw = 1'h0;
    assign dcache__pma_checker_entries_barrier_1__io_x_ae_final = 1'h0;
    assign dcache__pma_checker_entries_barrier_1__io_x_pf = 1'h0;
    assign dcache__pma_checker_entries_barrier_1__io_x_gf = 1'h0;
    assign dcache__pma_checker_entries_barrier_1__io_x_sw = 1'h0;
    assign dcache__pma_checker_entries_barrier_1__io_x_sx = 1'h0;
    assign dcache__pma_checker_entries_barrier_1__io_x_sr = 1'h0;
    assign dcache__pma_checker_entries_barrier_1__io_x_pw = 1'h0;
    assign dcache__pma_checker_entries_barrier_1__io_x_px = 1'h0;
    assign dcache__pma_checker_entries_barrier_1__io_x_pr = 1'h0;
    assign dcache__pma_checker_entries_barrier_1__io_x_ppp = 1'h0;
    assign dcache__pma_checker_entries_barrier_1__io_x_pal = 1'h0;
    assign dcache__pma_checker_entries_barrier_1__io_x_paa = 1'h0;
    assign dcache__pma_checker_entries_barrier_1__io_x_eff = 1'h0;
    assign dcache__pma_checker_entries_barrier_1__io_x_c = 1'h0;
    assign dcache__pma_checker_entries_barrier_2__io_x_u = 1'h0;
    assign dcache__pma_checker_entries_barrier_2__io_x_ae_ptw = 1'h0;
    assign dcache__pma_checker_entries_barrier_2__io_x_ae_final = 1'h0;
    assign dcache__pma_checker_entries_barrier_2__io_x_pf = 1'h0;
    assign dcache__pma_checker_entries_barrier_2__io_x_gf = 1'h0;
    assign dcache__pma_checker_entries_barrier_2__io_x_sw = 1'h0;
    assign dcache__pma_checker_entries_barrier_2__io_x_sx = 1'h0;
    assign dcache__pma_checker_entries_barrier_2__io_x_sr = 1'h0;
    assign dcache__pma_checker_entries_barrier_2__io_x_pw = 1'h0;
    assign dcache__pma_checker_entries_barrier_2__io_x_px = 1'h0;
    assign dcache__pma_checker_entries_barrier_2__io_x_pr = 1'h0;
    assign dcache__pma_checker_entries_barrier_2__io_x_ppp = 1'h0;
    assign dcache__pma_checker_entries_barrier_2__io_x_pal = 1'h0;
    assign dcache__pma_checker_entries_barrier_2__io_x_paa = 1'h0;
    assign dcache__pma_checker_entries_barrier_2__io_x_eff = 1'h0;
    assign dcache__pma_checker_entries_barrier_2__io_x_c = 1'h0;
    assign dcache__pma_checker_entries_barrier_3__io_x_u = 1'h0;
    assign dcache__pma_checker_entries_barrier_3__io_x_ae_ptw = 1'h0;
    assign dcache__pma_checker_entries_barrier_3__io_x_ae_final = 1'h0;
    assign dcache__pma_checker_entries_barrier_3__io_x_pf = 1'h0;
    assign dcache__pma_checker_entries_barrier_3__io_x_gf = 1'h0;
    assign dcache__pma_checker_entries_barrier_3__io_x_sw = 1'h0;
    assign dcache__pma_checker_entries_barrier_3__io_x_sx = 1'h0;
    assign dcache__pma_checker_entries_barrier_3__io_x_sr = 1'h0;
    assign dcache__pma_checker_entries_barrier_3__io_x_pw = 1'h0;
    assign dcache__pma_checker_entries_barrier_3__io_x_px = 1'h0;
    assign dcache__pma_checker_entries_barrier_3__io_x_pr = 1'h0;
    assign dcache__pma_checker_entries_barrier_3__io_x_ppp = 1'h0;
    assign dcache__pma_checker_entries_barrier_3__io_x_pal = 1'h0;
    assign dcache__pma_checker_entries_barrier_3__io_x_paa = 1'h0;
    assign dcache__pma_checker_entries_barrier_3__io_x_eff = 1'h0;
    assign dcache__pma_checker_entries_barrier_3__io_x_c = 1'h0;
    assign dcache__pma_checker_entries_barrier_4__io_x_u = 1'h0;
    assign dcache__pma_checker_entries_barrier_4__io_x_ae_ptw = 1'h0;
    assign dcache__pma_checker_entries_barrier_4__io_x_ae_final = 1'h0;
    assign dcache__pma_checker_entries_barrier_4__io_x_pf = 1'h0;
    assign dcache__pma_checker_entries_barrier_4__io_x_gf = 1'h0;
    assign dcache__pma_checker_entries_barrier_4__io_x_sw = 1'h0;
    assign dcache__pma_checker_entries_barrier_4__io_x_sx = 1'h0;
    assign dcache__pma_checker_entries_barrier_4__io_x_sr = 1'h0;
    assign dcache__pma_checker_entries_barrier_4__io_x_pw = 1'h0;
    assign dcache__pma_checker_entries_barrier_4__io_x_px = 1'h0;
    assign dcache__pma_checker_entries_barrier_4__io_x_pr = 1'h0;
    assign dcache__pma_checker_entries_barrier_4__io_x_ppp = 1'h0;
    assign dcache__pma_checker_entries_barrier_4__io_x_pal = 1'h0;
    assign dcache__pma_checker_entries_barrier_4__io_x_paa = 1'h0;
    assign dcache__pma_checker_entries_barrier_4__io_x_eff = 1'h0;
    assign dcache__pma_checker_entries_barrier_4__io_x_c = 1'h0;


    wire [5:0] dcache__tag_array_0_ext__RW0_addr;
    wire  dcache__tag_array_0_ext__RW0_en;
    wire  dcache__tag_array_0_ext__RW0_clk;
    wire  dcache__tag_array_0_ext__RW0_wmode;
    wire [21:0] dcache__tag_array_0_ext__RW0_wdata;
    wire [21:0] dcache__tag_array_0_ext__RW0_rdata;

    reg[21:0]  dcache__tag_array_0_ext__Memory  [0:63];
    reg[5:0]  dcache__tag_array_0_ext___RW0_raddr_d0  ;
    reg  dcache__tag_array_0_ext___RW0_ren_d0  ;
    reg  dcache__tag_array_0_ext___RW0_rmode_d0  ;
    always @( posedge   dcache__tag_array_0_ext__RW0_clk  )
    begin
        dcache__tag_array_0_ext___RW0_raddr_d0   <=  dcache__tag_array_0_ext__RW0_addr  ;
        dcache__tag_array_0_ext___RW0_ren_d0   <=  dcache__tag_array_0_ext__RW0_en  ;
        dcache__tag_array_0_ext___RW0_rmode_d0   <=  dcache__tag_array_0_ext__RW0_wmode  ;
        if (  dcache__tag_array_0_ext__RW0_en  &  dcache__tag_array_0_ext__RW0_wmode  &1'h1)
            dcache__tag_array_0_ext__Memory   [  dcache__tag_array_0_ext__RW0_addr  ]<=  dcache__tag_array_0_ext__RW0_wdata  ;
    end

    assign   dcache__tag_array_0_ext__RW0_rdata  =  dcache__tag_array_0_ext___RW0_ren_d0  &~  dcache__tag_array_0_ext___RW0_rmode_d0   ?   dcache__tag_array_0_ext__Memory  [  dcache__tag_array_0_ext___RW0_raddr_d0  ]:22'bx;
    assign dcache__tag_array_0_ext__RW0_addr = dcache__resetting ? dcache__flushCounter:dcache___GEN ? dcache__metaArb_io_in_bits_idx_3:dcache__metaArb_io_in_valid_4 ? dcache__metaArb_io_in_bits_idx_4:dcache__metaArb_io_in_valid_6 ? dcache__metaArb_io_in_bits_idx_6:dcache__metaArb_io_in_bits_idx_7;
    assign dcache__tag_array_0_ext__RW0_en = dcache__readEnable|dcache__writeEnable;
    assign dcache__tag_array_0_ext__RW0_clk = dcache__clock;
    assign dcache__tag_array_0_ext__RW0_wmode = dcache__metaArb_io_out_bits_write;
    assign dcache__tag_array_0_ext__RW0_wdata = dcache__resetting ? 22'h0:dcache__metaArb_io_in_valid_2 ? dcache__metaArb_io_in_bits_data_2:dcache__metaArb_io_in_valid_3 ? dcache__metaArb_io_in_bits_data_3:dcache__metaArb_io_in_bits_data_7;
    assign dcache___tag_array_0_ext_RW0_rdata = dcache__tag_array_0_ext__RW0_rdata;


    wire  dcache__data__clock;
    wire  dcache__data__io_req_valid;
    wire [11:0] dcache__data__io_req_bits_addr;
    wire  dcache__data__io_req_bits_write;
    wire [63:0] dcache__data__io_req_bits_wdata;
    wire [7:0] dcache__data__io_req_bits_eccMask;
    wire [63:0] dcache__data__io_resp_0;

    wire  dcache__data__data_arrays_0_rdata_data_en  ;
    wire  dcache__data__data_arrays_0_rdata_MPORT_en  ;
    assign   dcache__data__data_arrays_0_rdata_MPORT_en  =  dcache__data__io_req_valid  &  dcache__data__io_req_bits_write  ;
    assign   dcache__data__data_arrays_0_rdata_data_en  =  dcache__data__io_req_valid  &~  dcache__data__io_req_bits_write  ;

    wire [8:0] dcache__data__data_arrays_0_ext__RW0_addr;
    wire  dcache__data__data_arrays_0_ext__RW0_en;
    wire  dcache__data__data_arrays_0_ext__RW0_clk;
    wire  dcache__data__data_arrays_0_ext__RW0_wmode;
    wire [63:0] dcache__data__data_arrays_0_ext__RW0_wdata;
    wire [63:0] dcache__data__data_arrays_0_ext__RW0_rdata;
    wire [7:0] dcache__data__data_arrays_0_ext__RW0_wmask;

    reg[63:0]  dcache__data__data_arrays_0_ext__Memory  [0:511];
    reg[8:0]  dcache__data__data_arrays_0_ext___RW0_raddr_d0  ;
    reg  dcache__data__data_arrays_0_ext___RW0_ren_d0  ;
    reg  dcache__data__data_arrays_0_ext___RW0_rmode_d0  ;
    always @( posedge   dcache__data__data_arrays_0_ext__RW0_clk  )
    begin
        dcache__data__data_arrays_0_ext___RW0_raddr_d0   <=  dcache__data__data_arrays_0_ext__RW0_addr  ;
        dcache__data__data_arrays_0_ext___RW0_ren_d0   <=  dcache__data__data_arrays_0_ext__RW0_en  ;
        dcache__data__data_arrays_0_ext___RW0_rmode_d0   <=  dcache__data__data_arrays_0_ext__RW0_wmode  ;
        if (  dcache__data__data_arrays_0_ext__RW0_en  &  dcache__data__data_arrays_0_ext__RW0_wmask  [0]&  dcache__data__data_arrays_0_ext__RW0_wmode  )
            dcache__data__data_arrays_0_ext__Memory   [  dcache__data__data_arrays_0_ext__RW0_addr  ][32'h0+:8]<=  dcache__data__data_arrays_0_ext__RW0_wdata  [7:0];
        if (  dcache__data__data_arrays_0_ext__RW0_en  &  dcache__data__data_arrays_0_ext__RW0_wmask  [1]&  dcache__data__data_arrays_0_ext__RW0_wmode  )
            dcache__data__data_arrays_0_ext__Memory   [  dcache__data__data_arrays_0_ext__RW0_addr  ][32'h8+:8]<=  dcache__data__data_arrays_0_ext__RW0_wdata  [15:8];
        if (  dcache__data__data_arrays_0_ext__RW0_en  &  dcache__data__data_arrays_0_ext__RW0_wmask  [2]&  dcache__data__data_arrays_0_ext__RW0_wmode  )
            dcache__data__data_arrays_0_ext__Memory   [  dcache__data__data_arrays_0_ext__RW0_addr  ][32'h10+:8]<=  dcache__data__data_arrays_0_ext__RW0_wdata  [23:16];
        if (  dcache__data__data_arrays_0_ext__RW0_en  &  dcache__data__data_arrays_0_ext__RW0_wmask  [3]&  dcache__data__data_arrays_0_ext__RW0_wmode  )
            dcache__data__data_arrays_0_ext__Memory   [  dcache__data__data_arrays_0_ext__RW0_addr  ][32'h18+:8]<=  dcache__data__data_arrays_0_ext__RW0_wdata  [31:24];
        if (  dcache__data__data_arrays_0_ext__RW0_en  &  dcache__data__data_arrays_0_ext__RW0_wmask  [4]&  dcache__data__data_arrays_0_ext__RW0_wmode  )
            dcache__data__data_arrays_0_ext__Memory   [  dcache__data__data_arrays_0_ext__RW0_addr  ][32'h20+:8]<=  dcache__data__data_arrays_0_ext__RW0_wdata  [39:32];
        if (  dcache__data__data_arrays_0_ext__RW0_en  &  dcache__data__data_arrays_0_ext__RW0_wmask  [5]&  dcache__data__data_arrays_0_ext__RW0_wmode  )
            dcache__data__data_arrays_0_ext__Memory   [  dcache__data__data_arrays_0_ext__RW0_addr  ][32'h28+:8]<=  dcache__data__data_arrays_0_ext__RW0_wdata  [47:40];
        if (  dcache__data__data_arrays_0_ext__RW0_en  &  dcache__data__data_arrays_0_ext__RW0_wmask  [6]&  dcache__data__data_arrays_0_ext__RW0_wmode  )
            dcache__data__data_arrays_0_ext__Memory   [  dcache__data__data_arrays_0_ext__RW0_addr  ][32'h30+:8]<=  dcache__data__data_arrays_0_ext__RW0_wdata  [55:48];
        if (  dcache__data__data_arrays_0_ext__RW0_en  &  dcache__data__data_arrays_0_ext__RW0_wmask  [7]&  dcache__data__data_arrays_0_ext__RW0_wmode  )
            dcache__data__data_arrays_0_ext__Memory   [  dcache__data__data_arrays_0_ext__RW0_addr  ][32'h38+:8]<=  dcache__data__data_arrays_0_ext__RW0_wdata  [63:56];
    end

    assign   dcache__data__data_arrays_0_ext__RW0_rdata  =  dcache__data__data_arrays_0_ext___RW0_ren_d0  &~  dcache__data__data_arrays_0_ext___RW0_rmode_d0   ?   dcache__data__data_arrays_0_ext__Memory  [  dcache__data__data_arrays_0_ext___RW0_raddr_d0  ]:64'bx;
    assign dcache__data__data_arrays_0_ext__RW0_addr = dcache__data__io_req_bits_addr[11:3];
    assign dcache__data__data_arrays_0_ext__RW0_en = dcache__data__data_arrays_0_rdata_data_en|dcache__data__data_arrays_0_rdata_MPORT_en;
    assign dcache__data__data_arrays_0_ext__RW0_clk = dcache__data__clock;
    assign dcache__data__data_arrays_0_ext__RW0_wmode = dcache__data__io_req_bits_write;
    assign dcache__data__data_arrays_0_ext__RW0_wdata = dcache__data__io_req_bits_wdata;
    assign dcache__data__io_resp_0 = dcache__data__data_arrays_0_ext__RW0_rdata;
    assign dcache__data__data_arrays_0_ext__RW0_wmask = dcache__data__io_req_bits_eccMask;

    assign dcache__data__clock = dcache__clock;
    assign dcache__data__io_req_valid = dcache__dataArb_io_out_valid;
    assign dcache__data__io_req_bits_addr = dcache__dataArb_io_in_valid_0 ? dcache___dataArb_io_in_0_bits_wordMask_wordMask_T:dcache__dataArb_io_in_valid_1 ? dcache__dataArb_io_in_bits_addr_1:dcache__dataArb_io_in_valid_2 ? dcache__dataArb_io_in_bits_addr_2:dcache__dataArb_io_in_bits_addr_3;
    assign dcache__data__io_req_bits_write = dcache__dataArb_io_in_valid_0 ? dcache__pstore_drain:dcache__dataArb_io_in_valid_1&dcache__dataArb_io_in_bits_write_1;
    assign dcache__data__io_req_bits_wdata = dcache__dataArb_io_in_valid_0 ? dcache__dataArb_io_in_bits_wdata_0:dcache__auto_out_d_bits_data;
    assign dcache__data__io_req_bits_eccMask = dcache__dataArb_io_in_valid_0 ? dcache__dataArb_io_in_bits_eccMask_0:8'hFF;
    assign dcache___data_io_resp_0 = dcache__data__io_resp_0;


    wire [7:0] dcache__amoalus_0__io_mask;
    wire [4:0] dcache__amoalus_0__io_cmd;
    wire [63:0] dcache__amoalus_0__io_lhs;
    wire [63:0] dcache__amoalus_0__io_rhs;
    wire [63:0] dcache__amoalus_0__io_out;

    wire  dcache__amoalus_0___logic_xor_T_1  =  dcache__amoalus_0__io_cmd  ==5'hA;
    wire  dcache__amoalus_0__logic_and  =  dcache__amoalus_0___logic_xor_T_1  |  dcache__amoalus_0__io_cmd  ==5'hB;
    wire  dcache__amoalus_0__logic_xor  =  dcache__amoalus_0__io_cmd  ==5'h9|  dcache__amoalus_0___logic_xor_T_1  ;
    wire[63:0]  dcache__amoalus_0__adder_out_mask  ={32'hFFFFFFFF,  dcache__amoalus_0__io_mask  [3],31'h7FFFFFFF};
    wire[63:0]  dcache__amoalus_0__wmask  ={{8{  dcache__amoalus_0__io_mask  [7]}},{8{  dcache__amoalus_0__io_mask  [6]}},{8{  dcache__amoalus_0__io_mask  [5]}},{8{  dcache__amoalus_0__io_mask  [4]}},{8{  dcache__amoalus_0__io_mask  [3]}},{8{  dcache__amoalus_0__io_mask  [2]}},{8{  dcache__amoalus_0__io_mask  [1]}},{8{  dcache__amoalus_0__io_mask  [0]}}};
    assign   dcache__amoalus_0__io_out  =  dcache__amoalus_0__wmask  &(  dcache__amoalus_0__io_cmd  ==5'h8 ? (  dcache__amoalus_0__io_lhs  &  dcache__amoalus_0__adder_out_mask  )+(  dcache__amoalus_0__io_rhs  &  dcache__amoalus_0__adder_out_mask  ):  dcache__amoalus_0__logic_and  |  dcache__amoalus_0__logic_xor   ? (  dcache__amoalus_0__logic_and   ?   dcache__amoalus_0__io_lhs  &  dcache__amoalus_0__io_rhs  :64'h0)|(  dcache__amoalus_0__logic_xor   ?   dcache__amoalus_0__io_lhs  ^  dcache__amoalus_0__io_rhs  :64'h0):((  dcache__amoalus_0__io_mask  [4] ? (  dcache__amoalus_0__io_lhs  [63]==  dcache__amoalus_0__io_rhs  [63] ?   dcache__amoalus_0__io_lhs  [63:32]<  dcache__amoalus_0__io_rhs  [63:32]|  dcache__amoalus_0__io_lhs  [63:32]==  dcache__amoalus_0__io_rhs  [63:32]&  dcache__amoalus_0__io_lhs  [31:0]<  dcache__amoalus_0__io_rhs  [31:0]:  dcache__amoalus_0__io_cmd  [1] ?   dcache__amoalus_0__io_rhs  [63]:  dcache__amoalus_0__io_lhs  [63]):  dcache__amoalus_0__io_lhs  [31]==  dcache__amoalus_0__io_rhs  [31] ?   dcache__amoalus_0__io_lhs  [31:0]<  dcache__amoalus_0__io_rhs  [31:0]:  dcache__amoalus_0__io_cmd  [1] ?   dcache__amoalus_0__io_rhs  [31]:  dcache__amoalus_0__io_lhs  [31]) ?   dcache__amoalus_0__io_cmd  ==5'hC|  dcache__amoalus_0__io_cmd  ==5'hE:  dcache__amoalus_0__io_cmd  ==5'hD|  dcache__amoalus_0__io_cmd  ==5'hF) ?   dcache__amoalus_0__io_lhs  :  dcache__amoalus_0__io_rhs  )|~  dcache__amoalus_0__wmask  &  dcache__amoalus_0__io_lhs  ;
    assign dcache__amoalus_0__io_mask = dcache__pstore1_mask;
    assign dcache__amoalus_0__io_cmd = dcache__pstore1_cmd;
    assign dcache__amoalus_0__io_lhs = dcache__s2_data;
    assign dcache__amoalus_0__io_rhs = dcache__pstore1_data;
    assign dcache___amoalus_0_io_out = dcache__amoalus_0__io_out;

    assign   dcache__auto_out_a_valid  =  dcache__tl_out_a_valid  ;
    assign   dcache__auto_out_a_bits_opcode  =  dcache__s2_pma_cacheable   ? 3'h6:  dcache__s2_write   ? (  dcache___metaArb_io_in_3_bits_data_c_cat_T_24   ? 3'h1:  dcache__s2_read   ? (  dcache___metaArb_io_in_3_bits_data_c_cat_T_39  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_38  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_37  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_36  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_35   ? 3'h2:  dcache___metaArb_io_in_3_bits_data_c_cat_T_31  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_30  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_29  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_28   ? 3'h3:3'h0):3'h0):3'h4;
    assign   dcache__auto_out_a_bits_param  =  dcache__s2_pma_cacheable   ? {1'h0,  dcache__casez_tmp  }:~  dcache__s2_write  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_24  |~  dcache__s2_read   ? 3'h0:  dcache___metaArb_io_in_3_bits_data_c_cat_T_39   ? 3'h3:  dcache___metaArb_io_in_3_bits_data_c_cat_T_38   ? 3'h2:  dcache___metaArb_io_in_3_bits_data_c_cat_T_37   ? 3'h1:  dcache___metaArb_io_in_3_bits_data_c_cat_T_36   ? 3'h0:  dcache___metaArb_io_in_3_bits_data_c_cat_T_35   ? 3'h4:  dcache___metaArb_io_in_3_bits_data_c_cat_T_31   ? 3'h2:  dcache___metaArb_io_in_3_bits_data_c_cat_T_30   ? 3'h1:  dcache___metaArb_io_in_3_bits_data_c_cat_T_29  |~  dcache___metaArb_io_in_3_bits_data_c_cat_T_28   ? 3'h0:3'h3;
    assign   dcache__auto_out_a_bits_size  =  dcache__s2_pma_cacheable   ? 4'h6:  dcache___GEN_16   ? {2'h0,  dcache__s2_req_size  }:4'h0;
    assign   dcache__auto_out_a_bits_source  =~  dcache__s2_pma_cacheable  &(~  dcache__s2_write  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_24  |~  dcache__s2_read  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_39  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_38  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_37  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_36  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_35  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_31  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_30  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_29  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_28  );
    assign   dcache__auto_out_a_bits_address  =  dcache__s2_pma_cacheable   ? {  dcache__s2_req_addr  [31:6],6'h0}:  dcache___GEN_16   ?   dcache__s2_req_addr  [31:0]:32'h0;
    assign   dcache__auto_out_a_bits_mask  =  dcache__s2_pma_cacheable   ? 8'hFF:  dcache__s2_write   ? (  dcache___metaArb_io_in_3_bits_data_c_cat_T_24   ?   dcache__pstore1_mask  :  dcache__s2_read   ?   dcache__atomics_mask  :{  dcache__put_a_mask_acc_5  |  dcache__put_a_mask_eq_5  &  dcache__s2_req_addr  [0],  dcache__put_a_mask_acc_5  |  dcache__put_a_mask_eq_5  &~(  dcache__s2_req_addr  [0]),  dcache__put_a_mask_acc_4  |  dcache__put_a_mask_eq_4  &  dcache__s2_req_addr  [0],  dcache__put_a_mask_acc_4  |  dcache__put_a_mask_eq_4  &~(  dcache__s2_req_addr  [0]),  dcache__put_a_mask_acc_3  |  dcache__put_a_mask_eq_3  &  dcache__s2_req_addr  [0],  dcache__put_a_mask_acc_3  |  dcache__put_a_mask_eq_3  &~(  dcache__s2_req_addr  [0]),  dcache__put_a_mask_acc_2  |  dcache__put_a_mask_eq_2  &  dcache__s2_req_addr  [0],  dcache__put_a_mask_acc_2  |  dcache__put_a_mask_eq_2  &~(  dcache__s2_req_addr  [0])}):{  dcache__get_a_mask_acc_5  |  dcache__get_a_mask_eq_5  &  dcache__s2_req_addr  [0],  dcache__get_a_mask_acc_5  |  dcache__get_a_mask_eq_5  &~(  dcache__s2_req_addr  [0]),  dcache__get_a_mask_acc_4  |  dcache__get_a_mask_eq_4  &  dcache__s2_req_addr  [0],  dcache__get_a_mask_acc_4  |  dcache__get_a_mask_eq_4  &~(  dcache__s2_req_addr  [0]),  dcache__get_a_mask_acc_3  |  dcache__get_a_mask_eq_3  &  dcache__s2_req_addr  [0],  dcache__get_a_mask_acc_3  |  dcache__get_a_mask_eq_3  &~(  dcache__s2_req_addr  [0]),  dcache__get_a_mask_acc_2  |  dcache__get_a_mask_eq_2  &  dcache__s2_req_addr  [0],  dcache__get_a_mask_acc_2  |  dcache__get_a_mask_eq_2  &~(  dcache__s2_req_addr  [0])};
    assign   dcache__auto_out_a_bits_data  =  dcache__s2_pma_cacheable  |~  dcache__s2_write  |~(  dcache___metaArb_io_in_3_bits_data_c_cat_T_24  |~  dcache__s2_read  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_39  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_38  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_37  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_36  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_35  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_31  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_30  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_29  |  dcache___metaArb_io_in_3_bits_data_c_cat_T_28  ) ? 64'h0:  dcache__pstore1_data  ;
    assign   dcache__auto_out_b_ready  =  dcache__nodeOut_b_ready  ;
    assign   dcache__auto_out_c_valid  =  dcache__nodeOut_c_valid  ;
    assign   dcache__auto_out_c_bits_opcode  =  dcache__nodeOut_c_bits_opcode  ;
    assign   dcache__auto_out_c_bits_param  =  dcache___GEN_27   ? ((&  dcache__s2_victim_state_state  )|  dcache__s2_victim_state_state  ==2'h2 ? 3'h1:  dcache__s2_victim_state_state  ==2'h1 ? 3'h2:  dcache__s2_victim_state_state  ==2'h0 ? 3'h5:3'h0):  dcache___inWriteback_T_1  |  dcache___GEN_26  |~(~  dcache__s2_probe  |  dcache__s2_prb_ack_data  |~(|  dcache__s2_probe_state_state  )) ? (  dcache___GEN_13   ? 3'h3:  dcache___GEN_10   ? 3'h4:  dcache___GEN_9   ? 3'h5:  dcache___GEN_8  |  dcache___GEN_7   ? 3'h0:  dcache___GEN_6   ? 3'h4:  dcache___GEN_5   ? 3'h5:  dcache___GEN_4  |  dcache___GEN_3  ==4'hA ? 3'h1:  dcache___GEN_3  ==4'h9 ? 3'h2:  dcache___GEN_3  ==4'h8 ? 3'h5:3'h0):3'h5;
    assign   dcache__auto_out_c_bits_size  =  dcache__nodeOut_c_bits_size  ;
    assign   dcache__auto_out_c_bits_source  =  dcache__probe_bits_source  ;
    assign   dcache__auto_out_c_bits_address  =  dcache__probe_bits_address  ;
    assign   dcache__auto_out_c_bits_data  =  dcache__s2_data  ;
    assign   dcache__auto_out_d_ready  =  dcache__nodeOut_d_ready  ;
    assign   dcache__auto_out_e_valid  =  dcache__nodeOut_e_valid  ;
    assign   dcache__auto_out_e_bits_sink  =  dcache__auto_out_d_bits_sink  ;
    assign   dcache__io_cpu_req_ready  =  dcache__io_cpu_req_ready_0  ;
    assign   dcache__io_cpu_s2_nack  =  dcache__io_cpu_s2_nack_0  ;
    assign   dcache__io_cpu_resp_valid  =  dcache__s2_valid_hit_pre_data_ecc_and_waw  |  dcache__doUncachedResp  ;
    assign   dcache__io_cpu_resp_bits_addr  =  dcache__doUncachedResp   ?   dcache__s2_uncached_resp_addr  :  dcache__s2_req_addr  ;
    assign   dcache__io_cpu_resp_bits_tag  =  dcache__s2_req_tag  ;
    assign   dcache__io_cpu_resp_bits_cmd  =  dcache__s2_req_cmd  ;
    assign   dcache__io_cpu_resp_bits_size  =  dcache__s2_req_size  ;
    assign   dcache__io_cpu_resp_bits_signed  =  dcache__s2_req_signed  ;
    assign   dcache__io_cpu_resp_bits_dprv  =  dcache__s2_req_dprv  ;
    assign   dcache__io_cpu_resp_bits_dv  =  dcache__s2_req_dv  ;
    assign   dcache__io_cpu_resp_bits_data  ={  dcache__s2_req_size  ==2'h0|  dcache__s2_sc   ? {56{  dcache__s2_req_signed  &  dcache__io_cpu_resp_bits_data_zeroed_2  [7]}}:{  dcache__s2_req_size  ==2'h1 ? {48{  dcache__s2_req_signed  &  dcache__io_cpu_resp_bits_data_zeroed_1  [15]}}:{  dcache___io_cpu_resp_bits_data_word_bypass_T_1   ? {32{  dcache__s2_req_signed  &  dcache__io_cpu_resp_bits_data_zeroed  [31]}}:  dcache__s2_data  [63:32],  dcache__io_cpu_resp_bits_data_zeroed  [31:16]},  dcache__io_cpu_resp_bits_data_zeroed_1  [15:8]},  dcache__io_cpu_resp_bits_data_zeroed_2  [7:1],  dcache__io_cpu_resp_bits_data_zeroed_2  [0]|  dcache__s2_sc_fail  };
    assign   dcache__io_cpu_resp_bits_mask  =8'h0;
    assign   dcache__io_cpu_resp_bits_replay  =  dcache__doUncachedResp  ;
    assign   dcache__io_cpu_resp_bits_has_data  =  dcache__s2_read  ;
    assign   dcache__io_cpu_resp_bits_data_word_bypass  ={  dcache___io_cpu_resp_bits_data_word_bypass_T_1   ? {32{  dcache__s2_req_signed  &  dcache__io_cpu_resp_bits_data_word_bypass_zeroed  [31]}}:  dcache__s2_data  [63:32],  dcache__io_cpu_resp_bits_data_word_bypass_zeroed  };
    assign   dcache__io_cpu_resp_bits_data_raw  =  dcache__s2_data  ;
    assign   dcache__io_cpu_resp_bits_store_data  =  dcache__pstore1_data  ;
    assign   dcache__io_cpu_replay_next  =  dcache__io_cpu_replay_next_0  ;
    assign   dcache__io_cpu_s2_xcpt_ma_ld  =  dcache__io_cpu_s2_xcpt_ma_ld_0  ;
    assign   dcache__io_cpu_s2_xcpt_ma_st  =  dcache__io_cpu_s2_xcpt_ma_st_0  ;
    assign   dcache__io_cpu_s2_xcpt_pf_ld  =  dcache__io_cpu_s2_xcpt_pf_ld_0  ;
    assign   dcache__io_cpu_s2_xcpt_pf_st  =  dcache__io_cpu_s2_xcpt_pf_st_0  ;
    assign   dcache__io_cpu_s2_xcpt_ae_ld  =  dcache__io_cpu_s2_xcpt_ae_ld_0  ;
    assign   dcache__io_cpu_s2_xcpt_ae_st  =  dcache__io_cpu_s2_xcpt_ae_st_0  ;
    assign   dcache__io_cpu_ordered  =~(  dcache__s1_valid  |  dcache__s2_valid  |  dcache__cached_grant_wait  |  dcache__uncachedInFlight_0  );
    assign   dcache__io_cpu_perf_release  =(  dcache__io_cpu_perf_release_counter  ==9'h1|  dcache__io_cpu_perf_release_beats1  ==9'h0)&  dcache___io_cpu_perf_release_T  ;
    assign   dcache__io_cpu_perf_grant  =  dcache__auto_out_d_valid  &  dcache__d_last  ;
    assign   dcache__io_ptw_req_bits_bits_need_gpa  =1'h0;
    assign   dcache__io_ptw_req_bits_bits_stage2  =1'h0;
    assign dcache__clock = clock;
    assign dcache__reset = reset;
    assign dcache__auto_out_a_ready = _tlMasterXbar_auto_in_0_a_ready;
    assign _dcache_auto_out_a_valid = dcache__auto_out_a_valid;
    assign _dcache_auto_out_a_bits_opcode = dcache__auto_out_a_bits_opcode;
    assign _dcache_auto_out_a_bits_param = dcache__auto_out_a_bits_param;
    assign _dcache_auto_out_a_bits_size = dcache__auto_out_a_bits_size;
    assign _dcache_auto_out_a_bits_source = dcache__auto_out_a_bits_source;
    assign _dcache_auto_out_a_bits_address = dcache__auto_out_a_bits_address;
    assign _dcache_auto_out_a_bits_mask = dcache__auto_out_a_bits_mask;
    assign _dcache_auto_out_a_bits_data = dcache__auto_out_a_bits_data;
    assign _dcache_auto_out_b_ready = dcache__auto_out_b_ready;
    assign dcache__auto_out_b_valid = _tlMasterXbar_auto_in_0_b_valid;
    assign dcache__auto_out_b_bits_param = _tlMasterXbar_auto_in_0_b_bits_param;
    assign dcache__auto_out_b_bits_size = _tlMasterXbar_auto_in_0_b_bits_size;
    assign dcache__auto_out_b_bits_source = _tlMasterXbar_auto_in_0_b_bits_source;
    assign dcache__auto_out_b_bits_address = _tlMasterXbar_auto_in_0_b_bits_address;
    assign dcache__auto_out_c_ready = _tlMasterXbar_auto_in_0_c_ready;
    assign _dcache_auto_out_c_valid = dcache__auto_out_c_valid;
    assign _dcache_auto_out_c_bits_opcode = dcache__auto_out_c_bits_opcode;
    assign _dcache_auto_out_c_bits_param = dcache__auto_out_c_bits_param;
    assign _dcache_auto_out_c_bits_size = dcache__auto_out_c_bits_size;
    assign _dcache_auto_out_c_bits_source = dcache__auto_out_c_bits_source;
    assign _dcache_auto_out_c_bits_address = dcache__auto_out_c_bits_address;
    assign _dcache_auto_out_c_bits_data = dcache__auto_out_c_bits_data;
    assign _dcache_auto_out_d_ready = dcache__auto_out_d_ready;
    assign dcache__auto_out_d_valid = _tlMasterXbar_auto_in_0_d_valid;
    assign dcache__auto_out_d_bits_opcode = _tlMasterXbar_auto_in_0_d_bits_opcode;
    assign dcache__auto_out_d_bits_param = _tlMasterXbar_auto_in_0_d_bits_param;
    assign dcache__auto_out_d_bits_size = _tlMasterXbar_auto_in_0_d_bits_size;
    assign dcache__auto_out_d_bits_source = _tlMasterXbar_auto_in_0_d_bits_source;
    assign dcache__auto_out_d_bits_sink = _tlMasterXbar_auto_in_0_d_bits_sink;
    assign dcache__auto_out_d_bits_denied = _tlMasterXbar_auto_in_0_d_bits_denied;
    assign dcache__auto_out_d_bits_data = _tlMasterXbar_auto_in_0_d_bits_data;
    assign dcache__auto_out_e_ready = _tlMasterXbar_auto_in_0_e_ready;
    assign _dcache_auto_out_e_valid = dcache__auto_out_e_valid;
    assign _dcache_auto_out_e_bits_sink = dcache__auto_out_e_bits_sink;
    assign _dcache_io_cpu_req_ready = dcache__io_cpu_req_ready;
    assign dcache__io_cpu_req_valid = _dcacheArb_io_mem_req_valid;
    assign dcache__io_cpu_req_bits_addr = _dcacheArb_io_mem_req_bits_addr;
    assign dcache__io_cpu_req_bits_tag = _dcacheArb_io_mem_req_bits_tag;
    assign dcache__io_cpu_req_bits_cmd = _dcacheArb_io_mem_req_bits_cmd;
    assign dcache__io_cpu_req_bits_size = _dcacheArb_io_mem_req_bits_size;
    assign dcache__io_cpu_req_bits_signed = _dcacheArb_io_mem_req_bits_signed;
    assign dcache__io_cpu_req_bits_dv = _dcacheArb_io_mem_req_bits_dv;
    assign dcache__io_cpu_s1_kill = _dcacheArb_io_mem_s1_kill;
    assign dcache__io_cpu_s1_data_data = _dcacheArb_io_mem_s1_data_data;
    assign dcache__io_cpu_s1_data_mask = 8'h0;
    assign _dcache_io_cpu_s2_nack = dcache__io_cpu_s2_nack;
    assign _dcache_io_cpu_resp_valid = dcache__io_cpu_resp_valid;
    assign _dcache_io_cpu_resp_bits_tag = dcache__io_cpu_resp_bits_tag;
    assign _dcache_io_cpu_resp_bits_data = dcache__io_cpu_resp_bits_data;
    assign _dcache_io_cpu_resp_bits_replay = dcache__io_cpu_resp_bits_replay;
    assign _dcache_io_cpu_resp_bits_has_data = dcache__io_cpu_resp_bits_has_data;
    assign _dcache_io_cpu_resp_bits_data_word_bypass = dcache__io_cpu_resp_bits_data_word_bypass;
    assign _dcache_io_cpu_replay_next = dcache__io_cpu_replay_next;
    assign _dcache_io_cpu_s2_xcpt_ma_ld = dcache__io_cpu_s2_xcpt_ma_ld;
    assign _dcache_io_cpu_s2_xcpt_ma_st = dcache__io_cpu_s2_xcpt_ma_st;
    assign _dcache_io_cpu_s2_xcpt_pf_ld = dcache__io_cpu_s2_xcpt_pf_ld;
    assign _dcache_io_cpu_s2_xcpt_pf_st = dcache__io_cpu_s2_xcpt_pf_st;
    assign _dcache_io_cpu_s2_xcpt_ae_ld = dcache__io_cpu_s2_xcpt_ae_ld;
    assign _dcache_io_cpu_s2_xcpt_ae_st = dcache__io_cpu_s2_xcpt_ae_st;
    assign _dcache_io_cpu_ordered = dcache__io_cpu_ordered;
    assign _dcache_io_cpu_perf_release = dcache__io_cpu_perf_release;
    assign _dcache_io_cpu_perf_grant = dcache__io_cpu_perf_grant;
    assign _dcache_io_ptw_req_bits_bits_need_gpa = dcache__io_ptw_req_bits_bits_need_gpa;
    assign _dcache_io_ptw_req_bits_bits_stage2 = dcache__io_ptw_req_bits_bits_stage2;
    assign dcache__io_ptw_status_debug = _ptw_io_requestor_0_status_debug;
    assign dcache__io_ptw_pmp_cfg_l_0 = _ptw_io_requestor_0_pmp_cfg_l_0;
    assign dcache__io_ptw_pmp_cfg_l_1 = _ptw_io_requestor_0_pmp_cfg_l_1;
    assign dcache__io_ptw_pmp_cfg_l_2 = _ptw_io_requestor_0_pmp_cfg_l_2;
    assign dcache__io_ptw_pmp_cfg_l_3 = _ptw_io_requestor_0_pmp_cfg_l_3;
    assign dcache__io_ptw_pmp_cfg_l_4 = _ptw_io_requestor_0_pmp_cfg_l_4;
    assign dcache__io_ptw_pmp_cfg_l_5 = _ptw_io_requestor_0_pmp_cfg_l_5;
    assign dcache__io_ptw_pmp_cfg_l_6 = _ptw_io_requestor_0_pmp_cfg_l_6;
    assign dcache__io_ptw_pmp_cfg_l_7 = _ptw_io_requestor_0_pmp_cfg_l_7;
    assign dcache__io_ptw_pmp_cfg_a_0 = _ptw_io_requestor_0_pmp_cfg_a_0;
    assign dcache__io_ptw_pmp_cfg_a_1 = _ptw_io_requestor_0_pmp_cfg_a_1;
    assign dcache__io_ptw_pmp_cfg_a_2 = _ptw_io_requestor_0_pmp_cfg_a_2;
    assign dcache__io_ptw_pmp_cfg_a_3 = _ptw_io_requestor_0_pmp_cfg_a_3;
    assign dcache__io_ptw_pmp_cfg_a_4 = _ptw_io_requestor_0_pmp_cfg_a_4;
    assign dcache__io_ptw_pmp_cfg_a_5 = _ptw_io_requestor_0_pmp_cfg_a_5;
    assign dcache__io_ptw_pmp_cfg_a_6 = _ptw_io_requestor_0_pmp_cfg_a_6;
    assign dcache__io_ptw_pmp_cfg_a_7 = _ptw_io_requestor_0_pmp_cfg_a_7;
    assign dcache__io_ptw_pmp_cfg_w_0 = _ptw_io_requestor_0_pmp_cfg_w_0;
    assign dcache__io_ptw_pmp_cfg_w_1 = _ptw_io_requestor_0_pmp_cfg_w_1;
    assign dcache__io_ptw_pmp_cfg_w_2 = _ptw_io_requestor_0_pmp_cfg_w_2;
    assign dcache__io_ptw_pmp_cfg_w_3 = _ptw_io_requestor_0_pmp_cfg_w_3;
    assign dcache__io_ptw_pmp_cfg_w_4 = _ptw_io_requestor_0_pmp_cfg_w_4;
    assign dcache__io_ptw_pmp_cfg_w_5 = _ptw_io_requestor_0_pmp_cfg_w_5;
    assign dcache__io_ptw_pmp_cfg_w_6 = _ptw_io_requestor_0_pmp_cfg_w_6;
    assign dcache__io_ptw_pmp_cfg_w_7 = _ptw_io_requestor_0_pmp_cfg_w_7;
    assign dcache__io_ptw_pmp_cfg_r_0 = _ptw_io_requestor_0_pmp_cfg_r_0;
    assign dcache__io_ptw_pmp_cfg_r_1 = _ptw_io_requestor_0_pmp_cfg_r_1;
    assign dcache__io_ptw_pmp_cfg_r_2 = _ptw_io_requestor_0_pmp_cfg_r_2;
    assign dcache__io_ptw_pmp_cfg_r_3 = _ptw_io_requestor_0_pmp_cfg_r_3;
    assign dcache__io_ptw_pmp_cfg_r_4 = _ptw_io_requestor_0_pmp_cfg_r_4;
    assign dcache__io_ptw_pmp_cfg_r_5 = _ptw_io_requestor_0_pmp_cfg_r_5;
    assign dcache__io_ptw_pmp_cfg_r_6 = _ptw_io_requestor_0_pmp_cfg_r_6;
    assign dcache__io_ptw_pmp_cfg_r_7 = _ptw_io_requestor_0_pmp_cfg_r_7;
    assign dcache__io_ptw_pmp_addr_0 = _ptw_io_requestor_0_pmp_addr_0;
    assign dcache__io_ptw_pmp_addr_1 = _ptw_io_requestor_0_pmp_addr_1;
    assign dcache__io_ptw_pmp_addr_2 = _ptw_io_requestor_0_pmp_addr_2;
    assign dcache__io_ptw_pmp_addr_3 = _ptw_io_requestor_0_pmp_addr_3;
    assign dcache__io_ptw_pmp_addr_4 = _ptw_io_requestor_0_pmp_addr_4;
    assign dcache__io_ptw_pmp_addr_5 = _ptw_io_requestor_0_pmp_addr_5;
    assign dcache__io_ptw_pmp_addr_6 = _ptw_io_requestor_0_pmp_addr_6;
    assign dcache__io_ptw_pmp_addr_7 = _ptw_io_requestor_0_pmp_addr_7;
    assign dcache__io_ptw_pmp_mask_0 = _ptw_io_requestor_0_pmp_mask_0;
    assign dcache__io_ptw_pmp_mask_1 = _ptw_io_requestor_0_pmp_mask_1;
    assign dcache__io_ptw_pmp_mask_2 = _ptw_io_requestor_0_pmp_mask_2;
    assign dcache__io_ptw_pmp_mask_3 = _ptw_io_requestor_0_pmp_mask_3;
    assign dcache__io_ptw_pmp_mask_4 = _ptw_io_requestor_0_pmp_mask_4;
    assign dcache__io_ptw_pmp_mask_5 = _ptw_io_requestor_0_pmp_mask_5;
    assign dcache__io_ptw_pmp_mask_6 = _ptw_io_requestor_0_pmp_mask_6;
    assign dcache__io_ptw_pmp_mask_7 = _ptw_io_requestor_0_pmp_mask_7;


    wire  frontend__clock;
    wire  frontend__reset;
    wire  frontend__auto_icache_master_out_a_ready;
    wire  frontend__auto_icache_master_out_a_valid;
    wire [31:0] frontend__auto_icache_master_out_a_bits_address;
    wire  frontend__auto_icache_master_out_d_valid;
    wire [2:0] frontend__auto_icache_master_out_d_bits_opcode;
    wire [3:0] frontend__auto_icache_master_out_d_bits_size;
    wire [63:0] frontend__auto_icache_master_out_d_bits_data;
    wire  frontend__auto_icache_master_out_d_bits_corrupt;
    wire  frontend__io_cpu_might_request;
    wire  frontend__io_cpu_req_valid;
    wire [33:0] frontend__io_cpu_req_bits_pc;
    wire  frontend__io_cpu_req_bits_speculative;
    wire  frontend__io_cpu_resp_ready;
    wire  frontend__io_cpu_resp_valid;
    wire [33:0] frontend__io_cpu_resp_bits_pc;
    wire [31:0] frontend__io_cpu_resp_bits_data;
    wire  frontend__io_cpu_resp_bits_xcpt_pf_inst;
    wire  frontend__io_cpu_resp_bits_xcpt_gf_inst;
    wire  frontend__io_cpu_resp_bits_xcpt_ae_inst;
    wire  frontend__io_cpu_resp_bits_replay;
    wire  frontend__io_cpu_btb_update_valid;
    wire  frontend__io_cpu_bht_update_valid;
    wire  frontend__io_cpu_flush_icache;
    wire  frontend__io_ptw_req_bits_bits_need_gpa;
    wire  frontend__io_ptw_req_bits_bits_stage2;
    wire  frontend__io_ptw_status_debug;
    wire  frontend__io_ptw_pmp_cfg_l_0;
    wire  frontend__io_ptw_pmp_cfg_l_1;
    wire  frontend__io_ptw_pmp_cfg_l_2;
    wire  frontend__io_ptw_pmp_cfg_l_3;
    wire  frontend__io_ptw_pmp_cfg_l_4;
    wire  frontend__io_ptw_pmp_cfg_l_5;
    wire  frontend__io_ptw_pmp_cfg_l_6;
    wire  frontend__io_ptw_pmp_cfg_l_7;
    wire [1:0] frontend__io_ptw_pmp_cfg_a_0;
    wire [1:0] frontend__io_ptw_pmp_cfg_a_1;
    wire [1:0] frontend__io_ptw_pmp_cfg_a_2;
    wire [1:0] frontend__io_ptw_pmp_cfg_a_3;
    wire [1:0] frontend__io_ptw_pmp_cfg_a_4;
    wire [1:0] frontend__io_ptw_pmp_cfg_a_5;
    wire [1:0] frontend__io_ptw_pmp_cfg_a_6;
    wire [1:0] frontend__io_ptw_pmp_cfg_a_7;
    wire  frontend__io_ptw_pmp_cfg_x_0;
    wire  frontend__io_ptw_pmp_cfg_x_1;
    wire  frontend__io_ptw_pmp_cfg_x_2;
    wire  frontend__io_ptw_pmp_cfg_x_3;
    wire  frontend__io_ptw_pmp_cfg_x_4;
    wire  frontend__io_ptw_pmp_cfg_x_5;
    wire  frontend__io_ptw_pmp_cfg_x_6;
    wire  frontend__io_ptw_pmp_cfg_x_7;
    wire [29:0] frontend__io_ptw_pmp_addr_0;
    wire [29:0] frontend__io_ptw_pmp_addr_1;
    wire [29:0] frontend__io_ptw_pmp_addr_2;
    wire [29:0] frontend__io_ptw_pmp_addr_3;
    wire [29:0] frontend__io_ptw_pmp_addr_4;
    wire [29:0] frontend__io_ptw_pmp_addr_5;
    wire [29:0] frontend__io_ptw_pmp_addr_6;
    wire [29:0] frontend__io_ptw_pmp_addr_7;
    wire [31:0] frontend__io_ptw_pmp_mask_0;
    wire [31:0] frontend__io_ptw_pmp_mask_1;
    wire [31:0] frontend__io_ptw_pmp_mask_2;
    wire [31:0] frontend__io_ptw_pmp_mask_3;
    wire [31:0] frontend__io_ptw_pmp_mask_4;
    wire [31:0] frontend__io_ptw_pmp_mask_5;
    wire [31:0] frontend__io_ptw_pmp_mask_6;
    wire [31:0] frontend__io_ptw_pmp_mask_7;
    wire [63:0] frontend__io_ptw_customCSRs_csrs_0_value;

    wire[32:0]  frontend___io_cpu_npc_T  ;
    wire  frontend__fq_io_enq_valid  ;
    wire[31:0]  frontend___tlb_io_resp_paddr  ;
    wire  frontend___tlb_io_resp_pf_inst  ;
    wire  frontend___tlb_io_resp_ae_inst  ;
    wire  frontend___tlb_io_resp_cacheable  ;
    wire  frontend___fq_io_enq_ready  ;
    wire[4:0]  frontend___fq_io_mask  ;
    wire  frontend___icache_io_resp_valid  ;
    wire[31:0]  frontend___icache_io_resp_bits_data  ;
    wire  frontend___icache_io_resp_bits_ae  ;
    reg  frontend__s1_valid  ;
    reg  frontend__s2_valid  ;
    wire  frontend__s0_valid  =  frontend__io_cpu_req_valid  |~(  frontend___fq_io_mask  [2])|~(  frontend___fq_io_mask  [3])&(~  frontend__s1_valid  |~  frontend__s2_valid  )|~(  frontend___fq_io_mask  [4])&~  frontend__s1_valid  &~  frontend__s2_valid  ;
    reg[33:0]  frontend__s1_pc  ;
    reg  frontend__s1_speculative  ;
    reg[33:0]  frontend__s2_pc  ;
    reg  frontend__s2_tlb_resp_pf_inst  ;
    reg  frontend__s2_tlb_resp_ae_inst  ;
    reg  frontend__s2_tlb_resp_cacheable  ;
    wire  frontend___s2_xcpt_T  =  frontend__s2_tlb_resp_ae_inst  |  frontend__s2_tlb_resp_pf_inst  ;
    reg  frontend__s2_speculative  ;
    wire[33:0]  frontend__predicted_npc  ={  frontend__s1_pc  [33:2],2'h0}+34'h4;
    reg  frontend__s2_replay_REG  ;
    wire  frontend__s2_replay  =  frontend__s2_valid  &~(  frontend___fq_io_enq_ready  &  frontend__fq_io_enq_valid  )|  frontend__s2_replay_REG  ;
    wire  frontend__icache_io_s2_kill  =  frontend__s2_speculative  &~(  frontend__s2_tlb_resp_cacheable  &~(  frontend__io_ptw_customCSRs_csrs_0_value  [3]))|  frontend___s2_xcpt_T  ;
    reg  frontend__fq_io_enq_valid_REG  ;
    assign   frontend__fq_io_enq_valid  =  frontend__fq_io_enq_valid_REG  &  frontend__s2_valid  &(  frontend___icache_io_resp_valid  |  frontend__icache_io_s2_kill  );
    assign   frontend___io_cpu_npc_T  =  frontend__io_cpu_req_valid   ?   frontend__io_cpu_req_bits_pc  [33:1]:  frontend__s2_replay   ?   frontend__s2_pc  [33:1]:  frontend__predicted_npc  [33:1];
    always @( posedge   frontend__clock  )
    begin
        if (~  frontend__reset  &~(~(  frontend__io_cpu_req_valid  |  frontend__io_cpu_flush_icache  |  frontend__io_cpu_bht_update_valid  |  frontend__io_cpu_btb_update_valid  )|  frontend__io_cpu_might_request  ))
        begin
            if (1)
                $display("Assertion failed\n    at Frontend.scala:92 assert(!(io.cpu.req.valid || io.cpu.sfence.valid || io.cpu.flush_icache || io.cpu.bht_update.valid || io.cpu.btb_update.valid) || io.cpu.might_request)\n");
            if (1)
                $display("");
        end
        if (~  frontend__reset  &  frontend__s2_speculative  &  frontend__io_ptw_customCSRs_csrs_0_value  [3]&~  frontend__icache_io_s2_kill  )
        begin
            if (1)
                $display("Assertion failed\n    at Frontend.scala:190 assert(!(s2_speculative && io.ptw.customCSRs.asInstanceOf[RocketCustomCSRs].disableSpeculativeICacheRefill && !icache.io.s2_kill))\n");
            if (1)
                $display("");
        end
    end

    always @( posedge   frontend__clock  )
    begin
        frontend__s1_valid   <=  frontend__s0_valid  ;
        frontend__s1_pc   <={  frontend___io_cpu_npc_T  ,1'h0};
        if (  frontend__io_cpu_req_valid  )
            frontend__s1_speculative   <=  frontend__io_cpu_req_bits_speculative  ;
        else
            if (  frontend__s2_replay  )
                frontend__s1_speculative   <=  frontend__s2_speculative  ;
            else
                frontend__s1_speculative   <=  frontend__s1_speculative  |  frontend__s2_valid  &~  frontend__s2_speculative  ;
        if (~  frontend__s2_replay  )
        begin
            frontend__s2_tlb_resp_pf_inst   <=  frontend___tlb_io_resp_pf_inst  ;
            frontend__s2_tlb_resp_ae_inst   <=  frontend___tlb_io_resp_ae_inst  ;
            frontend__s2_tlb_resp_cacheable   <=  frontend___tlb_io_resp_cacheable  ;
        end
        frontend__fq_io_enq_valid_REG   <=  frontend__s1_valid  ;
        if (  frontend__reset  )
        begin
            frontend__s2_valid   <=1'h0;
            frontend__s2_pc   <=34'h10040;
            frontend__s2_speculative   <=1'h0;
            frontend__s2_replay_REG   <=1'h1;
        end
        else
        begin
            frontend__s2_valid   <=~  frontend__s2_replay  &~  frontend__io_cpu_req_valid  ;
            if (~  frontend__s2_replay  )
            begin
                frontend__s2_pc   <=  frontend__s1_pc  ;
                frontend__s2_speculative   <=  frontend__s1_speculative  ;
            end
            frontend__s2_replay_REG   <=  frontend__s2_replay  &~  frontend__s0_valid  ;
        end
    end


    wire  frontend__icache__clock;
    wire  frontend__icache__reset;
    wire  frontend__icache__auto_master_out_a_ready;
    wire  frontend__icache__auto_master_out_a_valid;
    wire [31:0] frontend__icache__auto_master_out_a_bits_address;
    wire  frontend__icache__auto_master_out_d_valid;
    wire [2:0] frontend__icache__auto_master_out_d_bits_opcode;
    wire [3:0] frontend__icache__auto_master_out_d_bits_size;
    wire [63:0] frontend__icache__auto_master_out_d_bits_data;
    wire  frontend__icache__auto_master_out_d_bits_corrupt;
    wire  frontend__icache__io_req_valid;
    wire [32:0] frontend__icache__io_req_bits_addr;
    wire [31:0] frontend__icache__io_s1_paddr;
    wire  frontend__icache__io_s1_kill;
    wire  frontend__icache__io_s2_kill;
    wire  frontend__icache__io_resp_valid;
    wire [31:0] frontend__icache__io_resp_bits_data;
    wire  frontend__icache__io_resp_bits_ae;
    wire  frontend__icache__io_invalidate;

    wire  frontend__icache__readEnable  ;
    wire  frontend__icache__writeEnable  ;
    wire  frontend__icache__readEnable_0  ;
    wire  frontend__icache__wen  ;
    wire  frontend__icache__readEnable_1  ;
    wire[5:0]  frontend__icache___tag_rdata_T  ;
    wire  frontend__icache__io_req_ready  ;
    wire[31:0]  frontend__icache___data_arrays_1_0_ext_RW0_rdata  ;
    wire[31:0]  frontend__icache___data_arrays_0_0_ext_RW0_rdata  ;
    wire[20:0]  frontend__icache___tag_array_0_ext_RW0_rdata  ;
    wire  frontend__icache__s0_valid  =  frontend__icache__io_req_ready  &  frontend__icache__io_req_valid  ;
    reg  frontend__icache__s1_valid  ;
    reg  frontend__icache__s2_valid  ;
    reg  frontend__icache__s2_hit  ;
    reg  frontend__icache__invalidated  ;
    reg  frontend__icache__refill_valid  ;
    wire  frontend__icache__s2_miss  =  frontend__icache__s2_valid  &~  frontend__icache__s2_hit  &~  frontend__icache__io_s2_kill  ;
    reg  frontend__icache__s2_request_refill_REG  ;
    wire  frontend__icache__s2_request_refill  =  frontend__icache__s2_miss  &  frontend__icache__s2_request_refill_REG  ;
    reg[31:0]  frontend__icache__refill_paddr  ;
    wire  frontend__icache__refill_one_beat  =  frontend__icache__auto_master_out_d_valid  &  frontend__icache__auto_master_out_d_bits_opcode  [0];
    assign   frontend__icache__io_req_ready  =~  frontend__icache__refill_one_beat  ;
    wire[26:0]  frontend__icache___beats1_decode_T_1  =27'hFFF<<  frontend__icache__auto_master_out_d_bits_size  ;
    wire[8:0]  frontend__icache__beats1  =  frontend__icache__auto_master_out_d_bits_opcode  [0] ? ~(  frontend__icache___beats1_decode_T_1  [11:3]):9'h0;
    reg[8:0]  frontend__icache__counter  ;
    wire[8:0]  frontend__icache___counter1_T  =  frontend__icache__counter  -9'h1;
    wire[8:0]  frontend__icache__refill_cnt  =  frontend__icache__beats1  &~  frontend__icache___counter1_T  ;
    wire  frontend__icache__writeEnable_0  =  frontend__icache__refill_one_beat  &(  frontend__icache__counter  ==9'h1|  frontend__icache__beats1  ==9'h0)&  frontend__icache__auto_master_out_d_valid  ;
    assign   frontend__icache___tag_rdata_T  =  frontend__icache__io_req_bits_addr  [11:6];
    assign   frontend__icache__readEnable_1  =~  frontend__icache__writeEnable_0  &  frontend__icache__s0_valid  ;
    reg  frontend__icache__accruedRefillError  ;
    wire  frontend__icache__refillError  =  frontend__icache__auto_master_out_d_bits_corrupt  |(|  frontend__icache__refill_cnt  )&  frontend__icache__accruedRefillError  ;
    reg[63:0]  frontend__icache__vb_array  ;
    wire[63:0]  frontend__icache___s1_vb_T_1  =  frontend__icache__vb_array  >>  frontend__icache__io_s1_paddr  [11:6];
    wire  frontend__icache__s1_hit  =  frontend__icache___s1_vb_T_1  [0]&  frontend__icache___tag_array_0_ext_RW0_rdata  [19:0]==  frontend__icache__io_s1_paddr  [31:12];
    assign   frontend__icache__wen  =  frontend__icache__refill_one_beat  &~  frontend__icache__invalidated  ;
    wire[8:0]  frontend__icache___mem_idx_T_6  ={  frontend__icache__refill_paddr  [11:6],3'h0};
    assign   frontend__icache__readEnable_0  =~  frontend__icache__wen  &  frontend__icache__s0_valid  &~(  frontend__icache__io_req_bits_addr  [2]);
    assign   frontend__icache__writeEnable  =  frontend__icache__refill_one_beat  &~  frontend__icache__invalidated  ;
    assign   frontend__icache__readEnable  =~  frontend__icache__writeEnable  &  frontend__icache__s0_valid  &  frontend__icache__io_req_bits_addr  [2];
    reg[31:0]  frontend__icache__s2_dout_0  ;
    reg  frontend__icache__s2_tl_error  ;
    wire[127:0]  frontend__icache___vb_array_T_3  =128'h1<<  frontend__icache__refill_paddr  [11:6];
    wire  frontend__icache___s1_can_request_refill_T  =  frontend__icache__s2_miss  |  frontend__icache__refill_valid  ;
    always @( posedge   frontend__icache__clock  )
    begin
        if (  frontend__icache__reset  )
        begin
            frontend__icache__s1_valid   <=1'h0;
            frontend__icache__s2_valid   <=1'h0;
            frontend__icache__refill_valid   <=1'h0;
            frontend__icache__counter   <=9'h0;
            frontend__icache__vb_array   <=64'h0;
        end
        else
        begin
            frontend__icache__s1_valid   <=  frontend__icache__s0_valid  ;
            frontend__icache__s2_valid   <=  frontend__icache__s1_valid  &~  frontend__icache__io_s1_kill  ;
            frontend__icache__refill_valid   <=~  frontend__icache__writeEnable_0  &(  frontend__icache__auto_master_out_a_ready  &  frontend__icache__s2_request_refill  |  frontend__icache__refill_valid  );
            if (  frontend__icache__auto_master_out_d_valid  )
            begin
                if (  frontend__icache__counter  ==9'h0)
                    frontend__icache__counter   <=  frontend__icache__beats1  ;
                else
                    frontend__icache__counter   <=  frontend__icache___counter1_T  ;
            end
            if (  frontend__icache__io_invalidate  )
                frontend__icache__vb_array   <=64'h0;
            else
                if (  frontend__icache__refill_one_beat  )
                    frontend__icache__vb_array   <=  frontend__icache__writeEnable_0  &~  frontend__icache__invalidated   ?   frontend__icache__vb_array  |  frontend__icache___vb_array_T_3  [63:0]:~(~  frontend__icache__vb_array  |  frontend__icache___vb_array_T_3  [63:0]);
        end
        frontend__icache__s2_hit   <=  frontend__icache__s1_hit  ;
        frontend__icache__invalidated   <=  frontend__icache__refill_valid  &(  frontend__icache__io_invalidate  |  frontend__icache__invalidated  );
        frontend__icache__s2_request_refill_REG   <=~  frontend__icache___s1_can_request_refill_T  ;
        if (  frontend__icache__s1_valid  &~  frontend__icache___s1_can_request_refill_T  )
            frontend__icache__refill_paddr   <=  frontend__icache__io_s1_paddr  ;
        if (  frontend__icache__refill_one_beat  )
            frontend__icache__accruedRefillError   <=  frontend__icache__refillError  ;
        if (  frontend__icache__s1_valid  )
        begin
            frontend__icache__s2_dout_0   <=  frontend__icache__io_s1_paddr  [2] ?   frontend__icache___data_arrays_1_0_ext_RW0_rdata  :  frontend__icache___data_arrays_0_0_ext_RW0_rdata  ;
            frontend__icache__s2_tl_error   <=  frontend__icache__s1_hit  &  frontend__icache___tag_array_0_ext_RW0_rdata  [20];
        end
    end


    wire [5:0] frontend__icache__tag_array_0_ext__RW0_addr;
    wire  frontend__icache__tag_array_0_ext__RW0_en;
    wire  frontend__icache__tag_array_0_ext__RW0_clk;
    wire  frontend__icache__tag_array_0_ext__RW0_wmode;
    wire [20:0] frontend__icache__tag_array_0_ext__RW0_wdata;
    wire [20:0] frontend__icache__tag_array_0_ext__RW0_rdata;

    reg[20:0]  frontend__icache__tag_array_0_ext__Memory  [0:63];
    reg[5:0]  frontend__icache__tag_array_0_ext___RW0_raddr_d0  ;
    reg  frontend__icache__tag_array_0_ext___RW0_ren_d0  ;
    reg  frontend__icache__tag_array_0_ext___RW0_rmode_d0  ;
    always @( posedge   frontend__icache__tag_array_0_ext__RW0_clk  )
    begin
        frontend__icache__tag_array_0_ext___RW0_raddr_d0   <=  frontend__icache__tag_array_0_ext__RW0_addr  ;
        frontend__icache__tag_array_0_ext___RW0_ren_d0   <=  frontend__icache__tag_array_0_ext__RW0_en  ;
        frontend__icache__tag_array_0_ext___RW0_rmode_d0   <=  frontend__icache__tag_array_0_ext__RW0_wmode  ;
        if (  frontend__icache__tag_array_0_ext__RW0_en  &  frontend__icache__tag_array_0_ext__RW0_wmode  &1'h1)
            frontend__icache__tag_array_0_ext__Memory   [  frontend__icache__tag_array_0_ext__RW0_addr  ]<=  frontend__icache__tag_array_0_ext__RW0_wdata  ;
    end

    assign   frontend__icache__tag_array_0_ext__RW0_rdata  =  frontend__icache__tag_array_0_ext___RW0_ren_d0  &~  frontend__icache__tag_array_0_ext___RW0_rmode_d0   ?   frontend__icache__tag_array_0_ext__Memory  [  frontend__icache__tag_array_0_ext___RW0_raddr_d0  ]:21'bx;
    assign frontend__icache__tag_array_0_ext__RW0_addr = frontend__icache__writeEnable_0 ? frontend__icache__refill_paddr[11:6]:frontend__icache___tag_rdata_T;
    assign frontend__icache__tag_array_0_ext__RW0_en = frontend__icache__readEnable_1|frontend__icache__writeEnable_0;
    assign frontend__icache__tag_array_0_ext__RW0_clk = frontend__icache__clock;
    assign frontend__icache__tag_array_0_ext__RW0_wmode = frontend__icache__refill_one_beat;
    assign frontend__icache__tag_array_0_ext__RW0_wdata = {frontend__icache__refillError,frontend__icache__refill_paddr[31:12]};
    assign frontend__icache___tag_array_0_ext_RW0_rdata = frontend__icache__tag_array_0_ext__RW0_rdata;


    wire [8:0] frontend__icache__data_arrays_0_0_ext__RW0_addr;
    wire  frontend__icache__data_arrays_0_0_ext__RW0_en;
    wire  frontend__icache__data_arrays_0_0_ext__RW0_clk;
    wire  frontend__icache__data_arrays_0_0_ext__RW0_wmode;
    wire [31:0] frontend__icache__data_arrays_0_0_ext__RW0_wdata;
    wire [31:0] frontend__icache__data_arrays_0_0_ext__RW0_rdata;
    wire [8:0] frontend__icache__data_arrays_1_0_ext__RW0_addr;
    wire  frontend__icache__data_arrays_1_0_ext__RW0_en;
    wire  frontend__icache__data_arrays_1_0_ext__RW0_clk;
    wire  frontend__icache__data_arrays_1_0_ext__RW0_wmode;
    wire [31:0] frontend__icache__data_arrays_1_0_ext__RW0_wdata;
    wire [31:0] frontend__icache__data_arrays_1_0_ext__RW0_rdata;

    reg[31:0]  frontend__icache__data_arrays_0_0_ext__Memory  [0:511];
    reg[8:0]  frontend__icache__data_arrays_0_0_ext___RW0_raddr_d0  ;
    reg  frontend__icache__data_arrays_0_0_ext___RW0_ren_d0  ;
    reg  frontend__icache__data_arrays_0_0_ext___RW0_rmode_d0  ;
    always @( posedge   frontend__icache__data_arrays_0_0_ext__RW0_clk  )
    begin
        frontend__icache__data_arrays_0_0_ext___RW0_raddr_d0   <=  frontend__icache__data_arrays_0_0_ext__RW0_addr  ;
        frontend__icache__data_arrays_0_0_ext___RW0_ren_d0   <=  frontend__icache__data_arrays_0_0_ext__RW0_en  ;
        frontend__icache__data_arrays_0_0_ext___RW0_rmode_d0   <=  frontend__icache__data_arrays_0_0_ext__RW0_wmode  ;
        if (  frontend__icache__data_arrays_0_0_ext__RW0_en  &  frontend__icache__data_arrays_0_0_ext__RW0_wmode  &1'h1)
            frontend__icache__data_arrays_0_0_ext__Memory   [  frontend__icache__data_arrays_0_0_ext__RW0_addr  ]<=  frontend__icache__data_arrays_0_0_ext__RW0_wdata  ;
    end

    assign   frontend__icache__data_arrays_0_0_ext__RW0_rdata  =  frontend__icache__data_arrays_0_0_ext___RW0_ren_d0  &~  frontend__icache__data_arrays_0_0_ext___RW0_rmode_d0   ?   frontend__icache__data_arrays_0_0_ext__Memory  [  frontend__icache__data_arrays_0_0_ext___RW0_raddr_d0  ]:32'bx;



    reg[31:0]  frontend__icache__data_arrays_1_0_ext__Memory  [0:511];
    reg[8:0]  frontend__icache__data_arrays_1_0_ext___RW0_raddr_d0  ;
    reg  frontend__icache__data_arrays_1_0_ext___RW0_ren_d0  ;
    reg  frontend__icache__data_arrays_1_0_ext___RW0_rmode_d0  ;
    always @( posedge   frontend__icache__data_arrays_1_0_ext__RW0_clk  )
    begin
        frontend__icache__data_arrays_1_0_ext___RW0_raddr_d0   <=  frontend__icache__data_arrays_1_0_ext__RW0_addr  ;
        frontend__icache__data_arrays_1_0_ext___RW0_ren_d0   <=  frontend__icache__data_arrays_1_0_ext__RW0_en  ;
        frontend__icache__data_arrays_1_0_ext___RW0_rmode_d0   <=  frontend__icache__data_arrays_1_0_ext__RW0_wmode  ;
        if (  frontend__icache__data_arrays_1_0_ext__RW0_en  &  frontend__icache__data_arrays_1_0_ext__RW0_wmode  &1'h1)
            frontend__icache__data_arrays_1_0_ext__Memory   [  frontend__icache__data_arrays_1_0_ext__RW0_addr  ]<=  frontend__icache__data_arrays_1_0_ext__RW0_wdata  ;
    end

    assign   frontend__icache__data_arrays_1_0_ext__RW0_rdata  =  frontend__icache__data_arrays_1_0_ext___RW0_ren_d0  &~  frontend__icache__data_arrays_1_0_ext___RW0_rmode_d0   ?   frontend__icache__data_arrays_1_0_ext__Memory  [  frontend__icache__data_arrays_1_0_ext___RW0_raddr_d0  ]:32'bx;
    assign frontend__icache__data_arrays_0_0_ext__RW0_addr = frontend__icache__refill_one_beat ? frontend__icache___mem_idx_T_6|frontend__icache__refill_cnt:frontend__icache__io_req_bits_addr[11:3];
    assign frontend__icache__data_arrays_0_0_ext__RW0_en = frontend__icache__readEnable_0|frontend__icache__wen;
    assign frontend__icache__data_arrays_0_0_ext__RW0_clk = frontend__icache__clock;
    assign frontend__icache__data_arrays_0_0_ext__RW0_wmode = frontend__icache__refill_one_beat;
    assign frontend__icache__data_arrays_0_0_ext__RW0_wdata = frontend__icache__auto_master_out_d_bits_data[31:0];
    assign frontend__icache___data_arrays_0_0_ext_RW0_rdata = frontend__icache__data_arrays_0_0_ext__RW0_rdata;
    assign frontend__icache__data_arrays_1_0_ext__RW0_addr = frontend__icache__refill_one_beat ? frontend__icache___mem_idx_T_6|frontend__icache__refill_cnt:frontend__icache__io_req_bits_addr[11:3];
    assign frontend__icache__data_arrays_1_0_ext__RW0_en = frontend__icache__readEnable|frontend__icache__writeEnable;
    assign frontend__icache__data_arrays_1_0_ext__RW0_clk = frontend__icache__clock;
    assign frontend__icache__data_arrays_1_0_ext__RW0_wmode = frontend__icache__refill_one_beat;
    assign frontend__icache__data_arrays_1_0_ext__RW0_wdata = frontend__icache__auto_master_out_d_bits_data[63:32];
    assign frontend__icache___data_arrays_1_0_ext_RW0_rdata = frontend__icache__data_arrays_1_0_ext__RW0_rdata;

    assign   frontend__icache__auto_master_out_a_valid  =  frontend__icache__s2_request_refill  ;
    assign   frontend__icache__auto_master_out_a_bits_address  ={  frontend__icache__refill_paddr  [31:6],6'h0};
    assign   frontend__icache__io_resp_valid  =  frontend__icache__s2_valid  &  frontend__icache__s2_hit  ;
    assign   frontend__icache__io_resp_bits_data  =  frontend__icache__s2_dout_0  ;
    assign   frontend__icache__io_resp_bits_ae  =  frontend__icache__s2_tl_error  ;
    assign frontend__icache__clock = frontend__clock;
    assign frontend__icache__reset = frontend__reset;
    assign frontend__icache__auto_master_out_a_ready = frontend__auto_icache_master_out_a_ready;
    assign frontend__auto_icache_master_out_a_valid = frontend__icache__auto_master_out_a_valid;
    assign frontend__auto_icache_master_out_a_bits_address = frontend__icache__auto_master_out_a_bits_address;
    assign frontend__icache__auto_master_out_d_valid = frontend__auto_icache_master_out_d_valid;
    assign frontend__icache__auto_master_out_d_bits_opcode = frontend__auto_icache_master_out_d_bits_opcode;
    assign frontend__icache__auto_master_out_d_bits_size = frontend__auto_icache_master_out_d_bits_size;
    assign frontend__icache__auto_master_out_d_bits_data = frontend__auto_icache_master_out_d_bits_data;
    assign frontend__icache__auto_master_out_d_bits_corrupt = frontend__auto_icache_master_out_d_bits_corrupt;
    assign frontend__icache__io_req_valid = frontend__s0_valid;
    assign frontend__icache__io_req_bits_addr = {frontend___io_cpu_npc_T[31:0],1'h0};
    assign frontend__icache__io_s1_paddr = frontend___tlb_io_resp_paddr;
    assign frontend__icache__io_s1_kill = frontend__io_cpu_req_valid|frontend__s2_replay;
    assign frontend__icache__io_s2_kill = frontend__icache_io_s2_kill;
    assign frontend___icache_io_resp_valid = frontend__icache__io_resp_valid;
    assign frontend___icache_io_resp_bits_data = frontend__icache__io_resp_bits_data;
    assign frontend___icache_io_resp_bits_ae = frontend__icache__io_resp_bits_ae;
    assign frontend__icache__io_invalidate = frontend__io_cpu_flush_icache;


    wire  frontend__fq__clock;
    wire  frontend__fq__reset;
    wire  frontend__fq__io_enq_ready;
    wire  frontend__fq__io_enq_valid;
    wire [33:0] frontend__fq__io_enq_bits_pc;
    wire [31:0] frontend__fq__io_enq_bits_data;
    wire  frontend__fq__io_enq_bits_xcpt_pf_inst;
    wire  frontend__fq__io_enq_bits_xcpt_ae_inst;
    wire  frontend__fq__io_enq_bits_replay;
    wire  frontend__fq__io_deq_ready;
    wire  frontend__fq__io_deq_valid;
    wire [33:0] frontend__fq__io_deq_bits_pc;
    wire [31:0] frontend__fq__io_deq_bits_data;
    wire  frontend__fq__io_deq_bits_xcpt_pf_inst;
    wire  frontend__fq__io_deq_bits_xcpt_gf_inst;
    wire  frontend__fq__io_deq_bits_xcpt_ae_inst;
    wire  frontend__fq__io_deq_bits_replay;
    wire [4:0] frontend__fq__io_mask;

    reg  frontend__fq__valid_0  ;
    reg  frontend__fq__valid_1  ;
    reg  frontend__fq__valid_2  ;
    reg  frontend__fq__valid_3  ;
    reg  frontend__fq__valid_4  ;
    reg[33:0]  frontend__fq__elts_pc_0  ;
    reg[33:0]  frontend__fq__elts_pc_1  ;
    reg[33:0]  frontend__fq__elts_pc_2  ;
    reg[33:0]  frontend__fq__elts_pc_3  ;
    reg[33:0]  frontend__fq__elts_pc_4  ;
    reg[31:0]  frontend__fq__elts_data_0  ;
    reg[31:0]  frontend__fq__elts_data_1  ;
    reg[31:0]  frontend__fq__elts_data_2  ;
    reg[31:0]  frontend__fq__elts_data_3  ;
    reg[31:0]  frontend__fq__elts_data_4  ;
    reg  frontend__fq__elts_xcpt_pf_inst_0  ;
    reg  frontend__fq__elts_xcpt_pf_inst_1  ;
    reg  frontend__fq__elts_xcpt_pf_inst_2  ;
    reg  frontend__fq__elts_xcpt_pf_inst_3  ;
    reg  frontend__fq__elts_xcpt_pf_inst_4  ;
    reg  frontend__fq__elts_xcpt_gf_inst_0  ;
    reg  frontend__fq__elts_xcpt_gf_inst_1  ;
    reg  frontend__fq__elts_xcpt_gf_inst_2  ;
    reg  frontend__fq__elts_xcpt_gf_inst_3  ;
    reg  frontend__fq__elts_xcpt_gf_inst_4  ;
    reg  frontend__fq__elts_xcpt_ae_inst_0  ;
    reg  frontend__fq__elts_xcpt_ae_inst_1  ;
    reg  frontend__fq__elts_xcpt_ae_inst_2  ;
    reg  frontend__fq__elts_xcpt_ae_inst_3  ;
    reg  frontend__fq__elts_xcpt_ae_inst_4  ;
    reg  frontend__fq__elts_replay_0  ;
    reg  frontend__fq__elts_replay_1  ;
    reg  frontend__fq__elts_replay_2  ;
    reg  frontend__fq__elts_replay_3  ;
    reg  frontend__fq__elts_replay_4  ;
    wire  frontend__fq___valid_4_T_4  =~  frontend__fq__valid_4  &  frontend__fq__io_enq_valid  ;
    wire  frontend__fq__wen_4  =  frontend__fq__io_deq_ready   ?   frontend__fq___valid_4_T_4  &  frontend__fq__valid_4  :  frontend__fq___valid_4_T_4  &  frontend__fq__valid_3  &~  frontend__fq__valid_4  ;
    always @( posedge   frontend__fq__clock  )
    begin
        if (  frontend__fq__reset  )
        begin
            frontend__fq__valid_0   <=1'h0;
            frontend__fq__valid_1   <=1'h0;
            frontend__fq__valid_2   <=1'h0;
            frontend__fq__valid_3   <=1'h0;
            frontend__fq__valid_4   <=1'h0;
        end
        else
            if (  frontend__fq__io_deq_ready  )
            begin
                frontend__fq__valid_0   <=  frontend__fq__valid_1  |  frontend__fq___valid_4_T_4  &  frontend__fq__valid_0  ;
                frontend__fq__valid_1   <=  frontend__fq__valid_2  |  frontend__fq___valid_4_T_4  &  frontend__fq__valid_1  ;
                frontend__fq__valid_2   <=  frontend__fq__valid_3  |  frontend__fq___valid_4_T_4  &  frontend__fq__valid_2  ;
                frontend__fq__valid_3   <=  frontend__fq__valid_4  |  frontend__fq___valid_4_T_4  &  frontend__fq__valid_3  ;
                frontend__fq__valid_4   <=  frontend__fq___valid_4_T_4  &  frontend__fq__valid_4  ;
            end
            else
            begin
                frontend__fq__valid_0   <=  frontend__fq___valid_4_T_4  |  frontend__fq__valid_0  ;
                frontend__fq__valid_1   <=  frontend__fq___valid_4_T_4  &  frontend__fq__valid_0  |  frontend__fq__valid_1  ;
                frontend__fq__valid_2   <=  frontend__fq___valid_4_T_4  &  frontend__fq__valid_1  |  frontend__fq__valid_2  ;
                frontend__fq__valid_3   <=  frontend__fq___valid_4_T_4  &  frontend__fq__valid_2  |  frontend__fq__valid_3  ;
                frontend__fq__valid_4   <=  frontend__fq___valid_4_T_4  &  frontend__fq__valid_3  |  frontend__fq__valid_4  ;
            end
        if (  frontend__fq__io_deq_ready   ?   frontend__fq__valid_1  |  frontend__fq___valid_4_T_4  &  frontend__fq__valid_0  :  frontend__fq___valid_4_T_4  &~  frontend__fq__valid_0  )
        begin
            frontend__fq__elts_pc_0   <=  frontend__fq__valid_1   ?   frontend__fq__elts_pc_1  :  frontend__fq__io_enq_bits_pc  ;
            frontend__fq__elts_data_0   <=  frontend__fq__valid_1   ?   frontend__fq__elts_data_1  :  frontend__fq__io_enq_bits_data  ;
            frontend__fq__elts_xcpt_pf_inst_0   <=  frontend__fq__valid_1   ?   frontend__fq__elts_xcpt_pf_inst_1  :  frontend__fq__io_enq_bits_xcpt_pf_inst  ;
            frontend__fq__elts_xcpt_gf_inst_0   <=  frontend__fq__valid_1  &  frontend__fq__elts_xcpt_gf_inst_1  ;
            frontend__fq__elts_xcpt_ae_inst_0   <=  frontend__fq__valid_1   ?   frontend__fq__elts_xcpt_ae_inst_1  :  frontend__fq__io_enq_bits_xcpt_ae_inst  ;
            frontend__fq__elts_replay_0   <=  frontend__fq__valid_1   ?   frontend__fq__elts_replay_1  :  frontend__fq__io_enq_bits_replay  ;
        end
        if (  frontend__fq__io_deq_ready   ?   frontend__fq__valid_2  |  frontend__fq___valid_4_T_4  &  frontend__fq__valid_1  :  frontend__fq___valid_4_T_4  &  frontend__fq__valid_0  &~  frontend__fq__valid_1  )
        begin
            frontend__fq__elts_pc_1   <=  frontend__fq__valid_2   ?   frontend__fq__elts_pc_2  :  frontend__fq__io_enq_bits_pc  ;
            frontend__fq__elts_data_1   <=  frontend__fq__valid_2   ?   frontend__fq__elts_data_2  :  frontend__fq__io_enq_bits_data  ;
            frontend__fq__elts_xcpt_pf_inst_1   <=  frontend__fq__valid_2   ?   frontend__fq__elts_xcpt_pf_inst_2  :  frontend__fq__io_enq_bits_xcpt_pf_inst  ;
            frontend__fq__elts_xcpt_gf_inst_1   <=  frontend__fq__valid_2  &  frontend__fq__elts_xcpt_gf_inst_2  ;
            frontend__fq__elts_xcpt_ae_inst_1   <=  frontend__fq__valid_2   ?   frontend__fq__elts_xcpt_ae_inst_2  :  frontend__fq__io_enq_bits_xcpt_ae_inst  ;
            frontend__fq__elts_replay_1   <=  frontend__fq__valid_2   ?   frontend__fq__elts_replay_2  :  frontend__fq__io_enq_bits_replay  ;
        end
        if (  frontend__fq__io_deq_ready   ?   frontend__fq__valid_3  |  frontend__fq___valid_4_T_4  &  frontend__fq__valid_2  :  frontend__fq___valid_4_T_4  &  frontend__fq__valid_1  &~  frontend__fq__valid_2  )
        begin
            frontend__fq__elts_pc_2   <=  frontend__fq__valid_3   ?   frontend__fq__elts_pc_3  :  frontend__fq__io_enq_bits_pc  ;
            frontend__fq__elts_data_2   <=  frontend__fq__valid_3   ?   frontend__fq__elts_data_3  :  frontend__fq__io_enq_bits_data  ;
            frontend__fq__elts_xcpt_pf_inst_2   <=  frontend__fq__valid_3   ?   frontend__fq__elts_xcpt_pf_inst_3  :  frontend__fq__io_enq_bits_xcpt_pf_inst  ;
            frontend__fq__elts_xcpt_gf_inst_2   <=  frontend__fq__valid_3  &  frontend__fq__elts_xcpt_gf_inst_3  ;
            frontend__fq__elts_xcpt_ae_inst_2   <=  frontend__fq__valid_3   ?   frontend__fq__elts_xcpt_ae_inst_3  :  frontend__fq__io_enq_bits_xcpt_ae_inst  ;
            frontend__fq__elts_replay_2   <=  frontend__fq__valid_3   ?   frontend__fq__elts_replay_3  :  frontend__fq__io_enq_bits_replay  ;
        end
        if (  frontend__fq__io_deq_ready   ?   frontend__fq__valid_4  |  frontend__fq___valid_4_T_4  &  frontend__fq__valid_3  :  frontend__fq___valid_4_T_4  &  frontend__fq__valid_2  &~  frontend__fq__valid_3  )
        begin
            frontend__fq__elts_pc_3   <=  frontend__fq__valid_4   ?   frontend__fq__elts_pc_4  :  frontend__fq__io_enq_bits_pc  ;
            frontend__fq__elts_data_3   <=  frontend__fq__valid_4   ?   frontend__fq__elts_data_4  :  frontend__fq__io_enq_bits_data  ;
            frontend__fq__elts_xcpt_pf_inst_3   <=  frontend__fq__valid_4   ?   frontend__fq__elts_xcpt_pf_inst_4  :  frontend__fq__io_enq_bits_xcpt_pf_inst  ;
            frontend__fq__elts_xcpt_gf_inst_3   <=  frontend__fq__valid_4  &  frontend__fq__elts_xcpt_gf_inst_4  ;
            frontend__fq__elts_xcpt_ae_inst_3   <=  frontend__fq__valid_4   ?   frontend__fq__elts_xcpt_ae_inst_4  :  frontend__fq__io_enq_bits_xcpt_ae_inst  ;
            frontend__fq__elts_replay_3   <=  frontend__fq__valid_4   ?   frontend__fq__elts_replay_4  :  frontend__fq__io_enq_bits_replay  ;
        end
        if (  frontend__fq__wen_4  )
        begin
            frontend__fq__elts_pc_4   <=  frontend__fq__io_enq_bits_pc  ;
            frontend__fq__elts_data_4   <=  frontend__fq__io_enq_bits_data  ;
            frontend__fq__elts_xcpt_pf_inst_4   <=  frontend__fq__io_enq_bits_xcpt_pf_inst  ;
            frontend__fq__elts_xcpt_ae_inst_4   <=  frontend__fq__io_enq_bits_xcpt_ae_inst  ;
            frontend__fq__elts_replay_4   <=  frontend__fq__io_enq_bits_replay  ;
        end
        frontend__fq__elts_xcpt_gf_inst_4   <=~  frontend__fq__wen_4  &  frontend__fq__elts_xcpt_gf_inst_4  ;
    end

    assign   frontend__fq__io_enq_ready  =~  frontend__fq__valid_4  ;
    assign   frontend__fq__io_deq_valid  =  frontend__fq__io_enq_valid  |  frontend__fq__valid_0  ;
    assign   frontend__fq__io_deq_bits_pc  =  frontend__fq__valid_0   ?   frontend__fq__elts_pc_0  :  frontend__fq__io_enq_bits_pc  ;
    assign   frontend__fq__io_deq_bits_data  =  frontend__fq__valid_0   ?   frontend__fq__elts_data_0  :  frontend__fq__io_enq_bits_data  ;
    assign   frontend__fq__io_deq_bits_xcpt_pf_inst  =  frontend__fq__valid_0   ?   frontend__fq__elts_xcpt_pf_inst_0  :  frontend__fq__io_enq_bits_xcpt_pf_inst  ;
    assign   frontend__fq__io_deq_bits_xcpt_gf_inst  =  frontend__fq__valid_0  &  frontend__fq__elts_xcpt_gf_inst_0  ;
    assign   frontend__fq__io_deq_bits_xcpt_ae_inst  =  frontend__fq__valid_0   ?   frontend__fq__elts_xcpt_ae_inst_0  :  frontend__fq__io_enq_bits_xcpt_ae_inst  ;
    assign   frontend__fq__io_deq_bits_replay  =  frontend__fq__valid_0   ?   frontend__fq__elts_replay_0  :  frontend__fq__io_enq_bits_replay  ;
    assign   frontend__fq__io_mask  ={  frontend__fq__valid_4  ,  frontend__fq__valid_3  ,  frontend__fq__valid_2  ,  frontend__fq__valid_1  ,  frontend__fq__valid_0  };
    assign frontend__fq__clock = frontend__clock;
    assign frontend__fq__reset = frontend__reset|frontend__io_cpu_req_valid;
    assign frontend___fq_io_enq_ready = frontend__fq__io_enq_ready;
    assign frontend__fq__io_enq_valid = frontend__fq_io_enq_valid;
    assign frontend__fq__io_enq_bits_pc = frontend__s2_pc;
    assign frontend__fq__io_enq_bits_data = frontend___icache_io_resp_bits_data;
    assign frontend__fq__io_enq_bits_xcpt_pf_inst = frontend__s2_tlb_resp_pf_inst;
    assign frontend__fq__io_enq_bits_xcpt_ae_inst = frontend___icache_io_resp_valid&frontend___icache_io_resp_bits_ae|frontend__s2_tlb_resp_ae_inst;
    assign frontend__fq__io_enq_bits_replay = frontend__icache_io_s2_kill&~frontend___icache_io_resp_valid&~frontend___s2_xcpt_T;
    assign frontend__fq__io_deq_ready = frontend__io_cpu_resp_ready;
    assign frontend__io_cpu_resp_valid = frontend__fq__io_deq_valid;
    assign frontend__io_cpu_resp_bits_pc = frontend__fq__io_deq_bits_pc;
    assign frontend__io_cpu_resp_bits_data = frontend__fq__io_deq_bits_data;
    assign frontend__io_cpu_resp_bits_xcpt_pf_inst = frontend__fq__io_deq_bits_xcpt_pf_inst;
    assign frontend__io_cpu_resp_bits_xcpt_gf_inst = frontend__fq__io_deq_bits_xcpt_gf_inst;
    assign frontend__io_cpu_resp_bits_xcpt_ae_inst = frontend__fq__io_deq_bits_xcpt_ae_inst;
    assign frontend__io_cpu_resp_bits_replay = frontend__fq__io_deq_bits_replay;
    assign frontend___fq_io_mask = frontend__fq__io_mask;


    wire [33:0] frontend__tlb__io_req_bits_vaddr;
    wire [31:0] frontend__tlb__io_resp_paddr;
    wire  frontend__tlb__io_resp_pf_inst;
    wire  frontend__tlb__io_resp_ae_inst;
    wire  frontend__tlb__io_resp_cacheable;
    wire  frontend__tlb__io_ptw_req_bits_bits_need_gpa;
    wire  frontend__tlb__io_ptw_req_bits_bits_stage2;
    wire  frontend__tlb__io_ptw_status_debug;
    wire  frontend__tlb__io_ptw_pmp_cfg_l_0;
    wire  frontend__tlb__io_ptw_pmp_cfg_l_1;
    wire  frontend__tlb__io_ptw_pmp_cfg_l_2;
    wire  frontend__tlb__io_ptw_pmp_cfg_l_3;
    wire  frontend__tlb__io_ptw_pmp_cfg_l_4;
    wire  frontend__tlb__io_ptw_pmp_cfg_l_5;
    wire  frontend__tlb__io_ptw_pmp_cfg_l_6;
    wire  frontend__tlb__io_ptw_pmp_cfg_l_7;
    wire [1:0] frontend__tlb__io_ptw_pmp_cfg_a_0;
    wire [1:0] frontend__tlb__io_ptw_pmp_cfg_a_1;
    wire [1:0] frontend__tlb__io_ptw_pmp_cfg_a_2;
    wire [1:0] frontend__tlb__io_ptw_pmp_cfg_a_3;
    wire [1:0] frontend__tlb__io_ptw_pmp_cfg_a_4;
    wire [1:0] frontend__tlb__io_ptw_pmp_cfg_a_5;
    wire [1:0] frontend__tlb__io_ptw_pmp_cfg_a_6;
    wire [1:0] frontend__tlb__io_ptw_pmp_cfg_a_7;
    wire  frontend__tlb__io_ptw_pmp_cfg_x_0;
    wire  frontend__tlb__io_ptw_pmp_cfg_x_1;
    wire  frontend__tlb__io_ptw_pmp_cfg_x_2;
    wire  frontend__tlb__io_ptw_pmp_cfg_x_3;
    wire  frontend__tlb__io_ptw_pmp_cfg_x_4;
    wire  frontend__tlb__io_ptw_pmp_cfg_x_5;
    wire  frontend__tlb__io_ptw_pmp_cfg_x_6;
    wire  frontend__tlb__io_ptw_pmp_cfg_x_7;
    wire [29:0] frontend__tlb__io_ptw_pmp_addr_0;
    wire [29:0] frontend__tlb__io_ptw_pmp_addr_1;
    wire [29:0] frontend__tlb__io_ptw_pmp_addr_2;
    wire [29:0] frontend__tlb__io_ptw_pmp_addr_3;
    wire [29:0] frontend__tlb__io_ptw_pmp_addr_4;
    wire [29:0] frontend__tlb__io_ptw_pmp_addr_5;
    wire [29:0] frontend__tlb__io_ptw_pmp_addr_6;
    wire [29:0] frontend__tlb__io_ptw_pmp_addr_7;
    wire [31:0] frontend__tlb__io_ptw_pmp_mask_0;
    wire [31:0] frontend__tlb__io_ptw_pmp_mask_1;
    wire [31:0] frontend__tlb__io_ptw_pmp_mask_2;
    wire [31:0] frontend__tlb__io_ptw_pmp_mask_3;
    wire [31:0] frontend__tlb__io_ptw_pmp_mask_4;
    wire [31:0] frontend__tlb__io_ptw_pmp_mask_5;
    wire [31:0] frontend__tlb__io_ptw_pmp_mask_6;
    wire [31:0] frontend__tlb__io_ptw_pmp_mask_7;

    wire  frontend__tlb___pmp_io_x  ;
    wire[3:0]  frontend__tlb___GEN  =  frontend__tlb__io_req_bits_vaddr  [31:28]^4'h8;
    wire  frontend__tlb__legal_address  ={  frontend__tlb__io_req_bits_vaddr  [33:14],~(  frontend__tlb__io_req_bits_vaddr  [13:12])}==22'h0|{  frontend__tlb__io_req_bits_vaddr  [33:28],~(  frontend__tlb__io_req_bits_vaddr  [27:26])}==8'h0|{  frontend__tlb__io_req_bits_vaddr  [33:26],  frontend__tlb__io_req_bits_vaddr  [25:16]^10'h200}==18'h0|~(|(  frontend__tlb__io_req_bits_vaddr  [33:12]))|{  frontend__tlb__io_req_bits_vaddr  [33:17],~(  frontend__tlb__io_req_bits_vaddr  [16])}==18'h0|{  frontend__tlb__io_req_bits_vaddr  [33:32],  frontend__tlb___GEN  }==6'h0|{  frontend__tlb__io_req_bits_vaddr  [33:31],~(  frontend__tlb__io_req_bits_vaddr  [30:29])}==5'h0;

    wire [1:0] frontend__tlb__pmp__io_prv;
    wire  frontend__tlb__pmp__io_pmp_cfg_l_0;
    wire  frontend__tlb__pmp__io_pmp_cfg_l_1;
    wire  frontend__tlb__pmp__io_pmp_cfg_l_2;
    wire  frontend__tlb__pmp__io_pmp_cfg_l_3;
    wire  frontend__tlb__pmp__io_pmp_cfg_l_4;
    wire  frontend__tlb__pmp__io_pmp_cfg_l_5;
    wire  frontend__tlb__pmp__io_pmp_cfg_l_6;
    wire  frontend__tlb__pmp__io_pmp_cfg_l_7;
    wire [1:0] frontend__tlb__pmp__io_pmp_cfg_a_0;
    wire [1:0] frontend__tlb__pmp__io_pmp_cfg_a_1;
    wire [1:0] frontend__tlb__pmp__io_pmp_cfg_a_2;
    wire [1:0] frontend__tlb__pmp__io_pmp_cfg_a_3;
    wire [1:0] frontend__tlb__pmp__io_pmp_cfg_a_4;
    wire [1:0] frontend__tlb__pmp__io_pmp_cfg_a_5;
    wire [1:0] frontend__tlb__pmp__io_pmp_cfg_a_6;
    wire [1:0] frontend__tlb__pmp__io_pmp_cfg_a_7;
    wire  frontend__tlb__pmp__io_pmp_cfg_x_0;
    wire  frontend__tlb__pmp__io_pmp_cfg_x_1;
    wire  frontend__tlb__pmp__io_pmp_cfg_x_2;
    wire  frontend__tlb__pmp__io_pmp_cfg_x_3;
    wire  frontend__tlb__pmp__io_pmp_cfg_x_4;
    wire  frontend__tlb__pmp__io_pmp_cfg_x_5;
    wire  frontend__tlb__pmp__io_pmp_cfg_x_6;
    wire  frontend__tlb__pmp__io_pmp_cfg_x_7;
    wire [29:0] frontend__tlb__pmp__io_pmp_addr_0;
    wire [29:0] frontend__tlb__pmp__io_pmp_addr_1;
    wire [29:0] frontend__tlb__pmp__io_pmp_addr_2;
    wire [29:0] frontend__tlb__pmp__io_pmp_addr_3;
    wire [29:0] frontend__tlb__pmp__io_pmp_addr_4;
    wire [29:0] frontend__tlb__pmp__io_pmp_addr_5;
    wire [29:0] frontend__tlb__pmp__io_pmp_addr_6;
    wire [29:0] frontend__tlb__pmp__io_pmp_addr_7;
    wire [31:0] frontend__tlb__pmp__io_pmp_mask_0;
    wire [31:0] frontend__tlb__pmp__io_pmp_mask_1;
    wire [31:0] frontend__tlb__pmp__io_pmp_mask_2;
    wire [31:0] frontend__tlb__pmp__io_pmp_mask_3;
    wire [31:0] frontend__tlb__pmp__io_pmp_mask_4;
    wire [31:0] frontend__tlb__pmp__io_pmp_mask_5;
    wire [31:0] frontend__tlb__pmp__io_pmp_mask_6;
    wire [31:0] frontend__tlb__pmp__io_pmp_mask_7;
    wire [31:0] frontend__tlb__pmp__io_addr;
    wire  frontend__tlb__pmp__io_x;

    assign   frontend__tlb__pmp__io_x  =(  frontend__tlb__pmp__io_pmp_cfg_a_0  [1] ? ((  frontend__tlb__pmp__io_addr  ^{  frontend__tlb__pmp__io_pmp_addr_0  ,2'h0})&~  frontend__tlb__pmp__io_pmp_mask_0  )==32'h0:  frontend__tlb__pmp__io_pmp_cfg_a_0  [0]&  frontend__tlb__pmp__io_addr  <{  frontend__tlb__pmp__io_pmp_addr_0  ,2'h0}) ?   frontend__tlb__pmp__io_pmp_cfg_x_0  |  frontend__tlb__pmp__io_prv  [1]&~  frontend__tlb__pmp__io_pmp_cfg_l_0  :(  frontend__tlb__pmp__io_pmp_cfg_a_1  [1] ? ((  frontend__tlb__pmp__io_addr  ^{  frontend__tlb__pmp__io_pmp_addr_1  ,2'h0})&~  frontend__tlb__pmp__io_pmp_mask_1  )==32'h0:  frontend__tlb__pmp__io_pmp_cfg_a_1  [0]&  frontend__tlb__pmp__io_addr  >={  frontend__tlb__pmp__io_pmp_addr_0  ,2'h0}&  frontend__tlb__pmp__io_addr  <{  frontend__tlb__pmp__io_pmp_addr_1  ,2'h0}) ?   frontend__tlb__pmp__io_pmp_cfg_x_1  |  frontend__tlb__pmp__io_prv  [1]&~  frontend__tlb__pmp__io_pmp_cfg_l_1  :(  frontend__tlb__pmp__io_pmp_cfg_a_2  [1] ? ((  frontend__tlb__pmp__io_addr  ^{  frontend__tlb__pmp__io_pmp_addr_2  ,2'h0})&~  frontend__tlb__pmp__io_pmp_mask_2  )==32'h0:  frontend__tlb__pmp__io_pmp_cfg_a_2  [0]&  frontend__tlb__pmp__io_addr  >={  frontend__tlb__pmp__io_pmp_addr_1  ,2'h0}&  frontend__tlb__pmp__io_addr  <{  frontend__tlb__pmp__io_pmp_addr_2  ,2'h0}) ?   frontend__tlb__pmp__io_pmp_cfg_x_2  |  frontend__tlb__pmp__io_prv  [1]&~  frontend__tlb__pmp__io_pmp_cfg_l_2  :(  frontend__tlb__pmp__io_pmp_cfg_a_3  [1] ? ((  frontend__tlb__pmp__io_addr  ^{  frontend__tlb__pmp__io_pmp_addr_3  ,2'h0})&~  frontend__tlb__pmp__io_pmp_mask_3  )==32'h0:  frontend__tlb__pmp__io_pmp_cfg_a_3  [0]&  frontend__tlb__pmp__io_addr  >={  frontend__tlb__pmp__io_pmp_addr_2  ,2'h0}&  frontend__tlb__pmp__io_addr  <{  frontend__tlb__pmp__io_pmp_addr_3  ,2'h0}) ?   frontend__tlb__pmp__io_pmp_cfg_x_3  |  frontend__tlb__pmp__io_prv  [1]&~  frontend__tlb__pmp__io_pmp_cfg_l_3  :(  frontend__tlb__pmp__io_pmp_cfg_a_4  [1] ? ((  frontend__tlb__pmp__io_addr  ^{  frontend__tlb__pmp__io_pmp_addr_4  ,2'h0})&~  frontend__tlb__pmp__io_pmp_mask_4  )==32'h0:  frontend__tlb__pmp__io_pmp_cfg_a_4  [0]&  frontend__tlb__pmp__io_addr  >={  frontend__tlb__pmp__io_pmp_addr_3  ,2'h0}&  frontend__tlb__pmp__io_addr  <{  frontend__tlb__pmp__io_pmp_addr_4  ,2'h0}) ?   frontend__tlb__pmp__io_pmp_cfg_x_4  |  frontend__tlb__pmp__io_prv  [1]&~  frontend__tlb__pmp__io_pmp_cfg_l_4  :(  frontend__tlb__pmp__io_pmp_cfg_a_5  [1] ? ((  frontend__tlb__pmp__io_addr  ^{  frontend__tlb__pmp__io_pmp_addr_5  ,2'h0})&~  frontend__tlb__pmp__io_pmp_mask_5  )==32'h0:  frontend__tlb__pmp__io_pmp_cfg_a_5  [0]&  frontend__tlb__pmp__io_addr  >={  frontend__tlb__pmp__io_pmp_addr_4  ,2'h0}&  frontend__tlb__pmp__io_addr  <{  frontend__tlb__pmp__io_pmp_addr_5  ,2'h0}) ?   frontend__tlb__pmp__io_pmp_cfg_x_5  |  frontend__tlb__pmp__io_prv  [1]&~  frontend__tlb__pmp__io_pmp_cfg_l_5  :(  frontend__tlb__pmp__io_pmp_cfg_a_6  [1] ? ((  frontend__tlb__pmp__io_addr  ^{  frontend__tlb__pmp__io_pmp_addr_6  ,2'h0})&~  frontend__tlb__pmp__io_pmp_mask_6  )==32'h0:  frontend__tlb__pmp__io_pmp_cfg_a_6  [0]&  frontend__tlb__pmp__io_addr  >={  frontend__tlb__pmp__io_pmp_addr_5  ,2'h0}&  frontend__tlb__pmp__io_addr  <{  frontend__tlb__pmp__io_pmp_addr_6  ,2'h0}) ?   frontend__tlb__pmp__io_pmp_cfg_x_6  |  frontend__tlb__pmp__io_prv  [1]&~  frontend__tlb__pmp__io_pmp_cfg_l_6  :(  frontend__tlb__pmp__io_pmp_cfg_a_7  [1] ? ((  frontend__tlb__pmp__io_addr  ^{  frontend__tlb__pmp__io_pmp_addr_7  ,2'h0})&~  frontend__tlb__pmp__io_pmp_mask_7  )==32'h0:  frontend__tlb__pmp__io_pmp_cfg_a_7  [0]&  frontend__tlb__pmp__io_addr  >={  frontend__tlb__pmp__io_pmp_addr_6  ,2'h0}&  frontend__tlb__pmp__io_addr  <{  frontend__tlb__pmp__io_pmp_addr_7  ,2'h0}) ?   frontend__tlb__pmp__io_pmp_cfg_x_7  |  frontend__tlb__pmp__io_prv  [1]&~  frontend__tlb__pmp__io_pmp_cfg_l_7  :  frontend__tlb__pmp__io_prv  [1];
    assign frontend__tlb__pmp__io_prv = 2'h3;
    assign frontend__tlb__pmp__io_pmp_cfg_l_0 = frontend__tlb__io_ptw_pmp_cfg_l_0;
    assign frontend__tlb__pmp__io_pmp_cfg_l_1 = frontend__tlb__io_ptw_pmp_cfg_l_1;
    assign frontend__tlb__pmp__io_pmp_cfg_l_2 = frontend__tlb__io_ptw_pmp_cfg_l_2;
    assign frontend__tlb__pmp__io_pmp_cfg_l_3 = frontend__tlb__io_ptw_pmp_cfg_l_3;
    assign frontend__tlb__pmp__io_pmp_cfg_l_4 = frontend__tlb__io_ptw_pmp_cfg_l_4;
    assign frontend__tlb__pmp__io_pmp_cfg_l_5 = frontend__tlb__io_ptw_pmp_cfg_l_5;
    assign frontend__tlb__pmp__io_pmp_cfg_l_6 = frontend__tlb__io_ptw_pmp_cfg_l_6;
    assign frontend__tlb__pmp__io_pmp_cfg_l_7 = frontend__tlb__io_ptw_pmp_cfg_l_7;
    assign frontend__tlb__pmp__io_pmp_cfg_a_0 = frontend__tlb__io_ptw_pmp_cfg_a_0;
    assign frontend__tlb__pmp__io_pmp_cfg_a_1 = frontend__tlb__io_ptw_pmp_cfg_a_1;
    assign frontend__tlb__pmp__io_pmp_cfg_a_2 = frontend__tlb__io_ptw_pmp_cfg_a_2;
    assign frontend__tlb__pmp__io_pmp_cfg_a_3 = frontend__tlb__io_ptw_pmp_cfg_a_3;
    assign frontend__tlb__pmp__io_pmp_cfg_a_4 = frontend__tlb__io_ptw_pmp_cfg_a_4;
    assign frontend__tlb__pmp__io_pmp_cfg_a_5 = frontend__tlb__io_ptw_pmp_cfg_a_5;
    assign frontend__tlb__pmp__io_pmp_cfg_a_6 = frontend__tlb__io_ptw_pmp_cfg_a_6;
    assign frontend__tlb__pmp__io_pmp_cfg_a_7 = frontend__tlb__io_ptw_pmp_cfg_a_7;
    assign frontend__tlb__pmp__io_pmp_cfg_x_0 = frontend__tlb__io_ptw_pmp_cfg_x_0;
    assign frontend__tlb__pmp__io_pmp_cfg_x_1 = frontend__tlb__io_ptw_pmp_cfg_x_1;
    assign frontend__tlb__pmp__io_pmp_cfg_x_2 = frontend__tlb__io_ptw_pmp_cfg_x_2;
    assign frontend__tlb__pmp__io_pmp_cfg_x_3 = frontend__tlb__io_ptw_pmp_cfg_x_3;
    assign frontend__tlb__pmp__io_pmp_cfg_x_4 = frontend__tlb__io_ptw_pmp_cfg_x_4;
    assign frontend__tlb__pmp__io_pmp_cfg_x_5 = frontend__tlb__io_ptw_pmp_cfg_x_5;
    assign frontend__tlb__pmp__io_pmp_cfg_x_6 = frontend__tlb__io_ptw_pmp_cfg_x_6;
    assign frontend__tlb__pmp__io_pmp_cfg_x_7 = frontend__tlb__io_ptw_pmp_cfg_x_7;
    assign frontend__tlb__pmp__io_pmp_addr_0 = frontend__tlb__io_ptw_pmp_addr_0;
    assign frontend__tlb__pmp__io_pmp_addr_1 = frontend__tlb__io_ptw_pmp_addr_1;
    assign frontend__tlb__pmp__io_pmp_addr_2 = frontend__tlb__io_ptw_pmp_addr_2;
    assign frontend__tlb__pmp__io_pmp_addr_3 = frontend__tlb__io_ptw_pmp_addr_3;
    assign frontend__tlb__pmp__io_pmp_addr_4 = frontend__tlb__io_ptw_pmp_addr_4;
    assign frontend__tlb__pmp__io_pmp_addr_5 = frontend__tlb__io_ptw_pmp_addr_5;
    assign frontend__tlb__pmp__io_pmp_addr_6 = frontend__tlb__io_ptw_pmp_addr_6;
    assign frontend__tlb__pmp__io_pmp_addr_7 = frontend__tlb__io_ptw_pmp_addr_7;
    assign frontend__tlb__pmp__io_pmp_mask_0 = frontend__tlb__io_ptw_pmp_mask_0;
    assign frontend__tlb__pmp__io_pmp_mask_1 = frontend__tlb__io_ptw_pmp_mask_1;
    assign frontend__tlb__pmp__io_pmp_mask_2 = frontend__tlb__io_ptw_pmp_mask_2;
    assign frontend__tlb__pmp__io_pmp_mask_3 = frontend__tlb__io_ptw_pmp_mask_3;
    assign frontend__tlb__pmp__io_pmp_mask_4 = frontend__tlb__io_ptw_pmp_mask_4;
    assign frontend__tlb__pmp__io_pmp_mask_5 = frontend__tlb__io_ptw_pmp_mask_5;
    assign frontend__tlb__pmp__io_pmp_mask_6 = frontend__tlb__io_ptw_pmp_mask_6;
    assign frontend__tlb__pmp__io_pmp_mask_7 = frontend__tlb__io_ptw_pmp_mask_7;
    assign frontend__tlb__pmp__io_addr = frontend__tlb__io_req_bits_vaddr[31:0];
    assign frontend__tlb___pmp_io_x = frontend__tlb__pmp__io_x;


    wire  frontend__tlb__entries_barrier__io_x_u;
    wire  frontend__tlb__entries_barrier__io_x_ae_ptw;
    wire  frontend__tlb__entries_barrier__io_x_ae_final;
    wire  frontend__tlb__entries_barrier__io_x_pf;
    wire  frontend__tlb__entries_barrier__io_x_gf;
    wire  frontend__tlb__entries_barrier__io_x_sw;
    wire  frontend__tlb__entries_barrier__io_x_sx;
    wire  frontend__tlb__entries_barrier__io_x_sr;
    wire  frontend__tlb__entries_barrier__io_x_pw;
    wire  frontend__tlb__entries_barrier__io_x_px;
    wire  frontend__tlb__entries_barrier__io_x_pr;
    wire  frontend__tlb__entries_barrier__io_x_ppp;
    wire  frontend__tlb__entries_barrier__io_x_pal;
    wire  frontend__tlb__entries_barrier__io_x_paa;
    wire  frontend__tlb__entries_barrier__io_x_eff;
    wire  frontend__tlb__entries_barrier__io_x_c;
    wire  frontend__tlb__entries_barrier__io_y_u;
    wire  frontend__tlb__entries_barrier__io_y_ae_ptw;
    wire  frontend__tlb__entries_barrier__io_y_ae_final;
    wire  frontend__tlb__entries_barrier__io_y_pf;
    wire  frontend__tlb__entries_barrier__io_y_gf;
    wire  frontend__tlb__entries_barrier__io_y_sw;
    wire  frontend__tlb__entries_barrier__io_y_sx;
    wire  frontend__tlb__entries_barrier__io_y_sr;
    wire  frontend__tlb__entries_barrier__io_y_pw;
    wire  frontend__tlb__entries_barrier__io_y_px;
    wire  frontend__tlb__entries_barrier__io_y_pr;
    wire  frontend__tlb__entries_barrier__io_y_ppp;
    wire  frontend__tlb__entries_barrier__io_y_pal;
    wire  frontend__tlb__entries_barrier__io_y_paa;
    wire  frontend__tlb__entries_barrier__io_y_eff;
    wire  frontend__tlb__entries_barrier__io_y_c;
    wire  frontend__tlb__entries_barrier_1__io_x_u;
    wire  frontend__tlb__entries_barrier_1__io_x_ae_ptw;
    wire  frontend__tlb__entries_barrier_1__io_x_ae_final;
    wire  frontend__tlb__entries_barrier_1__io_x_pf;
    wire  frontend__tlb__entries_barrier_1__io_x_gf;
    wire  frontend__tlb__entries_barrier_1__io_x_sw;
    wire  frontend__tlb__entries_barrier_1__io_x_sx;
    wire  frontend__tlb__entries_barrier_1__io_x_sr;
    wire  frontend__tlb__entries_barrier_1__io_x_pw;
    wire  frontend__tlb__entries_barrier_1__io_x_px;
    wire  frontend__tlb__entries_barrier_1__io_x_pr;
    wire  frontend__tlb__entries_barrier_1__io_x_ppp;
    wire  frontend__tlb__entries_barrier_1__io_x_pal;
    wire  frontend__tlb__entries_barrier_1__io_x_paa;
    wire  frontend__tlb__entries_barrier_1__io_x_eff;
    wire  frontend__tlb__entries_barrier_1__io_x_c;
    wire  frontend__tlb__entries_barrier_1__io_y_u;
    wire  frontend__tlb__entries_barrier_1__io_y_ae_ptw;
    wire  frontend__tlb__entries_barrier_1__io_y_ae_final;
    wire  frontend__tlb__entries_barrier_1__io_y_pf;
    wire  frontend__tlb__entries_barrier_1__io_y_gf;
    wire  frontend__tlb__entries_barrier_1__io_y_sw;
    wire  frontend__tlb__entries_barrier_1__io_y_sx;
    wire  frontend__tlb__entries_barrier_1__io_y_sr;
    wire  frontend__tlb__entries_barrier_1__io_y_pw;
    wire  frontend__tlb__entries_barrier_1__io_y_px;
    wire  frontend__tlb__entries_barrier_1__io_y_pr;
    wire  frontend__tlb__entries_barrier_1__io_y_ppp;
    wire  frontend__tlb__entries_barrier_1__io_y_pal;
    wire  frontend__tlb__entries_barrier_1__io_y_paa;
    wire  frontend__tlb__entries_barrier_1__io_y_eff;
    wire  frontend__tlb__entries_barrier_1__io_y_c;
    wire  frontend__tlb__entries_barrier_2__io_x_u;
    wire  frontend__tlb__entries_barrier_2__io_x_ae_ptw;
    wire  frontend__tlb__entries_barrier_2__io_x_ae_final;
    wire  frontend__tlb__entries_barrier_2__io_x_pf;
    wire  frontend__tlb__entries_barrier_2__io_x_gf;
    wire  frontend__tlb__entries_barrier_2__io_x_sw;
    wire  frontend__tlb__entries_barrier_2__io_x_sx;
    wire  frontend__tlb__entries_barrier_2__io_x_sr;
    wire  frontend__tlb__entries_barrier_2__io_x_pw;
    wire  frontend__tlb__entries_barrier_2__io_x_px;
    wire  frontend__tlb__entries_barrier_2__io_x_pr;
    wire  frontend__tlb__entries_barrier_2__io_x_ppp;
    wire  frontend__tlb__entries_barrier_2__io_x_pal;
    wire  frontend__tlb__entries_barrier_2__io_x_paa;
    wire  frontend__tlb__entries_barrier_2__io_x_eff;
    wire  frontend__tlb__entries_barrier_2__io_x_c;
    wire  frontend__tlb__entries_barrier_2__io_y_u;
    wire  frontend__tlb__entries_barrier_2__io_y_ae_ptw;
    wire  frontend__tlb__entries_barrier_2__io_y_ae_final;
    wire  frontend__tlb__entries_barrier_2__io_y_pf;
    wire  frontend__tlb__entries_barrier_2__io_y_gf;
    wire  frontend__tlb__entries_barrier_2__io_y_sw;
    wire  frontend__tlb__entries_barrier_2__io_y_sx;
    wire  frontend__tlb__entries_barrier_2__io_y_sr;
    wire  frontend__tlb__entries_barrier_2__io_y_pw;
    wire  frontend__tlb__entries_barrier_2__io_y_px;
    wire  frontend__tlb__entries_barrier_2__io_y_pr;
    wire  frontend__tlb__entries_barrier_2__io_y_ppp;
    wire  frontend__tlb__entries_barrier_2__io_y_pal;
    wire  frontend__tlb__entries_barrier_2__io_y_paa;
    wire  frontend__tlb__entries_barrier_2__io_y_eff;
    wire  frontend__tlb__entries_barrier_2__io_y_c;
    wire  frontend__tlb__entries_barrier_3__io_x_u;
    wire  frontend__tlb__entries_barrier_3__io_x_ae_ptw;
    wire  frontend__tlb__entries_barrier_3__io_x_ae_final;
    wire  frontend__tlb__entries_barrier_3__io_x_pf;
    wire  frontend__tlb__entries_barrier_3__io_x_gf;
    wire  frontend__tlb__entries_barrier_3__io_x_sw;
    wire  frontend__tlb__entries_barrier_3__io_x_sx;
    wire  frontend__tlb__entries_barrier_3__io_x_sr;
    wire  frontend__tlb__entries_barrier_3__io_x_pw;
    wire  frontend__tlb__entries_barrier_3__io_x_px;
    wire  frontend__tlb__entries_barrier_3__io_x_pr;
    wire  frontend__tlb__entries_barrier_3__io_x_ppp;
    wire  frontend__tlb__entries_barrier_3__io_x_pal;
    wire  frontend__tlb__entries_barrier_3__io_x_paa;
    wire  frontend__tlb__entries_barrier_3__io_x_eff;
    wire  frontend__tlb__entries_barrier_3__io_x_c;
    wire  frontend__tlb__entries_barrier_3__io_y_u;
    wire  frontend__tlb__entries_barrier_3__io_y_ae_ptw;
    wire  frontend__tlb__entries_barrier_3__io_y_ae_final;
    wire  frontend__tlb__entries_barrier_3__io_y_pf;
    wire  frontend__tlb__entries_barrier_3__io_y_gf;
    wire  frontend__tlb__entries_barrier_3__io_y_sw;
    wire  frontend__tlb__entries_barrier_3__io_y_sx;
    wire  frontend__tlb__entries_barrier_3__io_y_sr;
    wire  frontend__tlb__entries_barrier_3__io_y_pw;
    wire  frontend__tlb__entries_barrier_3__io_y_px;
    wire  frontend__tlb__entries_barrier_3__io_y_pr;
    wire  frontend__tlb__entries_barrier_3__io_y_ppp;
    wire  frontend__tlb__entries_barrier_3__io_y_pal;
    wire  frontend__tlb__entries_barrier_3__io_y_paa;
    wire  frontend__tlb__entries_barrier_3__io_y_eff;
    wire  frontend__tlb__entries_barrier_3__io_y_c;
    wire  frontend__tlb__entries_barrier_4__io_x_u;
    wire  frontend__tlb__entries_barrier_4__io_x_ae_ptw;
    wire  frontend__tlb__entries_barrier_4__io_x_ae_final;
    wire  frontend__tlb__entries_barrier_4__io_x_pf;
    wire  frontend__tlb__entries_barrier_4__io_x_gf;
    wire  frontend__tlb__entries_barrier_4__io_x_sw;
    wire  frontend__tlb__entries_barrier_4__io_x_sx;
    wire  frontend__tlb__entries_barrier_4__io_x_sr;
    wire  frontend__tlb__entries_barrier_4__io_x_pw;
    wire  frontend__tlb__entries_barrier_4__io_x_px;
    wire  frontend__tlb__entries_barrier_4__io_x_pr;
    wire  frontend__tlb__entries_barrier_4__io_x_ppp;
    wire  frontend__tlb__entries_barrier_4__io_x_pal;
    wire  frontend__tlb__entries_barrier_4__io_x_paa;
    wire  frontend__tlb__entries_barrier_4__io_x_eff;
    wire  frontend__tlb__entries_barrier_4__io_x_c;
    wire  frontend__tlb__entries_barrier_4__io_y_u;
    wire  frontend__tlb__entries_barrier_4__io_y_ae_ptw;
    wire  frontend__tlb__entries_barrier_4__io_y_ae_final;
    wire  frontend__tlb__entries_barrier_4__io_y_pf;
    wire  frontend__tlb__entries_barrier_4__io_y_gf;
    wire  frontend__tlb__entries_barrier_4__io_y_sw;
    wire  frontend__tlb__entries_barrier_4__io_y_sx;
    wire  frontend__tlb__entries_barrier_4__io_y_sr;
    wire  frontend__tlb__entries_barrier_4__io_y_pw;
    wire  frontend__tlb__entries_barrier_4__io_y_px;
    wire  frontend__tlb__entries_barrier_4__io_y_pr;
    wire  frontend__tlb__entries_barrier_4__io_y_ppp;
    wire  frontend__tlb__entries_barrier_4__io_y_pal;
    wire  frontend__tlb__entries_barrier_4__io_y_paa;
    wire  frontend__tlb__entries_barrier_4__io_y_eff;
    wire  frontend__tlb__entries_barrier_4__io_y_c;
    wire  frontend__tlb__entries_barrier_5__io_x_u;
    wire  frontend__tlb__entries_barrier_5__io_x_ae_ptw;
    wire  frontend__tlb__entries_barrier_5__io_x_ae_final;
    wire  frontend__tlb__entries_barrier_5__io_x_pf;
    wire  frontend__tlb__entries_barrier_5__io_x_gf;
    wire  frontend__tlb__entries_barrier_5__io_x_sw;
    wire  frontend__tlb__entries_barrier_5__io_x_sx;
    wire  frontend__tlb__entries_barrier_5__io_x_sr;
    wire  frontend__tlb__entries_barrier_5__io_x_pw;
    wire  frontend__tlb__entries_barrier_5__io_x_px;
    wire  frontend__tlb__entries_barrier_5__io_x_pr;
    wire  frontend__tlb__entries_barrier_5__io_x_ppp;
    wire  frontend__tlb__entries_barrier_5__io_x_pal;
    wire  frontend__tlb__entries_barrier_5__io_x_paa;
    wire  frontend__tlb__entries_barrier_5__io_x_eff;
    wire  frontend__tlb__entries_barrier_5__io_x_c;
    wire  frontend__tlb__entries_barrier_5__io_y_u;
    wire  frontend__tlb__entries_barrier_5__io_y_ae_ptw;
    wire  frontend__tlb__entries_barrier_5__io_y_ae_final;
    wire  frontend__tlb__entries_barrier_5__io_y_pf;
    wire  frontend__tlb__entries_barrier_5__io_y_gf;
    wire  frontend__tlb__entries_barrier_5__io_y_sw;
    wire  frontend__tlb__entries_barrier_5__io_y_sx;
    wire  frontend__tlb__entries_barrier_5__io_y_sr;
    wire  frontend__tlb__entries_barrier_5__io_y_pw;
    wire  frontend__tlb__entries_barrier_5__io_y_px;
    wire  frontend__tlb__entries_barrier_5__io_y_pr;
    wire  frontend__tlb__entries_barrier_5__io_y_ppp;
    wire  frontend__tlb__entries_barrier_5__io_y_pal;
    wire  frontend__tlb__entries_barrier_5__io_y_paa;
    wire  frontend__tlb__entries_barrier_5__io_y_eff;
    wire  frontend__tlb__entries_barrier_5__io_y_c;

    assign   frontend__tlb__entries_barrier__io_y_u  =  frontend__tlb__entries_barrier__io_x_u  ;
    assign   frontend__tlb__entries_barrier__io_y_ae_ptw  =  frontend__tlb__entries_barrier__io_x_ae_ptw  ;
    assign   frontend__tlb__entries_barrier__io_y_ae_final  =  frontend__tlb__entries_barrier__io_x_ae_final  ;
    assign   frontend__tlb__entries_barrier__io_y_pf  =  frontend__tlb__entries_barrier__io_x_pf  ;
    assign   frontend__tlb__entries_barrier__io_y_gf  =  frontend__tlb__entries_barrier__io_x_gf  ;
    assign   frontend__tlb__entries_barrier__io_y_sw  =  frontend__tlb__entries_barrier__io_x_sw  ;
    assign   frontend__tlb__entries_barrier__io_y_sx  =  frontend__tlb__entries_barrier__io_x_sx  ;
    assign   frontend__tlb__entries_barrier__io_y_sr  =  frontend__tlb__entries_barrier__io_x_sr  ;
    assign   frontend__tlb__entries_barrier__io_y_pw  =  frontend__tlb__entries_barrier__io_x_pw  ;
    assign   frontend__tlb__entries_barrier__io_y_px  =  frontend__tlb__entries_barrier__io_x_px  ;
    assign   frontend__tlb__entries_barrier__io_y_pr  =  frontend__tlb__entries_barrier__io_x_pr  ;
    assign   frontend__tlb__entries_barrier__io_y_ppp  =  frontend__tlb__entries_barrier__io_x_ppp  ;
    assign   frontend__tlb__entries_barrier__io_y_pal  =  frontend__tlb__entries_barrier__io_x_pal  ;
    assign   frontend__tlb__entries_barrier__io_y_paa  =  frontend__tlb__entries_barrier__io_x_paa  ;
    assign   frontend__tlb__entries_barrier__io_y_eff  =  frontend__tlb__entries_barrier__io_x_eff  ;
    assign   frontend__tlb__entries_barrier__io_y_c  =  frontend__tlb__entries_barrier__io_x_c  ;



    assign   frontend__tlb__entries_barrier_1__io_y_u  =  frontend__tlb__entries_barrier_1__io_x_u  ;
    assign   frontend__tlb__entries_barrier_1__io_y_ae_ptw  =  frontend__tlb__entries_barrier_1__io_x_ae_ptw  ;
    assign   frontend__tlb__entries_barrier_1__io_y_ae_final  =  frontend__tlb__entries_barrier_1__io_x_ae_final  ;
    assign   frontend__tlb__entries_barrier_1__io_y_pf  =  frontend__tlb__entries_barrier_1__io_x_pf  ;
    assign   frontend__tlb__entries_barrier_1__io_y_gf  =  frontend__tlb__entries_barrier_1__io_x_gf  ;
    assign   frontend__tlb__entries_barrier_1__io_y_sw  =  frontend__tlb__entries_barrier_1__io_x_sw  ;
    assign   frontend__tlb__entries_barrier_1__io_y_sx  =  frontend__tlb__entries_barrier_1__io_x_sx  ;
    assign   frontend__tlb__entries_barrier_1__io_y_sr  =  frontend__tlb__entries_barrier_1__io_x_sr  ;
    assign   frontend__tlb__entries_barrier_1__io_y_pw  =  frontend__tlb__entries_barrier_1__io_x_pw  ;
    assign   frontend__tlb__entries_barrier_1__io_y_px  =  frontend__tlb__entries_barrier_1__io_x_px  ;
    assign   frontend__tlb__entries_barrier_1__io_y_pr  =  frontend__tlb__entries_barrier_1__io_x_pr  ;
    assign   frontend__tlb__entries_barrier_1__io_y_ppp  =  frontend__tlb__entries_barrier_1__io_x_ppp  ;
    assign   frontend__tlb__entries_barrier_1__io_y_pal  =  frontend__tlb__entries_barrier_1__io_x_pal  ;
    assign   frontend__tlb__entries_barrier_1__io_y_paa  =  frontend__tlb__entries_barrier_1__io_x_paa  ;
    assign   frontend__tlb__entries_barrier_1__io_y_eff  =  frontend__tlb__entries_barrier_1__io_x_eff  ;
    assign   frontend__tlb__entries_barrier_1__io_y_c  =  frontend__tlb__entries_barrier_1__io_x_c  ;



    assign   frontend__tlb__entries_barrier_2__io_y_u  =  frontend__tlb__entries_barrier_2__io_x_u  ;
    assign   frontend__tlb__entries_barrier_2__io_y_ae_ptw  =  frontend__tlb__entries_barrier_2__io_x_ae_ptw  ;
    assign   frontend__tlb__entries_barrier_2__io_y_ae_final  =  frontend__tlb__entries_barrier_2__io_x_ae_final  ;
    assign   frontend__tlb__entries_barrier_2__io_y_pf  =  frontend__tlb__entries_barrier_2__io_x_pf  ;
    assign   frontend__tlb__entries_barrier_2__io_y_gf  =  frontend__tlb__entries_barrier_2__io_x_gf  ;
    assign   frontend__tlb__entries_barrier_2__io_y_sw  =  frontend__tlb__entries_barrier_2__io_x_sw  ;
    assign   frontend__tlb__entries_barrier_2__io_y_sx  =  frontend__tlb__entries_barrier_2__io_x_sx  ;
    assign   frontend__tlb__entries_barrier_2__io_y_sr  =  frontend__tlb__entries_barrier_2__io_x_sr  ;
    assign   frontend__tlb__entries_barrier_2__io_y_pw  =  frontend__tlb__entries_barrier_2__io_x_pw  ;
    assign   frontend__tlb__entries_barrier_2__io_y_px  =  frontend__tlb__entries_barrier_2__io_x_px  ;
    assign   frontend__tlb__entries_barrier_2__io_y_pr  =  frontend__tlb__entries_barrier_2__io_x_pr  ;
    assign   frontend__tlb__entries_barrier_2__io_y_ppp  =  frontend__tlb__entries_barrier_2__io_x_ppp  ;
    assign   frontend__tlb__entries_barrier_2__io_y_pal  =  frontend__tlb__entries_barrier_2__io_x_pal  ;
    assign   frontend__tlb__entries_barrier_2__io_y_paa  =  frontend__tlb__entries_barrier_2__io_x_paa  ;
    assign   frontend__tlb__entries_barrier_2__io_y_eff  =  frontend__tlb__entries_barrier_2__io_x_eff  ;
    assign   frontend__tlb__entries_barrier_2__io_y_c  =  frontend__tlb__entries_barrier_2__io_x_c  ;



    assign   frontend__tlb__entries_barrier_3__io_y_u  =  frontend__tlb__entries_barrier_3__io_x_u  ;
    assign   frontend__tlb__entries_barrier_3__io_y_ae_ptw  =  frontend__tlb__entries_barrier_3__io_x_ae_ptw  ;
    assign   frontend__tlb__entries_barrier_3__io_y_ae_final  =  frontend__tlb__entries_barrier_3__io_x_ae_final  ;
    assign   frontend__tlb__entries_barrier_3__io_y_pf  =  frontend__tlb__entries_barrier_3__io_x_pf  ;
    assign   frontend__tlb__entries_barrier_3__io_y_gf  =  frontend__tlb__entries_barrier_3__io_x_gf  ;
    assign   frontend__tlb__entries_barrier_3__io_y_sw  =  frontend__tlb__entries_barrier_3__io_x_sw  ;
    assign   frontend__tlb__entries_barrier_3__io_y_sx  =  frontend__tlb__entries_barrier_3__io_x_sx  ;
    assign   frontend__tlb__entries_barrier_3__io_y_sr  =  frontend__tlb__entries_barrier_3__io_x_sr  ;
    assign   frontend__tlb__entries_barrier_3__io_y_pw  =  frontend__tlb__entries_barrier_3__io_x_pw  ;
    assign   frontend__tlb__entries_barrier_3__io_y_px  =  frontend__tlb__entries_barrier_3__io_x_px  ;
    assign   frontend__tlb__entries_barrier_3__io_y_pr  =  frontend__tlb__entries_barrier_3__io_x_pr  ;
    assign   frontend__tlb__entries_barrier_3__io_y_ppp  =  frontend__tlb__entries_barrier_3__io_x_ppp  ;
    assign   frontend__tlb__entries_barrier_3__io_y_pal  =  frontend__tlb__entries_barrier_3__io_x_pal  ;
    assign   frontend__tlb__entries_barrier_3__io_y_paa  =  frontend__tlb__entries_barrier_3__io_x_paa  ;
    assign   frontend__tlb__entries_barrier_3__io_y_eff  =  frontend__tlb__entries_barrier_3__io_x_eff  ;
    assign   frontend__tlb__entries_barrier_3__io_y_c  =  frontend__tlb__entries_barrier_3__io_x_c  ;



    assign   frontend__tlb__entries_barrier_4__io_y_u  =  frontend__tlb__entries_barrier_4__io_x_u  ;
    assign   frontend__tlb__entries_barrier_4__io_y_ae_ptw  =  frontend__tlb__entries_barrier_4__io_x_ae_ptw  ;
    assign   frontend__tlb__entries_barrier_4__io_y_ae_final  =  frontend__tlb__entries_barrier_4__io_x_ae_final  ;
    assign   frontend__tlb__entries_barrier_4__io_y_pf  =  frontend__tlb__entries_barrier_4__io_x_pf  ;
    assign   frontend__tlb__entries_barrier_4__io_y_gf  =  frontend__tlb__entries_barrier_4__io_x_gf  ;
    assign   frontend__tlb__entries_barrier_4__io_y_sw  =  frontend__tlb__entries_barrier_4__io_x_sw  ;
    assign   frontend__tlb__entries_barrier_4__io_y_sx  =  frontend__tlb__entries_barrier_4__io_x_sx  ;
    assign   frontend__tlb__entries_barrier_4__io_y_sr  =  frontend__tlb__entries_barrier_4__io_x_sr  ;
    assign   frontend__tlb__entries_barrier_4__io_y_pw  =  frontend__tlb__entries_barrier_4__io_x_pw  ;
    assign   frontend__tlb__entries_barrier_4__io_y_px  =  frontend__tlb__entries_barrier_4__io_x_px  ;
    assign   frontend__tlb__entries_barrier_4__io_y_pr  =  frontend__tlb__entries_barrier_4__io_x_pr  ;
    assign   frontend__tlb__entries_barrier_4__io_y_ppp  =  frontend__tlb__entries_barrier_4__io_x_ppp  ;
    assign   frontend__tlb__entries_barrier_4__io_y_pal  =  frontend__tlb__entries_barrier_4__io_x_pal  ;
    assign   frontend__tlb__entries_barrier_4__io_y_paa  =  frontend__tlb__entries_barrier_4__io_x_paa  ;
    assign   frontend__tlb__entries_barrier_4__io_y_eff  =  frontend__tlb__entries_barrier_4__io_x_eff  ;
    assign   frontend__tlb__entries_barrier_4__io_y_c  =  frontend__tlb__entries_barrier_4__io_x_c  ;



    assign   frontend__tlb__entries_barrier_5__io_y_u  =  frontend__tlb__entries_barrier_5__io_x_u  ;
    assign   frontend__tlb__entries_barrier_5__io_y_ae_ptw  =  frontend__tlb__entries_barrier_5__io_x_ae_ptw  ;
    assign   frontend__tlb__entries_barrier_5__io_y_ae_final  =  frontend__tlb__entries_barrier_5__io_x_ae_final  ;
    assign   frontend__tlb__entries_barrier_5__io_y_pf  =  frontend__tlb__entries_barrier_5__io_x_pf  ;
    assign   frontend__tlb__entries_barrier_5__io_y_gf  =  frontend__tlb__entries_barrier_5__io_x_gf  ;
    assign   frontend__tlb__entries_barrier_5__io_y_sw  =  frontend__tlb__entries_barrier_5__io_x_sw  ;
    assign   frontend__tlb__entries_barrier_5__io_y_sx  =  frontend__tlb__entries_barrier_5__io_x_sx  ;
    assign   frontend__tlb__entries_barrier_5__io_y_sr  =  frontend__tlb__entries_barrier_5__io_x_sr  ;
    assign   frontend__tlb__entries_barrier_5__io_y_pw  =  frontend__tlb__entries_barrier_5__io_x_pw  ;
    assign   frontend__tlb__entries_barrier_5__io_y_px  =  frontend__tlb__entries_barrier_5__io_x_px  ;
    assign   frontend__tlb__entries_barrier_5__io_y_pr  =  frontend__tlb__entries_barrier_5__io_x_pr  ;
    assign   frontend__tlb__entries_barrier_5__io_y_ppp  =  frontend__tlb__entries_barrier_5__io_x_ppp  ;
    assign   frontend__tlb__entries_barrier_5__io_y_pal  =  frontend__tlb__entries_barrier_5__io_x_pal  ;
    assign   frontend__tlb__entries_barrier_5__io_y_paa  =  frontend__tlb__entries_barrier_5__io_x_paa  ;
    assign   frontend__tlb__entries_barrier_5__io_y_eff  =  frontend__tlb__entries_barrier_5__io_x_eff  ;
    assign   frontend__tlb__entries_barrier_5__io_y_c  =  frontend__tlb__entries_barrier_5__io_x_c  ;
    assign frontend__tlb__entries_barrier__io_x_u = 1'h0;
    assign frontend__tlb__entries_barrier__io_x_ae_ptw = 1'h0;
    assign frontend__tlb__entries_barrier__io_x_ae_final = 1'h0;
    assign frontend__tlb__entries_barrier__io_x_pf = 1'h0;
    assign frontend__tlb__entries_barrier__io_x_gf = 1'h0;
    assign frontend__tlb__entries_barrier__io_x_sw = 1'h0;
    assign frontend__tlb__entries_barrier__io_x_sx = 1'h0;
    assign frontend__tlb__entries_barrier__io_x_sr = 1'h0;
    assign frontend__tlb__entries_barrier__io_x_pw = 1'h0;
    assign frontend__tlb__entries_barrier__io_x_px = 1'h0;
    assign frontend__tlb__entries_barrier__io_x_pr = 1'h0;
    assign frontend__tlb__entries_barrier__io_x_ppp = 1'h0;
    assign frontend__tlb__entries_barrier__io_x_pal = 1'h0;
    assign frontend__tlb__entries_barrier__io_x_paa = 1'h0;
    assign frontend__tlb__entries_barrier__io_x_eff = 1'h0;
    assign frontend__tlb__entries_barrier__io_x_c = 1'h0;
    assign frontend__tlb__entries_barrier_1__io_x_u = 1'h0;
    assign frontend__tlb__entries_barrier_1__io_x_ae_ptw = 1'h0;
    assign frontend__tlb__entries_barrier_1__io_x_ae_final = 1'h0;
    assign frontend__tlb__entries_barrier_1__io_x_pf = 1'h0;
    assign frontend__tlb__entries_barrier_1__io_x_gf = 1'h0;
    assign frontend__tlb__entries_barrier_1__io_x_sw = 1'h0;
    assign frontend__tlb__entries_barrier_1__io_x_sx = 1'h0;
    assign frontend__tlb__entries_barrier_1__io_x_sr = 1'h0;
    assign frontend__tlb__entries_barrier_1__io_x_pw = 1'h0;
    assign frontend__tlb__entries_barrier_1__io_x_px = 1'h0;
    assign frontend__tlb__entries_barrier_1__io_x_pr = 1'h0;
    assign frontend__tlb__entries_barrier_1__io_x_ppp = 1'h0;
    assign frontend__tlb__entries_barrier_1__io_x_pal = 1'h0;
    assign frontend__tlb__entries_barrier_1__io_x_paa = 1'h0;
    assign frontend__tlb__entries_barrier_1__io_x_eff = 1'h0;
    assign frontend__tlb__entries_barrier_1__io_x_c = 1'h0;
    assign frontend__tlb__entries_barrier_2__io_x_u = 1'h0;
    assign frontend__tlb__entries_barrier_2__io_x_ae_ptw = 1'h0;
    assign frontend__tlb__entries_barrier_2__io_x_ae_final = 1'h0;
    assign frontend__tlb__entries_barrier_2__io_x_pf = 1'h0;
    assign frontend__tlb__entries_barrier_2__io_x_gf = 1'h0;
    assign frontend__tlb__entries_barrier_2__io_x_sw = 1'h0;
    assign frontend__tlb__entries_barrier_2__io_x_sx = 1'h0;
    assign frontend__tlb__entries_barrier_2__io_x_sr = 1'h0;
    assign frontend__tlb__entries_barrier_2__io_x_pw = 1'h0;
    assign frontend__tlb__entries_barrier_2__io_x_px = 1'h0;
    assign frontend__tlb__entries_barrier_2__io_x_pr = 1'h0;
    assign frontend__tlb__entries_barrier_2__io_x_ppp = 1'h0;
    assign frontend__tlb__entries_barrier_2__io_x_pal = 1'h0;
    assign frontend__tlb__entries_barrier_2__io_x_paa = 1'h0;
    assign frontend__tlb__entries_barrier_2__io_x_eff = 1'h0;
    assign frontend__tlb__entries_barrier_2__io_x_c = 1'h0;
    assign frontend__tlb__entries_barrier_3__io_x_u = 1'h0;
    assign frontend__tlb__entries_barrier_3__io_x_ae_ptw = 1'h0;
    assign frontend__tlb__entries_barrier_3__io_x_ae_final = 1'h0;
    assign frontend__tlb__entries_barrier_3__io_x_pf = 1'h0;
    assign frontend__tlb__entries_barrier_3__io_x_gf = 1'h0;
    assign frontend__tlb__entries_barrier_3__io_x_sw = 1'h0;
    assign frontend__tlb__entries_barrier_3__io_x_sx = 1'h0;
    assign frontend__tlb__entries_barrier_3__io_x_sr = 1'h0;
    assign frontend__tlb__entries_barrier_3__io_x_pw = 1'h0;
    assign frontend__tlb__entries_barrier_3__io_x_px = 1'h0;
    assign frontend__tlb__entries_barrier_3__io_x_pr = 1'h0;
    assign frontend__tlb__entries_barrier_3__io_x_ppp = 1'h0;
    assign frontend__tlb__entries_barrier_3__io_x_pal = 1'h0;
    assign frontend__tlb__entries_barrier_3__io_x_paa = 1'h0;
    assign frontend__tlb__entries_barrier_3__io_x_eff = 1'h0;
    assign frontend__tlb__entries_barrier_3__io_x_c = 1'h0;
    assign frontend__tlb__entries_barrier_4__io_x_u = 1'h0;
    assign frontend__tlb__entries_barrier_4__io_x_ae_ptw = 1'h0;
    assign frontend__tlb__entries_barrier_4__io_x_ae_final = 1'h0;
    assign frontend__tlb__entries_barrier_4__io_x_pf = 1'h0;
    assign frontend__tlb__entries_barrier_4__io_x_gf = 1'h0;
    assign frontend__tlb__entries_barrier_4__io_x_sw = 1'h0;
    assign frontend__tlb__entries_barrier_4__io_x_sx = 1'h0;
    assign frontend__tlb__entries_barrier_4__io_x_sr = 1'h0;
    assign frontend__tlb__entries_barrier_4__io_x_pw = 1'h0;
    assign frontend__tlb__entries_barrier_4__io_x_px = 1'h0;
    assign frontend__tlb__entries_barrier_4__io_x_pr = 1'h0;
    assign frontend__tlb__entries_barrier_4__io_x_ppp = 1'h0;
    assign frontend__tlb__entries_barrier_4__io_x_pal = 1'h0;
    assign frontend__tlb__entries_barrier_4__io_x_paa = 1'h0;
    assign frontend__tlb__entries_barrier_4__io_x_eff = 1'h0;
    assign frontend__tlb__entries_barrier_4__io_x_c = 1'h0;
    assign frontend__tlb__entries_barrier_5__io_x_u = 1'h0;
    assign frontend__tlb__entries_barrier_5__io_x_ae_ptw = 1'h0;
    assign frontend__tlb__entries_barrier_5__io_x_ae_final = 1'h0;
    assign frontend__tlb__entries_barrier_5__io_x_pf = 1'h0;
    assign frontend__tlb__entries_barrier_5__io_x_gf = 1'h0;
    assign frontend__tlb__entries_barrier_5__io_x_sw = 1'h0;
    assign frontend__tlb__entries_barrier_5__io_x_sx = 1'h0;
    assign frontend__tlb__entries_barrier_5__io_x_sr = 1'h0;
    assign frontend__tlb__entries_barrier_5__io_x_pw = 1'h0;
    assign frontend__tlb__entries_barrier_5__io_x_px = 1'h0;
    assign frontend__tlb__entries_barrier_5__io_x_pr = 1'h0;
    assign frontend__tlb__entries_barrier_5__io_x_ppp = 1'h0;
    assign frontend__tlb__entries_barrier_5__io_x_pal = 1'h0;
    assign frontend__tlb__entries_barrier_5__io_x_paa = 1'h0;
    assign frontend__tlb__entries_barrier_5__io_x_eff = 1'h0;
    assign frontend__tlb__entries_barrier_5__io_x_c = 1'h0;

    assign   frontend__tlb__io_resp_paddr  =  frontend__tlb__io_req_bits_vaddr  [31:0];
    assign   frontend__tlb__io_resp_pf_inst  =1'h0;
    assign   frontend__tlb__io_resp_ae_inst  =~(  frontend__tlb__legal_address  &({  frontend__tlb__io_req_bits_vaddr  [31:30],  frontend__tlb__io_req_bits_vaddr  [27],  frontend__tlb__io_req_bits_vaddr  [25]}==4'h0|{  frontend__tlb__io_req_bits_vaddr  [31],~(  frontend__tlb__io_req_bits_vaddr  [30])}==2'h0|  frontend__tlb___GEN  [3:2]==2'h0)&~(~  frontend__tlb__io_ptw_status_debug  &~(|(  frontend__tlb__io_req_bits_vaddr  [33:12])))&  frontend__tlb___pmp_io_x  );
    assign   frontend__tlb__io_resp_cacheable  =  frontend__tlb__legal_address  &~(  frontend__tlb___GEN  [3]);
    assign   frontend__tlb__io_ptw_req_bits_bits_need_gpa  =1'h0;
    assign   frontend__tlb__io_ptw_req_bits_bits_stage2  =1'h0;
    assign frontend__tlb__io_req_bits_vaddr = frontend__s1_pc;
    assign frontend___tlb_io_resp_paddr = frontend__tlb__io_resp_paddr;
    assign frontend___tlb_io_resp_pf_inst = frontend__tlb__io_resp_pf_inst;
    assign frontend___tlb_io_resp_ae_inst = frontend__tlb__io_resp_ae_inst;
    assign frontend___tlb_io_resp_cacheable = frontend__tlb__io_resp_cacheable;
    assign frontend__io_ptw_req_bits_bits_need_gpa = frontend__tlb__io_ptw_req_bits_bits_need_gpa;
    assign frontend__io_ptw_req_bits_bits_stage2 = frontend__tlb__io_ptw_req_bits_bits_stage2;
    assign frontend__tlb__io_ptw_status_debug = frontend__io_ptw_status_debug;
    assign frontend__tlb__io_ptw_pmp_cfg_l_0 = frontend__io_ptw_pmp_cfg_l_0;
    assign frontend__tlb__io_ptw_pmp_cfg_l_1 = frontend__io_ptw_pmp_cfg_l_1;
    assign frontend__tlb__io_ptw_pmp_cfg_l_2 = frontend__io_ptw_pmp_cfg_l_2;
    assign frontend__tlb__io_ptw_pmp_cfg_l_3 = frontend__io_ptw_pmp_cfg_l_3;
    assign frontend__tlb__io_ptw_pmp_cfg_l_4 = frontend__io_ptw_pmp_cfg_l_4;
    assign frontend__tlb__io_ptw_pmp_cfg_l_5 = frontend__io_ptw_pmp_cfg_l_5;
    assign frontend__tlb__io_ptw_pmp_cfg_l_6 = frontend__io_ptw_pmp_cfg_l_6;
    assign frontend__tlb__io_ptw_pmp_cfg_l_7 = frontend__io_ptw_pmp_cfg_l_7;
    assign frontend__tlb__io_ptw_pmp_cfg_a_0 = frontend__io_ptw_pmp_cfg_a_0;
    assign frontend__tlb__io_ptw_pmp_cfg_a_1 = frontend__io_ptw_pmp_cfg_a_1;
    assign frontend__tlb__io_ptw_pmp_cfg_a_2 = frontend__io_ptw_pmp_cfg_a_2;
    assign frontend__tlb__io_ptw_pmp_cfg_a_3 = frontend__io_ptw_pmp_cfg_a_3;
    assign frontend__tlb__io_ptw_pmp_cfg_a_4 = frontend__io_ptw_pmp_cfg_a_4;
    assign frontend__tlb__io_ptw_pmp_cfg_a_5 = frontend__io_ptw_pmp_cfg_a_5;
    assign frontend__tlb__io_ptw_pmp_cfg_a_6 = frontend__io_ptw_pmp_cfg_a_6;
    assign frontend__tlb__io_ptw_pmp_cfg_a_7 = frontend__io_ptw_pmp_cfg_a_7;
    assign frontend__tlb__io_ptw_pmp_cfg_x_0 = frontend__io_ptw_pmp_cfg_x_0;
    assign frontend__tlb__io_ptw_pmp_cfg_x_1 = frontend__io_ptw_pmp_cfg_x_1;
    assign frontend__tlb__io_ptw_pmp_cfg_x_2 = frontend__io_ptw_pmp_cfg_x_2;
    assign frontend__tlb__io_ptw_pmp_cfg_x_3 = frontend__io_ptw_pmp_cfg_x_3;
    assign frontend__tlb__io_ptw_pmp_cfg_x_4 = frontend__io_ptw_pmp_cfg_x_4;
    assign frontend__tlb__io_ptw_pmp_cfg_x_5 = frontend__io_ptw_pmp_cfg_x_5;
    assign frontend__tlb__io_ptw_pmp_cfg_x_6 = frontend__io_ptw_pmp_cfg_x_6;
    assign frontend__tlb__io_ptw_pmp_cfg_x_7 = frontend__io_ptw_pmp_cfg_x_7;
    assign frontend__tlb__io_ptw_pmp_addr_0 = frontend__io_ptw_pmp_addr_0;
    assign frontend__tlb__io_ptw_pmp_addr_1 = frontend__io_ptw_pmp_addr_1;
    assign frontend__tlb__io_ptw_pmp_addr_2 = frontend__io_ptw_pmp_addr_2;
    assign frontend__tlb__io_ptw_pmp_addr_3 = frontend__io_ptw_pmp_addr_3;
    assign frontend__tlb__io_ptw_pmp_addr_4 = frontend__io_ptw_pmp_addr_4;
    assign frontend__tlb__io_ptw_pmp_addr_5 = frontend__io_ptw_pmp_addr_5;
    assign frontend__tlb__io_ptw_pmp_addr_6 = frontend__io_ptw_pmp_addr_6;
    assign frontend__tlb__io_ptw_pmp_addr_7 = frontend__io_ptw_pmp_addr_7;
    assign frontend__tlb__io_ptw_pmp_mask_0 = frontend__io_ptw_pmp_mask_0;
    assign frontend__tlb__io_ptw_pmp_mask_1 = frontend__io_ptw_pmp_mask_1;
    assign frontend__tlb__io_ptw_pmp_mask_2 = frontend__io_ptw_pmp_mask_2;
    assign frontend__tlb__io_ptw_pmp_mask_3 = frontend__io_ptw_pmp_mask_3;
    assign frontend__tlb__io_ptw_pmp_mask_4 = frontend__io_ptw_pmp_mask_4;
    assign frontend__tlb__io_ptw_pmp_mask_5 = frontend__io_ptw_pmp_mask_5;
    assign frontend__tlb__io_ptw_pmp_mask_6 = frontend__io_ptw_pmp_mask_6;
    assign frontend__tlb__io_ptw_pmp_mask_7 = frontend__io_ptw_pmp_mask_7;

    assign frontend__clock = clock;
    assign frontend__reset = reset;
    assign frontend__auto_icache_master_out_a_ready = _tlMasterXbar_auto_in_1_a_ready;
    assign _frontend_auto_icache_master_out_a_valid = frontend__auto_icache_master_out_a_valid;
    assign _frontend_auto_icache_master_out_a_bits_address = frontend__auto_icache_master_out_a_bits_address;
    assign frontend__auto_icache_master_out_d_valid = _tlMasterXbar_auto_in_1_d_valid;
    assign frontend__auto_icache_master_out_d_bits_opcode = _tlMasterXbar_auto_in_1_d_bits_opcode;
    assign frontend__auto_icache_master_out_d_bits_size = _tlMasterXbar_auto_in_1_d_bits_size;
    assign frontend__auto_icache_master_out_d_bits_data = _tlMasterXbar_auto_in_1_d_bits_data;
    assign frontend__auto_icache_master_out_d_bits_corrupt = _tlMasterXbar_auto_in_1_d_bits_corrupt;
    assign frontend__io_cpu_might_request = _core_io_imem_might_request;
    assign frontend__io_cpu_req_valid = _core_io_imem_req_valid;
    assign frontend__io_cpu_req_bits_pc = _core_io_imem_req_bits_pc;
    assign frontend__io_cpu_req_bits_speculative = _core_io_imem_req_bits_speculative;
    assign frontend__io_cpu_resp_ready = _core_io_imem_resp_ready;
    assign _frontend_io_cpu_resp_valid = frontend__io_cpu_resp_valid;
    assign _frontend_io_cpu_resp_bits_pc = frontend__io_cpu_resp_bits_pc;
    assign _frontend_io_cpu_resp_bits_data = frontend__io_cpu_resp_bits_data;
    assign _frontend_io_cpu_resp_bits_xcpt_pf_inst = frontend__io_cpu_resp_bits_xcpt_pf_inst;
    assign _frontend_io_cpu_resp_bits_xcpt_gf_inst = frontend__io_cpu_resp_bits_xcpt_gf_inst;
    assign _frontend_io_cpu_resp_bits_xcpt_ae_inst = frontend__io_cpu_resp_bits_xcpt_ae_inst;
    assign _frontend_io_cpu_resp_bits_replay = frontend__io_cpu_resp_bits_replay;
    assign frontend__io_cpu_btb_update_valid = _core_io_imem_btb_update_valid;
    assign frontend__io_cpu_bht_update_valid = _core_io_imem_bht_update_valid;
    assign frontend__io_cpu_flush_icache = _core_io_imem_flush_icache;
    assign _frontend_io_ptw_req_bits_bits_need_gpa = frontend__io_ptw_req_bits_bits_need_gpa;
    assign _frontend_io_ptw_req_bits_bits_stage2 = frontend__io_ptw_req_bits_bits_stage2;
    assign frontend__io_ptw_status_debug = _ptw_io_requestor_1_status_debug;
    assign frontend__io_ptw_pmp_cfg_l_0 = _ptw_io_requestor_1_pmp_cfg_l_0;
    assign frontend__io_ptw_pmp_cfg_l_1 = _ptw_io_requestor_1_pmp_cfg_l_1;
    assign frontend__io_ptw_pmp_cfg_l_2 = _ptw_io_requestor_1_pmp_cfg_l_2;
    assign frontend__io_ptw_pmp_cfg_l_3 = _ptw_io_requestor_1_pmp_cfg_l_3;
    assign frontend__io_ptw_pmp_cfg_l_4 = _ptw_io_requestor_1_pmp_cfg_l_4;
    assign frontend__io_ptw_pmp_cfg_l_5 = _ptw_io_requestor_1_pmp_cfg_l_5;
    assign frontend__io_ptw_pmp_cfg_l_6 = _ptw_io_requestor_1_pmp_cfg_l_6;
    assign frontend__io_ptw_pmp_cfg_l_7 = _ptw_io_requestor_1_pmp_cfg_l_7;
    assign frontend__io_ptw_pmp_cfg_a_0 = _ptw_io_requestor_1_pmp_cfg_a_0;
    assign frontend__io_ptw_pmp_cfg_a_1 = _ptw_io_requestor_1_pmp_cfg_a_1;
    assign frontend__io_ptw_pmp_cfg_a_2 = _ptw_io_requestor_1_pmp_cfg_a_2;
    assign frontend__io_ptw_pmp_cfg_a_3 = _ptw_io_requestor_1_pmp_cfg_a_3;
    assign frontend__io_ptw_pmp_cfg_a_4 = _ptw_io_requestor_1_pmp_cfg_a_4;
    assign frontend__io_ptw_pmp_cfg_a_5 = _ptw_io_requestor_1_pmp_cfg_a_5;
    assign frontend__io_ptw_pmp_cfg_a_6 = _ptw_io_requestor_1_pmp_cfg_a_6;
    assign frontend__io_ptw_pmp_cfg_a_7 = _ptw_io_requestor_1_pmp_cfg_a_7;
    assign frontend__io_ptw_pmp_cfg_x_0 = _ptw_io_requestor_1_pmp_cfg_x_0;
    assign frontend__io_ptw_pmp_cfg_x_1 = _ptw_io_requestor_1_pmp_cfg_x_1;
    assign frontend__io_ptw_pmp_cfg_x_2 = _ptw_io_requestor_1_pmp_cfg_x_2;
    assign frontend__io_ptw_pmp_cfg_x_3 = _ptw_io_requestor_1_pmp_cfg_x_3;
    assign frontend__io_ptw_pmp_cfg_x_4 = _ptw_io_requestor_1_pmp_cfg_x_4;
    assign frontend__io_ptw_pmp_cfg_x_5 = _ptw_io_requestor_1_pmp_cfg_x_5;
    assign frontend__io_ptw_pmp_cfg_x_6 = _ptw_io_requestor_1_pmp_cfg_x_6;
    assign frontend__io_ptw_pmp_cfg_x_7 = _ptw_io_requestor_1_pmp_cfg_x_7;
    assign frontend__io_ptw_pmp_addr_0 = _ptw_io_requestor_1_pmp_addr_0;
    assign frontend__io_ptw_pmp_addr_1 = _ptw_io_requestor_1_pmp_addr_1;
    assign frontend__io_ptw_pmp_addr_2 = _ptw_io_requestor_1_pmp_addr_2;
    assign frontend__io_ptw_pmp_addr_3 = _ptw_io_requestor_1_pmp_addr_3;
    assign frontend__io_ptw_pmp_addr_4 = _ptw_io_requestor_1_pmp_addr_4;
    assign frontend__io_ptw_pmp_addr_5 = _ptw_io_requestor_1_pmp_addr_5;
    assign frontend__io_ptw_pmp_addr_6 = _ptw_io_requestor_1_pmp_addr_6;
    assign frontend__io_ptw_pmp_addr_7 = _ptw_io_requestor_1_pmp_addr_7;
    assign frontend__io_ptw_pmp_mask_0 = _ptw_io_requestor_1_pmp_mask_0;
    assign frontend__io_ptw_pmp_mask_1 = _ptw_io_requestor_1_pmp_mask_1;
    assign frontend__io_ptw_pmp_mask_2 = _ptw_io_requestor_1_pmp_mask_2;
    assign frontend__io_ptw_pmp_mask_3 = _ptw_io_requestor_1_pmp_mask_3;
    assign frontend__io_ptw_pmp_mask_4 = _ptw_io_requestor_1_pmp_mask_4;
    assign frontend__io_ptw_pmp_mask_5 = _ptw_io_requestor_1_pmp_mask_5;
    assign frontend__io_ptw_pmp_mask_6 = _ptw_io_requestor_1_pmp_mask_6;
    assign frontend__io_ptw_pmp_mask_7 = _ptw_io_requestor_1_pmp_mask_7;
    assign frontend__io_ptw_customCSRs_csrs_0_value = _ptw_io_requestor_1_customCSRs_csrs_0_value;


    wire  dcacheArb__io_requestor_0_req_ready;
    wire  dcacheArb__io_requestor_0_req_valid;
    wire [33:0] dcacheArb__io_requestor_0_req_bits_addr;
    wire [5:0] dcacheArb__io_requestor_0_req_bits_tag;
    wire [4:0] dcacheArb__io_requestor_0_req_bits_cmd;
    wire [1:0] dcacheArb__io_requestor_0_req_bits_size;
    wire  dcacheArb__io_requestor_0_req_bits_signed;
    wire  dcacheArb__io_requestor_0_req_bits_dv;
    wire  dcacheArb__io_requestor_0_s1_kill;
    wire [63:0] dcacheArb__io_requestor_0_s1_data_data;
    wire  dcacheArb__io_requestor_0_s2_nack;
    wire  dcacheArb__io_requestor_0_resp_valid;
    wire [5:0] dcacheArb__io_requestor_0_resp_bits_tag;
    wire [63:0] dcacheArb__io_requestor_0_resp_bits_data;
    wire  dcacheArb__io_requestor_0_resp_bits_replay;
    wire  dcacheArb__io_requestor_0_resp_bits_has_data;
    wire [63:0] dcacheArb__io_requestor_0_resp_bits_data_word_bypass;
    wire  dcacheArb__io_requestor_0_replay_next;
    wire  dcacheArb__io_requestor_0_s2_xcpt_ma_ld;
    wire  dcacheArb__io_requestor_0_s2_xcpt_ma_st;
    wire  dcacheArb__io_requestor_0_s2_xcpt_pf_ld;
    wire  dcacheArb__io_requestor_0_s2_xcpt_pf_st;
    wire  dcacheArb__io_requestor_0_s2_xcpt_ae_ld;
    wire  dcacheArb__io_requestor_0_s2_xcpt_ae_st;
    wire  dcacheArb__io_requestor_0_ordered;
    wire  dcacheArb__io_requestor_0_perf_release;
    wire  dcacheArb__io_requestor_0_perf_grant;
    wire  dcacheArb__io_mem_req_ready;
    wire  dcacheArb__io_mem_req_valid;
    wire [33:0] dcacheArb__io_mem_req_bits_addr;
    wire [5:0] dcacheArb__io_mem_req_bits_tag;
    wire [4:0] dcacheArb__io_mem_req_bits_cmd;
    wire [1:0] dcacheArb__io_mem_req_bits_size;
    wire  dcacheArb__io_mem_req_bits_signed;
    wire  dcacheArb__io_mem_req_bits_dv;
    wire  dcacheArb__io_mem_s1_kill;
    wire [63:0] dcacheArb__io_mem_s1_data_data;
    wire  dcacheArb__io_mem_s2_nack;
    wire  dcacheArb__io_mem_resp_valid;
    wire [5:0] dcacheArb__io_mem_resp_bits_tag;
    wire [63:0] dcacheArb__io_mem_resp_bits_data;
    wire  dcacheArb__io_mem_resp_bits_replay;
    wire  dcacheArb__io_mem_resp_bits_has_data;
    wire [63:0] dcacheArb__io_mem_resp_bits_data_word_bypass;
    wire  dcacheArb__io_mem_replay_next;
    wire  dcacheArb__io_mem_s2_xcpt_ma_ld;
    wire  dcacheArb__io_mem_s2_xcpt_ma_st;
    wire  dcacheArb__io_mem_s2_xcpt_pf_ld;
    wire  dcacheArb__io_mem_s2_xcpt_pf_st;
    wire  dcacheArb__io_mem_s2_xcpt_ae_ld;
    wire  dcacheArb__io_mem_s2_xcpt_ae_st;
    wire  dcacheArb__io_mem_ordered;
    wire  dcacheArb__io_mem_perf_release;
    wire  dcacheArb__io_mem_perf_grant;

    assign   dcacheArb__io_requestor_0_req_ready  =  dcacheArb__io_mem_req_ready  ;
    assign   dcacheArb__io_requestor_0_s2_nack  =  dcacheArb__io_mem_s2_nack  ;
    assign   dcacheArb__io_requestor_0_resp_valid  =  dcacheArb__io_mem_resp_valid  ;
    assign   dcacheArb__io_requestor_0_resp_bits_tag  =  dcacheArb__io_mem_resp_bits_tag  ;
    assign   dcacheArb__io_requestor_0_resp_bits_data  =  dcacheArb__io_mem_resp_bits_data  ;
    assign   dcacheArb__io_requestor_0_resp_bits_replay  =  dcacheArb__io_mem_resp_bits_replay  ;
    assign   dcacheArb__io_requestor_0_resp_bits_has_data  =  dcacheArb__io_mem_resp_bits_has_data  ;
    assign   dcacheArb__io_requestor_0_resp_bits_data_word_bypass  =  dcacheArb__io_mem_resp_bits_data_word_bypass  ;
    assign   dcacheArb__io_requestor_0_replay_next  =  dcacheArb__io_mem_replay_next  ;
    assign   dcacheArb__io_requestor_0_s2_xcpt_ma_ld  =  dcacheArb__io_mem_s2_xcpt_ma_ld  ;
    assign   dcacheArb__io_requestor_0_s2_xcpt_ma_st  =  dcacheArb__io_mem_s2_xcpt_ma_st  ;
    assign   dcacheArb__io_requestor_0_s2_xcpt_pf_ld  =  dcacheArb__io_mem_s2_xcpt_pf_ld  ;
    assign   dcacheArb__io_requestor_0_s2_xcpt_pf_st  =  dcacheArb__io_mem_s2_xcpt_pf_st  ;
    assign   dcacheArb__io_requestor_0_s2_xcpt_ae_ld  =  dcacheArb__io_mem_s2_xcpt_ae_ld  ;
    assign   dcacheArb__io_requestor_0_s2_xcpt_ae_st  =  dcacheArb__io_mem_s2_xcpt_ae_st  ;
    assign   dcacheArb__io_requestor_0_ordered  =  dcacheArb__io_mem_ordered  ;
    assign   dcacheArb__io_requestor_0_perf_release  =  dcacheArb__io_mem_perf_release  ;
    assign   dcacheArb__io_requestor_0_perf_grant  =  dcacheArb__io_mem_perf_grant  ;
    assign   dcacheArb__io_mem_req_valid  =  dcacheArb__io_requestor_0_req_valid  ;
    assign   dcacheArb__io_mem_req_bits_addr  =  dcacheArb__io_requestor_0_req_bits_addr  ;
    assign   dcacheArb__io_mem_req_bits_tag  =  dcacheArb__io_requestor_0_req_bits_tag  ;
    assign   dcacheArb__io_mem_req_bits_cmd  =  dcacheArb__io_requestor_0_req_bits_cmd  ;
    assign   dcacheArb__io_mem_req_bits_size  =  dcacheArb__io_requestor_0_req_bits_size  ;
    assign   dcacheArb__io_mem_req_bits_signed  =  dcacheArb__io_requestor_0_req_bits_signed  ;
    assign   dcacheArb__io_mem_req_bits_dv  =  dcacheArb__io_requestor_0_req_bits_dv  ;
    assign   dcacheArb__io_mem_s1_kill  =  dcacheArb__io_requestor_0_s1_kill  ;
    assign   dcacheArb__io_mem_s1_data_data  =  dcacheArb__io_requestor_0_s1_data_data  ;
    assign _dcacheArb_io_requestor_0_req_ready = dcacheArb__io_requestor_0_req_ready;
    assign dcacheArb__io_requestor_0_req_valid = _core_io_dmem_req_valid;
    assign dcacheArb__io_requestor_0_req_bits_addr = _core_io_dmem_req_bits_addr;
    assign dcacheArb__io_requestor_0_req_bits_tag = _core_io_dmem_req_bits_tag;
    assign dcacheArb__io_requestor_0_req_bits_cmd = _core_io_dmem_req_bits_cmd;
    assign dcacheArb__io_requestor_0_req_bits_size = _core_io_dmem_req_bits_size;
    assign dcacheArb__io_requestor_0_req_bits_signed = _core_io_dmem_req_bits_signed;
    assign dcacheArb__io_requestor_0_req_bits_dv = _core_io_dmem_req_bits_dv;
    assign dcacheArb__io_requestor_0_s1_kill = _core_io_dmem_s1_kill;
    assign dcacheArb__io_requestor_0_s1_data_data = _core_io_dmem_s1_data_data;
    assign _dcacheArb_io_requestor_0_s2_nack = dcacheArb__io_requestor_0_s2_nack;
    assign _dcacheArb_io_requestor_0_resp_valid = dcacheArb__io_requestor_0_resp_valid;
    assign _dcacheArb_io_requestor_0_resp_bits_tag = dcacheArb__io_requestor_0_resp_bits_tag;
    assign _dcacheArb_io_requestor_0_resp_bits_data = dcacheArb__io_requestor_0_resp_bits_data;
    assign _dcacheArb_io_requestor_0_resp_bits_replay = dcacheArb__io_requestor_0_resp_bits_replay;
    assign _dcacheArb_io_requestor_0_resp_bits_has_data = dcacheArb__io_requestor_0_resp_bits_has_data;
    assign _dcacheArb_io_requestor_0_resp_bits_data_word_bypass = dcacheArb__io_requestor_0_resp_bits_data_word_bypass;
    assign _dcacheArb_io_requestor_0_replay_next = dcacheArb__io_requestor_0_replay_next;
    assign _dcacheArb_io_requestor_0_s2_xcpt_ma_ld = dcacheArb__io_requestor_0_s2_xcpt_ma_ld;
    assign _dcacheArb_io_requestor_0_s2_xcpt_ma_st = dcacheArb__io_requestor_0_s2_xcpt_ma_st;
    assign _dcacheArb_io_requestor_0_s2_xcpt_pf_ld = dcacheArb__io_requestor_0_s2_xcpt_pf_ld;
    assign _dcacheArb_io_requestor_0_s2_xcpt_pf_st = dcacheArb__io_requestor_0_s2_xcpt_pf_st;
    assign _dcacheArb_io_requestor_0_s2_xcpt_ae_ld = dcacheArb__io_requestor_0_s2_xcpt_ae_ld;
    assign _dcacheArb_io_requestor_0_s2_xcpt_ae_st = dcacheArb__io_requestor_0_s2_xcpt_ae_st;
    assign _dcacheArb_io_requestor_0_ordered = dcacheArb__io_requestor_0_ordered;
    assign _dcacheArb_io_requestor_0_perf_release = dcacheArb__io_requestor_0_perf_release;
    assign _dcacheArb_io_requestor_0_perf_grant = dcacheArb__io_requestor_0_perf_grant;
    assign dcacheArb__io_mem_req_ready = _dcache_io_cpu_req_ready;
    assign _dcacheArb_io_mem_req_valid = dcacheArb__io_mem_req_valid;
    assign _dcacheArb_io_mem_req_bits_addr = dcacheArb__io_mem_req_bits_addr;
    assign _dcacheArb_io_mem_req_bits_tag = dcacheArb__io_mem_req_bits_tag;
    assign _dcacheArb_io_mem_req_bits_cmd = dcacheArb__io_mem_req_bits_cmd;
    assign _dcacheArb_io_mem_req_bits_size = dcacheArb__io_mem_req_bits_size;
    assign _dcacheArb_io_mem_req_bits_signed = dcacheArb__io_mem_req_bits_signed;
    assign _dcacheArb_io_mem_req_bits_dv = dcacheArb__io_mem_req_bits_dv;
    assign _dcacheArb_io_mem_s1_kill = dcacheArb__io_mem_s1_kill;
    assign _dcacheArb_io_mem_s1_data_data = dcacheArb__io_mem_s1_data_data;
    assign dcacheArb__io_mem_s2_nack = _dcache_io_cpu_s2_nack;
    assign dcacheArb__io_mem_resp_valid = _dcache_io_cpu_resp_valid;
    assign dcacheArb__io_mem_resp_bits_tag = _dcache_io_cpu_resp_bits_tag;
    assign dcacheArb__io_mem_resp_bits_data = _dcache_io_cpu_resp_bits_data;
    assign dcacheArb__io_mem_resp_bits_replay = _dcache_io_cpu_resp_bits_replay;
    assign dcacheArb__io_mem_resp_bits_has_data = _dcache_io_cpu_resp_bits_has_data;
    assign dcacheArb__io_mem_resp_bits_data_word_bypass = _dcache_io_cpu_resp_bits_data_word_bypass;
    assign dcacheArb__io_mem_replay_next = _dcache_io_cpu_replay_next;
    assign dcacheArb__io_mem_s2_xcpt_ma_ld = _dcache_io_cpu_s2_xcpt_ma_ld;
    assign dcacheArb__io_mem_s2_xcpt_ma_st = _dcache_io_cpu_s2_xcpt_ma_st;
    assign dcacheArb__io_mem_s2_xcpt_pf_ld = _dcache_io_cpu_s2_xcpt_pf_ld;
    assign dcacheArb__io_mem_s2_xcpt_pf_st = _dcache_io_cpu_s2_xcpt_pf_st;
    assign dcacheArb__io_mem_s2_xcpt_ae_ld = _dcache_io_cpu_s2_xcpt_ae_ld;
    assign dcacheArb__io_mem_s2_xcpt_ae_st = _dcache_io_cpu_s2_xcpt_ae_st;
    assign dcacheArb__io_mem_ordered = _dcache_io_cpu_ordered;
    assign dcacheArb__io_mem_perf_release = _dcache_io_cpu_perf_release;
    assign dcacheArb__io_mem_perf_grant = _dcache_io_cpu_perf_grant;


    wire  ptw__clock;
    wire  ptw__io_requestor_0_req_bits_bits_need_gpa;
    wire  ptw__io_requestor_0_req_bits_bits_stage2;
    wire  ptw__io_requestor_0_status_debug;
    wire  ptw__io_requestor_0_pmp_cfg_l_0;
    wire  ptw__io_requestor_0_pmp_cfg_l_1;
    wire  ptw__io_requestor_0_pmp_cfg_l_2;
    wire  ptw__io_requestor_0_pmp_cfg_l_3;
    wire  ptw__io_requestor_0_pmp_cfg_l_4;
    wire  ptw__io_requestor_0_pmp_cfg_l_5;
    wire  ptw__io_requestor_0_pmp_cfg_l_6;
    wire  ptw__io_requestor_0_pmp_cfg_l_7;
    wire [1:0] ptw__io_requestor_0_pmp_cfg_a_0;
    wire [1:0] ptw__io_requestor_0_pmp_cfg_a_1;
    wire [1:0] ptw__io_requestor_0_pmp_cfg_a_2;
    wire [1:0] ptw__io_requestor_0_pmp_cfg_a_3;
    wire [1:0] ptw__io_requestor_0_pmp_cfg_a_4;
    wire [1:0] ptw__io_requestor_0_pmp_cfg_a_5;
    wire [1:0] ptw__io_requestor_0_pmp_cfg_a_6;
    wire [1:0] ptw__io_requestor_0_pmp_cfg_a_7;
    wire  ptw__io_requestor_0_pmp_cfg_w_0;
    wire  ptw__io_requestor_0_pmp_cfg_w_1;
    wire  ptw__io_requestor_0_pmp_cfg_w_2;
    wire  ptw__io_requestor_0_pmp_cfg_w_3;
    wire  ptw__io_requestor_0_pmp_cfg_w_4;
    wire  ptw__io_requestor_0_pmp_cfg_w_5;
    wire  ptw__io_requestor_0_pmp_cfg_w_6;
    wire  ptw__io_requestor_0_pmp_cfg_w_7;
    wire  ptw__io_requestor_0_pmp_cfg_r_0;
    wire  ptw__io_requestor_0_pmp_cfg_r_1;
    wire  ptw__io_requestor_0_pmp_cfg_r_2;
    wire  ptw__io_requestor_0_pmp_cfg_r_3;
    wire  ptw__io_requestor_0_pmp_cfg_r_4;
    wire  ptw__io_requestor_0_pmp_cfg_r_5;
    wire  ptw__io_requestor_0_pmp_cfg_r_6;
    wire  ptw__io_requestor_0_pmp_cfg_r_7;
    wire [29:0] ptw__io_requestor_0_pmp_addr_0;
    wire [29:0] ptw__io_requestor_0_pmp_addr_1;
    wire [29:0] ptw__io_requestor_0_pmp_addr_2;
    wire [29:0] ptw__io_requestor_0_pmp_addr_3;
    wire [29:0] ptw__io_requestor_0_pmp_addr_4;
    wire [29:0] ptw__io_requestor_0_pmp_addr_5;
    wire [29:0] ptw__io_requestor_0_pmp_addr_6;
    wire [29:0] ptw__io_requestor_0_pmp_addr_7;
    wire [31:0] ptw__io_requestor_0_pmp_mask_0;
    wire [31:0] ptw__io_requestor_0_pmp_mask_1;
    wire [31:0] ptw__io_requestor_0_pmp_mask_2;
    wire [31:0] ptw__io_requestor_0_pmp_mask_3;
    wire [31:0] ptw__io_requestor_0_pmp_mask_4;
    wire [31:0] ptw__io_requestor_0_pmp_mask_5;
    wire [31:0] ptw__io_requestor_0_pmp_mask_6;
    wire [31:0] ptw__io_requestor_0_pmp_mask_7;
    wire  ptw__io_requestor_1_req_bits_bits_need_gpa;
    wire  ptw__io_requestor_1_req_bits_bits_stage2;
    wire  ptw__io_requestor_1_status_debug;
    wire  ptw__io_requestor_1_pmp_cfg_l_0;
    wire  ptw__io_requestor_1_pmp_cfg_l_1;
    wire  ptw__io_requestor_1_pmp_cfg_l_2;
    wire  ptw__io_requestor_1_pmp_cfg_l_3;
    wire  ptw__io_requestor_1_pmp_cfg_l_4;
    wire  ptw__io_requestor_1_pmp_cfg_l_5;
    wire  ptw__io_requestor_1_pmp_cfg_l_6;
    wire  ptw__io_requestor_1_pmp_cfg_l_7;
    wire [1:0] ptw__io_requestor_1_pmp_cfg_a_0;
    wire [1:0] ptw__io_requestor_1_pmp_cfg_a_1;
    wire [1:0] ptw__io_requestor_1_pmp_cfg_a_2;
    wire [1:0] ptw__io_requestor_1_pmp_cfg_a_3;
    wire [1:0] ptw__io_requestor_1_pmp_cfg_a_4;
    wire [1:0] ptw__io_requestor_1_pmp_cfg_a_5;
    wire [1:0] ptw__io_requestor_1_pmp_cfg_a_6;
    wire [1:0] ptw__io_requestor_1_pmp_cfg_a_7;
    wire  ptw__io_requestor_1_pmp_cfg_x_0;
    wire  ptw__io_requestor_1_pmp_cfg_x_1;
    wire  ptw__io_requestor_1_pmp_cfg_x_2;
    wire  ptw__io_requestor_1_pmp_cfg_x_3;
    wire  ptw__io_requestor_1_pmp_cfg_x_4;
    wire  ptw__io_requestor_1_pmp_cfg_x_5;
    wire  ptw__io_requestor_1_pmp_cfg_x_6;
    wire  ptw__io_requestor_1_pmp_cfg_x_7;
    wire [29:0] ptw__io_requestor_1_pmp_addr_0;
    wire [29:0] ptw__io_requestor_1_pmp_addr_1;
    wire [29:0] ptw__io_requestor_1_pmp_addr_2;
    wire [29:0] ptw__io_requestor_1_pmp_addr_3;
    wire [29:0] ptw__io_requestor_1_pmp_addr_4;
    wire [29:0] ptw__io_requestor_1_pmp_addr_5;
    wire [29:0] ptw__io_requestor_1_pmp_addr_6;
    wire [29:0] ptw__io_requestor_1_pmp_addr_7;
    wire [31:0] ptw__io_requestor_1_pmp_mask_0;
    wire [31:0] ptw__io_requestor_1_pmp_mask_1;
    wire [31:0] ptw__io_requestor_1_pmp_mask_2;
    wire [31:0] ptw__io_requestor_1_pmp_mask_3;
    wire [31:0] ptw__io_requestor_1_pmp_mask_4;
    wire [31:0] ptw__io_requestor_1_pmp_mask_5;
    wire [31:0] ptw__io_requestor_1_pmp_mask_6;
    wire [31:0] ptw__io_requestor_1_pmp_mask_7;
    wire [63:0] ptw__io_requestor_1_customCSRs_csrs_0_value;
    wire  ptw__io_dpath_status_debug;
    wire  ptw__io_dpath_pmp_cfg_l_0;
    wire  ptw__io_dpath_pmp_cfg_l_1;
    wire  ptw__io_dpath_pmp_cfg_l_2;
    wire  ptw__io_dpath_pmp_cfg_l_3;
    wire  ptw__io_dpath_pmp_cfg_l_4;
    wire  ptw__io_dpath_pmp_cfg_l_5;
    wire  ptw__io_dpath_pmp_cfg_l_6;
    wire  ptw__io_dpath_pmp_cfg_l_7;
    wire [1:0] ptw__io_dpath_pmp_cfg_a_0;
    wire [1:0] ptw__io_dpath_pmp_cfg_a_1;
    wire [1:0] ptw__io_dpath_pmp_cfg_a_2;
    wire [1:0] ptw__io_dpath_pmp_cfg_a_3;
    wire [1:0] ptw__io_dpath_pmp_cfg_a_4;
    wire [1:0] ptw__io_dpath_pmp_cfg_a_5;
    wire [1:0] ptw__io_dpath_pmp_cfg_a_6;
    wire [1:0] ptw__io_dpath_pmp_cfg_a_7;
    wire  ptw__io_dpath_pmp_cfg_x_0;
    wire  ptw__io_dpath_pmp_cfg_x_1;
    wire  ptw__io_dpath_pmp_cfg_x_2;
    wire  ptw__io_dpath_pmp_cfg_x_3;
    wire  ptw__io_dpath_pmp_cfg_x_4;
    wire  ptw__io_dpath_pmp_cfg_x_5;
    wire  ptw__io_dpath_pmp_cfg_x_6;
    wire  ptw__io_dpath_pmp_cfg_x_7;
    wire  ptw__io_dpath_pmp_cfg_w_0;
    wire  ptw__io_dpath_pmp_cfg_w_1;
    wire  ptw__io_dpath_pmp_cfg_w_2;
    wire  ptw__io_dpath_pmp_cfg_w_3;
    wire  ptw__io_dpath_pmp_cfg_w_4;
    wire  ptw__io_dpath_pmp_cfg_w_5;
    wire  ptw__io_dpath_pmp_cfg_w_6;
    wire  ptw__io_dpath_pmp_cfg_w_7;
    wire  ptw__io_dpath_pmp_cfg_r_0;
    wire  ptw__io_dpath_pmp_cfg_r_1;
    wire  ptw__io_dpath_pmp_cfg_r_2;
    wire  ptw__io_dpath_pmp_cfg_r_3;
    wire  ptw__io_dpath_pmp_cfg_r_4;
    wire  ptw__io_dpath_pmp_cfg_r_5;
    wire  ptw__io_dpath_pmp_cfg_r_6;
    wire  ptw__io_dpath_pmp_cfg_r_7;
    wire [29:0] ptw__io_dpath_pmp_addr_0;
    wire [29:0] ptw__io_dpath_pmp_addr_1;
    wire [29:0] ptw__io_dpath_pmp_addr_2;
    wire [29:0] ptw__io_dpath_pmp_addr_3;
    wire [29:0] ptw__io_dpath_pmp_addr_4;
    wire [29:0] ptw__io_dpath_pmp_addr_5;
    wire [29:0] ptw__io_dpath_pmp_addr_6;
    wire [29:0] ptw__io_dpath_pmp_addr_7;
    wire [31:0] ptw__io_dpath_pmp_mask_0;
    wire [31:0] ptw__io_dpath_pmp_mask_1;
    wire [31:0] ptw__io_dpath_pmp_mask_2;
    wire [31:0] ptw__io_dpath_pmp_mask_3;
    wire [31:0] ptw__io_dpath_pmp_mask_4;
    wire [31:0] ptw__io_dpath_pmp_mask_5;
    wire [31:0] ptw__io_dpath_pmp_mask_6;
    wire [31:0] ptw__io_dpath_pmp_mask_7;
    wire [63:0] ptw__io_dpath_customCSRs_csrs_0_value;


    wire  ptw__arb__io_in_0_bits_bits_need_gpa;
    wire  ptw__arb__io_in_0_bits_bits_stage2;
    wire  ptw__arb__io_in_1_bits_bits_need_gpa;
    wire  ptw__arb__io_in_1_bits_bits_stage2;
    wire  ptw__arb__io_out_bits_bits_need_gpa;
    wire  ptw__arb__io_out_bits_bits_stage2;

    assign   ptw__arb__io_out_bits_bits_need_gpa  =  ptw__arb__io_in_1_bits_bits_need_gpa  ;
    assign   ptw__arb__io_out_bits_bits_stage2  =  ptw__arb__io_in_1_bits_bits_stage2  ;
    assign ptw__arb__io_in_0_bits_bits_need_gpa = ptw__io_requestor_0_req_bits_bits_need_gpa;
    assign ptw__arb__io_in_0_bits_bits_stage2 = ptw__io_requestor_0_req_bits_bits_stage2;
    assign ptw__arb__io_in_1_bits_bits_need_gpa = ptw__io_requestor_1_req_bits_bits_need_gpa;
    assign ptw__arb__io_in_1_bits_bits_stage2 = ptw__io_requestor_1_req_bits_bits_stage2;

    assign   ptw__io_requestor_0_status_debug  =  ptw__io_dpath_status_debug  ;
    assign   ptw__io_requestor_0_pmp_cfg_l_0  =  ptw__io_dpath_pmp_cfg_l_0  ;
    assign   ptw__io_requestor_0_pmp_cfg_l_1  =  ptw__io_dpath_pmp_cfg_l_1  ;
    assign   ptw__io_requestor_0_pmp_cfg_l_2  =  ptw__io_dpath_pmp_cfg_l_2  ;
    assign   ptw__io_requestor_0_pmp_cfg_l_3  =  ptw__io_dpath_pmp_cfg_l_3  ;
    assign   ptw__io_requestor_0_pmp_cfg_l_4  =  ptw__io_dpath_pmp_cfg_l_4  ;
    assign   ptw__io_requestor_0_pmp_cfg_l_5  =  ptw__io_dpath_pmp_cfg_l_5  ;
    assign   ptw__io_requestor_0_pmp_cfg_l_6  =  ptw__io_dpath_pmp_cfg_l_6  ;
    assign   ptw__io_requestor_0_pmp_cfg_l_7  =  ptw__io_dpath_pmp_cfg_l_7  ;
    assign   ptw__io_requestor_0_pmp_cfg_a_0  =  ptw__io_dpath_pmp_cfg_a_0  ;
    assign   ptw__io_requestor_0_pmp_cfg_a_1  =  ptw__io_dpath_pmp_cfg_a_1  ;
    assign   ptw__io_requestor_0_pmp_cfg_a_2  =  ptw__io_dpath_pmp_cfg_a_2  ;
    assign   ptw__io_requestor_0_pmp_cfg_a_3  =  ptw__io_dpath_pmp_cfg_a_3  ;
    assign   ptw__io_requestor_0_pmp_cfg_a_4  =  ptw__io_dpath_pmp_cfg_a_4  ;
    assign   ptw__io_requestor_0_pmp_cfg_a_5  =  ptw__io_dpath_pmp_cfg_a_5  ;
    assign   ptw__io_requestor_0_pmp_cfg_a_6  =  ptw__io_dpath_pmp_cfg_a_6  ;
    assign   ptw__io_requestor_0_pmp_cfg_a_7  =  ptw__io_dpath_pmp_cfg_a_7  ;
    assign   ptw__io_requestor_0_pmp_cfg_w_0  =  ptw__io_dpath_pmp_cfg_w_0  ;
    assign   ptw__io_requestor_0_pmp_cfg_w_1  =  ptw__io_dpath_pmp_cfg_w_1  ;
    assign   ptw__io_requestor_0_pmp_cfg_w_2  =  ptw__io_dpath_pmp_cfg_w_2  ;
    assign   ptw__io_requestor_0_pmp_cfg_w_3  =  ptw__io_dpath_pmp_cfg_w_3  ;
    assign   ptw__io_requestor_0_pmp_cfg_w_4  =  ptw__io_dpath_pmp_cfg_w_4  ;
    assign   ptw__io_requestor_0_pmp_cfg_w_5  =  ptw__io_dpath_pmp_cfg_w_5  ;
    assign   ptw__io_requestor_0_pmp_cfg_w_6  =  ptw__io_dpath_pmp_cfg_w_6  ;
    assign   ptw__io_requestor_0_pmp_cfg_w_7  =  ptw__io_dpath_pmp_cfg_w_7  ;
    assign   ptw__io_requestor_0_pmp_cfg_r_0  =  ptw__io_dpath_pmp_cfg_r_0  ;
    assign   ptw__io_requestor_0_pmp_cfg_r_1  =  ptw__io_dpath_pmp_cfg_r_1  ;
    assign   ptw__io_requestor_0_pmp_cfg_r_2  =  ptw__io_dpath_pmp_cfg_r_2  ;
    assign   ptw__io_requestor_0_pmp_cfg_r_3  =  ptw__io_dpath_pmp_cfg_r_3  ;
    assign   ptw__io_requestor_0_pmp_cfg_r_4  =  ptw__io_dpath_pmp_cfg_r_4  ;
    assign   ptw__io_requestor_0_pmp_cfg_r_5  =  ptw__io_dpath_pmp_cfg_r_5  ;
    assign   ptw__io_requestor_0_pmp_cfg_r_6  =  ptw__io_dpath_pmp_cfg_r_6  ;
    assign   ptw__io_requestor_0_pmp_cfg_r_7  =  ptw__io_dpath_pmp_cfg_r_7  ;
    assign   ptw__io_requestor_0_pmp_addr_0  =  ptw__io_dpath_pmp_addr_0  ;
    assign   ptw__io_requestor_0_pmp_addr_1  =  ptw__io_dpath_pmp_addr_1  ;
    assign   ptw__io_requestor_0_pmp_addr_2  =  ptw__io_dpath_pmp_addr_2  ;
    assign   ptw__io_requestor_0_pmp_addr_3  =  ptw__io_dpath_pmp_addr_3  ;
    assign   ptw__io_requestor_0_pmp_addr_4  =  ptw__io_dpath_pmp_addr_4  ;
    assign   ptw__io_requestor_0_pmp_addr_5  =  ptw__io_dpath_pmp_addr_5  ;
    assign   ptw__io_requestor_0_pmp_addr_6  =  ptw__io_dpath_pmp_addr_6  ;
    assign   ptw__io_requestor_0_pmp_addr_7  =  ptw__io_dpath_pmp_addr_7  ;
    assign   ptw__io_requestor_0_pmp_mask_0  =  ptw__io_dpath_pmp_mask_0  ;
    assign   ptw__io_requestor_0_pmp_mask_1  =  ptw__io_dpath_pmp_mask_1  ;
    assign   ptw__io_requestor_0_pmp_mask_2  =  ptw__io_dpath_pmp_mask_2  ;
    assign   ptw__io_requestor_0_pmp_mask_3  =  ptw__io_dpath_pmp_mask_3  ;
    assign   ptw__io_requestor_0_pmp_mask_4  =  ptw__io_dpath_pmp_mask_4  ;
    assign   ptw__io_requestor_0_pmp_mask_5  =  ptw__io_dpath_pmp_mask_5  ;
    assign   ptw__io_requestor_0_pmp_mask_6  =  ptw__io_dpath_pmp_mask_6  ;
    assign   ptw__io_requestor_0_pmp_mask_7  =  ptw__io_dpath_pmp_mask_7  ;
    assign   ptw__io_requestor_1_status_debug  =  ptw__io_dpath_status_debug  ;
    assign   ptw__io_requestor_1_pmp_cfg_l_0  =  ptw__io_dpath_pmp_cfg_l_0  ;
    assign   ptw__io_requestor_1_pmp_cfg_l_1  =  ptw__io_dpath_pmp_cfg_l_1  ;
    assign   ptw__io_requestor_1_pmp_cfg_l_2  =  ptw__io_dpath_pmp_cfg_l_2  ;
    assign   ptw__io_requestor_1_pmp_cfg_l_3  =  ptw__io_dpath_pmp_cfg_l_3  ;
    assign   ptw__io_requestor_1_pmp_cfg_l_4  =  ptw__io_dpath_pmp_cfg_l_4  ;
    assign   ptw__io_requestor_1_pmp_cfg_l_5  =  ptw__io_dpath_pmp_cfg_l_5  ;
    assign   ptw__io_requestor_1_pmp_cfg_l_6  =  ptw__io_dpath_pmp_cfg_l_6  ;
    assign   ptw__io_requestor_1_pmp_cfg_l_7  =  ptw__io_dpath_pmp_cfg_l_7  ;
    assign   ptw__io_requestor_1_pmp_cfg_a_0  =  ptw__io_dpath_pmp_cfg_a_0  ;
    assign   ptw__io_requestor_1_pmp_cfg_a_1  =  ptw__io_dpath_pmp_cfg_a_1  ;
    assign   ptw__io_requestor_1_pmp_cfg_a_2  =  ptw__io_dpath_pmp_cfg_a_2  ;
    assign   ptw__io_requestor_1_pmp_cfg_a_3  =  ptw__io_dpath_pmp_cfg_a_3  ;
    assign   ptw__io_requestor_1_pmp_cfg_a_4  =  ptw__io_dpath_pmp_cfg_a_4  ;
    assign   ptw__io_requestor_1_pmp_cfg_a_5  =  ptw__io_dpath_pmp_cfg_a_5  ;
    assign   ptw__io_requestor_1_pmp_cfg_a_6  =  ptw__io_dpath_pmp_cfg_a_6  ;
    assign   ptw__io_requestor_1_pmp_cfg_a_7  =  ptw__io_dpath_pmp_cfg_a_7  ;
    assign   ptw__io_requestor_1_pmp_cfg_x_0  =  ptw__io_dpath_pmp_cfg_x_0  ;
    assign   ptw__io_requestor_1_pmp_cfg_x_1  =  ptw__io_dpath_pmp_cfg_x_1  ;
    assign   ptw__io_requestor_1_pmp_cfg_x_2  =  ptw__io_dpath_pmp_cfg_x_2  ;
    assign   ptw__io_requestor_1_pmp_cfg_x_3  =  ptw__io_dpath_pmp_cfg_x_3  ;
    assign   ptw__io_requestor_1_pmp_cfg_x_4  =  ptw__io_dpath_pmp_cfg_x_4  ;
    assign   ptw__io_requestor_1_pmp_cfg_x_5  =  ptw__io_dpath_pmp_cfg_x_5  ;
    assign   ptw__io_requestor_1_pmp_cfg_x_6  =  ptw__io_dpath_pmp_cfg_x_6  ;
    assign   ptw__io_requestor_1_pmp_cfg_x_7  =  ptw__io_dpath_pmp_cfg_x_7  ;
    assign   ptw__io_requestor_1_pmp_addr_0  =  ptw__io_dpath_pmp_addr_0  ;
    assign   ptw__io_requestor_1_pmp_addr_1  =  ptw__io_dpath_pmp_addr_1  ;
    assign   ptw__io_requestor_1_pmp_addr_2  =  ptw__io_dpath_pmp_addr_2  ;
    assign   ptw__io_requestor_1_pmp_addr_3  =  ptw__io_dpath_pmp_addr_3  ;
    assign   ptw__io_requestor_1_pmp_addr_4  =  ptw__io_dpath_pmp_addr_4  ;
    assign   ptw__io_requestor_1_pmp_addr_5  =  ptw__io_dpath_pmp_addr_5  ;
    assign   ptw__io_requestor_1_pmp_addr_6  =  ptw__io_dpath_pmp_addr_6  ;
    assign   ptw__io_requestor_1_pmp_addr_7  =  ptw__io_dpath_pmp_addr_7  ;
    assign   ptw__io_requestor_1_pmp_mask_0  =  ptw__io_dpath_pmp_mask_0  ;
    assign   ptw__io_requestor_1_pmp_mask_1  =  ptw__io_dpath_pmp_mask_1  ;
    assign   ptw__io_requestor_1_pmp_mask_2  =  ptw__io_dpath_pmp_mask_2  ;
    assign   ptw__io_requestor_1_pmp_mask_3  =  ptw__io_dpath_pmp_mask_3  ;
    assign   ptw__io_requestor_1_pmp_mask_4  =  ptw__io_dpath_pmp_mask_4  ;
    assign   ptw__io_requestor_1_pmp_mask_5  =  ptw__io_dpath_pmp_mask_5  ;
    assign   ptw__io_requestor_1_pmp_mask_6  =  ptw__io_dpath_pmp_mask_6  ;
    assign   ptw__io_requestor_1_pmp_mask_7  =  ptw__io_dpath_pmp_mask_7  ;
    assign   ptw__io_requestor_1_customCSRs_csrs_0_value  =  ptw__io_dpath_customCSRs_csrs_0_value  ;
    assign ptw__clock = clock;
    assign ptw__io_requestor_0_req_bits_bits_need_gpa = _dcache_io_ptw_req_bits_bits_need_gpa;
    assign ptw__io_requestor_0_req_bits_bits_stage2 = _dcache_io_ptw_req_bits_bits_stage2;
    assign _ptw_io_requestor_0_status_debug = ptw__io_requestor_0_status_debug;
    assign _ptw_io_requestor_0_pmp_cfg_l_0 = ptw__io_requestor_0_pmp_cfg_l_0;
    assign _ptw_io_requestor_0_pmp_cfg_l_1 = ptw__io_requestor_0_pmp_cfg_l_1;
    assign _ptw_io_requestor_0_pmp_cfg_l_2 = ptw__io_requestor_0_pmp_cfg_l_2;
    assign _ptw_io_requestor_0_pmp_cfg_l_3 = ptw__io_requestor_0_pmp_cfg_l_3;
    assign _ptw_io_requestor_0_pmp_cfg_l_4 = ptw__io_requestor_0_pmp_cfg_l_4;
    assign _ptw_io_requestor_0_pmp_cfg_l_5 = ptw__io_requestor_0_pmp_cfg_l_5;
    assign _ptw_io_requestor_0_pmp_cfg_l_6 = ptw__io_requestor_0_pmp_cfg_l_6;
    assign _ptw_io_requestor_0_pmp_cfg_l_7 = ptw__io_requestor_0_pmp_cfg_l_7;
    assign _ptw_io_requestor_0_pmp_cfg_a_0 = ptw__io_requestor_0_pmp_cfg_a_0;
    assign _ptw_io_requestor_0_pmp_cfg_a_1 = ptw__io_requestor_0_pmp_cfg_a_1;
    assign _ptw_io_requestor_0_pmp_cfg_a_2 = ptw__io_requestor_0_pmp_cfg_a_2;
    assign _ptw_io_requestor_0_pmp_cfg_a_3 = ptw__io_requestor_0_pmp_cfg_a_3;
    assign _ptw_io_requestor_0_pmp_cfg_a_4 = ptw__io_requestor_0_pmp_cfg_a_4;
    assign _ptw_io_requestor_0_pmp_cfg_a_5 = ptw__io_requestor_0_pmp_cfg_a_5;
    assign _ptw_io_requestor_0_pmp_cfg_a_6 = ptw__io_requestor_0_pmp_cfg_a_6;
    assign _ptw_io_requestor_0_pmp_cfg_a_7 = ptw__io_requestor_0_pmp_cfg_a_7;
    assign _ptw_io_requestor_0_pmp_cfg_w_0 = ptw__io_requestor_0_pmp_cfg_w_0;
    assign _ptw_io_requestor_0_pmp_cfg_w_1 = ptw__io_requestor_0_pmp_cfg_w_1;
    assign _ptw_io_requestor_0_pmp_cfg_w_2 = ptw__io_requestor_0_pmp_cfg_w_2;
    assign _ptw_io_requestor_0_pmp_cfg_w_3 = ptw__io_requestor_0_pmp_cfg_w_3;
    assign _ptw_io_requestor_0_pmp_cfg_w_4 = ptw__io_requestor_0_pmp_cfg_w_4;
    assign _ptw_io_requestor_0_pmp_cfg_w_5 = ptw__io_requestor_0_pmp_cfg_w_5;
    assign _ptw_io_requestor_0_pmp_cfg_w_6 = ptw__io_requestor_0_pmp_cfg_w_6;
    assign _ptw_io_requestor_0_pmp_cfg_w_7 = ptw__io_requestor_0_pmp_cfg_w_7;
    assign _ptw_io_requestor_0_pmp_cfg_r_0 = ptw__io_requestor_0_pmp_cfg_r_0;
    assign _ptw_io_requestor_0_pmp_cfg_r_1 = ptw__io_requestor_0_pmp_cfg_r_1;
    assign _ptw_io_requestor_0_pmp_cfg_r_2 = ptw__io_requestor_0_pmp_cfg_r_2;
    assign _ptw_io_requestor_0_pmp_cfg_r_3 = ptw__io_requestor_0_pmp_cfg_r_3;
    assign _ptw_io_requestor_0_pmp_cfg_r_4 = ptw__io_requestor_0_pmp_cfg_r_4;
    assign _ptw_io_requestor_0_pmp_cfg_r_5 = ptw__io_requestor_0_pmp_cfg_r_5;
    assign _ptw_io_requestor_0_pmp_cfg_r_6 = ptw__io_requestor_0_pmp_cfg_r_6;
    assign _ptw_io_requestor_0_pmp_cfg_r_7 = ptw__io_requestor_0_pmp_cfg_r_7;
    assign _ptw_io_requestor_0_pmp_addr_0 = ptw__io_requestor_0_pmp_addr_0;
    assign _ptw_io_requestor_0_pmp_addr_1 = ptw__io_requestor_0_pmp_addr_1;
    assign _ptw_io_requestor_0_pmp_addr_2 = ptw__io_requestor_0_pmp_addr_2;
    assign _ptw_io_requestor_0_pmp_addr_3 = ptw__io_requestor_0_pmp_addr_3;
    assign _ptw_io_requestor_0_pmp_addr_4 = ptw__io_requestor_0_pmp_addr_4;
    assign _ptw_io_requestor_0_pmp_addr_5 = ptw__io_requestor_0_pmp_addr_5;
    assign _ptw_io_requestor_0_pmp_addr_6 = ptw__io_requestor_0_pmp_addr_6;
    assign _ptw_io_requestor_0_pmp_addr_7 = ptw__io_requestor_0_pmp_addr_7;
    assign _ptw_io_requestor_0_pmp_mask_0 = ptw__io_requestor_0_pmp_mask_0;
    assign _ptw_io_requestor_0_pmp_mask_1 = ptw__io_requestor_0_pmp_mask_1;
    assign _ptw_io_requestor_0_pmp_mask_2 = ptw__io_requestor_0_pmp_mask_2;
    assign _ptw_io_requestor_0_pmp_mask_3 = ptw__io_requestor_0_pmp_mask_3;
    assign _ptw_io_requestor_0_pmp_mask_4 = ptw__io_requestor_0_pmp_mask_4;
    assign _ptw_io_requestor_0_pmp_mask_5 = ptw__io_requestor_0_pmp_mask_5;
    assign _ptw_io_requestor_0_pmp_mask_6 = ptw__io_requestor_0_pmp_mask_6;
    assign _ptw_io_requestor_0_pmp_mask_7 = ptw__io_requestor_0_pmp_mask_7;
    assign ptw__io_requestor_1_req_bits_bits_need_gpa = _frontend_io_ptw_req_bits_bits_need_gpa;
    assign ptw__io_requestor_1_req_bits_bits_stage2 = _frontend_io_ptw_req_bits_bits_stage2;
    assign _ptw_io_requestor_1_status_debug = ptw__io_requestor_1_status_debug;
    assign _ptw_io_requestor_1_pmp_cfg_l_0 = ptw__io_requestor_1_pmp_cfg_l_0;
    assign _ptw_io_requestor_1_pmp_cfg_l_1 = ptw__io_requestor_1_pmp_cfg_l_1;
    assign _ptw_io_requestor_1_pmp_cfg_l_2 = ptw__io_requestor_1_pmp_cfg_l_2;
    assign _ptw_io_requestor_1_pmp_cfg_l_3 = ptw__io_requestor_1_pmp_cfg_l_3;
    assign _ptw_io_requestor_1_pmp_cfg_l_4 = ptw__io_requestor_1_pmp_cfg_l_4;
    assign _ptw_io_requestor_1_pmp_cfg_l_5 = ptw__io_requestor_1_pmp_cfg_l_5;
    assign _ptw_io_requestor_1_pmp_cfg_l_6 = ptw__io_requestor_1_pmp_cfg_l_6;
    assign _ptw_io_requestor_1_pmp_cfg_l_7 = ptw__io_requestor_1_pmp_cfg_l_7;
    assign _ptw_io_requestor_1_pmp_cfg_a_0 = ptw__io_requestor_1_pmp_cfg_a_0;
    assign _ptw_io_requestor_1_pmp_cfg_a_1 = ptw__io_requestor_1_pmp_cfg_a_1;
    assign _ptw_io_requestor_1_pmp_cfg_a_2 = ptw__io_requestor_1_pmp_cfg_a_2;
    assign _ptw_io_requestor_1_pmp_cfg_a_3 = ptw__io_requestor_1_pmp_cfg_a_3;
    assign _ptw_io_requestor_1_pmp_cfg_a_4 = ptw__io_requestor_1_pmp_cfg_a_4;
    assign _ptw_io_requestor_1_pmp_cfg_a_5 = ptw__io_requestor_1_pmp_cfg_a_5;
    assign _ptw_io_requestor_1_pmp_cfg_a_6 = ptw__io_requestor_1_pmp_cfg_a_6;
    assign _ptw_io_requestor_1_pmp_cfg_a_7 = ptw__io_requestor_1_pmp_cfg_a_7;
    assign _ptw_io_requestor_1_pmp_cfg_x_0 = ptw__io_requestor_1_pmp_cfg_x_0;
    assign _ptw_io_requestor_1_pmp_cfg_x_1 = ptw__io_requestor_1_pmp_cfg_x_1;
    assign _ptw_io_requestor_1_pmp_cfg_x_2 = ptw__io_requestor_1_pmp_cfg_x_2;
    assign _ptw_io_requestor_1_pmp_cfg_x_3 = ptw__io_requestor_1_pmp_cfg_x_3;
    assign _ptw_io_requestor_1_pmp_cfg_x_4 = ptw__io_requestor_1_pmp_cfg_x_4;
    assign _ptw_io_requestor_1_pmp_cfg_x_5 = ptw__io_requestor_1_pmp_cfg_x_5;
    assign _ptw_io_requestor_1_pmp_cfg_x_6 = ptw__io_requestor_1_pmp_cfg_x_6;
    assign _ptw_io_requestor_1_pmp_cfg_x_7 = ptw__io_requestor_1_pmp_cfg_x_7;
    assign _ptw_io_requestor_1_pmp_addr_0 = ptw__io_requestor_1_pmp_addr_0;
    assign _ptw_io_requestor_1_pmp_addr_1 = ptw__io_requestor_1_pmp_addr_1;
    assign _ptw_io_requestor_1_pmp_addr_2 = ptw__io_requestor_1_pmp_addr_2;
    assign _ptw_io_requestor_1_pmp_addr_3 = ptw__io_requestor_1_pmp_addr_3;
    assign _ptw_io_requestor_1_pmp_addr_4 = ptw__io_requestor_1_pmp_addr_4;
    assign _ptw_io_requestor_1_pmp_addr_5 = ptw__io_requestor_1_pmp_addr_5;
    assign _ptw_io_requestor_1_pmp_addr_6 = ptw__io_requestor_1_pmp_addr_6;
    assign _ptw_io_requestor_1_pmp_addr_7 = ptw__io_requestor_1_pmp_addr_7;
    assign _ptw_io_requestor_1_pmp_mask_0 = ptw__io_requestor_1_pmp_mask_0;
    assign _ptw_io_requestor_1_pmp_mask_1 = ptw__io_requestor_1_pmp_mask_1;
    assign _ptw_io_requestor_1_pmp_mask_2 = ptw__io_requestor_1_pmp_mask_2;
    assign _ptw_io_requestor_1_pmp_mask_3 = ptw__io_requestor_1_pmp_mask_3;
    assign _ptw_io_requestor_1_pmp_mask_4 = ptw__io_requestor_1_pmp_mask_4;
    assign _ptw_io_requestor_1_pmp_mask_5 = ptw__io_requestor_1_pmp_mask_5;
    assign _ptw_io_requestor_1_pmp_mask_6 = ptw__io_requestor_1_pmp_mask_6;
    assign _ptw_io_requestor_1_pmp_mask_7 = ptw__io_requestor_1_pmp_mask_7;
    assign _ptw_io_requestor_1_customCSRs_csrs_0_value = ptw__io_requestor_1_customCSRs_csrs_0_value;
    assign ptw__io_dpath_status_debug = _core_io_ptw_status_debug;
    assign ptw__io_dpath_pmp_cfg_l_0 = _core_io_ptw_pmp_cfg_l_0;
    assign ptw__io_dpath_pmp_cfg_l_1 = _core_io_ptw_pmp_cfg_l_1;
    assign ptw__io_dpath_pmp_cfg_l_2 = _core_io_ptw_pmp_cfg_l_2;
    assign ptw__io_dpath_pmp_cfg_l_3 = _core_io_ptw_pmp_cfg_l_3;
    assign ptw__io_dpath_pmp_cfg_l_4 = _core_io_ptw_pmp_cfg_l_4;
    assign ptw__io_dpath_pmp_cfg_l_5 = _core_io_ptw_pmp_cfg_l_5;
    assign ptw__io_dpath_pmp_cfg_l_6 = _core_io_ptw_pmp_cfg_l_6;
    assign ptw__io_dpath_pmp_cfg_l_7 = _core_io_ptw_pmp_cfg_l_7;
    assign ptw__io_dpath_pmp_cfg_a_0 = _core_io_ptw_pmp_cfg_a_0;
    assign ptw__io_dpath_pmp_cfg_a_1 = _core_io_ptw_pmp_cfg_a_1;
    assign ptw__io_dpath_pmp_cfg_a_2 = _core_io_ptw_pmp_cfg_a_2;
    assign ptw__io_dpath_pmp_cfg_a_3 = _core_io_ptw_pmp_cfg_a_3;
    assign ptw__io_dpath_pmp_cfg_a_4 = _core_io_ptw_pmp_cfg_a_4;
    assign ptw__io_dpath_pmp_cfg_a_5 = _core_io_ptw_pmp_cfg_a_5;
    assign ptw__io_dpath_pmp_cfg_a_6 = _core_io_ptw_pmp_cfg_a_6;
    assign ptw__io_dpath_pmp_cfg_a_7 = _core_io_ptw_pmp_cfg_a_7;
    assign ptw__io_dpath_pmp_cfg_x_0 = _core_io_ptw_pmp_cfg_x_0;
    assign ptw__io_dpath_pmp_cfg_x_1 = _core_io_ptw_pmp_cfg_x_1;
    assign ptw__io_dpath_pmp_cfg_x_2 = _core_io_ptw_pmp_cfg_x_2;
    assign ptw__io_dpath_pmp_cfg_x_3 = _core_io_ptw_pmp_cfg_x_3;
    assign ptw__io_dpath_pmp_cfg_x_4 = _core_io_ptw_pmp_cfg_x_4;
    assign ptw__io_dpath_pmp_cfg_x_5 = _core_io_ptw_pmp_cfg_x_5;
    assign ptw__io_dpath_pmp_cfg_x_6 = _core_io_ptw_pmp_cfg_x_6;
    assign ptw__io_dpath_pmp_cfg_x_7 = _core_io_ptw_pmp_cfg_x_7;
    assign ptw__io_dpath_pmp_cfg_w_0 = _core_io_ptw_pmp_cfg_w_0;
    assign ptw__io_dpath_pmp_cfg_w_1 = _core_io_ptw_pmp_cfg_w_1;
    assign ptw__io_dpath_pmp_cfg_w_2 = _core_io_ptw_pmp_cfg_w_2;
    assign ptw__io_dpath_pmp_cfg_w_3 = _core_io_ptw_pmp_cfg_w_3;
    assign ptw__io_dpath_pmp_cfg_w_4 = _core_io_ptw_pmp_cfg_w_4;
    assign ptw__io_dpath_pmp_cfg_w_5 = _core_io_ptw_pmp_cfg_w_5;
    assign ptw__io_dpath_pmp_cfg_w_6 = _core_io_ptw_pmp_cfg_w_6;
    assign ptw__io_dpath_pmp_cfg_w_7 = _core_io_ptw_pmp_cfg_w_7;
    assign ptw__io_dpath_pmp_cfg_r_0 = _core_io_ptw_pmp_cfg_r_0;
    assign ptw__io_dpath_pmp_cfg_r_1 = _core_io_ptw_pmp_cfg_r_1;
    assign ptw__io_dpath_pmp_cfg_r_2 = _core_io_ptw_pmp_cfg_r_2;
    assign ptw__io_dpath_pmp_cfg_r_3 = _core_io_ptw_pmp_cfg_r_3;
    assign ptw__io_dpath_pmp_cfg_r_4 = _core_io_ptw_pmp_cfg_r_4;
    assign ptw__io_dpath_pmp_cfg_r_5 = _core_io_ptw_pmp_cfg_r_5;
    assign ptw__io_dpath_pmp_cfg_r_6 = _core_io_ptw_pmp_cfg_r_6;
    assign ptw__io_dpath_pmp_cfg_r_7 = _core_io_ptw_pmp_cfg_r_7;
    assign ptw__io_dpath_pmp_addr_0 = _core_io_ptw_pmp_addr_0;
    assign ptw__io_dpath_pmp_addr_1 = _core_io_ptw_pmp_addr_1;
    assign ptw__io_dpath_pmp_addr_2 = _core_io_ptw_pmp_addr_2;
    assign ptw__io_dpath_pmp_addr_3 = _core_io_ptw_pmp_addr_3;
    assign ptw__io_dpath_pmp_addr_4 = _core_io_ptw_pmp_addr_4;
    assign ptw__io_dpath_pmp_addr_5 = _core_io_ptw_pmp_addr_5;
    assign ptw__io_dpath_pmp_addr_6 = _core_io_ptw_pmp_addr_6;
    assign ptw__io_dpath_pmp_addr_7 = _core_io_ptw_pmp_addr_7;
    assign ptw__io_dpath_pmp_mask_0 = _core_io_ptw_pmp_mask_0;
    assign ptw__io_dpath_pmp_mask_1 = _core_io_ptw_pmp_mask_1;
    assign ptw__io_dpath_pmp_mask_2 = _core_io_ptw_pmp_mask_2;
    assign ptw__io_dpath_pmp_mask_3 = _core_io_ptw_pmp_mask_3;
    assign ptw__io_dpath_pmp_mask_4 = _core_io_ptw_pmp_mask_4;
    assign ptw__io_dpath_pmp_mask_5 = _core_io_ptw_pmp_mask_5;
    assign ptw__io_dpath_pmp_mask_6 = _core_io_ptw_pmp_mask_6;
    assign ptw__io_dpath_pmp_mask_7 = _core_io_ptw_pmp_mask_7;
    assign ptw__io_dpath_customCSRs_csrs_0_value = _core_io_ptw_customCSRs_csrs_0_value;


    wire  core__clock;
    wire  core__reset;
    wire  core__io_hartid;
    wire  core__io_interrupts_debug;
    wire  core__io_interrupts_mtip;
    wire  core__io_interrupts_msip;
    wire  core__io_interrupts_meip;
    wire  core__io_imem_might_request;
    wire  core__io_imem_req_valid;
    wire [33:0] core__io_imem_req_bits_pc;
    wire  core__io_imem_req_bits_speculative;
    wire  core__io_imem_resp_ready;
    wire  core__io_imem_resp_valid;
    wire [33:0] core__io_imem_resp_bits_pc;
    wire [31:0] core__io_imem_resp_bits_data;
    wire  core__io_imem_resp_bits_xcpt_pf_inst;
    wire  core__io_imem_resp_bits_xcpt_gf_inst;
    wire  core__io_imem_resp_bits_xcpt_ae_inst;
    wire  core__io_imem_resp_bits_replay;
    wire  core__io_imem_btb_update_valid;
    wire  core__io_imem_bht_update_valid;
    wire  core__io_imem_flush_icache;
    wire  core__io_dmem_req_ready;
    wire  core__io_dmem_req_valid;
    wire [33:0] core__io_dmem_req_bits_addr;
    wire [5:0] core__io_dmem_req_bits_tag;
    wire [4:0] core__io_dmem_req_bits_cmd;
    wire [1:0] core__io_dmem_req_bits_size;
    wire  core__io_dmem_req_bits_signed;
    wire  core__io_dmem_req_bits_dv;
    wire  core__io_dmem_s1_kill;
    wire [63:0] core__io_dmem_s1_data_data;
    wire  core__io_dmem_s2_nack;
    wire  core__io_dmem_resp_valid;
    wire [5:0] core__io_dmem_resp_bits_tag;
    wire [63:0] core__io_dmem_resp_bits_data;
    wire  core__io_dmem_resp_bits_replay;
    wire  core__io_dmem_resp_bits_has_data;
    wire [63:0] core__io_dmem_resp_bits_data_word_bypass;
    wire  core__io_dmem_replay_next;
    wire  core__io_dmem_s2_xcpt_ma_ld;
    wire  core__io_dmem_s2_xcpt_ma_st;
    wire  core__io_dmem_s2_xcpt_pf_ld;
    wire  core__io_dmem_s2_xcpt_pf_st;
    wire  core__io_dmem_s2_xcpt_ae_ld;
    wire  core__io_dmem_s2_xcpt_ae_st;
    wire  core__io_dmem_ordered;
    wire  core__io_dmem_perf_release;
    wire  core__io_dmem_perf_grant;
    wire  core__io_ptw_status_debug;
    wire  core__io_ptw_pmp_cfg_l_0;
    wire  core__io_ptw_pmp_cfg_l_1;
    wire  core__io_ptw_pmp_cfg_l_2;
    wire  core__io_ptw_pmp_cfg_l_3;
    wire  core__io_ptw_pmp_cfg_l_4;
    wire  core__io_ptw_pmp_cfg_l_5;
    wire  core__io_ptw_pmp_cfg_l_6;
    wire  core__io_ptw_pmp_cfg_l_7;
    wire [1:0] core__io_ptw_pmp_cfg_a_0;
    wire [1:0] core__io_ptw_pmp_cfg_a_1;
    wire [1:0] core__io_ptw_pmp_cfg_a_2;
    wire [1:0] core__io_ptw_pmp_cfg_a_3;
    wire [1:0] core__io_ptw_pmp_cfg_a_4;
    wire [1:0] core__io_ptw_pmp_cfg_a_5;
    wire [1:0] core__io_ptw_pmp_cfg_a_6;
    wire [1:0] core__io_ptw_pmp_cfg_a_7;
    wire  core__io_ptw_pmp_cfg_x_0;
    wire  core__io_ptw_pmp_cfg_x_1;
    wire  core__io_ptw_pmp_cfg_x_2;
    wire  core__io_ptw_pmp_cfg_x_3;
    wire  core__io_ptw_pmp_cfg_x_4;
    wire  core__io_ptw_pmp_cfg_x_5;
    wire  core__io_ptw_pmp_cfg_x_6;
    wire  core__io_ptw_pmp_cfg_x_7;
    wire  core__io_ptw_pmp_cfg_w_0;
    wire  core__io_ptw_pmp_cfg_w_1;
    wire  core__io_ptw_pmp_cfg_w_2;
    wire  core__io_ptw_pmp_cfg_w_3;
    wire  core__io_ptw_pmp_cfg_w_4;
    wire  core__io_ptw_pmp_cfg_w_5;
    wire  core__io_ptw_pmp_cfg_w_6;
    wire  core__io_ptw_pmp_cfg_w_7;
    wire  core__io_ptw_pmp_cfg_r_0;
    wire  core__io_ptw_pmp_cfg_r_1;
    wire  core__io_ptw_pmp_cfg_r_2;
    wire  core__io_ptw_pmp_cfg_r_3;
    wire  core__io_ptw_pmp_cfg_r_4;
    wire  core__io_ptw_pmp_cfg_r_5;
    wire  core__io_ptw_pmp_cfg_r_6;
    wire  core__io_ptw_pmp_cfg_r_7;
    wire [29:0] core__io_ptw_pmp_addr_0;
    wire [29:0] core__io_ptw_pmp_addr_1;
    wire [29:0] core__io_ptw_pmp_addr_2;
    wire [29:0] core__io_ptw_pmp_addr_3;
    wire [29:0] core__io_ptw_pmp_addr_4;
    wire [29:0] core__io_ptw_pmp_addr_5;
    wire [29:0] core__io_ptw_pmp_addr_6;
    wire [29:0] core__io_ptw_pmp_addr_7;
    wire [31:0] core__io_ptw_pmp_mask_0;
    wire [31:0] core__io_ptw_pmp_mask_1;
    wire [31:0] core__io_ptw_pmp_mask_2;
    wire [31:0] core__io_ptw_pmp_mask_3;
    wire [31:0] core__io_ptw_pmp_mask_4;
    wire [31:0] core__io_ptw_pmp_mask_5;
    wire [31:0] core__io_ptw_pmp_mask_6;
    wire [31:0] core__io_ptw_pmp_mask_7;
    wire [63:0] core__io_ptw_customCSRs_csrs_0_value;
    wire  core__io_wfi;

    wire  core__io_dmem_req_valid_0  ;
    wire  core__div_io_resp_ready  ;
    wire  core__take_pc_wb  ;
    wire  core__take_pc_mem  ;
    wire  core___div_io_req_ready  ;
    wire  core___div_io_resp_valid  ;
    wire[63:0]  core___div_io_resp_bits_data  ;
    wire[4:0]  core___div_io_resp_bits_tag  ;
    wire[63:0]  core___alu_io_out  ;
    wire[63:0]  core___alu_io_adder_out  ;
    wire  core___alu_io_cmp_out  ;
    wire  core___bpu_io_xcpt_if  ;
    wire  core___bpu_io_xcpt_ld  ;
    wire  core___bpu_io_xcpt_st  ;
    wire  core___bpu_io_debug_if  ;
    wire  core___bpu_io_debug_ld  ;
    wire  core___bpu_io_debug_st  ;
    wire[63:0]  core___csr_io_rw_rdata  ;
    wire  core___csr_io_decode_0_read_illegal  ;
    wire  core___csr_io_decode_0_write_illegal  ;
    wire  core___csr_io_decode_0_write_flush  ;
    wire  core___csr_io_decode_0_system_illegal  ;
    wire  core___csr_io_decode_0_virtual_access_illegal  ;
    wire  core___csr_io_decode_0_virtual_system_illegal  ;
    wire  core___csr_io_csr_stall  ;
    wire  core___csr_io_eret  ;
    wire  core___csr_io_singleStep  ;
    wire  core___csr_io_status_debug  ;
    wire[31:0]  core___csr_io_status_isa  ;
    wire  core___csr_io_status_dv  ;
    wire  core___csr_io_status_v  ;
    wire[33:0]  core___csr_io_evec  ;
    wire[63:0]  core___csr_io_time  ;
    wire  core___csr_io_interrupt  ;
    wire[63:0]  core___csr_io_interrupt_cause  ;
    wire  core___csr_io_bp_0_control_action  ;
    wire[1:0]  core___csr_io_bp_0_control_tmatch  ;
    wire  core___csr_io_bp_0_control_x  ;
    wire  core___csr_io_bp_0_control_w  ;
    wire  core___csr_io_bp_0_control_r  ;
    wire[32:0]  core___csr_io_bp_0_address  ;
    wire  core___csr_io_inhibit_cycle  ;
    wire  core___csr_io_trace_valid_0  ;
    wire[33:0]  core___csr_io_trace_iaddr_0  ;
    wire[31:0]  core___csr_io_trace_insn_0  ;
    wire  core___csr_io_trace_exception_0  ;
    wire[63:0]  core___csr_io_customCSRs_0_value  ;
    wire[63:0]  core___rf_ext_R0_data  ;
    wire[63:0]  core___rf_ext_R1_data  ;
    wire[33:0]  core___ibuf_io_pc  ;
    wire  core___ibuf_io_inst_0_valid  ;
    wire  core___ibuf_io_inst_0_bits_xcpt0_pf_inst  ;
    wire  core___ibuf_io_inst_0_bits_xcpt0_gf_inst  ;
    wire  core___ibuf_io_inst_0_bits_xcpt0_ae_inst  ;
    wire  core___ibuf_io_inst_0_bits_xcpt1_pf_inst  ;
    wire  core___ibuf_io_inst_0_bits_xcpt1_gf_inst  ;
    wire  core___ibuf_io_inst_0_bits_xcpt1_ae_inst  ;
    wire  core___ibuf_io_inst_0_bits_replay  ;
    wire  core___ibuf_io_inst_0_bits_rvc  ;
    wire[31:0]  core___ibuf_io_inst_0_bits_inst_bits  ;
    wire[4:0]  core___ibuf_io_inst_0_bits_inst_rd  ;
    wire[4:0]  core___ibuf_io_inst_0_bits_inst_rs1  ;
    wire[4:0]  core___ibuf_io_inst_0_bits_inst_rs2  ;
    wire[31:0]  core___ibuf_io_inst_0_bits_raw  ;
    reg  core__id_reg_pause  ;
    reg  core__imem_might_request_reg  ;
    reg  core__ex_ctrl_fp  ;
    reg  core__ex_ctrl_rocc  ;
    reg  core__ex_ctrl_branch  ;
    reg  core__ex_ctrl_jal  ;
    reg  core__ex_ctrl_jalr  ;
    reg  core__ex_ctrl_rxs2  ;
    reg  core__ex_ctrl_rxs1  ;
    reg[1:0]  core__ex_ctrl_sel_alu2  ;
    reg[1:0]  core__ex_ctrl_sel_alu1  ;
    reg[2:0]  core__ex_ctrl_sel_imm  ;
    reg  core__ex_ctrl_alu_dw  ;
    reg[3:0]  core__ex_ctrl_alu_fn  ;
    reg  core__ex_ctrl_mem  ;
    reg[4:0]  core__ex_ctrl_mem_cmd  ;
    reg  core__ex_ctrl_rfs1  ;
    reg  core__ex_ctrl_rfs2  ;
    reg  core__ex_ctrl_wfd  ;
    reg  core__ex_ctrl_mul  ;
    reg  core__ex_ctrl_div  ;
    reg  core__ex_ctrl_wxd  ;
    reg[2:0]  core__ex_ctrl_csr  ;
    reg  core__ex_ctrl_fence_i  ;
    reg  core__mem_ctrl_fp  ;
    reg  core__mem_ctrl_rocc  ;
    reg  core__mem_ctrl_branch  ;
    reg  core__mem_ctrl_jal  ;
    reg  core__mem_ctrl_jalr  ;
    reg  core__mem_ctrl_rxs2  ;
    reg  core__mem_ctrl_rxs1  ;
    reg  core__mem_ctrl_mem  ;
    reg  core__mem_ctrl_rfs1  ;
    reg  core__mem_ctrl_rfs2  ;
    reg  core__mem_ctrl_wfd  ;
    reg  core__mem_ctrl_mul  ;
    reg  core__mem_ctrl_div  ;
    reg  core__mem_ctrl_wxd  ;
    reg[2:0]  core__mem_ctrl_csr  ;
    reg  core__mem_ctrl_fence_i  ;
    reg  core__wb_ctrl_rocc  ;
    reg  core__wb_ctrl_rxs2  ;
    reg  core__wb_ctrl_rxs1  ;
    reg  core__wb_ctrl_mem  ;
    reg  core__wb_ctrl_rfs1  ;
    reg  core__wb_ctrl_rfs2  ;
    reg  core__wb_ctrl_wfd  ;
    reg  core__wb_ctrl_div  ;
    reg  core__wb_ctrl_wxd  ;
    reg[2:0]  core__wb_ctrl_csr  ;
    reg  core__wb_ctrl_fence_i  ;
    reg  core__ex_reg_xcpt_interrupt  ;
    reg  core__ex_reg_valid  ;
    reg  core__ex_reg_rvc  ;
    reg  core__ex_reg_xcpt  ;
    reg  core__ex_reg_flush_pipe  ;
    reg  core__ex_reg_load_use  ;
    reg[63:0]  core__ex_reg_cause  ;
    reg  core__ex_reg_replay  ;
    reg[33:0]  core__ex_reg_pc  ;
    reg[1:0]  core__ex_reg_mem_size  ;
    reg[31:0]  core__ex_reg_inst  ;
    reg[31:0]  core__ex_reg_raw_inst  ;
    reg  core__mem_reg_xcpt_interrupt  ;
    reg  core__mem_reg_valid  ;
    reg  core__mem_reg_rvc  ;
    reg  core__mem_reg_xcpt  ;
    reg  core__mem_reg_replay  ;
    reg  core__mem_reg_flush_pipe  ;
    reg[63:0]  core__mem_reg_cause  ;
    reg  core__mem_mem_cmd_bh  ;
    reg  core__mem_reg_load  ;
    reg  core__mem_reg_store  ;
    reg[33:0]  core__mem_reg_pc  ;
    reg[31:0]  core__mem_reg_inst  ;
    reg  core__mem_reg_hls_or_dv  ;
    reg[31:0]  core__mem_reg_raw_inst  ;
    reg[63:0]  core__mem_reg_wdata  ;
    reg[63:0]  core__mem_reg_rs2  ;
    reg  core__mem_br_taken  ;
    reg  core__wb_reg_valid  ;
    reg  core__wb_reg_xcpt  ;
    reg  core__wb_reg_replay  ;
    reg  core__wb_reg_flush_pipe  ;
    reg[63:0]  core__wb_reg_cause  ;
    reg[33:0]  core__wb_reg_pc  ;
    reg  core__wb_reg_hls_or_dv  ;
    reg[31:0]  core__wb_reg_inst  ;
    reg[31:0]  core__wb_reg_raw_inst  ;
    reg[63:0]  core__wb_reg_wdata  ;
    wire  core__ibuf_io_kill  =  core__take_pc_wb  |  core__take_pc_mem  ;
    wire[29:0]  core__id_ctrl_decoder_decoded_invInputs  =~(  core___ibuf_io_inst_0_bits_inst_bits  [31:2]);
    wire[6:0]  core___id_ctrl_decoder_decoded_T  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core__id_ctrl_decoder_decoded_invInputs  [3],  core__id_ctrl_decoder_decoded_invInputs  [4],  core__id_ctrl_decoder_decoded_invInputs  [10]};
    wire[7:0]  core___id_ctrl_decoder_decoded_T_4  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core__id_ctrl_decoder_decoded_invInputs  [2],  core__id_ctrl_decoder_decoded_invInputs  [3],  core__id_ctrl_decoder_decoded_invInputs  [4],  core__id_ctrl_decoder_decoded_invInputs  [11]};
    wire[6:0]  core___id_ctrl_decoder_decoded_T_6  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core__id_ctrl_decoder_decoded_invInputs  [2],  core__id_ctrl_decoder_decoded_invInputs  [4],  core__id_ctrl_decoder_decoded_invInputs  [12]};
    wire[7:0]  core___id_ctrl_decoder_decoded_T_8  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core__id_ctrl_decoder_decoded_invInputs  [2],  core__id_ctrl_decoder_decoded_invInputs  [3],  core__id_ctrl_decoder_decoded_invInputs  [4],  core__id_ctrl_decoder_decoded_invInputs  [12]};
    wire[8:0]  core___id_ctrl_decoder_decoded_T_12  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core__id_ctrl_decoder_decoded_invInputs  [3],  core__id_ctrl_decoder_decoded_invInputs  [4],  core__id_ctrl_decoder_decoded_invInputs  [10],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [12]};
    wire[5:0]  core___id_ctrl_decoder_decoded_T_14  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core___ibuf_io_inst_0_bits_inst_bits  [2],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core__id_ctrl_decoder_decoded_invInputs  [4]};
    wire[7:0]  core___id_ctrl_decoder_decoded_T_18  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core__id_ctrl_decoder_decoded_invInputs  [2],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core__id_ctrl_decoder_decoded_invInputs  [12]};
    wire[14:0]  core___id_ctrl_decoder_decoded_T_22  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core__id_ctrl_decoder_decoded_invInputs  [10],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [12],  core__id_ctrl_decoder_decoded_invInputs  [23],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [29]};
    wire[12:0]  core___id_ctrl_decoder_decoded_T_26  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]};
    wire[14:0]  core___id_ctrl_decoder_decoded_T_28  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core__id_ctrl_decoder_decoded_invInputs  [10],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [12],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]};
    wire[8:0]  core___id_ctrl_decoder_decoded_T_36  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [1],  core__id_ctrl_decoder_decoded_invInputs  [2],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core__id_ctrl_decoder_decoded_invInputs  [10],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [12]};
    wire[9:0]  core___id_ctrl_decoder_decoded_T_38  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core___ibuf_io_inst_0_bits_inst_bits  [2],  core__id_ctrl_decoder_decoded_invInputs  [1],  core__id_ctrl_decoder_decoded_invInputs  [2],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core__id_ctrl_decoder_decoded_invInputs  [10],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [12]};
    wire[6:0]  core___id_ctrl_decoder_decoded_T_40  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core___ibuf_io_inst_0_bits_inst_bits  [2],  core___ibuf_io_inst_0_bits_inst_bits  [3],  core__id_ctrl_decoder_decoded_invInputs  [2],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6]};
    wire[9:0]  core___id_ctrl_decoder_decoded_T_46  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core___ibuf_io_inst_0_bits_inst_bits  [2],  core___ibuf_io_inst_0_bits_inst_bits  [3],  core__id_ctrl_decoder_decoded_invInputs  [2],  core__id_ctrl_decoder_decoded_invInputs  [3],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [12]};
    wire[13:0]  core___id_ctrl_decoder_decoded_T_48  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]};
    wire[14:0]  core___id_ctrl_decoder_decoded_T_52  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core___ibuf_io_inst_0_bits_inst_bits  [3],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [23],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]};
    wire[8:0]  core___id_ctrl_decoder_decoded_T_60  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [12]};
    wire[7:0]  core___id_ctrl_decoder_decoded_T_62  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core___ibuf_io_inst_0_bits_inst_bits  [12]};
    wire[7:0]  core___id_ctrl_decoder_decoded_T_64  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core__id_ctrl_decoder_decoded_invInputs  [3],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [13]};
    wire[10:0]  core___id_ctrl_decoder_decoded_T_68  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core___ibuf_io_inst_0_bits_inst_bits  [2],  core___ibuf_io_inst_0_bits_inst_bits  [3],  core__id_ctrl_decoder_decoded_invInputs  [2],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [13],  core__id_ctrl_decoder_decoded_invInputs  [12],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26]};
    wire[7:0]  core___id_ctrl_decoder_decoded_T_74  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core___ibuf_io_inst_0_bits_inst_bits  [13]};
    wire[8:0]  core___id_ctrl_decoder_decoded_T_76  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core___ibuf_io_inst_0_bits_inst_bits  [13],  core__id_ctrl_decoder_decoded_invInputs  [12]};
    wire[7:0]  core___id_ctrl_decoder_decoded_T_86  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core__id_ctrl_decoder_decoded_invInputs  [2],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core___ibuf_io_inst_0_bits_inst_bits  [14]};
    wire[14:0]  core___id_ctrl_decoder_decoded_T_88  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core__id_ctrl_decoder_decoded_invInputs  [3],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core__id_ctrl_decoder_decoded_invInputs  [11],  core___ibuf_io_inst_0_bits_inst_bits  [14],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [29]};
    wire[14:0]  core___id_ctrl_decoder_decoded_T_92  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core___ibuf_io_inst_0_bits_inst_bits  [3],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core__id_ctrl_decoder_decoded_invInputs  [11],  core___ibuf_io_inst_0_bits_inst_bits  [14],  core__id_ctrl_decoder_decoded_invInputs  [23],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [29]};
    wire[14:0]  core___id_ctrl_decoder_decoded_T_98  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core__id_ctrl_decoder_decoded_invInputs  [11],  core___ibuf_io_inst_0_bits_inst_bits  [14],  core__id_ctrl_decoder_decoded_invInputs  [23],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [29]};
    wire[13:0]  core___id_ctrl_decoder_decoded_T_130  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [14],  core___ibuf_io_inst_0_bits_inst_bits  [25],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]};
    wire[12:0]  core___id_ctrl_decoder_decoded_T_136  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core___ibuf_io_inst_0_bits_inst_bits  [2],  core___ibuf_io_inst_0_bits_inst_bits  [3],  core__id_ctrl_decoder_decoded_invInputs  [2],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [13],  core__id_ctrl_decoder_decoded_invInputs  [12],  core___ibuf_io_inst_0_bits_inst_bits  [27],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]};
    wire[16:0]  core___id_ctrl_decoder_decoded_T_138  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core___ibuf_io_inst_0_bits_inst_bits  [2],  core___ibuf_io_inst_0_bits_inst_bits  [3],  core__id_ctrl_decoder_decoded_invInputs  [2],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core__id_ctrl_decoder_decoded_invInputs  [18],  core__id_ctrl_decoder_decoded_invInputs  [19],  core__id_ctrl_decoder_decoded_invInputs  [20],  core__id_ctrl_decoder_decoded_invInputs  [21],  core__id_ctrl_decoder_decoded_invInputs  [22],  core__id_ctrl_decoder_decoded_invInputs  [25],  core___ibuf_io_inst_0_bits_inst_bits  [28],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]};
    wire[18:0]  core___id_ctrl_decoder_decoded_T_140  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core___ibuf_io_inst_0_bits_inst_bits  [2],  core___ibuf_io_inst_0_bits_inst_bits  [3],  core__id_ctrl_decoder_decoded_invInputs  [2],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [13],  core__id_ctrl_decoder_decoded_invInputs  [12],  core__id_ctrl_decoder_decoded_invInputs  [18],  core__id_ctrl_decoder_decoded_invInputs  [19],  core__id_ctrl_decoder_decoded_invInputs  [20],  core__id_ctrl_decoder_decoded_invInputs  [21],  core__id_ctrl_decoder_decoded_invInputs  [22],  core__id_ctrl_decoder_decoded_invInputs  [25],  core___ibuf_io_inst_0_bits_inst_bits  [28],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]};
    wire[2:0]  core___id_ctrl_decoder_decoded_orMatrixOutputs_T  ={&  core___id_ctrl_decoder_decoded_T_68  ,&  core___id_ctrl_decoder_decoded_T_136  ,&  core___id_ctrl_decoder_decoded_T_138  };
    wire[21:0]  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_8  ={&  core___id_ctrl_decoder_decoded_T  ,&  core___id_ctrl_decoder_decoded_T_4  ,&  core___id_ctrl_decoder_decoded_T_8  ,&  core___id_ctrl_decoder_decoded_T_12  ,&  core___id_ctrl_decoder_decoded_T_14  ,&  core___id_ctrl_decoder_decoded_T_22  ,&  core___id_ctrl_decoder_decoded_T_26  ,&  core___id_ctrl_decoder_decoded_T_28  ,&  core___id_ctrl_decoder_decoded_T_38  ,&  core___id_ctrl_decoder_decoded_T_40  ,&  core___id_ctrl_decoder_decoded_T_48  ,&  core___id_ctrl_decoder_decoded_T_52  ,&  core___id_ctrl_decoder_decoded_T_62  ,&  core___id_ctrl_decoder_decoded_T_64  ,&  core___id_ctrl_decoder_decoded_T_68  ,&  core___id_ctrl_decoder_decoded_T_74  ,&  core___id_ctrl_decoder_decoded_T_88  ,&  core___id_ctrl_decoder_decoded_T_92  ,&  core___id_ctrl_decoder_decoded_T_98  ,&  core___id_ctrl_decoder_decoded_T_130  ,&  core___id_ctrl_decoder_decoded_T_136  ,&  core___id_ctrl_decoder_decoded_T_138  };
    wire[2:0]  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_10  ={&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [25],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]},&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core__id_ctrl_decoder_decoded_invInputs  [10],  core__id_ctrl_decoder_decoded_invInputs  [11],  core___ibuf_io_inst_0_bits_inst_bits  [25],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]},&  core___id_ctrl_decoder_decoded_T_130  };
    wire[5:0]  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_19  ={&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core__id_ctrl_decoder_decoded_invInputs  [2],  core__id_ctrl_decoder_decoded_invInputs  [3],  core__id_ctrl_decoder_decoded_invInputs  [4],  core__id_ctrl_decoder_decoded_invInputs  [10]},&  core___id_ctrl_decoder_decoded_T_4  ,&  core___id_ctrl_decoder_decoded_T_6  ,&  core___id_ctrl_decoder_decoded_T_68  ,&  core___id_ctrl_decoder_decoded_T_136  ,&  core___id_ctrl_decoder_decoded_T_140  };
    wire[20:0]  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_45  ={&  core___id_ctrl_decoder_decoded_T  ,&  core___id_ctrl_decoder_decoded_T_4  ,&  core___id_ctrl_decoder_decoded_T_6  ,&  core___id_ctrl_decoder_decoded_T_12  ,&  core___id_ctrl_decoder_decoded_T_22  ,&  core___id_ctrl_decoder_decoded_T_26  ,&  core___id_ctrl_decoder_decoded_T_28  ,&  core___id_ctrl_decoder_decoded_T_36  ,&  core___id_ctrl_decoder_decoded_T_48  ,&  core___id_ctrl_decoder_decoded_T_52  ,&  core___id_ctrl_decoder_decoded_T_60  ,&  core___id_ctrl_decoder_decoded_T_64  ,&  core___id_ctrl_decoder_decoded_T_68  ,&  core___id_ctrl_decoder_decoded_T_76  ,&  core___id_ctrl_decoder_decoded_T_86  ,&  core___id_ctrl_decoder_decoded_T_88  ,&  core___id_ctrl_decoder_decoded_T_92  ,&  core___id_ctrl_decoder_decoded_T_98  ,&  core___id_ctrl_decoder_decoded_T_130  ,&  core___id_ctrl_decoder_decoded_T_136  ,&  core___id_ctrl_decoder_decoded_T_138  };
    wire[11:0]  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_47  ={&  core___id_ctrl_decoder_decoded_T_18  ,&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core__id_ctrl_decoder_decoded_invInputs  [2],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [12]},&  core___id_ctrl_decoder_decoded_T_22  ,&  core___id_ctrl_decoder_decoded_T_26  ,&  core___id_ctrl_decoder_decoded_T_28  ,&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [12],  core__id_ctrl_decoder_decoded_invInputs  [23],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]},&  core___id_ctrl_decoder_decoded_T_68  ,&  core___id_ctrl_decoder_decoded_T_86  ,&  core___id_ctrl_decoder_decoded_T_98  ,&  core___id_ctrl_decoder_decoded_T_130  ,&  core___id_ctrl_decoder_decoded_T_136  ,&  core___id_ctrl_decoder_decoded_T_138  };
    reg  core__id_reg_fence  ;
    wire  core__id_mem_busy  =~  core__io_dmem_ordered  |  core__io_dmem_req_valid_0  ;
    wire  core___io_rocc_cmd_valid_T  =  core__wb_reg_valid  &  core__wb_ctrl_rocc  ;
    wire  core___dcache_kill_mem_T  =  core__mem_reg_valid  &  core__mem_ctrl_wxd  ;
    wire  core___fp_data_hazard_ex_T_1  =  core__ex_reg_inst  [11:7]==  core___ibuf_io_inst_0_bits_inst_rs1  ;
    wire  core___fp_data_hazard_mem_T_1  =  core__mem_reg_inst  [11:7]==  core___ibuf_io_inst_0_bits_inst_rs1  ;
    wire  core___fp_data_hazard_ex_T_3  =  core__ex_reg_inst  [11:7]==  core___ibuf_io_inst_0_bits_inst_rs2  ;
    wire  core___fp_data_hazard_mem_T_3  =  core__mem_reg_inst  [11:7]==  core___ibuf_io_inst_0_bits_inst_rs2  ;
    reg  core__ex_reg_rs_bypass_0  ;
    reg  core__ex_reg_rs_bypass_1  ;
    reg[1:0]  core__ex_reg_rs_lsb_0  ;
    reg[1:0]  core__ex_reg_rs_lsb_1  ;
    reg[61:0]  core__ex_reg_rs_msb_0  ;
    reg[61:0]  core__ex_reg_rs_msb_1  ;
    reg[63:0]  core__casez_tmp  ;
    always @(*)
    begin
        casez (  core__ex_reg_rs_lsb_0  )
            2 'b00:
                core__casez_tmp   =64'h0;
            2 'b01:
                core__casez_tmp   =  core__mem_reg_wdata  ;
            2 'b10:
                core__casez_tmp   =  core__wb_reg_wdata  ;
            default :
                core__casez_tmp   =  core__io_dmem_resp_bits_data_word_bypass  ;
        endcase
    end

    wire[63:0]  core__ex_rs_0  =  core__ex_reg_rs_bypass_0   ?   core__casez_tmp  :{  core__ex_reg_rs_msb_0  ,  core__ex_reg_rs_lsb_0  };
    reg[63:0]  core__casez_tmp_0  ;
    always @(*)
    begin
        casez (  core__ex_reg_rs_lsb_1  )
            2 'b00:
                core__casez_tmp_0   =64'h0;
            2 'b01:
                core__casez_tmp_0   =  core__mem_reg_wdata  ;
            2 'b10:
                core__casez_tmp_0   =  core__wb_reg_wdata  ;
            default :
                core__casez_tmp_0   =  core__io_dmem_resp_bits_data_word_bypass  ;
        endcase
    end

    wire[63:0]  core__ex_rs_1  =  core__ex_reg_rs_bypass_1   ?   core__casez_tmp_0  :{  core__ex_reg_rs_msb_1  ,  core__ex_reg_rs_lsb_1  };
    reg[63:0]  core__casez_tmp_1  ;
    wire[3:0]  core___ex_op2_T_1  =  core__ex_reg_rvc   ? 4'h2:4'h4;
    wire  core___ex_imm_b0_T_4  =  core__ex_ctrl_sel_imm  ==3'h5;
    wire  core__ex_imm_sign  =~  core___ex_imm_b0_T_4  &  core__ex_reg_inst  [31];
    wire  core___ex_imm_b4_1_T  =  core__ex_ctrl_sel_imm  ==3'h2;
    wire  core___ex_imm_b4_1_T_2  =  core__ex_ctrl_sel_imm  ==3'h1;
    wire  core___ex_imm_b0_T  =  core__ex_ctrl_sel_imm  ==3'h0;
    always @(*)
    begin
        casez (  core__ex_ctrl_sel_alu2  )
            2 'b00:
                core__casez_tmp_1   =64'h0;
            2 'b01:
                core__casez_tmp_1   ={{60{  core___ex_op2_T_1  [3]}},  core___ex_op2_T_1  };
            2 'b10:
                core__casez_tmp_1   =  core__ex_rs_1  ;
            default :
                core__casez_tmp_1   ={{33{  core__ex_imm_sign  }},  core___ex_imm_b4_1_T   ?   core__ex_reg_inst  [30:20]:{11{  core__ex_imm_sign  }},  core__ex_ctrl_sel_imm  !=3'h2&  core__ex_ctrl_sel_imm  !=3'h3 ? {8{  core__ex_imm_sign  }}:  core__ex_reg_inst  [19:12],~(  core___ex_imm_b4_1_T  |  core___ex_imm_b0_T_4  )&(  core__ex_ctrl_sel_imm  ==3'h3 ?   core__ex_reg_inst  [20]:  core___ex_imm_b4_1_T_2   ?   core__ex_reg_inst  [7]:  core__ex_imm_sign  ),  core___ex_imm_b4_1_T  |  core___ex_imm_b0_T_4   ? 6'h0:  core__ex_reg_inst  [30:25],  core___ex_imm_b4_1_T   ? 4'h0:  core___ex_imm_b0_T  |  core___ex_imm_b4_1_T_2   ?   core__ex_reg_inst  [11:8]:  core___ex_imm_b0_T_4   ?   core__ex_reg_inst  [19:16]:  core__ex_reg_inst  [24:21],  core___ex_imm_b0_T   ?   core__ex_reg_inst  [7]:  core__ex_ctrl_sel_imm  ==3'h4 ?   core__ex_reg_inst  [20]:  core___ex_imm_b0_T_4  &  core__ex_reg_inst  [15]};
        endcase
    end

    wire  core__div_io_req_valid  =  core__ex_reg_valid  &  core__ex_ctrl_div  ;
    wire  core__ex_pc_valid  =  core__ex_reg_valid  |  core__ex_reg_replay  |  core__ex_reg_xcpt_interrupt  ;
    wire  core__wb_dcache_miss  =  core__wb_ctrl_mem  &~  core__io_dmem_resp_valid  ;
    wire  core___mem_cfi_taken_T  =  core__mem_ctrl_branch  &  core__mem_br_taken  ;
    wire[3:0]  core___mem_br_target_T_6  =  core__mem_reg_rvc   ? 4'h2:4'h4;
    wire[31:0]  core___mem_br_target_T_8  =  core___mem_cfi_taken_T   ? {{20{  core__mem_reg_inst  [31]}},  core__mem_reg_inst  [7],  core__mem_reg_inst  [30:25],  core__mem_reg_inst  [11:8],1'h0}:  core__mem_ctrl_jal   ? {{12{  core__mem_reg_inst  [31]}},  core__mem_reg_inst  [19:12],  core__mem_reg_inst  [20],  core__mem_reg_inst  [30:21],1'h0}:{{28{  core___mem_br_target_T_6  [3]}},  core___mem_br_target_T_6  };
    wire[33:0]  core___mem_br_target_T_9  =  core__mem_reg_pc  +{{2{  core___mem_br_target_T_8  [31]}},  core___mem_br_target_T_8  };
    wire[33:0]  core___mem_npc_T_4  =  core__mem_ctrl_jalr   ? {  core__mem_reg_wdata  [63:33]==31'h0|(&(  core__mem_reg_wdata  [63:33])) ?   core__mem_reg_wdata  [33]:~(  core__mem_reg_wdata  [32]),  core__mem_reg_wdata  [32:0]}:  core___mem_br_target_T_9  ;
    wire[33:0]  core__mem_npc  =  core___mem_npc_T_4  &34'h3FFFFFFFE;
    wire  core__mem_cfi_taken  =  core___mem_cfi_taken_T  |  core__mem_ctrl_jalr  |  core__mem_ctrl_jal  ;
    assign   core__take_pc_mem  =  core__mem_reg_valid  &~  core__mem_reg_xcpt  &  core__mem_cfi_taken  ;
    reg[63:0]  core__casez_tmp_2  ;
    always @(*)
    begin
        casez (  core__ex_ctrl_rocc   ? 2'h3:  core__ex_reg_mem_size  )
            2 'b00:
                core__casez_tmp_2   ={2{{2{{2{  core__ex_rs_1  [7:0]}}}}}};
            2 'b01:
                core__casez_tmp_2   ={2{{2{  core__ex_rs_1  [15:0]}}}};
            2 'b10:
                core__casez_tmp_2   ={2{  core__ex_rs_1  [31:0]}};
            default :
                core__casez_tmp_2   =  core__ex_rs_1  ;
        endcase
    end

    wire  core__mem_debug_breakpoint  =  core__mem_reg_load  &  core___bpu_io_debug_ld  |  core__mem_reg_store  &  core___bpu_io_debug_st  ;
    wire  core__mem_ldst_xcpt  =  core__mem_debug_breakpoint  |  core__mem_reg_load  &  core___bpu_io_xcpt_ld  |  core__mem_reg_store  &  core___bpu_io_xcpt_st  ;
    wire  core__dcache_kill_mem  =  core___dcache_kill_mem_T  &  core__io_dmem_replay_next  ;
    wire  core__killm_common  =  core__dcache_kill_mem  |  core__take_pc_wb  |  core__mem_reg_xcpt  |~  core__mem_reg_valid  ;
    reg  core__div_io_kill_REG  ;
    wire  core___GEN  =  core__wb_reg_valid  &  core__wb_ctrl_mem  ;
    wire  core___GEN_0  =  core___GEN  &  core__io_dmem_s2_xcpt_pf_st  ;
    wire  core___GEN_1  =  core___GEN  &  core__io_dmem_s2_xcpt_pf_ld  ;
    wire  core___GEN_2  =  core___GEN  &  core__io_dmem_s2_xcpt_ae_st  ;
    wire  core___GEN_3  =  core___GEN  &  core__io_dmem_s2_xcpt_ae_ld  ;
    wire  core___GEN_4  =  core___GEN  &  core__io_dmem_s2_xcpt_ma_st  ;
    wire  core__wb_xcpt  =  core__wb_reg_xcpt  |  core___GEN_0  |  core___GEN_1  |  core___GEN_2  |  core___GEN_3  |  core___GEN_4  |  core___GEN  &  core__io_dmem_s2_xcpt_ma_ld  ;
    wire  core__wb_wxd  =  core__wb_reg_valid  &  core__wb_ctrl_wxd  ;
    wire  core__wb_set_sboard  =  core__wb_ctrl_div  |  core__wb_dcache_miss  |  core__wb_ctrl_rocc  ;
    wire  core__replay_wb_common  =  core__io_dmem_s2_nack  |  core__wb_reg_replay  ;
    wire  core___replay_wb_T  =  core__replay_wb_common  |  core___io_rocc_cmd_valid_T  ;
    assign   core__take_pc_wb  =  core___replay_wb_T  |  core__wb_xcpt  |  core___csr_io_eret  |  core__wb_reg_flush_pipe  ;
    wire  core__dmem_resp_valid  =  core__io_dmem_resp_valid  &  core__io_dmem_resp_bits_has_data  ;
    wire  core___GEN_5  =  core__dmem_resp_valid  &  core__io_dmem_resp_bits_replay  &~(  core__io_dmem_resp_bits_tag  [0]);
    assign   core__div_io_resp_ready  =~  core___GEN_5  &~  core__wb_wxd  ;
    wire[4:0]  core__ll_waddr  =  core___GEN_5   ?   core__io_dmem_resp_bits_tag  [5:1]:  core___div_io_resp_bits_tag  ;
    wire  core__ll_wen  =  core___GEN_5  |  core__div_io_resp_ready  &  core___div_io_resp_valid  ;
    wire  core__wb_valid  =  core__wb_reg_valid  &~  core___replay_wb_T  &~  core__wb_xcpt  ;
    wire  core__wb_wen  =  core__wb_valid  &  core__wb_ctrl_wxd  ;
    wire  core__rf_wen  =  core__wb_wen  |  core__ll_wen  ;
    wire[4:0]  core__rf_waddr  =  core__ll_wen   ?   core__ll_waddr  :  core__wb_reg_inst  [11:7];
    wire[63:0]  core__rf_wdata  =  core__dmem_resp_valid  &~(  core__io_dmem_resp_bits_tag  [0]) ?   core__io_dmem_resp_bits_data  :  core__ll_wen   ?   core___div_io_resp_bits_data  :(|  core__wb_ctrl_csr  ) ?   core___csr_io_rw_rdata  :  core__wb_reg_wdata  ;
    wire[63:0]  core__id_rs_0  =  core__rf_wen  &(|  core__rf_waddr  )&  core__rf_waddr  ==  core___ibuf_io_inst_0_bits_inst_rs1   ?   core__rf_wdata  :  core___rf_ext_R1_data  ;
    wire[63:0]  core__id_rs_1  =  core__rf_wen  &(|  core__rf_waddr  )&  core__rf_waddr  ==  core___ibuf_io_inst_0_bits_inst_rs2   ?   core__rf_wdata  :  core___rf_ext_R0_data  ;
    wire  core___csr_io_htval_htval_valid_imem_T  =  core__wb_reg_cause  ==64'h14;
    wire  core__tval_any_addr  =~  core__wb_reg_xcpt  |  core__wb_reg_cause  ==64'h3|  core__wb_reg_cause  ==64'h1|  core__wb_reg_cause  ==64'hC|  core___csr_io_htval_htval_valid_imem_T  ;
    wire  core___GEN_6  =(|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_45  )&(|  core___ibuf_io_inst_0_bits_inst_rs1  );
    wire  core___GEN_7  =(|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_47  )&(|  core___ibuf_io_inst_0_bits_inst_rs2  );
    wire  core___GEN_8  =(|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_8  )&(|  core___ibuf_io_inst_0_bits_inst_rd  );
    reg[31:0]  core___r  ;
    wire[31:0]  core__r  ={  core___r  [31:1],1'h0};
    wire[31:0]  core___id_sboard_hazard_T  =  core__r  >>  core___ibuf_io_inst_0_bits_inst_rs1  ;
    wire[31:0]  core___id_sboard_hazard_T_7  =  core__r  >>  core___ibuf_io_inst_0_bits_inst_rs2  ;
    wire[31:0]  core___id_sboard_hazard_T_14  =  core__r  >>  core___ibuf_io_inst_0_bits_inst_rd  ;
    wire  core__data_hazard_mem  =  core__mem_ctrl_wxd  &(  core___GEN_6  &  core___fp_data_hazard_mem_T_1  |  core___GEN_7  &  core___fp_data_hazard_mem_T_3  |  core___GEN_8  &  core___ibuf_io_inst_0_bits_inst_rd  ==  core__mem_reg_inst  [11:7]);
    reg  core__dcache_blocked_blocked  ;
    reg  core__rocc_blocked  ;
    wire  core___ctrl_stalld_T_28  =  core__ex_reg_valid  &  core__ex_ctrl_wxd  &(  core___GEN_6  &  core___fp_data_hazard_ex_T_1  |  core___GEN_7  &  core___fp_data_hazard_ex_T_3  |  core___GEN_8  &  core___ibuf_io_inst_0_bits_inst_rd  ==  core__ex_reg_inst  [11:7])&((|  core__ex_ctrl_csr  )|  core__ex_ctrl_jalr  |  core__ex_ctrl_mem  |  core__ex_ctrl_mul  |  core__ex_ctrl_div  |  core__ex_ctrl_fp  |  core__ex_ctrl_rocc  )|  core__mem_reg_valid  &  core__data_hazard_mem  &((|  core__mem_ctrl_csr  )|  core__mem_ctrl_mem  &  core__mem_mem_cmd_bh  |  core__mem_ctrl_mul  |  core__mem_ctrl_div  |  core__mem_ctrl_fp  |  core__mem_ctrl_rocc  )|  core__wb_reg_valid  &  core__wb_ctrl_wxd  &(  core___GEN_6  &  core___ibuf_io_inst_0_bits_inst_rs1  ==  core__wb_reg_inst  [11:7]|  core___GEN_7  &  core___ibuf_io_inst_0_bits_inst_rs2  ==  core__wb_reg_inst  [11:7]|  core___GEN_8  &  core___ibuf_io_inst_0_bits_inst_rd  ==  core__wb_reg_inst  [11:7])&  core__wb_set_sboard  |  core___GEN_6  &  core___id_sboard_hazard_T  [0]&~(  core__ll_wen  &  core__ll_waddr  ==  core___ibuf_io_inst_0_bits_inst_rs1  )|  core___GEN_7  &  core___id_sboard_hazard_T_7  [0]&~(  core__ll_wen  &  core__ll_waddr  ==  core___ibuf_io_inst_0_bits_inst_rs2  )|  core___GEN_8  &  core___id_sboard_hazard_T_14  [0]&~(  core__ll_wen  &  core__ll_waddr  ==  core___ibuf_io_inst_0_bits_inst_rd  )|  core___csr_io_singleStep  &(  core__ex_reg_valid  |  core__mem_reg_valid  |  core__wb_reg_valid  )|(|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_19  )&  core__dcache_blocked_blocked  &~  core__io_dmem_perf_grant  |(|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_10  )&(~(  core___div_io_req_ready  |  core___div_io_resp_valid  &~  core__wb_wxd  )|  core__div_io_req_valid  )|  core__id_mem_busy  &((|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T  )&  core___ibuf_io_inst_0_bits_inst_bits  [25]|(&  core___id_ctrl_decoder_decoded_T_46  )|  core__id_reg_fence  &(|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_19  ))|  core___csr_io_csr_stall  |  core__id_reg_pause  ;
    wire  core__ctrl_killd  =~  core___ibuf_io_inst_0_valid  |  core___ibuf_io_inst_0_bits_replay  |  core__ibuf_io_kill  |  core___ctrl_stalld_T_28  |  core___csr_io_interrupt  ;
    assign   core__io_dmem_req_valid_0  =  core__ex_reg_valid  &  core__ex_ctrl_mem  ;
    reg[63:0]  core__coreMonitorBundle_rd0val_REG  ;
    reg[63:0]  core__coreMonitorBundle_rd0val_REG_1  ;
    reg[63:0]  core__coreMonitorBundle_rd1val_REG  ;
    reg[63:0]  core__coreMonitorBundle_rd1val_REG_1  ;
    wire  core__coreMonitorBundle_wrenx  =  core__wb_wen  &~  core__wb_set_sboard  ;
    wire  core___GEN_9  =  core__wb_ctrl_rxs1  |  core__wb_ctrl_rfs1  ;
    wire  core___GEN_10  =  core__wb_ctrl_rxs2  |  core__wb_ctrl_rfs2  ;
    always @( posedge   core__clock  )
    begin
        if (~  core__reset  &  core__wb_reg_xcpt  &  core___csr_io_htval_htval_valid_imem_T  )
        begin
            if (1)
                $display("Assertion failed\n    at RocketCore.scala:718 assert(!htval_valid_imem || io.imem.gpa.valid)\n");
            if (1)
                $display("");
        end
        if ((1)&  core___csr_io_trace_valid_0  &~  core__reset  )
            $fwrite(32'h80000002,"C%d: %d [%d] pc=[%x] W[r%d=%x][%d] R[r%d=%x] R[r%d=%x] inst=[%x] DASM(%x)\n",  core__io_hartid  ,  core___csr_io_time  [31:0],  core___csr_io_trace_valid_0  &~  core___csr_io_trace_exception_0  ,{{30{  core___csr_io_trace_iaddr_0  [33]}},  core___csr_io_trace_iaddr_0  },  core__wb_ctrl_wxd  |  core__wb_ctrl_wfd   ?   core__wb_reg_inst  [11:7]:5'h0,  core__coreMonitorBundle_wrenx   ?   core__rf_wdata  :64'h0,  core__coreMonitorBundle_wrenx  ,  core___GEN_9   ?   core__wb_reg_inst  [19:15]:5'h0,  core___GEN_9   ?   core__coreMonitorBundle_rd0val_REG_1  :64'h0,  core___GEN_10   ?   core__wb_reg_inst  [24:20]:5'h0,  core___GEN_10   ?   core__coreMonitorBundle_rd1val_REG_1  :64'h0,  core___csr_io_trace_insn_0  ,  core___csr_io_trace_insn_0  );
    end

    wire[7:0]  core___id_ctrl_decoder_decoded_T_32  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core__id_ctrl_decoder_decoded_invInputs  [2],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core__id_ctrl_decoder_decoded_invInputs  [11]};
    wire[14:0]  core___id_ctrl_decoder_decoded_T_50  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core__id_ctrl_decoder_decoded_invInputs  [3],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]};
    wire[15:0]  core___id_ctrl_decoder_decoded_T_54  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core___ibuf_io_inst_0_bits_inst_bits  [3],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core__id_ctrl_decoder_decoded_invInputs  [3],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [23],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]};
    wire[15:0]  core___id_ctrl_decoder_decoded_T_94  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core___ibuf_io_inst_0_bits_inst_bits  [3],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core__id_ctrl_decoder_decoded_invInputs  [3],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core__id_ctrl_decoder_decoded_invInputs  [11],  core___ibuf_io_inst_0_bits_inst_bits  [14],  core__id_ctrl_decoder_decoded_invInputs  [23],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [29]};
    wire[7:0]  core___id_ctrl_decoder_decoded_T_104  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core___ibuf_io_inst_0_bits_inst_bits  [14]};
    wire[8:0]  core___id_ctrl_decoder_decoded_T_108  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core___ibuf_io_inst_0_bits_inst_bits  [14]};
    wire[7:0]  core___id_ctrl_decoder_decoded_T_114  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core___ibuf_io_inst_0_bits_inst_bits  [13],  core___ibuf_io_inst_0_bits_inst_bits  [14]};
    wire[8:0]  core___id_ctrl_decoder_decoded_T_118  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core___ibuf_io_inst_0_bits_inst_bits  [13],  core___ibuf_io_inst_0_bits_inst_bits  [14]};
    wire[13:0]  core___id_ctrl_decoder_decoded_T_146  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core___ibuf_io_inst_0_bits_inst_bits  [2],  core___ibuf_io_inst_0_bits_inst_bits  [3],  core__id_ctrl_decoder_decoded_invInputs  [2],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [13],  core__id_ctrl_decoder_decoded_invInputs  [12],  core___ibuf_io_inst_0_bits_inst_bits  [27],  core___ibuf_io_inst_0_bits_inst_bits  [28],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]};
    wire[2:0]  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_16  ={&  core___id_ctrl_decoder_decoded_T_136  ,&  core___id_ctrl_decoder_decoded_T_138  ,&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core___ibuf_io_inst_0_bits_inst_bits  [2],  core___ibuf_io_inst_0_bits_inst_bits  [3],  core__id_ctrl_decoder_decoded_invInputs  [2],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [13],  core__id_ctrl_decoder_decoded_invInputs  [12],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core___ibuf_io_inst_0_bits_inst_bits  [31]}};
    wire[2:0]  core___GEN_11  ={  core___ibuf_io_inst_0_bits_xcpt1_pf_inst  ,  core___ibuf_io_inst_0_bits_xcpt1_gf_inst  ,  core___ibuf_io_inst_0_bits_xcpt1_ae_inst  };
    wire  core___GEN_12  =  core___bpu_io_xcpt_if  |(|{  core___ibuf_io_inst_0_bits_xcpt0_pf_inst  ,  core___ibuf_io_inst_0_bits_xcpt0_gf_inst  ,  core___ibuf_io_inst_0_bits_xcpt0_ae_inst  });
    wire[31:0]  core__inst  =  core___ibuf_io_inst_0_bits_rvc   ? {16'h0,  core___ibuf_io_inst_0_bits_raw  [15:0]}:  core___ibuf_io_inst_0_bits_raw  ;
    wire  core___mem_reg_store_T_3  =  core__ex_ctrl_mem_cmd  ==5'h7;
    wire  core___mem_reg_store_T_5  =  core__ex_ctrl_mem_cmd  ==5'h4;
    wire  core___mem_reg_store_T_6  =  core__ex_ctrl_mem_cmd  ==5'h9;
    wire  core___mem_reg_store_T_7  =  core__ex_ctrl_mem_cmd  ==5'hA;
    wire  core___mem_reg_store_T_8  =  core__ex_ctrl_mem_cmd  ==5'hB;
    wire  core___mem_reg_store_T_12  =  core__ex_ctrl_mem_cmd  ==5'h8;
    wire  core___mem_reg_store_T_13  =  core__ex_ctrl_mem_cmd  ==5'hC;
    wire  core___mem_reg_store_T_14  =  core__ex_ctrl_mem_cmd  ==5'hD;
    wire  core___mem_reg_store_T_15  =  core__ex_ctrl_mem_cmd  ==5'hE;
    wire  core___mem_reg_store_T_16  =  core__ex_ctrl_mem_cmd  ==5'hF;
    wire[31:0]  core___GEN_13  =  core__r  &~(  core__ll_wen   ? 32'h1<<  core__ll_waddr  :32'h0);
    wire  core___GEN_14  =  core__wb_set_sboard  &  core__wb_wen  ;
    wire[8:0]  core___id_ctrl_decoder_decoded_T_10  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core___ibuf_io_inst_0_bits_inst_bits  [2],  core___ibuf_io_inst_0_bits_inst_bits  [3],  core__id_ctrl_decoder_decoded_invInputs  [2],  core__id_ctrl_decoder_decoded_invInputs  [3],  core__id_ctrl_decoder_decoded_invInputs  [4],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [12]};
    wire[7:0]  core___id_ctrl_decoder_decoded_T_56  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core__id_ctrl_decoder_decoded_invInputs  [11]};
    wire[27:0]  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_53  ={&  core___id_ctrl_decoder_decoded_T  ,&  core___id_ctrl_decoder_decoded_T_4  ,&  core___id_ctrl_decoder_decoded_T_6  ,&  core___id_ctrl_decoder_decoded_T_10  ,&  core___id_ctrl_decoder_decoded_T_12  ,&  core___id_ctrl_decoder_decoded_T_14  ,&  core___id_ctrl_decoder_decoded_T_22  ,&  core___id_ctrl_decoder_decoded_T_26  ,&  core___id_ctrl_decoder_decoded_T_28  ,&  core___id_ctrl_decoder_decoded_T_36  ,&  core___id_ctrl_decoder_decoded_T_40  ,&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core__id_ctrl_decoder_decoded_invInputs  [5],  core__id_ctrl_decoder_decoded_invInputs  [6],  core__id_ctrl_decoder_decoded_invInputs  [7],  core__id_ctrl_decoder_decoded_invInputs  [8],  core__id_ctrl_decoder_decoded_invInputs  [9],  core__id_ctrl_decoder_decoded_invInputs  [10],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [12],  core__id_ctrl_decoder_decoded_invInputs  [13],  core__id_ctrl_decoder_decoded_invInputs  [14],  core__id_ctrl_decoder_decoded_invInputs  [15],  core__id_ctrl_decoder_decoded_invInputs  [16],  core__id_ctrl_decoder_decoded_invInputs  [17],  core__id_ctrl_decoder_decoded_invInputs  [19],  core__id_ctrl_decoder_decoded_invInputs  [20],  core__id_ctrl_decoder_decoded_invInputs  [21],  core__id_ctrl_decoder_decoded_invInputs  [22],  core__id_ctrl_decoder_decoded_invInputs  [23],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]},&  core___id_ctrl_decoder_decoded_T_48  ,&  core___id_ctrl_decoder_decoded_T_52  ,&  core___id_ctrl_decoder_decoded_T_56  ,&  core___id_ctrl_decoder_decoded_T_64  ,&  core___id_ctrl_decoder_decoded_T_68  ,&  core___id_ctrl_decoder_decoded_T_74  ,&  core___id_ctrl_decoder_decoded_T_86  ,&  core___id_ctrl_decoder_decoded_T_88  ,&  core___id_ctrl_decoder_decoded_T_92  ,&  core___id_ctrl_decoder_decoded_T_98  ,&  core___id_ctrl_decoder_decoded_T_130  ,&  core___id_ctrl_decoder_decoded_T_136  ,&  core___id_ctrl_decoder_decoded_T_140  ,&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core__id_ctrl_decoder_decoded_invInputs  [5],  core__id_ctrl_decoder_decoded_invInputs  [6],  core__id_ctrl_decoder_decoded_invInputs  [7],  core__id_ctrl_decoder_decoded_invInputs  [8],  core__id_ctrl_decoder_decoded_invInputs  [9],  core__id_ctrl_decoder_decoded_invInputs  [10],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [12],  core__id_ctrl_decoder_decoded_invInputs  [13],  core__id_ctrl_decoder_decoded_invInputs  [14],  core__id_ctrl_decoder_decoded_invInputs  [15],  core__id_ctrl_decoder_decoded_invInputs  [16],  core__id_ctrl_decoder_decoded_invInputs  [17],  core___ibuf_io_inst_0_bits_inst_bits  [20],  core__id_ctrl_decoder_decoded_invInputs  [19],  core___ibuf_io_inst_0_bits_inst_bits  [22],  core__id_ctrl_decoder_decoded_invInputs  [21],  core__id_ctrl_decoder_decoded_invInputs  [22],  core__id_ctrl_decoder_decoded_invInputs  [23],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core___ibuf_io_inst_0_bits_inst_bits  [28],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]},&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core__id_ctrl_decoder_decoded_invInputs  [5],  core__id_ctrl_decoder_decoded_invInputs  [6],  core__id_ctrl_decoder_decoded_invInputs  [7],  core__id_ctrl_decoder_decoded_invInputs  [8],  core__id_ctrl_decoder_decoded_invInputs  [9],  core__id_ctrl_decoder_decoded_invInputs  [10],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [12],  core__id_ctrl_decoder_decoded_invInputs  [13],  core__id_ctrl_decoder_decoded_invInputs  [14],  core__id_ctrl_decoder_decoded_invInputs  [15],  core__id_ctrl_decoder_decoded_invInputs  [16],  core__id_ctrl_decoder_decoded_invInputs  [17],  core__id_ctrl_decoder_decoded_invInputs  [18],  core___ibuf_io_inst_0_bits_inst_bits  [21],  core__id_ctrl_decoder_decoded_invInputs  [20],  core__id_ctrl_decoder_decoded_invInputs  [21],  core__id_ctrl_decoder_decoded_invInputs  [22],  core__id_ctrl_decoder_decoded_invInputs  [23],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core___ibuf_io_inst_0_bits_inst_bits  [28],  core___ibuf_io_inst_0_bits_inst_bits  [29],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]},&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core__id_ctrl_decoder_decoded_invInputs  [5],  core__id_ctrl_decoder_decoded_invInputs  [6],  core__id_ctrl_decoder_decoded_invInputs  [7],  core__id_ctrl_decoder_decoded_invInputs  [8],  core__id_ctrl_decoder_decoded_invInputs  [9],  core__id_ctrl_decoder_decoded_invInputs  [10],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [12],  core__id_ctrl_decoder_decoded_invInputs  [13],  core__id_ctrl_decoder_decoded_invInputs  [14],  core__id_ctrl_decoder_decoded_invInputs  [15],  core__id_ctrl_decoder_decoded_invInputs  [16],  core__id_ctrl_decoder_decoded_invInputs  [17],  core__id_ctrl_decoder_decoded_invInputs  [18],  core___ibuf_io_inst_0_bits_inst_bits  [21],  core__id_ctrl_decoder_decoded_invInputs  [20],  core__id_ctrl_decoder_decoded_invInputs  [21],  core___ibuf_io_inst_0_bits_inst_bits  [24],  core___ibuf_io_inst_0_bits_inst_bits  [25],  core__id_ctrl_decoder_decoded_invInputs  [24],  core___ibuf_io_inst_0_bits_inst_bits  [27],  core___ibuf_io_inst_0_bits_inst_bits  [28],  core___ibuf_io_inst_0_bits_inst_bits  [29],  core___ibuf_io_inst_0_bits_inst_bits  [30],  core__id_ctrl_decoder_decoded_invInputs  [29]}};
    wire[2:0]  core__id_ctrl_csr  ={|{&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core__id_ctrl_decoder_decoded_invInputs  [5],  core__id_ctrl_decoder_decoded_invInputs  [6],  core__id_ctrl_decoder_decoded_invInputs  [7],  core__id_ctrl_decoder_decoded_invInputs  [8],  core__id_ctrl_decoder_decoded_invInputs  [9],  core__id_ctrl_decoder_decoded_invInputs  [10],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [12],  core__id_ctrl_decoder_decoded_invInputs  [13],  core__id_ctrl_decoder_decoded_invInputs  [14],  core__id_ctrl_decoder_decoded_invInputs  [15],  core__id_ctrl_decoder_decoded_invInputs  [16],  core__id_ctrl_decoder_decoded_invInputs  [17],  core__id_ctrl_decoder_decoded_invInputs  [19],  core__id_ctrl_decoder_decoded_invInputs  [20],  core__id_ctrl_decoder_decoded_invInputs  [21],  core__id_ctrl_decoder_decoded_invInputs  [22],  core__id_ctrl_decoder_decoded_invInputs  [23],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]},&  core___id_ctrl_decoder_decoded_T_62  ,&  core___id_ctrl_decoder_decoded_T_74  ,&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core__id_ctrl_decoder_decoded_invInputs  [5],  core__id_ctrl_decoder_decoded_invInputs  [6],  core__id_ctrl_decoder_decoded_invInputs  [7],  core__id_ctrl_decoder_decoded_invInputs  [8],  core__id_ctrl_decoder_decoded_invInputs  [9],  core__id_ctrl_decoder_decoded_invInputs  [10],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [12],  core__id_ctrl_decoder_decoded_invInputs  [13],  core__id_ctrl_decoder_decoded_invInputs  [14],  core__id_ctrl_decoder_decoded_invInputs  [15],  core__id_ctrl_decoder_decoded_invInputs  [16],  core__id_ctrl_decoder_decoded_invInputs  [17],  core___ibuf_io_inst_0_bits_inst_bits  [20],  core__id_ctrl_decoder_decoded_invInputs  [19],  core___ibuf_io_inst_0_bits_inst_bits  [22],  core__id_ctrl_decoder_decoded_invInputs  [21],  core__id_ctrl_decoder_decoded_invInputs  [22],  core__id_ctrl_decoder_decoded_invInputs  [23],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core___ibuf_io_inst_0_bits_inst_bits  [28],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]},&{  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core__id_ctrl_decoder_decoded_invInputs  [5],  core__id_ctrl_decoder_decoded_invInputs  [6],  core__id_ctrl_decoder_decoded_invInputs  [7],  core__id_ctrl_decoder_decoded_invInputs  [8],  core__id_ctrl_decoder_decoded_invInputs  [9],  core__id_ctrl_decoder_decoded_invInputs  [10],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [12],  core__id_ctrl_decoder_decoded_invInputs  [13],  core__id_ctrl_decoder_decoded_invInputs  [14],  core__id_ctrl_decoder_decoded_invInputs  [15],  core__id_ctrl_decoder_decoded_invInputs  [16],  core__id_ctrl_decoder_decoded_invInputs  [17],  core__id_ctrl_decoder_decoded_invInputs  [18],  core___ibuf_io_inst_0_bits_inst_bits  [21],  core__id_ctrl_decoder_decoded_invInputs  [20],  core__id_ctrl_decoder_decoded_invInputs  [21],  core__id_ctrl_decoder_decoded_invInputs  [22],  core__id_ctrl_decoder_decoded_invInputs  [23],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core___ibuf_io_inst_0_bits_inst_bits  [28],  core___ibuf_io_inst_0_bits_inst_bits  [29],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]},&{  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core__id_ctrl_decoder_decoded_invInputs  [5],  core__id_ctrl_decoder_decoded_invInputs  [6],  core__id_ctrl_decoder_decoded_invInputs  [7],  core__id_ctrl_decoder_decoded_invInputs  [8],  core__id_ctrl_decoder_decoded_invInputs  [9],  core__id_ctrl_decoder_decoded_invInputs  [10],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [12],  core__id_ctrl_decoder_decoded_invInputs  [13],  core__id_ctrl_decoder_decoded_invInputs  [14],  core__id_ctrl_decoder_decoded_invInputs  [15],  core__id_ctrl_decoder_decoded_invInputs  [16],  core__id_ctrl_decoder_decoded_invInputs  [17],  core__id_ctrl_decoder_decoded_invInputs  [18],  core___ibuf_io_inst_0_bits_inst_bits  [21],  core__id_ctrl_decoder_decoded_invInputs  [20],  core__id_ctrl_decoder_decoded_invInputs  [21],  core___ibuf_io_inst_0_bits_inst_bits  [24],  core___ibuf_io_inst_0_bits_inst_bits  [25],  core__id_ctrl_decoder_decoded_invInputs  [24],  core___ibuf_io_inst_0_bits_inst_bits  [27],  core___ibuf_io_inst_0_bits_inst_bits  [28],  core___ibuf_io_inst_0_bits_inst_bits  [29],  core___ibuf_io_inst_0_bits_inst_bits  [30],  core__id_ctrl_decoder_decoded_invInputs  [29]}},&  core___id_ctrl_decoder_decoded_T_74  ,&  core___id_ctrl_decoder_decoded_T_62  };
    wire  core___id_csr_ren_T  =  core__id_ctrl_csr  ==3'h6;
    wire  core__id_csr_en  =  core___id_csr_ren_T  |(&  core__id_ctrl_csr  )|  core__id_ctrl_csr  ==3'h5;
    wire  core__id_system_insn  =  core__id_ctrl_csr  ==3'h4;
    wire  core__id_csr_ren  =(  core___id_csr_ren_T  |(&  core__id_ctrl_csr  ))&~(|  core___ibuf_io_inst_0_bits_inst_rs1  );
    wire  core__id_illegal_insn  =~(|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_53  )|(|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_10  )&~(  core___csr_io_status_isa  [12])|(|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T  )&~(  core___csr_io_status_isa  [0])|  core___ibuf_io_inst_0_bits_rvc  &~(  core___csr_io_status_isa  [2])|  core__id_csr_en  &(  core___csr_io_decode_0_read_illegal  |~  core__id_csr_ren  &  core___csr_io_decode_0_write_illegal  )|~  core___ibuf_io_inst_0_bits_rvc  &  core__id_system_insn  &  core___csr_io_decode_0_system_illegal  ;
    wire  core__id_virtual_insn  =(|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_53  )&(  core__id_csr_en  &~(~  core__id_csr_ren  &  core___csr_io_decode_0_write_illegal  )&  core___csr_io_decode_0_virtual_access_illegal  |~  core___ibuf_io_inst_0_bits_rvc  &  core__id_system_insn  &  core___csr_io_decode_0_virtual_system_illegal  );
    wire  core__id_xcpt  =  core___csr_io_interrupt  |  core___bpu_io_debug_if  |  core___bpu_io_xcpt_if  |  core___ibuf_io_inst_0_bits_xcpt0_pf_inst  |  core___ibuf_io_inst_0_bits_xcpt0_gf_inst  |  core___ibuf_io_inst_0_bits_xcpt0_ae_inst  |  core___ibuf_io_inst_0_bits_xcpt1_pf_inst  |  core___ibuf_io_inst_0_bits_xcpt1_gf_inst  |  core___ibuf_io_inst_0_bits_xcpt1_ae_inst  |  core__id_virtual_insn  |  core__id_illegal_insn  ;
    wire  core___GEN_15  =  core__ex_reg_valid  &  core__ex_ctrl_wxd  ;
    wire  core___GEN_16  =  core___dcache_kill_mem_T  &~  core__mem_ctrl_mem  ;
    wire  core__id_bypass_src_1_1  =  core___GEN_15  &  core___fp_data_hazard_ex_T_3  ;
    wire  core__id_bypass_src_1_2  =  core___GEN_16  &  core___fp_data_hazard_mem_T_3  ;
    wire  core__do_bypass_1  =~(|  core___ibuf_io_inst_0_bits_inst_rs2  )|  core__id_bypass_src_1_1  |  core__id_bypass_src_1_2  |  core___dcache_kill_mem_T  &  core___fp_data_hazard_mem_T_3  ;
    wire  core___GEN_17  =(|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_47  )&~  core__do_bypass_1  ;
    wire  core__replay_ex  =  core__ex_reg_replay  |  core__ex_reg_valid  &(  core__ex_ctrl_mem  &~  core__io_dmem_req_ready  |  core__ex_ctrl_div  &~  core___div_io_req_ready  |  core__wb_dcache_miss  &  core__ex_reg_load_use  );
    wire  core__ctrl_killx  =  core__ibuf_io_kill  |  core__replay_ex  |~  core__ex_reg_valid  ;
    wire  core__mem_pc_valid  =  core__mem_reg_valid  |  core__mem_reg_replay  |  core__mem_reg_xcpt_interrupt  ;
    wire  core___mem_npc_misaligned_T_3  =~(  core___csr_io_status_isa  [2])&  core___mem_npc_T_4  [1];
    wire  core___GEN_18  =  core__mem_reg_valid  &  core__mem_reg_flush_pipe  ;
    wire  core___GEN_19  =  core___GEN_18  |~  core__ex_pc_valid  ;
    wire  core___GEN_20  =  core__ex_ctrl_jalr  &  core___csr_io_status_debug  ;
    wire  core___GEN_21  =  core__mem_reg_xcpt_interrupt  |  core__mem_reg_xcpt  ;
    wire  core___GEN_22  =  core__mem_reg_valid  &  core___mem_npc_misaligned_T_3  ;
    wire  core__mem_xcpt  =  core___GEN_21  |  core___GEN_22  |  core__mem_reg_valid  &  core__mem_ldst_xcpt  ;
    wire  core___ctrl_killm_T  =  core__killm_common  |  core__mem_xcpt  ;
    wire[15:0]  core___id_ctrl_decoder_decoded_T_154  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core__id_ctrl_decoder_decoded_invInputs  [10],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [12],  core__id_ctrl_decoder_decoded_invInputs  [23],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core___ibuf_io_inst_0_bits_inst_bits  [30],  core__id_ctrl_decoder_decoded_invInputs  [29]};
    wire[15:0]  core___id_ctrl_decoder_decoded_T_158  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core__id_ctrl_decoder_decoded_invInputs  [3],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core__id_ctrl_decoder_decoded_invInputs  [11],  core___ibuf_io_inst_0_bits_inst_bits  [14],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core___ibuf_io_inst_0_bits_inst_bits  [30],  core__id_ctrl_decoder_decoded_invInputs  [29]};
    wire[15:0]  core___id_ctrl_decoder_decoded_T_160  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core___ibuf_io_inst_0_bits_inst_bits  [3],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core__id_ctrl_decoder_decoded_invInputs  [11],  core___ibuf_io_inst_0_bits_inst_bits  [14],  core__id_ctrl_decoder_decoded_invInputs  [23],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core___ibuf_io_inst_0_bits_inst_bits  [30],  core__id_ctrl_decoder_decoded_invInputs  [29]};
    wire[15:0]  core___id_ctrl_decoder_decoded_T_162  ={  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core__id_ctrl_decoder_decoded_invInputs  [11],  core___ibuf_io_inst_0_bits_inst_bits  [14],  core__id_ctrl_decoder_decoded_invInputs  [23],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core___ibuf_io_inst_0_bits_inst_bits  [30],  core__id_ctrl_decoder_decoded_invInputs  [29]};
    wire[2:0]  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_12  ={&  core___id_ctrl_decoder_decoded_T_18  ,&  core___id_ctrl_decoder_decoded_T_146  ,&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core___ibuf_io_inst_0_bits_inst_bits  [2],  core___ibuf_io_inst_0_bits_inst_bits  [3],  core__id_ctrl_decoder_decoded_invInputs  [2],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [13],  core__id_ctrl_decoder_decoded_invInputs  [12],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core___ibuf_io_inst_0_bits_inst_bits  [29]}};
    wire[2:0]  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_14  ={&  core___id_ctrl_decoder_decoded_T_138  ,&  core___id_ctrl_decoder_decoded_T_146  ,&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core___ibuf_io_inst_0_bits_inst_bits  [2],  core___ibuf_io_inst_0_bits_inst_bits  [3],  core__id_ctrl_decoder_decoded_invInputs  [2],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [13],  core__id_ctrl_decoder_decoded_invInputs  [12],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core___ibuf_io_inst_0_bits_inst_bits  [30]}};
    wire  core__id_bypass_src_0_1  =  core___GEN_15  &  core___fp_data_hazard_ex_T_1  ;
    wire  core__id_bypass_src_0_2  =  core___GEN_16  &  core___fp_data_hazard_mem_T_1  ;
    wire  core__do_bypass  =~(|  core___ibuf_io_inst_0_bits_inst_rs1  )|  core__id_bypass_src_0_1  |  core__id_bypass_src_0_2  |  core___dcache_kill_mem_T  &  core___fp_data_hazard_mem_T_1  ;
    wire  core___GEN_23  =(|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_45  )&~  core__do_bypass  ;
    wire  core___GEN_24  =  core__id_illegal_insn  |  core__id_virtual_insn  ;
    wire[3:0]  core__id_ctrl_alu_fn  ={|{&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core__id_ctrl_decoder_decoded_invInputs  [3],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [13],  core__id_ctrl_decoder_decoded_invInputs  [12]},&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [13],  core__id_ctrl_decoder_decoded_invInputs  [12],  core__id_ctrl_decoder_decoded_invInputs  [23],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]},&  core___id_ctrl_decoder_decoded_T_86  ,&  core___id_ctrl_decoder_decoded_T_154  ,&  core___id_ctrl_decoder_decoded_T_158  ,&  core___id_ctrl_decoder_decoded_T_160  ,&  core___id_ctrl_decoder_decoded_T_162  },|{&  core___id_ctrl_decoder_decoded_T_64  ,&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [13],  core__id_ctrl_decoder_decoded_invInputs  [23],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]},&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core__id_ctrl_decoder_decoded_invInputs  [3],  core__id_ctrl_decoder_decoded_invInputs  [4],  core__id_ctrl_decoder_decoded_invInputs  [10],  core___ibuf_io_inst_0_bits_inst_bits  [14]},&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [14],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]},&  core___id_ctrl_decoder_decoded_T_86  ,&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core__id_ctrl_decoder_decoded_invInputs  [11],  core___ibuf_io_inst_0_bits_inst_bits  [14],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]},&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core___ibuf_io_inst_0_bits_inst_bits  [3],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core__id_ctrl_decoder_decoded_invInputs  [11],  core___ibuf_io_inst_0_bits_inst_bits  [14],  core__id_ctrl_decoder_decoded_invInputs  [23],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]},&  core___id_ctrl_decoder_decoded_T_130  },|{&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core__id_ctrl_decoder_decoded_invInputs  [2],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [12]},&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core__id_ctrl_decoder_decoded_invInputs  [3],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core___ibuf_io_inst_0_bits_inst_bits  [13]},&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core___ibuf_io_inst_0_bits_inst_bits  [13],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]},&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core__id_ctrl_decoder_decoded_invInputs  [3],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [13],  core___ibuf_io_inst_0_bits_inst_bits  [14]},&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [13],  core___ibuf_io_inst_0_bits_inst_bits  [14],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]},&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core__id_ctrl_decoder_decoded_invInputs  [2],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core___ibuf_io_inst_0_bits_inst_bits  [13],  core___ibuf_io_inst_0_bits_inst_bits  [14]},&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [13],  core___ibuf_io_inst_0_bits_inst_bits  [25],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]},&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [13],  core___ibuf_io_inst_0_bits_inst_bits  [14],  core___ibuf_io_inst_0_bits_inst_bits  [25],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]},&  core___id_ctrl_decoder_decoded_T_154  ,&  core___id_ctrl_decoder_decoded_T_158  ,&  core___id_ctrl_decoder_decoded_T_160  ,&  core___id_ctrl_decoder_decoded_T_162  },|{&  core___id_ctrl_decoder_decoded_T_48  ,&  core___id_ctrl_decoder_decoded_T_52  ,&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core__id_ctrl_decoder_decoded_invInputs  [2],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core__id_ctrl_decoder_decoded_invInputs  [11]},&  core___id_ctrl_decoder_decoded_T_88  ,&  core___id_ctrl_decoder_decoded_T_92  ,&  core___id_ctrl_decoder_decoded_T_98  ,&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core___ibuf_io_inst_0_bits_inst_bits  [14],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]},&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core__id_ctrl_decoder_decoded_invInputs  [2],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core___ibuf_io_inst_0_bits_inst_bits  [6],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core___ibuf_io_inst_0_bits_inst_bits  [14]},&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core__id_ctrl_decoder_decoded_invInputs  [3],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core___ibuf_io_inst_0_bits_inst_bits  [13],  core___ibuf_io_inst_0_bits_inst_bits  [14]},&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core___ibuf_io_inst_0_bits_inst_bits  [25],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]},&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core___ibuf_io_inst_0_bits_inst_bits  [14],  core___ibuf_io_inst_0_bits_inst_bits  [25],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [28],  core__id_ctrl_decoder_decoded_invInputs  [29]}}};
    always @( posedge   core__clock  )
    begin
        core__id_reg_pause   <=~(  core___csr_io_time  [4:0]==5'h0|  core___csr_io_inhibit_cycle  |  core__io_dmem_perf_release  |  core__ibuf_io_kill  )&(~  core__ctrl_killd  &(&  core___id_ctrl_decoder_decoded_T_10  )&  core___ibuf_io_inst_0_bits_inst_bits  [23:20]==4'h0|  core__id_reg_pause  );
        core__imem_might_request_reg   <=  core__ex_pc_valid  |  core__mem_pc_valid  |  core___csr_io_customCSRs_0_value  [1];
        core__ex_ctrl_fp   <=  core__ctrl_killd  &  core__ex_ctrl_fp  ;
        core__ex_ctrl_rocc   <=  core__ctrl_killd  &  core__ex_ctrl_rocc  ;
        if (~  core__ctrl_killd  )
        begin
            core__ex_ctrl_branch   <=|{&  core___id_ctrl_decoder_decoded_T_32  ,&  core___id_ctrl_decoder_decoded_T_86  };
            core__ex_ctrl_jal   <=&  core___id_ctrl_decoder_decoded_T_40  ;
            core__ex_ctrl_jalr   <=&  core___id_ctrl_decoder_decoded_T_38  ;
            core__ex_ctrl_rxs2   <=|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_47  ;
            core__ex_ctrl_rxs1   <=|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_45  ;
            core__ex_ctrl_sel_alu2   <=  core__id_xcpt   ? (  core___GEN_12   ? 2'h0:{1'h0,|  core___GEN_11  }):{|{&  core___id_ctrl_decoder_decoded_T  ,&  core___id_ctrl_decoder_decoded_T_4  ,&  core___id_ctrl_decoder_decoded_T_6  ,&  core___id_ctrl_decoder_decoded_T_12  ,&  core___id_ctrl_decoder_decoded_T_14  ,&  core___id_ctrl_decoder_decoded_T_22  ,&  core___id_ctrl_decoder_decoded_T_26  ,&  core___id_ctrl_decoder_decoded_T_28  ,&  core___id_ctrl_decoder_decoded_T_32  ,&  core___id_ctrl_decoder_decoded_T_36  ,&  core___id_ctrl_decoder_decoded_T_48  ,&  core___id_ctrl_decoder_decoded_T_52  ,&  core___id_ctrl_decoder_decoded_T_64  ,&  core___id_ctrl_decoder_decoded_T_88  ,&  core___id_ctrl_decoder_decoded_T_92  ,&  core___id_ctrl_decoder_decoded_T_98  ,&  core___id_ctrl_decoder_decoded_T_104  ,&  core___id_ctrl_decoder_decoded_T_114  ,&  core___id_ctrl_decoder_decoded_T_130  },|{&  core___id_ctrl_decoder_decoded_T  ,&  core___id_ctrl_decoder_decoded_T_4  ,&  core___id_ctrl_decoder_decoded_T_6  ,&  core___id_ctrl_decoder_decoded_T_12  ,&  core___id_ctrl_decoder_decoded_T_14  ,&  core___id_ctrl_decoder_decoded_T_38  ,&  core___id_ctrl_decoder_decoded_T_40  ,&  core___id_ctrl_decoder_decoded_T_50  ,&  core___id_ctrl_decoder_decoded_T_54  ,&  core___id_ctrl_decoder_decoded_T_64  ,&  core___id_ctrl_decoder_decoded_T_88  ,&  core___id_ctrl_decoder_decoded_T_94  ,&  core___id_ctrl_decoder_decoded_T_108  ,&  core___id_ctrl_decoder_decoded_T_118  }};
            core__ex_ctrl_sel_alu1   <=  core__id_xcpt   ? (  core___GEN_12  |(|  core___GEN_11  ) ? 2'h2:2'h1):{|{&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core___ibuf_io_inst_0_bits_inst_bits  [2],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core__id_ctrl_decoder_decoded_invInputs  [3],  core__id_ctrl_decoder_decoded_invInputs  [4]},&  core___id_ctrl_decoder_decoded_T_40  },|{&  core___id_ctrl_decoder_decoded_T  ,&  core___id_ctrl_decoder_decoded_T_4  ,&  core___id_ctrl_decoder_decoded_T_6  ,&  core___id_ctrl_decoder_decoded_T_12  ,&  core___id_ctrl_decoder_decoded_T_22  ,&  core___id_ctrl_decoder_decoded_T_26  ,&  core___id_ctrl_decoder_decoded_T_28  ,&  core___id_ctrl_decoder_decoded_T_36  ,&  core___id_ctrl_decoder_decoded_T_48  ,&  core___id_ctrl_decoder_decoded_T_52  ,&  core___id_ctrl_decoder_decoded_T_60  ,&  core___id_ctrl_decoder_decoded_T_64  ,&  core___id_ctrl_decoder_decoded_T_68  ,&  core___id_ctrl_decoder_decoded_T_76  ,&  core___id_ctrl_decoder_decoded_T_86  ,&  core___id_ctrl_decoder_decoded_T_88  ,&  core___id_ctrl_decoder_decoded_T_92  ,&  core___id_ctrl_decoder_decoded_T_98  ,&  core___id_ctrl_decoder_decoded_T_130  ,&  core___id_ctrl_decoder_decoded_T_136  ,&  core___id_ctrl_decoder_decoded_T_138  }};
            core__ex_ctrl_sel_imm   <={|{&  core___id_ctrl_decoder_decoded_T  ,&  core___id_ctrl_decoder_decoded_T_4  ,&  core___id_ctrl_decoder_decoded_T_8  ,&  core___id_ctrl_decoder_decoded_T_12  ,&  core___id_ctrl_decoder_decoded_T_38  ,&  core___id_ctrl_decoder_decoded_T_50  ,&  core___id_ctrl_decoder_decoded_T_54  ,&  core___id_ctrl_decoder_decoded_T_64  ,&  core___id_ctrl_decoder_decoded_T_88  ,&  core___id_ctrl_decoder_decoded_T_94  ,&  core___id_ctrl_decoder_decoded_T_108  ,&  core___id_ctrl_decoder_decoded_T_118  },|{&  core___id_ctrl_decoder_decoded_T_14  ,&  core___id_ctrl_decoder_decoded_T_40  },|{&  core___id_ctrl_decoder_decoded_T_32  ,&  core___id_ctrl_decoder_decoded_T_40  ,&  core___id_ctrl_decoder_decoded_T_104  ,&  core___id_ctrl_decoder_decoded_T_114  }};
            core__ex_ctrl_alu_dw   <=  core__id_xcpt  |(|{&  core___id_ctrl_decoder_decoded_T  ,&  core___id_ctrl_decoder_decoded_T_4  ,&  core___id_ctrl_decoder_decoded_T_6  ,&  core___id_ctrl_decoder_decoded_T_14  ,&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core__id_ctrl_decoder_decoded_invInputs  [10],  core__id_ctrl_decoder_decoded_invInputs  [11],  core__id_ctrl_decoder_decoded_invInputs  [12],  core__id_ctrl_decoder_decoded_invInputs  [23],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [29]},&  core___id_ctrl_decoder_decoded_T_26  ,&  core___id_ctrl_decoder_decoded_T_36  ,&  core___id_ctrl_decoder_decoded_T_40  ,&  core___id_ctrl_decoder_decoded_T_48  ,&  core___id_ctrl_decoder_decoded_T_56  ,&  core___id_ctrl_decoder_decoded_T_64  ,&  core___id_ctrl_decoder_decoded_T_68  ,&  core___id_ctrl_decoder_decoded_T_74  ,&  core___id_ctrl_decoder_decoded_T_86  ,&  core___id_ctrl_decoder_decoded_T_88  ,&{  core___ibuf_io_inst_0_bits_inst_bits  [0],  core___ibuf_io_inst_0_bits_inst_bits  [1],  core__id_ctrl_decoder_decoded_invInputs  [0],  core__id_ctrl_decoder_decoded_invInputs  [1],  core___ibuf_io_inst_0_bits_inst_bits  [4],  core___ibuf_io_inst_0_bits_inst_bits  [5],  core__id_ctrl_decoder_decoded_invInputs  [4],  core___ibuf_io_inst_0_bits_inst_bits  [12],  core__id_ctrl_decoder_decoded_invInputs  [11],  core___ibuf_io_inst_0_bits_inst_bits  [14],  core__id_ctrl_decoder_decoded_invInputs  [23],  core__id_ctrl_decoder_decoded_invInputs  [24],  core__id_ctrl_decoder_decoded_invInputs  [25],  core__id_ctrl_decoder_decoded_invInputs  [26],  core__id_ctrl_decoder_decoded_invInputs  [27],  core__id_ctrl_decoder_decoded_invInputs  [29]},&  core___id_ctrl_decoder_decoded_T_136  ,&  core___id_ctrl_decoder_decoded_T_138  });
            core__ex_ctrl_alu_fn   <=  core__id_xcpt   ? 4'h0:  core__id_ctrl_alu_fn  ;
            core__ex_ctrl_mem   <=|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_19  ;
            core__ex_ctrl_mem_cmd   <={1'h0,&  core___id_ctrl_decoder_decoded_T_68  ,|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_16  ,|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_14  ,|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_12  };
            core__ex_ctrl_div   <=|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_10  ;
            core__ex_ctrl_wxd   <=|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_8  ;
            core__ex_ctrl_csr   <=  core__id_system_insn  &(|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_19  ) ? 3'h0:  core__id_csr_ren   ? 3'h2:  core__id_ctrl_csr  ;
            core__ex_ctrl_fence_i   <=&  core___id_ctrl_decoder_decoded_T_46  ;
            core__ex_reg_rvc   <=  core__id_xcpt  &(|  core___GEN_11  )|  core___ibuf_io_inst_0_bits_rvc  ;
            core__ex_reg_flush_pipe   <=(&  core___id_ctrl_decoder_decoded_T_46  )|  core__id_system_insn  |  core__id_csr_en  &~  core__id_csr_ren  &  core___csr_io_decode_0_write_flush  ;
            core__ex_reg_load_use   <=  core__mem_reg_valid  &  core__data_hazard_mem  &  core__mem_ctrl_mem  ;
            core__ex_reg_mem_size   <={&  core___id_ctrl_decoder_decoded_T_68  ,|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_16  ,|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_14  ,|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T_12  }==4'h5 ? {|  core___ibuf_io_inst_0_bits_inst_rs2  ,|  core___ibuf_io_inst_0_bits_inst_rs1  }:  core___ibuf_io_inst_0_bits_inst_bits  [13:12];
            core__ex_reg_rs_bypass_0   <=~  core___GEN_24  &  core__do_bypass  ;
            core__ex_reg_rs_bypass_1   <=  core__do_bypass_1  ;
            core__ex_reg_rs_lsb_0   <=  core___GEN_24   ?   core__inst  [1:0]:  core___GEN_23   ?   core__id_rs_0  [1:0]:(|  core___ibuf_io_inst_0_bits_inst_rs1  ) ? (  core__id_bypass_src_0_1   ? 2'h1:{1'h1,~  core__id_bypass_src_0_2  }):2'h0;
            core__ex_reg_rs_lsb_1   <=  core___GEN_17   ?   core__id_rs_1  [1:0]:(|  core___ibuf_io_inst_0_bits_inst_rs2  ) ? (  core__id_bypass_src_1_1   ? 2'h1:{1'h1,~  core__id_bypass_src_1_2  }):2'h0;
            if (  core___GEN_24  )
                core__ex_reg_rs_msb_0   <={32'h0,  core__inst  [31:2]};
            else
                if (  core___GEN_23  )
                    core__ex_reg_rs_msb_0   <=  core__id_rs_0  [63:2];
        end
        core__ex_ctrl_rfs1   <=  core__ctrl_killd  &  core__ex_ctrl_rfs1  ;
        core__ex_ctrl_rfs2   <=  core__ctrl_killd  &  core__ex_ctrl_rfs2  ;
        core__ex_ctrl_wfd   <=  core__ctrl_killd  &  core__ex_ctrl_wfd  ;
        core__ex_ctrl_mul   <=  core__ctrl_killd  &  core__ex_ctrl_mul  ;
        if (  core___GEN_19  )
        begin
        end
        else
        begin
            core__mem_ctrl_fp   <=  core__ex_ctrl_fp  ;
            core__mem_ctrl_rocc   <=  core__ex_ctrl_rocc  ;
            core__mem_ctrl_branch   <=  core__ex_ctrl_branch  ;
            core__mem_ctrl_jal   <=  core__ex_ctrl_jal  ;
            core__mem_ctrl_jalr   <=  core__ex_ctrl_jalr  ;
            core__mem_ctrl_rxs2   <=  core__ex_ctrl_rxs2  ;
            core__mem_ctrl_rxs1   <=  core__ex_ctrl_rxs1  ;
            core__mem_ctrl_mem   <=  core__ex_ctrl_mem  ;
            core__mem_ctrl_rfs1   <=  core__ex_ctrl_rfs1  ;
            core__mem_ctrl_rfs2   <=  core__ex_ctrl_rfs2  ;
            core__mem_ctrl_wfd   <=  core__ex_ctrl_wfd  ;
            core__mem_ctrl_mul   <=  core__ex_ctrl_mul  ;
            core__mem_ctrl_div   <=  core__ex_ctrl_div  ;
            core__mem_ctrl_wxd   <=  core__ex_ctrl_wxd  ;
            core__mem_ctrl_csr   <=  core__ex_ctrl_csr  ;
            core__mem_ctrl_fence_i   <=  core___GEN_20  |  core__ex_ctrl_fence_i  ;
        end
        if (  core__mem_pc_valid  )
        begin
            core__wb_ctrl_rocc   <=  core__mem_ctrl_rocc  ;
            core__wb_ctrl_rxs2   <=  core__mem_ctrl_rxs2  ;
            core__wb_ctrl_rxs1   <=  core__mem_ctrl_rxs1  ;
            core__wb_ctrl_mem   <=  core__mem_ctrl_mem  ;
            core__wb_ctrl_rfs1   <=  core__mem_ctrl_rfs1  ;
            core__wb_ctrl_rfs2   <=  core__mem_ctrl_rfs2  ;
            core__wb_ctrl_wfd   <=  core__mem_ctrl_wfd  ;
            core__wb_ctrl_div   <=  core__mem_ctrl_div  ;
            core__wb_ctrl_wxd   <=  core__mem_ctrl_wxd  ;
            core__wb_ctrl_csr   <=  core__mem_ctrl_csr  ;
            core__wb_ctrl_fence_i   <=  core__mem_ctrl_fence_i  ;
            core__wb_reg_cause   <=  core___GEN_21   ?   core__mem_reg_cause  :{60'h0,  core___GEN_22   ? 4'h0:  core__mem_debug_breakpoint   ? 4'hE:4'h3};
            core__wb_reg_pc   <=  core__mem_reg_pc  ;
            core__wb_reg_hls_or_dv   <=  core__mem_reg_hls_or_dv  ;
            core__wb_reg_inst   <=  core__mem_reg_inst  ;
            core__wb_reg_raw_inst   <=  core__mem_reg_raw_inst  ;
            core__wb_reg_wdata   <=~  core__mem_reg_xcpt  &  core__mem_ctrl_fp  &  core__mem_ctrl_wxd   ? 64'h0:~  core__mem_reg_xcpt  &(  core__mem_ctrl_jalr  ^  core___mem_npc_misaligned_T_3  ) ? {{30{  core___mem_br_target_T_9  [33]}},  core___mem_br_target_T_9  }:  core__mem_reg_wdata  ;
        end
        core__ex_reg_xcpt_interrupt   <=~  core__ibuf_io_kill  &  core___ibuf_io_inst_0_valid  &  core___csr_io_interrupt  ;
        core__ex_reg_valid   <=~  core__ctrl_killd  ;
        core__ex_reg_xcpt   <=~  core__ctrl_killd  &  core__id_xcpt  ;
        if (~  core__ctrl_killd  |  core___csr_io_interrupt  |  core___ibuf_io_inst_0_bits_replay  )
        begin
            core__ex_reg_cause   <=  core___csr_io_interrupt   ?   core___csr_io_interrupt_cause  :{59'h0,  core___bpu_io_debug_if   ? 5'hE:  core___bpu_io_xcpt_if   ? 5'h3:  core___ibuf_io_inst_0_bits_xcpt0_pf_inst   ? 5'hC:  core___ibuf_io_inst_0_bits_xcpt0_gf_inst   ? 5'h14:  core___ibuf_io_inst_0_bits_xcpt0_ae_inst   ? 5'h1:  core___ibuf_io_inst_0_bits_xcpt1_pf_inst   ? 5'hC:  core___ibuf_io_inst_0_bits_xcpt1_gf_inst   ? 5'h14:  core___ibuf_io_inst_0_bits_xcpt1_ae_inst   ? 5'h1:  core__id_virtual_insn   ? 5'h16:5'h2};
            core__ex_reg_pc   <=  core___ibuf_io_pc  ;
            core__ex_reg_inst   <=  core___ibuf_io_inst_0_bits_inst_bits  ;
            core__ex_reg_raw_inst   <=  core___ibuf_io_inst_0_bits_raw  ;
        end
        core__ex_reg_replay   <=~  core__ibuf_io_kill  &  core___ibuf_io_inst_0_valid  &  core___ibuf_io_inst_0_bits_replay  ;
        core__mem_reg_xcpt_interrupt   <=~  core__ibuf_io_kill  &  core__ex_reg_xcpt_interrupt  ;
        core__mem_reg_valid   <=~  core__ctrl_killx  ;
        if (  core___GEN_19  )
        begin
        end
        else
            core__mem_reg_rvc   <=  core__ex_reg_rvc  ;
        core__mem_reg_xcpt   <=~  core__ctrl_killx  &(  core__ex_reg_xcpt_interrupt  |  core__ex_reg_xcpt  );
        core__mem_reg_replay   <=~  core__ibuf_io_kill  &  core__replay_ex  ;
        if (  core___GEN_19  )
        begin
        end
        else
        begin
            core__mem_reg_flush_pipe   <=  core___GEN_20  |  core__ex_reg_flush_pipe  ;
            core__mem_reg_cause   <=  core__ex_reg_cause  ;
            core__mem_mem_cmd_bh   <=  core___mem_reg_store_T_3  |~(  core__ex_reg_mem_size  [1]);
            core__mem_reg_load   <=  core__ex_ctrl_mem  &(  core__ex_ctrl_mem_cmd  ==5'h0|  core__ex_ctrl_mem_cmd  ==5'h10|  core__ex_ctrl_mem_cmd  ==5'h6|  core___mem_reg_store_T_3  |  core___mem_reg_store_T_5  |  core___mem_reg_store_T_6  |  core___mem_reg_store_T_7  |  core___mem_reg_store_T_8  |  core___mem_reg_store_T_12  |  core___mem_reg_store_T_13  |  core___mem_reg_store_T_14  |  core___mem_reg_store_T_15  |  core___mem_reg_store_T_16  );
            core__mem_reg_store   <=  core__ex_ctrl_mem  &(  core__ex_ctrl_mem_cmd  ==5'h1|  core__ex_ctrl_mem_cmd  ==5'h11|  core___mem_reg_store_T_3  |  core___mem_reg_store_T_5  |  core___mem_reg_store_T_6  |  core___mem_reg_store_T_7  |  core___mem_reg_store_T_8  |  core___mem_reg_store_T_12  |  core___mem_reg_store_T_13  |  core___mem_reg_store_T_14  |  core___mem_reg_store_T_15  |  core___mem_reg_store_T_16  );
            core__mem_reg_pc   <=  core__ex_reg_pc  ;
            core__mem_reg_inst   <=  core__ex_reg_inst  ;
            core__mem_reg_hls_or_dv   <=  core___csr_io_status_dv  ;
            core__mem_reg_raw_inst   <=  core__ex_reg_raw_inst  ;
            core__mem_reg_wdata   <=  core___alu_io_out  ;
        end
        if (  core___GEN_18  |~(  core__ex_pc_valid  &  core__ex_ctrl_rxs2  &(  core__ex_ctrl_mem  |  core__ex_ctrl_rocc  )))
        begin
        end
        else
            core__mem_reg_rs2   <=  core__casez_tmp_2  ;
        if (  core___GEN_19  )
        begin
        end
        else
            core__mem_br_taken   <=  core___alu_io_cmp_out  ;
        core__wb_reg_valid   <=~  core___ctrl_killm_T  ;
        core__wb_reg_xcpt   <=  core__mem_xcpt  &~  core__take_pc_wb  ;
        core__wb_reg_replay   <=(  core__dcache_kill_mem  |  core__mem_reg_replay  )&~  core__take_pc_wb  ;
        core__wb_reg_flush_pipe   <=~  core___ctrl_killm_T  &  core__mem_reg_flush_pipe  ;
        if (~  core__ctrl_killd  &  core___GEN_17  )
            core__ex_reg_rs_msb_1   <=  core__id_rs_1  [63:2];
        core__div_io_kill_REG   <=  core___div_io_req_ready  &  core__div_io_req_valid  ;
        core__dcache_blocked_blocked   <=~  core__io_dmem_req_ready  &~  core__io_dmem_perf_grant  &(  core__dcache_blocked_blocked  |  core__io_dmem_req_valid_0  |  core__io_dmem_s2_nack  );
        core__rocc_blocked   <=~  core__wb_xcpt  &(  core___io_rocc_cmd_valid_T  &~  core__replay_wb_common  |  core__rocc_blocked  );
        core__coreMonitorBundle_rd0val_REG   <=  core__ex_rs_0  ;
        core__coreMonitorBundle_rd0val_REG_1   <=  core__coreMonitorBundle_rd0val_REG  ;
        core__coreMonitorBundle_rd1val_REG   <=  core__ex_rs_1  ;
        core__coreMonitorBundle_rd1val_REG_1   <=  core__coreMonitorBundle_rd1val_REG  ;
        if (  core__reset  )
        begin
            core__id_reg_fence   <=1'h0;
            core___r   <=32'h0;
        end
        else
        begin
            core__id_reg_fence   <=~  core__ctrl_killd  &((&  core___id_ctrl_decoder_decoded_T_10  )|(|  core___id_ctrl_decoder_decoded_orMatrixOutputs_T  )&  core___ibuf_io_inst_0_bits_inst_bits  [26])|  core__id_mem_busy  &  core__id_reg_fence  ;
            if (  core__ll_wen  |  core___GEN_14  )
                core___r   <=  core___GEN_13  |(  core___GEN_14   ? 32'h1<<  core__wb_reg_inst  [11:7]:32'h0);
            else
                if (  core__ll_wen  )
                    core___r   <=  core___GEN_13  ;
        end
    end


    wire  core__ibuf__clock;
    wire  core__ibuf__reset;
    wire  core__ibuf__io_imem_ready;
    wire  core__ibuf__io_imem_valid;
    wire [33:0] core__ibuf__io_imem_bits_pc;
    wire [31:0] core__ibuf__io_imem_bits_data;
    wire  core__ibuf__io_imem_bits_xcpt_pf_inst;
    wire  core__ibuf__io_imem_bits_xcpt_gf_inst;
    wire  core__ibuf__io_imem_bits_xcpt_ae_inst;
    wire  core__ibuf__io_imem_bits_replay;
    wire  core__ibuf__io_kill;
    wire [33:0] core__ibuf__io_pc;
    wire  core__ibuf__io_inst_0_ready;
    wire  core__ibuf__io_inst_0_valid;
    wire  core__ibuf__io_inst_0_bits_xcpt0_pf_inst;
    wire  core__ibuf__io_inst_0_bits_xcpt0_gf_inst;
    wire  core__ibuf__io_inst_0_bits_xcpt0_ae_inst;
    wire  core__ibuf__io_inst_0_bits_xcpt1_pf_inst;
    wire  core__ibuf__io_inst_0_bits_xcpt1_gf_inst;
    wire  core__ibuf__io_inst_0_bits_xcpt1_ae_inst;
    wire  core__ibuf__io_inst_0_bits_replay;
    wire  core__ibuf__io_inst_0_bits_rvc;
    wire [31:0] core__ibuf__io_inst_0_bits_inst_bits;
    wire [4:0] core__ibuf__io_inst_0_bits_inst_rd;
    wire [4:0] core__ibuf__io_inst_0_bits_inst_rs1;
    wire [4:0] core__ibuf__io_inst_0_bits_inst_rs2;
    wire [31:0] core__ibuf__io_inst_0_bits_raw;

    wire[1:0]  core__ibuf__nReady  ;
    wire  core__ibuf___exp_io_rvc  ;
    reg  core__ibuf__nBufValid  ;
    reg[33:0]  core__ibuf__buf_pc  ;
    reg[31:0]  core__ibuf__buf_data  ;
    reg  core__ibuf__buf_xcpt_pf_inst  ;
    reg  core__ibuf__buf_xcpt_gf_inst  ;
    reg  core__ibuf__buf_xcpt_ae_inst  ;
    reg  core__ibuf__buf_replay  ;
    wire[1:0]  core__ibuf___GEN  ={1'h0,  core__ibuf__io_imem_bits_pc  [1]};
    wire[1:0]  core__ibuf___nIC_T_2  =2'h2-  core__ibuf___GEN  ;
    wire[1:0]  core__ibuf___GEN_0  ={1'h0,  core__ibuf__nBufValid  };
    wire[1:0]  core__ibuf___nICReady_T  =  core__ibuf__nReady  -  core__ibuf___GEN_0  ;
    wire  core__ibuf___nBufValid_T  =  core__ibuf__nReady  >=  core__ibuf___GEN_0  ;
    wire[1:0]  core__ibuf___nBufValid_T_6  =  core__ibuf___nIC_T_2  -  core__ibuf___nICReady_T  ;
    wire[190:0]  core__ibuf___icData_T_4  ={63'h0,{2{{2{  core__ibuf__io_imem_bits_data  [31:16]}}}},  core__ibuf__io_imem_bits_data  ,{2{  core__ibuf__io_imem_bits_data  [15:0]}}}<<{185'h0,  core__ibuf___GEN_0  -2'h2-  core__ibuf___GEN  ,4'h0};
    wire[62:0]  core__ibuf___icMask_T_2  =63'hFFFFFFFF<<{58'h0,  core__ibuf__nBufValid  ,4'h0};
    wire[31:0]  core__ibuf__inst  =  core__ibuf___icData_T_4  [95:64]&  core__ibuf___icMask_T_2  [31:0]|  core__ibuf__buf_data  &~(  core__ibuf___icMask_T_2  [31:0]);
    wire[3:0]  core__ibuf___valid_T  =4'h1<<(  core__ibuf__io_imem_valid   ?   core__ibuf___nIC_T_2  :2'h0)+  core__ibuf___GEN_0  ;
    wire[1:0]  core__ibuf___valid_T_1  =  core__ibuf___valid_T  [1:0]-2'h1;
    wire[1:0]  core__ibuf___bufMask_T_1  =(2'h1<<  core__ibuf___GEN_0  )-2'h1;
    wire[1:0]  core__ibuf__buf_replay_0  =  core__ibuf__buf_replay   ?   core__ibuf___bufMask_T_1  :2'h0;
    wire[1:0]  core__ibuf__ic_replay  =  core__ibuf__buf_replay_0  |(  core__ibuf__io_imem_bits_replay   ?   core__ibuf___valid_T_1  &~  core__ibuf___bufMask_T_1  :2'h0);
    wire  core__ibuf__full_insn  =  core__ibuf___exp_io_rvc  |  core__ibuf___valid_T_1  [1]|  core__ibuf__buf_replay_0  [0];
    wire[2:0]  core__ibuf___io_inst_0_bits_xcpt1_T_5  =  core__ibuf___exp_io_rvc   ? 3'h0:{  core__ibuf___bufMask_T_1  [1] ?   core__ibuf__buf_xcpt_pf_inst  :  core__ibuf__io_imem_bits_xcpt_pf_inst  ,  core__ibuf___bufMask_T_1  [1] ?   core__ibuf__buf_xcpt_gf_inst  :  core__ibuf__io_imem_bits_xcpt_gf_inst  ,  core__ibuf___bufMask_T_1  [1] ?   core__ibuf__buf_xcpt_ae_inst  :  core__ibuf__io_imem_bits_xcpt_ae_inst  };
    assign   core__ibuf__nReady  =  core__ibuf__full_insn   ? (  core__ibuf___exp_io_rvc   ? 2'h1:2'h2):2'h0;
    wire[63:0]  core__ibuf___buf_data_T_1  ={{2{  core__ibuf__io_imem_bits_data  [31:16]}},  core__ibuf__io_imem_bits_data  }>>{58'h0,  core__ibuf___GEN  +  core__ibuf___nICReady_T  ,4'h0};
    wire  core__ibuf___GEN_1  =  core__ibuf__io_imem_valid  &  core__ibuf___nBufValid_T  &  core__ibuf___nICReady_T  <  core__ibuf___nIC_T_2  &~(  core__ibuf___nBufValid_T_6  [1]);
    always @( posedge   core__ibuf__clock  )
    begin
        if (  core__ibuf__reset  )
            core__ibuf__nBufValid   <=1'h0;
        else
            core__ibuf__nBufValid   <=~  core__ibuf__io_kill  &(  core__ibuf__io_inst_0_ready   ? (  core__ibuf___GEN_1   ?   core__ibuf___nBufValid_T_6  [0]:~(  core__ibuf___nBufValid_T  |~  core__ibuf__nBufValid  )&  core__ibuf__nBufValid  -  core__ibuf__nReady  [0]):  core__ibuf__nBufValid  );
        if (  core__ibuf__io_inst_0_ready  &  core__ibuf___GEN_1  )
        begin
            core__ibuf__buf_pc   <=  core__ibuf__io_imem_bits_pc  &34'h3FFFFFFFC|  core__ibuf__io_imem_bits_pc  +{31'h0,  core__ibuf___nICReady_T  ,1'h0}&34'h3;
            core__ibuf__buf_data   <={16'h0,  core__ibuf___buf_data_T_1  [15:0]};
            core__ibuf__buf_xcpt_pf_inst   <=  core__ibuf__io_imem_bits_xcpt_pf_inst  ;
            core__ibuf__buf_xcpt_gf_inst   <=  core__ibuf__io_imem_bits_xcpt_gf_inst  ;
            core__ibuf__buf_xcpt_ae_inst   <=  core__ibuf__io_imem_bits_xcpt_ae_inst  ;
            core__ibuf__buf_replay   <=  core__ibuf__io_imem_bits_replay  ;
        end
    end


    wire [31:0] core__ibuf__exp__io_in;
    wire [31:0] core__ibuf__exp__io_out_bits;
    wire [4:0] core__ibuf__exp__io_out_rd;
    wire [4:0] core__ibuf__exp__io_out_rs1;
    wire [4:0] core__ibuf__exp__io_out_rs2;
    wire  core__ibuf__exp__io_rvc;

    reg[2:0]  core__ibuf__exp__casez_tmp  ;
    wire[2:0]  core__ibuf__exp___io_out_s_funct_T_2  ={  core__ibuf__exp__io_in  [12],  core__ibuf__exp__io_in  [6:5]};
    wire[2:0]  core__ibuf__exp___io_out_s_funct_T_4  ={  core__ibuf__exp___io_out_s_funct_T_2  ==3'h1,2'h0};
    always @(*)
    begin
        casez (  core__ibuf__exp___io_out_s_funct_T_2  )
            3 'b000:
                core__ibuf__exp__casez_tmp   =  core__ibuf__exp___io_out_s_funct_T_4  ;
            3 'b001:
                core__ibuf__exp__casez_tmp   =  core__ibuf__exp___io_out_s_funct_T_4  ;
            3 'b010:
                core__ibuf__exp__casez_tmp   =3'h6;
            3 'b011:
                core__ibuf__exp__casez_tmp   =3'h7;
            3 'b100:
                core__ibuf__exp__casez_tmp   =3'h0;
            3 'b101:
                core__ibuf__exp__casez_tmp   =3'h0;
            3 'b110:
                core__ibuf__exp__casez_tmp   =3'h2;
            default :
                core__ibuf__exp__casez_tmp   =3'h3;
        endcase
    end

    wire[3:0]  core__ibuf__exp___GEN  ={4{  core__ibuf__exp__io_in  [12]}};
    wire[6:0]  core__ibuf__exp__io_out_s_load_opc  =(|(  core__ibuf__exp__io_in  [11:7])) ? 7'h3:7'h1F;
    wire[4:0]  core__ibuf__exp___io_out_T_2  ={  core__ibuf__exp__io_in  [1:0],  core__ibuf__exp__io_in  [15:13]};
    wire  core__ibuf__exp___io_out_T_29  =  core__ibuf__exp___io_out_T_2  ==5'hE;
    wire  core__ibuf__exp___io_out_T_31  =  core__ibuf__exp___io_out_T_2  ==5'hF;
    wire  core__ibuf__exp___io_out_T_33  =  core__ibuf__exp___io_out_T_2  ==5'h10;
    wire  core__ibuf__exp___io_out_T_35  =  core__ibuf__exp___io_out_T_2  ==5'h11;
    wire  core__ibuf__exp___io_out_T_37  =  core__ibuf__exp___io_out_T_2  ==5'h12;
    wire  core__ibuf__exp___io_out_T_39  =  core__ibuf__exp___io_out_T_2  ==5'h13;
    wire  core__ibuf__exp___io_out_T_41  =  core__ibuf__exp___io_out_T_2  ==5'h14;
    wire[31:0]  core__ibuf__exp___io_out_T_42_bits  =  core__ibuf__exp___io_out_T_41   ? {7'h0,  core__ibuf__exp__io_in  [12] ? ((|(  core__ibuf__exp__io_in  [6:2])) ? {  core__ibuf__exp__io_in  [6:2],  core__ibuf__exp__io_in  [11:7],3'h0,  core__ibuf__exp__io_in  [11:7],7'h33}:(|(  core__ibuf__exp__io_in  [11:7])) ? {  core__ibuf__exp__io_in  [6:2],  core__ibuf__exp__io_in  [11:7],15'hE7}:{  core__ibuf__exp__io_in  [6:3],1'h1,  core__ibuf__exp__io_in  [11:7],15'h73}):{  core__ibuf__exp__io_in  [6:2],(|(  core__ibuf__exp__io_in  [6:2])) ? {8'h0,  core__ibuf__exp__io_in  [11:7],7'h33}:{  core__ibuf__exp__io_in  [11:7],(|(  core__ibuf__exp__io_in  [11:7])) ? 15'h67:15'h1F}}}:  core__ibuf__exp___io_out_T_39   ? {3'h0,  core__ibuf__exp__io_in  [4:2],  core__ibuf__exp__io_in  [12],  core__ibuf__exp__io_in  [6:5],11'h13,  core__ibuf__exp__io_in  [11:7],  core__ibuf__exp__io_out_s_load_opc  }:  core__ibuf__exp___io_out_T_37   ? {4'h0,  core__ibuf__exp__io_in  [3:2],  core__ibuf__exp__io_in  [12],  core__ibuf__exp__io_in  [6:4],10'h12,  core__ibuf__exp__io_in  [11:7],  core__ibuf__exp__io_out_s_load_opc  }:  core__ibuf__exp___io_out_T_35   ? {3'h0,  core__ibuf__exp__io_in  [4:2],  core__ibuf__exp__io_in  [12],  core__ibuf__exp__io_in  [6:5],11'h13,  core__ibuf__exp__io_in  [11:7],7'h7}:  core__ibuf__exp___io_out_T_33   ? {6'h0,  core__ibuf__exp__io_in  [12],  core__ibuf__exp__io_in  [6:2],  core__ibuf__exp__io_in  [11:7],3'h1,  core__ibuf__exp__io_in  [11:7],7'h13}:  core__ibuf__exp___io_out_T_31   ? {  core__ibuf__exp___GEN  ,  core__ibuf__exp__io_in  [6:5],  core__ibuf__exp__io_in  [2],7'h1,  core__ibuf__exp__io_in  [9:7],3'h1,  core__ibuf__exp__io_in  [11:10],  core__ibuf__exp__io_in  [4:3],  core__ibuf__exp__io_in  [12],7'h63}:  core__ibuf__exp___io_out_T_29   ? {  core__ibuf__exp___GEN  ,  core__ibuf__exp__io_in  [6:5],  core__ibuf__exp__io_in  [2],7'h1,  core__ibuf__exp__io_in  [9:7],3'h0,  core__ibuf__exp__io_in  [11:10],  core__ibuf__exp__io_in  [4:3],  core__ibuf__exp__io_in  [12],7'h63}:  core__ibuf__exp___io_out_T_2  ==5'hD ? {  core__ibuf__exp__io_in  [12],  core__ibuf__exp__io_in  [8],  core__ibuf__exp__io_in  [10:9],  core__ibuf__exp__io_in  [6],  core__ibuf__exp__io_in  [7],  core__ibuf__exp__io_in  [2],  core__ibuf__exp__io_in  [11],  core__ibuf__exp__io_in  [5:3],{9{  core__ibuf__exp__io_in  [12]}},12'h6F}:  core__ibuf__exp___io_out_T_2  ==5'hC ? ((&(  core__ibuf__exp__io_in  [11:10])) ? {1'h0,  core__ibuf__exp__io_in  [6:5]==2'h0,7'h1,  core__ibuf__exp__io_in  [4:2],2'h1,  core__ibuf__exp__io_in  [9:7],  core__ibuf__exp__casez_tmp  ,2'h1,  core__ibuf__exp__io_in  [9:7],3'h3,  core__ibuf__exp__io_in  [12],3'h3}:{  core__ibuf__exp__io_in  [11:10]==2'h2 ? {{7{  core__ibuf__exp__io_in  [12]}},  core__ibuf__exp__io_in  [6:2],2'h1,  core__ibuf__exp__io_in  [9:7],5'h1D}:{1'h0,  core__ibuf__exp__io_in  [11:10]==2'h1,4'h0,  core__ibuf__exp__io_in  [12],  core__ibuf__exp__io_in  [6:2],2'h1,  core__ibuf__exp__io_in  [9:7],5'h15},  core__ibuf__exp__io_in  [9:7],7'h13}):  core__ibuf__exp___io_out_T_2  ==5'hB ? {{3{  core__ibuf__exp__io_in  [12]}},  core__ibuf__exp__io_in  [11:7]==5'h0|  core__ibuf__exp__io_in  [11:7]==5'h2 ? {  core__ibuf__exp__io_in  [4:3],  core__ibuf__exp__io_in  [5],  core__ibuf__exp__io_in  [2],  core__ibuf__exp__io_in  [6],4'h0,  core__ibuf__exp__io_in  [11:7],3'h0,  core__ibuf__exp__io_in  [11:7],(|{{7{  core__ibuf__exp__io_in  [12]}},  core__ibuf__exp__io_in  [6:2]}) ? 7'h13:7'h1F}:{{12{  core__ibuf__exp__io_in  [12]}},  core__ibuf__exp__io_in  [6:2],  core__ibuf__exp__io_in  [11:7],3'h3,{{7{  core__ibuf__exp__io_in  [12]}},  core__ibuf__exp__io_in  [6:2]}==12'h0,3'h7}}:  core__ibuf__exp___io_out_T_2  ==5'hA ? {{7{  core__ibuf__exp__io_in  [12]}},  core__ibuf__exp__io_in  [6:2],8'h0,  core__ibuf__exp__io_in  [11:7],7'h13}:  core__ibuf__exp___io_out_T_2  ==5'h9 ? {{7{  core__ibuf__exp__io_in  [12]}},  core__ibuf__exp__io_in  [6:2],  core__ibuf__exp__io_in  [11:7],3'h0,  core__ibuf__exp__io_in  [11:7],4'h3,  core__ibuf__exp__io_in  [11:7]==5'h0,2'h3}:  core__ibuf__exp___io_out_T_2  ==5'h8 ? {{7{  core__ibuf__exp__io_in  [12]}},  core__ibuf__exp__io_in  [6:2],  core__ibuf__exp__io_in  [11:7],3'h0,  core__ibuf__exp__io_in  [11:7],7'h13}:  core__ibuf__exp___io_out_T_2  ==5'h7 ? {4'h0,  core__ibuf__exp__io_in  [6:5],  core__ibuf__exp__io_in  [12],2'h1,  core__ibuf__exp__io_in  [4:2],2'h1,  core__ibuf__exp__io_in  [9:7],3'h3,  core__ibuf__exp__io_in  [11:10],10'h23}:  core__ibuf__exp___io_out_T_2  ==5'h6 ? {5'h0,  core__ibuf__exp__io_in  [5],  core__ibuf__exp__io_in  [12],2'h1,  core__ibuf__exp__io_in  [4:2],2'h1,  core__ibuf__exp__io_in  [9:7],3'h2,  core__ibuf__exp__io_in  [11:10],  core__ibuf__exp__io_in  [6],9'h23}:  core__ibuf__exp___io_out_T_2  ==5'h5 ? {4'h0,  core__ibuf__exp__io_in  [6:5],  core__ibuf__exp__io_in  [12],2'h1,  core__ibuf__exp__io_in  [4:2],2'h1,  core__ibuf__exp__io_in  [9:7],3'h3,  core__ibuf__exp__io_in  [11:10],10'h27}:  core__ibuf__exp___io_out_T_2  ==5'h4 ? {5'h0,  core__ibuf__exp__io_in  [5],  core__ibuf__exp__io_in  [12],2'h1,  core__ibuf__exp__io_in  [4:2],2'h1,  core__ibuf__exp__io_in  [9:7],3'h2,  core__ibuf__exp__io_in  [11:10],  core__ibuf__exp__io_in  [6],9'h3F}:  core__ibuf__exp___io_out_T_2  ==5'h3 ? {4'h0,  core__ibuf__exp__io_in  [6:5],  core__ibuf__exp__io_in  [12:10],5'h1,  core__ibuf__exp__io_in  [9:7],5'hD,  core__ibuf__exp__io_in  [4:2],7'h3}:  core__ibuf__exp___io_out_T_2  ==5'h2 ? {5'h0,  core__ibuf__exp__io_in  [5],  core__ibuf__exp__io_in  [12:10],  core__ibuf__exp__io_in  [6],4'h1,  core__ibuf__exp__io_in  [9:7],5'h9,  core__ibuf__exp__io_in  [4:2],7'h3}:  core__ibuf__exp___io_out_T_2  ==5'h1 ? {4'h0,  core__ibuf__exp__io_in  [6:5],  core__ibuf__exp__io_in  [12:10],5'h1,  core__ibuf__exp__io_in  [9:7],5'hD,  core__ibuf__exp__io_in  [4:2],7'h7}:{2'h0,  core__ibuf__exp__io_in  [10:7],  core__ibuf__exp__io_in  [12:11],  core__ibuf__exp__io_in  [5],  core__ibuf__exp__io_in  [6],12'h41,  core__ibuf__exp__io_in  [4:2],(|(  core__ibuf__exp__io_in  [12:5])) ? 7'h13:7'h1F};
    wire  core__ibuf__exp___io_out_T_43  =  core__ibuf__exp___io_out_T_2  ==5'h15;
    wire  core__ibuf__exp___io_out_T_45  =  core__ibuf__exp___io_out_T_2  ==5'h16;
    wire  core__ibuf__exp___io_out_T_47  =  core__ibuf__exp___io_out_T_2  ==5'h17;
    wire  core__ibuf__exp___io_out_T_49  =  core__ibuf__exp___io_out_T_2  ==5'h18;
    wire  core__ibuf__exp___io_out_T_51  =  core__ibuf__exp___io_out_T_2  ==5'h19;
    wire  core__ibuf__exp___io_out_T_53  =  core__ibuf__exp___io_out_T_2  ==5'h1A;
    wire  core__ibuf__exp___io_out_T_55  =  core__ibuf__exp___io_out_T_2  ==5'h1B;
    wire  core__ibuf__exp___io_out_T_57  =  core__ibuf__exp___io_out_T_2  ==5'h1C;
    wire  core__ibuf__exp___io_out_T_59  =  core__ibuf__exp___io_out_T_2  ==5'h1D;
    wire  core__ibuf__exp___io_out_T_61  =  core__ibuf__exp___io_out_T_2  ==5'h1E;
    reg[4:0]  core__ibuf__exp__casez_tmp_0  ;
    wire[4:0]  core__ibuf__exp__io_out_s_7_rd  ={2'h1,  core__ibuf__exp__io_in  [4:2]};
    always @(*)
    begin
        casez (  core__ibuf__exp___io_out_T_2  )
            5 'b00000:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_out_s_7_rd  ;
            5 'b00001:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_out_s_7_rd  ;
            5 'b00010:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_out_s_7_rd  ;
            5 'b00011:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_out_s_7_rd  ;
            5 'b00100:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_out_s_7_rd  ;
            5 'b00101:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_out_s_7_rd  ;
            5 'b00110:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_out_s_7_rd  ;
            5 'b00111:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_out_s_7_rd  ;
            5 'b01000:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_in  [11:7];
            5 'b01001:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_in  [11:7];
            5 'b01010:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_in  [11:7];
            5 'b01011:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_in  [11:7];
            5 'b01100:
                core__ibuf__exp__casez_tmp_0   ={2'h1,  core__ibuf__exp__io_in  [9:7]};
            5 'b01101:
                core__ibuf__exp__casez_tmp_0   =5'h0;
            5 'b01110:
                core__ibuf__exp__casez_tmp_0   ={2'h1,  core__ibuf__exp__io_in  [9:7]};
            5 'b01111:
                core__ibuf__exp__casez_tmp_0   =5'h0;
            5 'b10000:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_in  [11:7];
            5 'b10001:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_in  [11:7];
            5 'b10010:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_in  [11:7];
            5 'b10011:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_in  [11:7];
            5 'b10100:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_in  [12] ? ((|(  core__ibuf__exp__io_in  [6:2])) ?   core__ibuf__exp__io_in  [11:7]:5'h1):(|(  core__ibuf__exp__io_in  [6:2])) ?   core__ibuf__exp__io_in  [11:7]:5'h0;
            5 'b10101:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_in  [11:7];
            5 'b10110:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_in  [11:7];
            5 'b10111:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_in  [11:7];
            5 'b11000:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_in  [11:7];
            5 'b11001:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_in  [11:7];
            5 'b11010:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_in  [11:7];
            5 'b11011:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_in  [11:7];
            5 'b11100:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_in  [11:7];
            5 'b11101:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_in  [11:7];
            5 'b11110:
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_in  [11:7];
            default :
                core__ibuf__exp__casez_tmp_0   =  core__ibuf__exp__io_in  [11:7];
        endcase
    end

    reg[4:0]  core__ibuf__exp__casez_tmp_1  ;
    always @(*)
    begin
        casez (  core__ibuf__exp___io_out_T_2  )
            5 'b00000:
                core__ibuf__exp__casez_tmp_1   =5'h2;
            5 'b00001:
                core__ibuf__exp__casez_tmp_1   ={2'h1,  core__ibuf__exp__io_in  [9:7]};
            5 'b00010:
                core__ibuf__exp__casez_tmp_1   ={2'h1,  core__ibuf__exp__io_in  [9:7]};
            5 'b00011:
                core__ibuf__exp__casez_tmp_1   ={2'h1,  core__ibuf__exp__io_in  [9:7]};
            5 'b00100:
                core__ibuf__exp__casez_tmp_1   ={2'h1,  core__ibuf__exp__io_in  [9:7]};
            5 'b00101:
                core__ibuf__exp__casez_tmp_1   ={2'h1,  core__ibuf__exp__io_in  [9:7]};
            5 'b00110:
                core__ibuf__exp__casez_tmp_1   ={2'h1,  core__ibuf__exp__io_in  [9:7]};
            5 'b00111:
                core__ibuf__exp__casez_tmp_1   ={2'h1,  core__ibuf__exp__io_in  [9:7]};
            5 'b01000:
                core__ibuf__exp__casez_tmp_1   =  core__ibuf__exp__io_in  [11:7];
            5 'b01001:
                core__ibuf__exp__casez_tmp_1   =  core__ibuf__exp__io_in  [11:7];
            5 'b01010:
                core__ibuf__exp__casez_tmp_1   =5'h0;
            5 'b01011:
                core__ibuf__exp__casez_tmp_1   =  core__ibuf__exp__io_in  [11:7];
            5 'b01100:
                core__ibuf__exp__casez_tmp_1   ={2'h1,  core__ibuf__exp__io_in  [9:7]};
            5 'b01101:
                core__ibuf__exp__casez_tmp_1   ={2'h1,  core__ibuf__exp__io_in  [9:7]};
            5 'b01110:
                core__ibuf__exp__casez_tmp_1   ={2'h1,  core__ibuf__exp__io_in  [9:7]};
            5 'b01111:
                core__ibuf__exp__casez_tmp_1   ={2'h1,  core__ibuf__exp__io_in  [9:7]};
            5 'b10000:
                core__ibuf__exp__casez_tmp_1   =  core__ibuf__exp__io_in  [11:7];
            5 'b10001:
                core__ibuf__exp__casez_tmp_1   =5'h2;
            5 'b10010:
                core__ibuf__exp__casez_tmp_1   =5'h2;
            5 'b10011:
                core__ibuf__exp__casez_tmp_1   =5'h2;
            5 'b10100:
                core__ibuf__exp__casez_tmp_1   =  core__ibuf__exp__io_in  [12]|~(|(  core__ibuf__exp__io_in  [6:2])) ?   core__ibuf__exp__io_in  [11:7]:5'h0;
            5 'b10101:
                core__ibuf__exp__casez_tmp_1   =5'h2;
            5 'b10110:
                core__ibuf__exp__casez_tmp_1   =5'h2;
            5 'b10111:
                core__ibuf__exp__casez_tmp_1   =5'h2;
            5 'b11000:
                core__ibuf__exp__casez_tmp_1   =  core__ibuf__exp__io_in  [19:15];
            5 'b11001:
                core__ibuf__exp__casez_tmp_1   =  core__ibuf__exp__io_in  [19:15];
            5 'b11010:
                core__ibuf__exp__casez_tmp_1   =  core__ibuf__exp__io_in  [19:15];
            5 'b11011:
                core__ibuf__exp__casez_tmp_1   =  core__ibuf__exp__io_in  [19:15];
            5 'b11100:
                core__ibuf__exp__casez_tmp_1   =  core__ibuf__exp__io_in  [19:15];
            5 'b11101:
                core__ibuf__exp__casez_tmp_1   =  core__ibuf__exp__io_in  [19:15];
            5 'b11110:
                core__ibuf__exp__casez_tmp_1   =  core__ibuf__exp__io_in  [19:15];
            default :
                core__ibuf__exp__casez_tmp_1   =  core__ibuf__exp__io_in  [19:15];
        endcase
    end

    assign   core__ibuf__exp__io_out_bits  =(&  core__ibuf__exp___io_out_T_2  )|  core__ibuf__exp___io_out_T_61  |  core__ibuf__exp___io_out_T_59  |  core__ibuf__exp___io_out_T_57  |  core__ibuf__exp___io_out_T_55  |  core__ibuf__exp___io_out_T_53  |  core__ibuf__exp___io_out_T_51  |  core__ibuf__exp___io_out_T_49   ?   core__ibuf__exp__io_in  :  core__ibuf__exp___io_out_T_47   ? {3'h0,  core__ibuf__exp__io_in  [9:7],  core__ibuf__exp__io_in  [12],  core__ibuf__exp__io_in  [6:2],8'h13,  core__ibuf__exp__io_in  [11:10],10'h23}:  core__ibuf__exp___io_out_T_45   ? {4'h0,  core__ibuf__exp__io_in  [8:7],  core__ibuf__exp__io_in  [12],  core__ibuf__exp__io_in  [6:2],8'h12,  core__ibuf__exp__io_in  [11:9],9'h23}:  core__ibuf__exp___io_out_T_43   ? {3'h0,  core__ibuf__exp__io_in  [9:7],  core__ibuf__exp__io_in  [12],  core__ibuf__exp__io_in  [6:2],8'h13,  core__ibuf__exp__io_in  [11:10],10'h27}:  core__ibuf__exp___io_out_T_42_bits  ;
    assign   core__ibuf__exp__io_out_rd  =  core__ibuf__exp__casez_tmp_0  ;
    assign   core__ibuf__exp__io_out_rs1  =  core__ibuf__exp__casez_tmp_1  ;
    assign   core__ibuf__exp__io_out_rs2  =(&  core__ibuf__exp___io_out_T_2  )|  core__ibuf__exp___io_out_T_61  |  core__ibuf__exp___io_out_T_59  |  core__ibuf__exp___io_out_T_57  |  core__ibuf__exp___io_out_T_55  |  core__ibuf__exp___io_out_T_53  |  core__ibuf__exp___io_out_T_51  |  core__ibuf__exp___io_out_T_49   ?   core__ibuf__exp__io_in  [24:20]:  core__ibuf__exp___io_out_T_47  |  core__ibuf__exp___io_out_T_45  |  core__ibuf__exp___io_out_T_43  |  core__ibuf__exp___io_out_T_41  |  core__ibuf__exp___io_out_T_39  |  core__ibuf__exp___io_out_T_37  |  core__ibuf__exp___io_out_T_35  |  core__ibuf__exp___io_out_T_33   ?   core__ibuf__exp__io_in  [6:2]:  core__ibuf__exp___io_out_T_31  |  core__ibuf__exp___io_out_T_29   ? 5'h0:{2'h1,  core__ibuf__exp__io_in  [4:2]};
    assign   core__ibuf__exp__io_rvc  =  core__ibuf__exp__io_in  [1:0]!=2'h3;
    assign core__ibuf__exp__io_in = core__ibuf__inst;
    assign core__ibuf__io_inst_0_bits_inst_bits = core__ibuf__exp__io_out_bits;
    assign core__ibuf__io_inst_0_bits_inst_rd = core__ibuf__exp__io_out_rd;
    assign core__ibuf__io_inst_0_bits_inst_rs1 = core__ibuf__exp__io_out_rs1;
    assign core__ibuf__io_inst_0_bits_inst_rs2 = core__ibuf__exp__io_out_rs2;
    assign core__ibuf___exp_io_rvc = core__ibuf__exp__io_rvc;

    assign   core__ibuf__io_imem_ready  =  core__ibuf__io_inst_0_ready  &  core__ibuf___nBufValid_T  &(  core__ibuf___nICReady_T  >=  core__ibuf___nIC_T_2  |~(  core__ibuf___nBufValid_T_6  [1]));
    assign   core__ibuf__io_pc  =  core__ibuf__nBufValid   ?   core__ibuf__buf_pc  :  core__ibuf__io_imem_bits_pc  ;
    assign   core__ibuf__io_inst_0_valid  =  core__ibuf___valid_T_1  [0]&  core__ibuf__full_insn  ;
    assign   core__ibuf__io_inst_0_bits_xcpt0_pf_inst  =  core__ibuf___bufMask_T_1  [0] ?   core__ibuf__buf_xcpt_pf_inst  :  core__ibuf__io_imem_bits_xcpt_pf_inst  ;
    assign   core__ibuf__io_inst_0_bits_xcpt0_gf_inst  =  core__ibuf___bufMask_T_1  [0] ?   core__ibuf__buf_xcpt_gf_inst  :  core__ibuf__io_imem_bits_xcpt_gf_inst  ;
    assign   core__ibuf__io_inst_0_bits_xcpt0_ae_inst  =  core__ibuf___bufMask_T_1  [0] ?   core__ibuf__buf_xcpt_ae_inst  :  core__ibuf__io_imem_bits_xcpt_ae_inst  ;
    assign   core__ibuf__io_inst_0_bits_xcpt1_pf_inst  =  core__ibuf___io_inst_0_bits_xcpt1_T_5  [2];
    assign   core__ibuf__io_inst_0_bits_xcpt1_gf_inst  =  core__ibuf___io_inst_0_bits_xcpt1_T_5  [1];
    assign   core__ibuf__io_inst_0_bits_xcpt1_ae_inst  =  core__ibuf___io_inst_0_bits_xcpt1_T_5  [0];
    assign   core__ibuf__io_inst_0_bits_replay  =  core__ibuf__ic_replay  [0]|~  core__ibuf___exp_io_rvc  &  core__ibuf__ic_replay  [1];
    assign   core__ibuf__io_inst_0_bits_rvc  =  core__ibuf___exp_io_rvc  ;
    assign   core__ibuf__io_inst_0_bits_raw  =  core__ibuf__inst  ;
    assign core__ibuf__clock = core__clock;
    assign core__ibuf__reset = core__reset;
    assign core__io_imem_resp_ready = core__ibuf__io_imem_ready;
    assign core__ibuf__io_imem_valid = core__io_imem_resp_valid;
    assign core__ibuf__io_imem_bits_pc = core__io_imem_resp_bits_pc;
    assign core__ibuf__io_imem_bits_data = core__io_imem_resp_bits_data;
    assign core__ibuf__io_imem_bits_xcpt_pf_inst = core__io_imem_resp_bits_xcpt_pf_inst;
    assign core__ibuf__io_imem_bits_xcpt_gf_inst = core__io_imem_resp_bits_xcpt_gf_inst;
    assign core__ibuf__io_imem_bits_xcpt_ae_inst = core__io_imem_resp_bits_xcpt_ae_inst;
    assign core__ibuf__io_imem_bits_replay = core__io_imem_resp_bits_replay;
    assign core__ibuf__io_kill = core__ibuf_io_kill;
    assign core___ibuf_io_pc = core__ibuf__io_pc;
    assign core__ibuf__io_inst_0_ready = ~core___ctrl_stalld_T_28;
    assign core___ibuf_io_inst_0_valid = core__ibuf__io_inst_0_valid;
    assign core___ibuf_io_inst_0_bits_xcpt0_pf_inst = core__ibuf__io_inst_0_bits_xcpt0_pf_inst;
    assign core___ibuf_io_inst_0_bits_xcpt0_gf_inst = core__ibuf__io_inst_0_bits_xcpt0_gf_inst;
    assign core___ibuf_io_inst_0_bits_xcpt0_ae_inst = core__ibuf__io_inst_0_bits_xcpt0_ae_inst;
    assign core___ibuf_io_inst_0_bits_xcpt1_pf_inst = core__ibuf__io_inst_0_bits_xcpt1_pf_inst;
    assign core___ibuf_io_inst_0_bits_xcpt1_gf_inst = core__ibuf__io_inst_0_bits_xcpt1_gf_inst;
    assign core___ibuf_io_inst_0_bits_xcpt1_ae_inst = core__ibuf__io_inst_0_bits_xcpt1_ae_inst;
    assign core___ibuf_io_inst_0_bits_replay = core__ibuf__io_inst_0_bits_replay;
    assign core___ibuf_io_inst_0_bits_rvc = core__ibuf__io_inst_0_bits_rvc;
    assign core___ibuf_io_inst_0_bits_inst_bits = core__ibuf__io_inst_0_bits_inst_bits;
    assign core___ibuf_io_inst_0_bits_inst_rd = core__ibuf__io_inst_0_bits_inst_rd;
    assign core___ibuf_io_inst_0_bits_inst_rs1 = core__ibuf__io_inst_0_bits_inst_rs1;
    assign core___ibuf_io_inst_0_bits_inst_rs2 = core__ibuf__io_inst_0_bits_inst_rs2;
    assign core___ibuf_io_inst_0_bits_raw = core__ibuf__io_inst_0_bits_raw;


    wire [4:0] core__rf_ext__R0_addr;
    wire  core__rf_ext__R0_en;
    wire  core__rf_ext__R0_clk;
    wire [63:0] core__rf_ext__R0_data;
    wire [4:0] core__rf_ext__R1_addr;
    wire  core__rf_ext__R1_en;
    wire  core__rf_ext__R1_clk;
    wire [63:0] core__rf_ext__R1_data;
    wire [4:0] core__rf_ext__W0_addr;
    wire  core__rf_ext__W0_en;
    wire  core__rf_ext__W0_clk;
    wire [63:0] core__rf_ext__W0_data;

    reg[63:0]  core__rf_ext__Memory  [0:30];
    always @( posedge   core__rf_ext__W0_clk  )
    begin
        if (  core__rf_ext__W0_en  &1'h1)
            core__rf_ext__Memory   [  core__rf_ext__W0_addr  ]<=  core__rf_ext__W0_data  ;
    end

    assign   core__rf_ext__R0_data  =  core__rf_ext__R0_en   ?   core__rf_ext__Memory  [  core__rf_ext__R0_addr  ]:64'bx;
    assign   core__rf_ext__R1_data  =  core__rf_ext__R1_en   ?   core__rf_ext__Memory  [  core__rf_ext__R1_addr  ]:64'bx;
    assign core__rf_ext__R0_addr = ~core___ibuf_io_inst_0_bits_inst_rs2;
    assign core__rf_ext__R0_en = 1'h1;
    assign core__rf_ext__R0_clk = core__clock;
    assign core___rf_ext_R0_data = core__rf_ext__R0_data;
    assign core__rf_ext__R1_addr = ~core___ibuf_io_inst_0_bits_inst_rs1;
    assign core__rf_ext__R1_en = 1'h1;
    assign core__rf_ext__R1_clk = core__clock;
    assign core___rf_ext_R1_data = core__rf_ext__R1_data;
    assign core__rf_ext__W0_addr = ~core__rf_waddr;
    assign core__rf_ext__W0_en = core__rf_wen&(|core__rf_waddr);
    assign core__rf_ext__W0_clk = core__clock;
    assign core__rf_ext__W0_data = core__rf_wdata;


    wire  core__csr__clock;
    wire  core__csr__reset;
    wire  core__csr__io_ungated_clock;
    wire  core__csr__io_interrupts_debug;
    wire  core__csr__io_interrupts_mtip;
    wire  core__csr__io_interrupts_msip;
    wire  core__csr__io_interrupts_meip;
    wire  core__csr__io_hartid;
    wire [11:0] core__csr__io_rw_addr;
    wire [2:0] core__csr__io_rw_cmd;
    wire [63:0] core__csr__io_rw_rdata;
    wire [63:0] core__csr__io_rw_wdata;
    wire [31:0] core__csr__io_decode_0_inst;
    wire  core__csr__io_decode_0_read_illegal;
    wire  core__csr__io_decode_0_write_illegal;
    wire  core__csr__io_decode_0_write_flush;
    wire  core__csr__io_decode_0_system_illegal;
    wire  core__csr__io_decode_0_virtual_access_illegal;
    wire  core__csr__io_decode_0_virtual_system_illegal;
    wire  core__csr__io_csr_stall;
    wire  core__csr__io_eret;
    wire  core__csr__io_singleStep;
    wire  core__csr__io_status_debug;
    wire  core__csr__io_status_wfi;
    wire [31:0] core__csr__io_status_isa;
    wire  core__csr__io_status_dv;
    wire  core__csr__io_status_v;
    wire [33:0] core__csr__io_evec;
    wire  core__csr__io_exception;
    wire  core__csr__io_retire;
    wire [63:0] core__csr__io_cause;
    wire [33:0] core__csr__io_pc;
    wire [33:0] core__csr__io_tval;
    wire  core__csr__io_gva;
    wire [63:0] core__csr__io_time;
    wire  core__csr__io_interrupt;
    wire [63:0] core__csr__io_interrupt_cause;
    wire  core__csr__io_bp_0_control_action;
    wire [1:0] core__csr__io_bp_0_control_tmatch;
    wire  core__csr__io_bp_0_control_x;
    wire  core__csr__io_bp_0_control_w;
    wire  core__csr__io_bp_0_control_r;
    wire [32:0] core__csr__io_bp_0_address;
    wire  core__csr__io_pmp_cfg_l_0;
    wire  core__csr__io_pmp_cfg_l_1;
    wire  core__csr__io_pmp_cfg_l_2;
    wire  core__csr__io_pmp_cfg_l_3;
    wire  core__csr__io_pmp_cfg_l_4;
    wire  core__csr__io_pmp_cfg_l_5;
    wire  core__csr__io_pmp_cfg_l_6;
    wire  core__csr__io_pmp_cfg_l_7;
    wire [1:0] core__csr__io_pmp_cfg_a_0;
    wire [1:0] core__csr__io_pmp_cfg_a_1;
    wire [1:0] core__csr__io_pmp_cfg_a_2;
    wire [1:0] core__csr__io_pmp_cfg_a_3;
    wire [1:0] core__csr__io_pmp_cfg_a_4;
    wire [1:0] core__csr__io_pmp_cfg_a_5;
    wire [1:0] core__csr__io_pmp_cfg_a_6;
    wire [1:0] core__csr__io_pmp_cfg_a_7;
    wire  core__csr__io_pmp_cfg_x_0;
    wire  core__csr__io_pmp_cfg_x_1;
    wire  core__csr__io_pmp_cfg_x_2;
    wire  core__csr__io_pmp_cfg_x_3;
    wire  core__csr__io_pmp_cfg_x_4;
    wire  core__csr__io_pmp_cfg_x_5;
    wire  core__csr__io_pmp_cfg_x_6;
    wire  core__csr__io_pmp_cfg_x_7;
    wire  core__csr__io_pmp_cfg_w_0;
    wire  core__csr__io_pmp_cfg_w_1;
    wire  core__csr__io_pmp_cfg_w_2;
    wire  core__csr__io_pmp_cfg_w_3;
    wire  core__csr__io_pmp_cfg_w_4;
    wire  core__csr__io_pmp_cfg_w_5;
    wire  core__csr__io_pmp_cfg_w_6;
    wire  core__csr__io_pmp_cfg_w_7;
    wire  core__csr__io_pmp_cfg_r_0;
    wire  core__csr__io_pmp_cfg_r_1;
    wire  core__csr__io_pmp_cfg_r_2;
    wire  core__csr__io_pmp_cfg_r_3;
    wire  core__csr__io_pmp_cfg_r_4;
    wire  core__csr__io_pmp_cfg_r_5;
    wire  core__csr__io_pmp_cfg_r_6;
    wire  core__csr__io_pmp_cfg_r_7;
    wire [29:0] core__csr__io_pmp_addr_0;
    wire [29:0] core__csr__io_pmp_addr_1;
    wire [29:0] core__csr__io_pmp_addr_2;
    wire [29:0] core__csr__io_pmp_addr_3;
    wire [29:0] core__csr__io_pmp_addr_4;
    wire [29:0] core__csr__io_pmp_addr_5;
    wire [29:0] core__csr__io_pmp_addr_6;
    wire [29:0] core__csr__io_pmp_addr_7;
    wire [31:0] core__csr__io_pmp_mask_0;
    wire [31:0] core__csr__io_pmp_mask_1;
    wire [31:0] core__csr__io_pmp_mask_2;
    wire [31:0] core__csr__io_pmp_mask_3;
    wire [31:0] core__csr__io_pmp_mask_4;
    wire [31:0] core__csr__io_pmp_mask_5;
    wire [31:0] core__csr__io_pmp_mask_6;
    wire [31:0] core__csr__io_pmp_mask_7;
    wire  core__csr__io_inhibit_cycle;
    wire [31:0] core__csr__io_inst_0;
    wire  core__csr__io_trace_valid_0;
    wire [33:0] core__csr__io_trace_iaddr_0;
    wire [31:0] core__csr__io_trace_insn_0;
    wire  core__csr__io_trace_exception_0;
    wire [63:0] core__csr__io_customCSRs_0_value;

    wire[63:0]  core__csr___io_rw_rdata_T_262  ;
    reg  core__csr__io_status_cease_r  ;
    wire  core__csr__io_singleStep_0  ;
    reg  core__csr__reg_mstatus_v  ;
    reg  core__csr__reg_mstatus_mpv  ;
    reg  core__csr__reg_mstatus_gva  ;
    reg[1:0]  core__csr__reg_mstatus_mpp  ;
    reg  core__csr__reg_mstatus_mpie  ;
    reg  core__csr__reg_mstatus_mie  ;
    reg  core__csr__reg_dcsr_ebreakm  ;
    reg[2:0]  core__csr__reg_dcsr_cause  ;
    reg  core__csr__reg_dcsr_v  ;
    reg  core__csr__reg_dcsr_step  ;
    reg  core__csr__reg_debug  ;
    reg[33:0]  core__csr__reg_dpc  ;
    reg[63:0]  core__csr__reg_dscratch0  ;
    reg  core__csr__reg_singleStepped  ;
    reg  core__csr__reg_bp_0_control_dmode  ;
    reg  core__csr__reg_bp_0_control_action  ;
    reg[1:0]  core__csr__reg_bp_0_control_tmatch  ;
    reg  core__csr__reg_bp_0_control_x  ;
    reg  core__csr__reg_bp_0_control_w  ;
    reg  core__csr__reg_bp_0_control_r  ;
    reg[32:0]  core__csr__reg_bp_0_address  ;
    reg  core__csr__reg_pmp_cfg_l_0  ;
    reg  core__csr__reg_pmp_cfg_l_1  ;
    reg  core__csr__reg_pmp_cfg_l_2  ;
    reg  core__csr__reg_pmp_cfg_l_3  ;
    reg  core__csr__reg_pmp_cfg_l_4  ;
    reg  core__csr__reg_pmp_cfg_l_5  ;
    reg  core__csr__reg_pmp_cfg_l_6  ;
    reg  core__csr__reg_pmp_cfg_l_7  ;
    reg[1:0]  core__csr__reg_pmp_cfg_a_0  ;
    reg[1:0]  core__csr__reg_pmp_cfg_a_1  ;
    reg[1:0]  core__csr__reg_pmp_cfg_a_2  ;
    reg[1:0]  core__csr__reg_pmp_cfg_a_3  ;
    reg[1:0]  core__csr__reg_pmp_cfg_a_4  ;
    reg[1:0]  core__csr__reg_pmp_cfg_a_5  ;
    reg[1:0]  core__csr__reg_pmp_cfg_a_6  ;
    reg[1:0]  core__csr__reg_pmp_cfg_a_7  ;
    reg  core__csr__reg_pmp_cfg_x_0  ;
    reg  core__csr__reg_pmp_cfg_x_1  ;
    reg  core__csr__reg_pmp_cfg_x_2  ;
    reg  core__csr__reg_pmp_cfg_x_3  ;
    reg  core__csr__reg_pmp_cfg_x_4  ;
    reg  core__csr__reg_pmp_cfg_x_5  ;
    reg  core__csr__reg_pmp_cfg_x_6  ;
    reg  core__csr__reg_pmp_cfg_x_7  ;
    reg  core__csr__reg_pmp_cfg_w_0  ;
    reg  core__csr__reg_pmp_cfg_w_1  ;
    reg  core__csr__reg_pmp_cfg_w_2  ;
    reg  core__csr__reg_pmp_cfg_w_3  ;
    reg  core__csr__reg_pmp_cfg_w_4  ;
    reg  core__csr__reg_pmp_cfg_w_5  ;
    reg  core__csr__reg_pmp_cfg_w_6  ;
    reg  core__csr__reg_pmp_cfg_w_7  ;
    reg  core__csr__reg_pmp_cfg_r_0  ;
    reg  core__csr__reg_pmp_cfg_r_1  ;
    reg  core__csr__reg_pmp_cfg_r_2  ;
    reg  core__csr__reg_pmp_cfg_r_3  ;
    reg  core__csr__reg_pmp_cfg_r_4  ;
    reg  core__csr__reg_pmp_cfg_r_5  ;
    reg  core__csr__reg_pmp_cfg_r_6  ;
    reg  core__csr__reg_pmp_cfg_r_7  ;
    reg[29:0]  core__csr__reg_pmp_addr_0  ;
    reg[29:0]  core__csr__reg_pmp_addr_1  ;
    reg[29:0]  core__csr__reg_pmp_addr_2  ;
    reg[29:0]  core__csr__reg_pmp_addr_3  ;
    reg[29:0]  core__csr__reg_pmp_addr_4  ;
    reg[29:0]  core__csr__reg_pmp_addr_5  ;
    reg[29:0]  core__csr__reg_pmp_addr_6  ;
    reg[29:0]  core__csr__reg_pmp_addr_7  ;
    reg[63:0]  core__csr__reg_mie  ;
    reg[33:0]  core__csr__reg_mepc  ;
    reg[63:0]  core__csr__reg_mcause  ;
    reg[33:0]  core__csr__reg_mtval  ;
    reg[63:0]  core__csr__reg_mscratch  ;
    reg[31:0]  core__csr__reg_mtvec  ;
    reg  core__csr__reg_wfi  ;
    reg[2:0]  core__csr__reg_mcountinhibit  ;
    reg[5:0]  core__csr__small_0  ;
    reg[57:0]  core__csr__large_0  ;
    wire[63:0]  core__csr__value  ={  core__csr__large_0  ,  core__csr__small_0  };
    reg[5:0]  core__csr__small_1  ;
    reg[57:0]  core__csr__large_1  ;
    wire[63:0]  core__csr__io_time_0  ={  core__csr__large_1  ,  core__csr__small_1  };
    wire[15:0]  core__csr__read_mip  ={4'h0,  core__csr__io_interrupts_meip  ,3'h0,  core__csr__io_interrupts_mtip  ,3'h0,  core__csr__io_interrupts_msip  ,3'h0};
    wire[15:0]  core__csr___GEN  =  core__csr__reg_mie  [15:0]&  core__csr__read_mip  ;
    wire[15:0]  core__csr__m_interrupts  =  core__csr__reg_mstatus_mie   ?   core__csr___GEN  :16'h0;
    wire[29:0]  core__csr___GEN_0  ={  core__csr__reg_pmp_addr_0  [28:0],  core__csr__reg_pmp_cfg_a_0  [0]};
    wire[29:0]  core__csr___GEN_1  ={  core__csr__reg_pmp_addr_1  [28:0],  core__csr__reg_pmp_cfg_a_1  [0]};
    wire[29:0]  core__csr___GEN_2  ={  core__csr__reg_pmp_addr_2  [28:0],  core__csr__reg_pmp_cfg_a_2  [0]};
    wire[29:0]  core__csr___GEN_3  ={  core__csr__reg_pmp_addr_3  [28:0],  core__csr__reg_pmp_cfg_a_3  [0]};
    wire[29:0]  core__csr___GEN_4  ={  core__csr__reg_pmp_addr_4  [28:0],  core__csr__reg_pmp_cfg_a_4  [0]};
    wire[29:0]  core__csr___GEN_5  ={  core__csr__reg_pmp_addr_5  [28:0],  core__csr__reg_pmp_cfg_a_5  [0]};
    wire[29:0]  core__csr___GEN_6  ={  core__csr__reg_pmp_addr_6  [28:0],  core__csr__reg_pmp_cfg_a_6  [0]};
    wire[29:0]  core__csr___GEN_7  ={  core__csr__reg_pmp_addr_7  [28:0],  core__csr__reg_pmp_cfg_a_7  [0]};
    reg[63:0]  core__csr__reg_misa  ;
    wire[31:0]  core__csr___read_mtvec_T_5  =  core__csr__reg_mtvec  &{24'hFFFFFF,~(  core__csr__reg_mtvec  [0] ? 8'hFE:8'h2)};
    wire[33:0]  core__csr___io_evec_T_20  =~  core__csr__reg_mepc  ;
    wire[1:0]  core__csr___GEN_8  ={~(  core__csr__reg_misa  [2]),1'h1};
    wire[33:0]  core__csr___GEN_9  =~{  core__csr___io_evec_T_20  [33:2],  core__csr___io_evec_T_20  [1:0]|  core__csr___GEN_8  };
    wire[33:0]  core__csr___io_evec_T_10  =~  core__csr__reg_dpc  ;
    wire[33:0]  core__csr___GEN_10  =~{  core__csr___io_evec_T_10  [33:2],  core__csr___io_evec_T_10  [1:0]|  core__csr___GEN_8  };
    reg[63:0]  core__csr__reg_custom_0  ;
    wire[11:0]  core__csr__decoded_decoded_invInputs  =~  core__csr__io_rw_addr  ;
    wire[11:0]  core__csr___decoded_decoded_T  ={  core__csr__decoded_decoded_invInputs  [0],  core__csr__decoded_decoded_invInputs  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__decoded_decoded_invInputs  [4],  core__csr__decoded_decoded_invInputs  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__decoded_decoded_invInputs  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__decoded_decoded_invInputs  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[11:0]  core__csr___decoded_decoded_T_2  ={  core__csr__io_rw_addr  [0],  core__csr__decoded_decoded_invInputs  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__decoded_decoded_invInputs  [4],  core__csr__decoded_decoded_invInputs  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__decoded_decoded_invInputs  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__decoded_decoded_invInputs  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[11:0]  core__csr___decoded_decoded_T_4  ={  core__csr__decoded_decoded_invInputs  [0],  core__csr__decoded_decoded_invInputs  [1],  core__csr__io_rw_addr  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__decoded_decoded_invInputs  [4],  core__csr__decoded_decoded_invInputs  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__decoded_decoded_invInputs  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__decoded_decoded_invInputs  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[11:0]  core__csr___decoded_decoded_T_6  ={  core__csr__io_rw_addr  [0],  core__csr__decoded_decoded_invInputs  [1],  core__csr__io_rw_addr  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__decoded_decoded_invInputs  [4],  core__csr__decoded_decoded_invInputs  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__decoded_decoded_invInputs  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__decoded_decoded_invInputs  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[10:0]  core__csr___decoded_decoded_T_8  ={  core__csr__decoded_decoded_invInputs  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__decoded_decoded_invInputs  [4],  core__csr__io_rw_addr  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__decoded_decoded_invInputs  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__decoded_decoded_invInputs  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[11:0]  core__csr___decoded_decoded_T_68  ={  core__csr__decoded_decoded_invInputs  [0],  core__csr__decoded_decoded_invInputs  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__decoded_decoded_invInputs  [4],  core__csr__decoded_decoded_invInputs  [5],  core__csr__io_rw_addr  [6],  core__csr__decoded_decoded_invInputs  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__decoded_decoded_invInputs  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[11:0]  core__csr___decoded_decoded_T_70  ={  core__csr__io_rw_addr  [0],  core__csr__decoded_decoded_invInputs  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__decoded_decoded_invInputs  [4],  core__csr__decoded_decoded_invInputs  [5],  core__csr__io_rw_addr  [6],  core__csr__decoded_decoded_invInputs  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__decoded_decoded_invInputs  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[11:0]  core__csr___decoded_decoded_T_72  ={  core__csr__decoded_decoded_invInputs  [0],  core__csr__io_rw_addr  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__decoded_decoded_invInputs  [4],  core__csr__decoded_decoded_invInputs  [5],  core__csr__io_rw_addr  [6],  core__csr__decoded_decoded_invInputs  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__decoded_decoded_invInputs  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[11:0]  core__csr___decoded_decoded_T_74  ={  core__csr__io_rw_addr  [0],  core__csr__io_rw_addr  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__decoded_decoded_invInputs  [4],  core__csr__decoded_decoded_invInputs  [5],  core__csr__io_rw_addr  [6],  core__csr__decoded_decoded_invInputs  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__decoded_decoded_invInputs  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[10:0]  core__csr___decoded_decoded_T_78  ={  core__csr__decoded_decoded_invInputs  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__decoded_decoded_invInputs  [4],  core__csr__io_rw_addr  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__io_rw_addr  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__decoded_decoded_invInputs  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[11:0]  core__csr___decoded_decoded_T_82  ={  core__csr__decoded_decoded_invInputs  [0],  core__csr__decoded_decoded_invInputs  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__io_rw_addr  [4],  core__csr__io_rw_addr  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__io_rw_addr  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__decoded_decoded_invInputs  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[11:0]  core__csr___decoded_decoded_T_84  ={  core__csr__io_rw_addr  [0],  core__csr__decoded_decoded_invInputs  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__io_rw_addr  [4],  core__csr__io_rw_addr  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__io_rw_addr  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__decoded_decoded_invInputs  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[11:0]  core__csr___decoded_decoded_T_86  ={  core__csr__decoded_decoded_invInputs  [0],  core__csr__io_rw_addr  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__io_rw_addr  [4],  core__csr__io_rw_addr  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__io_rw_addr  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__decoded_decoded_invInputs  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[11:0]  core__csr___decoded_decoded_T_88  ={  core__csr__io_rw_addr  [0],  core__csr__io_rw_addr  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__io_rw_addr  [4],  core__csr__io_rw_addr  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__io_rw_addr  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__decoded_decoded_invInputs  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[11:0]  core__csr___decoded_decoded_T_90  ={  core__csr__decoded_decoded_invInputs  [0],  core__csr__decoded_decoded_invInputs  [1],  core__csr__io_rw_addr  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__io_rw_addr  [4],  core__csr__io_rw_addr  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__io_rw_addr  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__decoded_decoded_invInputs  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[11:0]  core__csr___decoded_decoded_T_92  ={  core__csr__io_rw_addr  [0],  core__csr__decoded_decoded_invInputs  [1],  core__csr__io_rw_addr  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__io_rw_addr  [4],  core__csr__io_rw_addr  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__io_rw_addr  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__decoded_decoded_invInputs  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[11:0]  core__csr___decoded_decoded_T_94  ={  core__csr__decoded_decoded_invInputs  [0],  core__csr__io_rw_addr  [1],  core__csr__io_rw_addr  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__io_rw_addr  [4],  core__csr__io_rw_addr  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__io_rw_addr  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__decoded_decoded_invInputs  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[11:0]  core__csr___decoded_decoded_T_96  ={  core__csr__io_rw_addr  [0],  core__csr__io_rw_addr  [1],  core__csr__io_rw_addr  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__io_rw_addr  [4],  core__csr__io_rw_addr  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__io_rw_addr  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__decoded_decoded_invInputs  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[11:0]  core__csr___decoded_decoded_T_116  ={  core__csr__io_rw_addr  [0],  core__csr__decoded_decoded_invInputs  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__decoded_decoded_invInputs  [4],  core__csr__io_rw_addr  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__io_rw_addr  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__io_rw_addr  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[11:0]  core__csr___decoded_decoded_T_118  ={  core__csr__decoded_decoded_invInputs  [0],  core__csr__io_rw_addr  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__decoded_decoded_invInputs  [4],  core__csr__io_rw_addr  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__io_rw_addr  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__io_rw_addr  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[11:0]  core__csr___decoded_decoded_T_122  ={  core__csr__decoded_decoded_invInputs  [0],  core__csr__decoded_decoded_invInputs  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__io_rw_addr  [4],  core__csr__io_rw_addr  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__io_rw_addr  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__io_rw_addr  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[11:0]  core__csr___decoded_decoded_T_124  ={  core__csr__io_rw_addr  [0],  core__csr__decoded_decoded_invInputs  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__io_rw_addr  [4],  core__csr__io_rw_addr  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__io_rw_addr  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__io_rw_addr  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[10:0]  core__csr___decoded_decoded_T_126  ={  core__csr__io_rw_addr  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__io_rw_addr  [4],  core__csr__io_rw_addr  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__io_rw_addr  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__io_rw_addr  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[5:0]  core__csr___decoded_decoded_T_128  ={  core__csr__io_rw_addr  [6],  core__csr__io_rw_addr  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__io_rw_addr  [10],  core__csr__decoded_decoded_invInputs  [11]};
    wire[10:0]  core__csr___decoded_decoded_T_130  ={  core__csr__decoded_decoded_invInputs  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__decoded_decoded_invInputs  [4],  core__csr__decoded_decoded_invInputs  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__decoded_decoded_invInputs  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__decoded_decoded_invInputs  [10],  core__csr__io_rw_addr  [11]};
    wire[11:0]  core__csr___decoded_decoded_T_132  ={  core__csr__decoded_decoded_invInputs  [0],  core__csr__io_rw_addr  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__decoded_decoded_invInputs  [4],  core__csr__decoded_decoded_invInputs  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__decoded_decoded_invInputs  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__decoded_decoded_invInputs  [10],  core__csr__io_rw_addr  [11]};
    wire[63:0]  core__csr___wdata_T_2  =(  core__csr__io_rw_cmd  [1] ?   core__csr___io_rw_rdata_T_262  :64'h0)|  core__csr__io_rw_wdata  ;
    wire[63:0]  core__csr___wdata_T_6  =~((&(  core__csr__io_rw_cmd  [1:0])) ?   core__csr__io_rw_wdata  :64'h0);
    wire  core__csr__system_insn  =  core__csr__io_rw_cmd  ==3'h4;
    wire[11:0]  core__csr___GEN_11  =~  core__csr__io_rw_addr  ;
    wire  core__csr__insn_call  =  core__csr__system_insn  &(&{  core__csr___GEN_11  [0],  core__csr___GEN_11  [1],  core__csr___GEN_11  [2],  core__csr___GEN_11  [3],  core__csr___GEN_11  [4],  core__csr___GEN_11  [5],  core__csr___GEN_11  [6],  core__csr___GEN_11  [7],  core__csr___GEN_11  [8],  core__csr___GEN_11  [9],  core__csr___GEN_11  [10],  core__csr___GEN_11  [11]});
    wire  core__csr__insn_break  =  core__csr__system_insn  &(&{  core__csr__io_rw_addr  [0],  core__csr___GEN_11  [1],  core__csr___GEN_11  [2],  core__csr___GEN_11  [3],  core__csr___GEN_11  [4],  core__csr___GEN_11  [5],  core__csr___GEN_11  [6],  core__csr___GEN_11  [7],  core__csr___GEN_11  [8],  core__csr___GEN_11  [9],  core__csr___GEN_11  [10],  core__csr___GEN_11  [11]});
    wire  core__csr__insn_ret  =  core__csr__system_insn  &(|{&{  core__csr___GEN_11  [2],  core__csr___GEN_11  [3],  core__csr___GEN_11  [4],  core__csr___GEN_11  [5],  core__csr___GEN_11  [6],  core__csr___GEN_11  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr___GEN_11  [10],  core__csr___GEN_11  [11]},&{  core__csr__io_rw_addr  [10],  core__csr___GEN_11  [11]}});
    wire[9:0]  core__csr__decoded_invInputs_1  =~(  core__csr__io_decode_0_inst  [31:22]);
    wire[31:0]  core__csr___GEN_12  ={27'h0,  core__csr__io_decode_0_inst  [24:20]};
    wire[31:0]  core__csr___io_decode_0_virtual_access_illegal_T_3  =32'h0>>  core__csr___GEN_12  ;
    wire[31:0]  core__csr___io_decode_0_virtual_access_illegal_T_6  =32'h0>>  core__csr___GEN_12  ;
    wire  core__csr__csr_exists  =  core__csr__io_decode_0_inst  [31:20]==12'h7A0|  core__csr__io_decode_0_inst  [31:20]==12'h7A1|  core__csr__io_decode_0_inst  [31:20]==12'h7A2|  core__csr__io_decode_0_inst  [31:20]==12'h7A3|  core__csr__io_decode_0_inst  [31:20]==12'h301|  core__csr__io_decode_0_inst  [31:20]==12'h300|  core__csr__io_decode_0_inst  [31:20]==12'h305|  core__csr__io_decode_0_inst  [31:20]==12'h344|  core__csr__io_decode_0_inst  [31:20]==12'h304|  core__csr__io_decode_0_inst  [31:20]==12'h340|  core__csr__io_decode_0_inst  [31:20]==12'h341|  core__csr__io_decode_0_inst  [31:20]==12'h343|  core__csr__io_decode_0_inst  [31:20]==12'h342|  core__csr__io_decode_0_inst  [31:20]==12'hF14|  core__csr__io_decode_0_inst  [31:20]==12'h7B0|  core__csr__io_decode_0_inst  [31:20]==12'h7B1|  core__csr__io_decode_0_inst  [31:20]==12'h7B2|  core__csr__io_decode_0_inst  [31:20]==12'h320|  core__csr__io_decode_0_inst  [31:20]==12'hB00|  core__csr__io_decode_0_inst  [31:20]==12'hB02|  core__csr__io_decode_0_inst  [31:20]==12'h323|  core__csr__io_decode_0_inst  [31:20]==12'hB03|  core__csr__io_decode_0_inst  [31:20]==12'hC03|  core__csr__io_decode_0_inst  [31:20]==12'h324|  core__csr__io_decode_0_inst  [31:20]==12'hB04|  core__csr__io_decode_0_inst  [31:20]==12'hC04|  core__csr__io_decode_0_inst  [31:20]==12'h325|  core__csr__io_decode_0_inst  [31:20]==12'hB05|  core__csr__io_decode_0_inst  [31:20]==12'hC05|  core__csr__io_decode_0_inst  [31:20]==12'h326|  core__csr__io_decode_0_inst  [31:20]==12'hB06|  core__csr__io_decode_0_inst  [31:20]==12'hC06|  core__csr__io_decode_0_inst  [31:20]==12'h327|  core__csr__io_decode_0_inst  [31:20]==12'hB07|  core__csr__io_decode_0_inst  [31:20]==12'hC07|  core__csr__io_decode_0_inst  [31:20]==12'h328|  core__csr__io_decode_0_inst  [31:20]==12'hB08|  core__csr__io_decode_0_inst  [31:20]==12'hC08|  core__csr__io_decode_0_inst  [31:20]==12'h329|  core__csr__io_decode_0_inst  [31:20]==12'hB09|  core__csr__io_decode_0_inst  [31:20]==12'hC09|  core__csr__io_decode_0_inst  [31:20]==12'h32A|  core__csr__io_decode_0_inst  [31:20]==12'hB0A|  core__csr__io_decode_0_inst  [31:20]==12'hC0A|  core__csr__io_decode_0_inst  [31:20]==12'h32B|  core__csr__io_decode_0_inst  [31:20]==12'hB0B|  core__csr__io_decode_0_inst  [31:20]==12'hC0B|  core__csr__io_decode_0_inst  [31:20]==12'h32C|  core__csr__io_decode_0_inst  [31:20]==12'hB0C|  core__csr__io_decode_0_inst  [31:20]==12'hC0C|  core__csr__io_decode_0_inst  [31:20]==12'h32D|  core__csr__io_decode_0_inst  [31:20]==12'hB0D|  core__csr__io_decode_0_inst  [31:20]==12'hC0D|  core__csr__io_decode_0_inst  [31:20]==12'h32E|  core__csr__io_decode_0_inst  [31:20]==12'hB0E|  core__csr__io_decode_0_inst  [31:20]==12'hC0E|  core__csr__io_decode_0_inst  [31:20]==12'h32F|  core__csr__io_decode_0_inst  [31:20]==12'hB0F|  core__csr__io_decode_0_inst  [31:20]==12'hC0F|  core__csr__io_decode_0_inst  [31:20]==12'h330|  core__csr__io_decode_0_inst  [31:20]==12'hB10|  core__csr__io_decode_0_inst  [31:20]==12'hC10|  core__csr__io_decode_0_inst  [31:20]==12'h331|  core__csr__io_decode_0_inst  [31:20]==12'hB11|  core__csr__io_decode_0_inst  [31:20]==12'hC11|  core__csr__io_decode_0_inst  [31:20]==12'h332|  core__csr__io_decode_0_inst  [31:20]==12'hB12|  core__csr__io_decode_0_inst  [31:20]==12'hC12|  core__csr__io_decode_0_inst  [31:20]==12'h333|  core__csr__io_decode_0_inst  [31:20]==12'hB13|  core__csr__io_decode_0_inst  [31:20]==12'hC13|  core__csr__io_decode_0_inst  [31:20]==12'h334|  core__csr__io_decode_0_inst  [31:20]==12'hB14|  core__csr__io_decode_0_inst  [31:20]==12'hC14|  core__csr__io_decode_0_inst  [31:20]==12'h335|  core__csr__io_decode_0_inst  [31:20]==12'hB15|  core__csr__io_decode_0_inst  [31:20]==12'hC15|  core__csr__io_decode_0_inst  [31:20]==12'h336|  core__csr__io_decode_0_inst  [31:20]==12'hB16|  core__csr__io_decode_0_inst  [31:20]==12'hC16|  core__csr__io_decode_0_inst  [31:20]==12'h337|  core__csr__io_decode_0_inst  [31:20]==12'hB17|  core__csr__io_decode_0_inst  [31:20]==12'hC17|  core__csr__io_decode_0_inst  [31:20]==12'h338|  core__csr__io_decode_0_inst  [31:20]==12'hB18|  core__csr__io_decode_0_inst  [31:20]==12'hC18|  core__csr__io_decode_0_inst  [31:20]==12'h339|  core__csr__io_decode_0_inst  [31:20]==12'hB19|  core__csr__io_decode_0_inst  [31:20]==12'hC19|  core__csr__io_decode_0_inst  [31:20]==12'h33A|  core__csr__io_decode_0_inst  [31:20]==12'hB1A|  core__csr__io_decode_0_inst  [31:20]==12'hC1A|  core__csr__io_decode_0_inst  [31:20]==12'h33B|  core__csr__io_decode_0_inst  [31:20]==12'hB1B|  core__csr__io_decode_0_inst  [31:20]==12'hC1B|  core__csr__io_decode_0_inst  [31:20]==12'h33C|  core__csr__io_decode_0_inst  [31:20]==12'hB1C|  core__csr__io_decode_0_inst  [31:20]==12'hC1C|  core__csr__io_decode_0_inst  [31:20]==12'h33D|  core__csr__io_decode_0_inst  [31:20]==12'hB1D|  core__csr__io_decode_0_inst  [31:20]==12'hC1D|  core__csr__io_decode_0_inst  [31:20]==12'h33E|  core__csr__io_decode_0_inst  [31:20]==12'hB1E|  core__csr__io_decode_0_inst  [31:20]==12'hC1E|  core__csr__io_decode_0_inst  [31:20]==12'h33F|  core__csr__io_decode_0_inst  [31:20]==12'hB1F|  core__csr__io_decode_0_inst  [31:20]==12'hC1F|  core__csr__io_decode_0_inst  [31:20]==12'hC00|  core__csr__io_decode_0_inst  [31:20]==12'hC02|  core__csr__io_decode_0_inst  [31:20]==12'h3A0|  core__csr__io_decode_0_inst  [31:20]==12'h3A2|  core__csr__io_decode_0_inst  [31:20]==12'h3B0|  core__csr__io_decode_0_inst  [31:20]==12'h3B1|  core__csr__io_decode_0_inst  [31:20]==12'h3B2|  core__csr__io_decode_0_inst  [31:20]==12'h3B3|  core__csr__io_decode_0_inst  [31:20]==12'h3B4|  core__csr__io_decode_0_inst  [31:20]==12'h3B5|  core__csr__io_decode_0_inst  [31:20]==12'h3B6|  core__csr__io_decode_0_inst  [31:20]==12'h3B7|  core__csr__io_decode_0_inst  [31:20]==12'h3B8|  core__csr__io_decode_0_inst  [31:20]==12'h3B9|  core__csr__io_decode_0_inst  [31:20]==12'h3BA|  core__csr__io_decode_0_inst  [31:20]==12'h3BB|  core__csr__io_decode_0_inst  [31:20]==12'h3BC|  core__csr__io_decode_0_inst  [31:20]==12'h3BD|  core__csr__io_decode_0_inst  [31:20]==12'h3BE|  core__csr__io_decode_0_inst  [31:20]==12'h3BF|  core__csr__io_decode_0_inst  [31:20]==12'h7C1|  core__csr__io_decode_0_inst  [31:20]==12'hF12|  core__csr__io_decode_0_inst  [31:20]==12'hF11|  core__csr__io_decode_0_inst  [31:20]==12'hF13|  core__csr__io_decode_0_inst  [31:20]==12'hF15;
    wire[5:0]  core__csr__io_decode_0_read_illegal_invInputs  =~(  core__csr__io_decode_0_inst  [31:26]);
    wire[11:0]  core__csr__io_decode_0_write_flush_addr_m  ={  core__csr__io_decode_0_inst  [31:30],  core__csr__io_decode_0_inst  [29:20]|10'h300};
    wire[63:0]  core__csr__cause  =  core__csr__insn_call   ? {60'h0,{3'h1,~  core__csr__reg_mstatus_v  }-4'h8}:  core__csr__insn_break   ? 64'h3:  core__csr__io_cause  ;
    wire  core__csr___causeIsDebugTrigger_T_2  =  core__csr__cause  [7:0]==8'hE;
    wire  core__csr__causeIsDebugInt  =  core__csr__cause  [63]&  core__csr___causeIsDebugTrigger_T_2  ;
    wire  core__csr__causeIsDebugTrigger  =~(  core__csr__cause  [63])&  core__csr___causeIsDebugTrigger_T_2  ;
    wire  core__csr__trapToDebug  =  core__csr__reg_singleStepped  |  core__csr__causeIsDebugInt  |  core__csr__causeIsDebugTrigger  |~(  core__csr__cause  [63])&  core__csr__insn_break  &  core__csr__reg_dcsr_ebreakm  |  core__csr__reg_debug  ;
    wire  core__csr___exception_T  =  core__csr__insn_call  |  core__csr__insn_break  ;
    assign   core__csr__io_singleStep_0  =  core__csr__reg_dcsr_step  &~  core__csr__reg_debug  ;
    wire  core__csr__exception  =  core__csr___exception_T  |  core__csr__io_exception  ;
    wire[2:0]  core__csr___GEN_13  ={1'h0,{1'h0,  core__csr__insn_ret  }+{1'h0,  core__csr__insn_call  }}+{1'h0,{1'h0,  core__csr__insn_break  }+{1'h0,  core__csr__io_exception  }};
    always @( posedge   core__csr__clock  )
    begin
        if (~  core__csr__reset  &(|(  core__csr___GEN_13  [2:1])))
        begin
            if (1)
                $display("Assertion failed: these conditions must be mutually exclusive\n    at CSR.scala:1010 assert(PopCount(insn_ret :: insn_call :: insn_break :: io.exception :: Nil) <= 1.U, \"these conditions must be mutually exclusive\")\n");
            if (1)
                $display("");
        end
        if (~  core__csr__reset  &~(~  core__csr__reg_singleStepped  |~  core__csr__io_retire  ))
        begin
            if (1)
                $display("Assertion failed\n    at CSR.scala:1019 assert(!reg_singleStepped || io.retire === 0.U)\n");
            if (1)
                $display("");
        end
    end

    wire  core__csr___GEN_14  =  core__csr__io_rw_addr  [10]&  core__csr__io_rw_addr  [7];
    wire  core__csr__io_csr_stall_0  =  core__csr__reg_wfi  |  core__csr__io_status_cease_r  ;
    wire[63:0]  core__csr___io_rw_rdata_T_137  =((&  core__csr___decoded_decoded_T_116  ) ? {4'h2,  core__csr__reg_bp_0_control_dmode  ,46'h40000000000,  core__csr__reg_bp_0_control_action  ,3'h0,  core__csr__reg_bp_0_control_tmatch  ,4'h8,  core__csr__reg_bp_0_control_x  ,  core__csr__reg_bp_0_control_w  ,  core__csr__reg_bp_0_control_r  }:64'h0)|((&  core__csr___decoded_decoded_T_118  ) ? {{31{  core__csr__reg_bp_0_address  [32]}},  core__csr__reg_bp_0_address  }:64'h0)|((&  core__csr___decoded_decoded_T_2  ) ?   core__csr__reg_misa  :64'h0)|((&  core__csr___decoded_decoded_T  ) ? {24'h0,  core__csr__reg_mstatus_mpv  ,  core__csr__reg_mstatus_gva  ,25'h0,  core__csr__reg_mstatus_mpp  ,3'h0,  core__csr__reg_mstatus_mpie  ,3'h0,  core__csr__reg_mstatus_mie  ,3'h0}:64'h0)|((&  core__csr___decoded_decoded_T_6  ) ? {32'h0,  core__csr___read_mtvec_T_5  }:64'h0);
    wire[63:0]  core__csr___io_rw_rdata_T_143  ={  core__csr___io_rw_rdata_T_137  [63:16],  core__csr___io_rw_rdata_T_137  [15:0]|((&{  core__csr__io_rw_addr  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__decoded_decoded_invInputs  [4],  core__csr__decoded_decoded_invInputs  [5],  core__csr__io_rw_addr  [6],  core__csr__decoded_decoded_invInputs  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__decoded_decoded_invInputs  [10],  core__csr__decoded_decoded_invInputs  [11]}) ?   core__csr__read_mip  :16'h0)}|((&  core__csr___decoded_decoded_T_4  ) ?   core__csr__reg_mie  :64'h0)|((&  core__csr___decoded_decoded_T_68  ) ?   core__csr__reg_mscratch  :64'h0)|((&  core__csr___decoded_decoded_T_70  ) ? {{30{  core__csr___GEN_9  [33]}},  core__csr___GEN_9  }:64'h0)|((&  core__csr___decoded_decoded_T_74  ) ? {{30{  core__csr__reg_mtval  [33]}},  core__csr__reg_mtval  }:64'h0)|((&  core__csr___decoded_decoded_T_72  ) ?   core__csr__reg_mcause  :64'h0);
    wire[63:0]  core__csr___io_rw_rdata_T_147  ={  core__csr___io_rw_rdata_T_143  [63:32],{  core__csr___io_rw_rdata_T_143  [31:1],  core__csr___io_rw_rdata_T_143  [0]|(&{  core__csr__decoded_decoded_invInputs  [0],  core__csr__decoded_decoded_invInputs  [1],  core__csr__io_rw_addr  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__io_rw_addr  [4],  core__csr__decoded_decoded_invInputs  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__decoded_decoded_invInputs  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__io_rw_addr  [10],  core__csr__io_rw_addr  [11]})&  core__csr__io_hartid  }|((&  core__csr___decoded_decoded_T_122  ) ? {16'h4000,  core__csr__reg_dcsr_ebreakm  ,6'h0,  core__csr__reg_dcsr_cause  ,  core__csr__reg_dcsr_v  ,2'h0,  core__csr__reg_dcsr_step  ,2'h3}:32'h0)}|((&  core__csr___decoded_decoded_T_124  ) ? {{30{  core__csr___GEN_10  [33]}},  core__csr___GEN_10  }:64'h0)|((&  core__csr___decoded_decoded_T_126  ) ?   core__csr__reg_dscratch0  :64'h0);
    wire[63:0]  core__csr___io_rw_rdata_T_241  ={  core__csr___io_rw_rdata_T_147  [63:3],  core__csr___io_rw_rdata_T_147  [2:0]|((&  core__csr___decoded_decoded_T_8  ) ?   core__csr__reg_mcountinhibit  :3'h0)}|((&  core__csr___decoded_decoded_T_130  ) ?   core__csr__io_time_0  :64'h0)|((&  core__csr___decoded_decoded_T_132  ) ?   core__csr__value  :64'h0)|((&{  core__csr__decoded_decoded_invInputs  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__decoded_decoded_invInputs  [4],  core__csr__decoded_decoded_invInputs  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__decoded_decoded_invInputs  [7],  core__csr__decoded_decoded_invInputs  [8],  core__csr__decoded_decoded_invInputs  [9],  core__csr__io_rw_addr  [10],  core__csr__io_rw_addr  [11]}) ?   core__csr__io_time_0  :64'h0)|((&{  core__csr__decoded_decoded_invInputs  [0],  core__csr__io_rw_addr  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__decoded_decoded_invInputs  [4],  core__csr__decoded_decoded_invInputs  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__decoded_decoded_invInputs  [7],  core__csr__decoded_decoded_invInputs  [8],  core__csr__decoded_decoded_invInputs  [9],  core__csr__io_rw_addr  [10],  core__csr__io_rw_addr  [11]}) ?   core__csr__value  :64'h0)|((&  core__csr___decoded_decoded_T_78  ) ? {  core__csr__reg_pmp_cfg_l_7  ,2'h0,  core__csr__reg_pmp_cfg_a_7  ,  core__csr__reg_pmp_cfg_x_7  ,  core__csr__reg_pmp_cfg_w_7  ,  core__csr__reg_pmp_cfg_r_7  ,  core__csr__reg_pmp_cfg_l_6  ,2'h0,  core__csr__reg_pmp_cfg_a_6  ,  core__csr__reg_pmp_cfg_x_6  ,  core__csr__reg_pmp_cfg_w_6  ,  core__csr__reg_pmp_cfg_r_6  ,  core__csr__reg_pmp_cfg_l_5  ,2'h0,  core__csr__reg_pmp_cfg_a_5  ,  core__csr__reg_pmp_cfg_x_5  ,  core__csr__reg_pmp_cfg_w_5  ,  core__csr__reg_pmp_cfg_r_5  ,  core__csr__reg_pmp_cfg_l_4  ,2'h0,  core__csr__reg_pmp_cfg_a_4  ,  core__csr__reg_pmp_cfg_x_4  ,  core__csr__reg_pmp_cfg_w_4  ,  core__csr__reg_pmp_cfg_r_4  ,  core__csr__reg_pmp_cfg_l_3  ,2'h0,  core__csr__reg_pmp_cfg_a_3  ,  core__csr__reg_pmp_cfg_x_3  ,  core__csr__reg_pmp_cfg_w_3  ,  core__csr__reg_pmp_cfg_r_3  ,  core__csr__reg_pmp_cfg_l_2  ,2'h0,  core__csr__reg_pmp_cfg_a_2  ,  core__csr__reg_pmp_cfg_x_2  ,  core__csr__reg_pmp_cfg_w_2  ,  core__csr__reg_pmp_cfg_r_2  ,  core__csr__reg_pmp_cfg_l_1  ,2'h0,  core__csr__reg_pmp_cfg_a_1  ,  core__csr__reg_pmp_cfg_x_1  ,  core__csr__reg_pmp_cfg_w_1  ,  core__csr__reg_pmp_cfg_r_1  ,  core__csr__reg_pmp_cfg_l_0  ,2'h0,  core__csr__reg_pmp_cfg_a_0  ,  core__csr__reg_pmp_cfg_x_0  ,  core__csr__reg_pmp_cfg_w_0  ,  core__csr__reg_pmp_cfg_r_0  }:64'h0);
    wire[29:0]  core__csr___GEN_15  =  core__csr___io_rw_rdata_T_241  [29:0]|((&  core__csr___decoded_decoded_T_82  ) ?   core__csr__reg_pmp_addr_0  :30'h0)|((&  core__csr___decoded_decoded_T_84  ) ?   core__csr__reg_pmp_addr_1  :30'h0)|((&  core__csr___decoded_decoded_T_86  ) ?   core__csr__reg_pmp_addr_2  :30'h0)|((&  core__csr___decoded_decoded_T_88  ) ?   core__csr__reg_pmp_addr_3  :30'h0)|((&  core__csr___decoded_decoded_T_90  ) ?   core__csr__reg_pmp_addr_4  :30'h0)|((&  core__csr___decoded_decoded_T_92  ) ?   core__csr__reg_pmp_addr_5  :30'h0)|((&  core__csr___decoded_decoded_T_94  ) ?   core__csr__reg_pmp_addr_6  :30'h0)|((&  core__csr___decoded_decoded_T_96  ) ?   core__csr__reg_pmp_addr_7  :30'h0);
    assign   core__csr___io_rw_rdata_T_262  =((&  core__csr___decoded_decoded_T_128  ) ?   core__csr__reg_custom_0  :64'h0)|((&{  core__csr__io_rw_addr  [0],  core__csr__io_rw_addr  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__io_rw_addr  [4],  core__csr__decoded_decoded_invInputs  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__decoded_decoded_invInputs  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__io_rw_addr  [10],  core__csr__io_rw_addr  [11]}) ? 64'h20181004:64'h0)|{  core__csr___io_rw_rdata_T_241  [63:30],  core__csr___GEN_15  [29:1],  core__csr___GEN_15  [0]|(&{  core__csr__decoded_decoded_invInputs  [0],  core__csr__io_rw_addr  [1],  core__csr__decoded_decoded_invInputs  [2],  core__csr__decoded_decoded_invInputs  [3],  core__csr__io_rw_addr  [4],  core__csr__decoded_decoded_invInputs  [5],  core__csr__decoded_decoded_invInputs  [6],  core__csr__decoded_decoded_invInputs  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr__io_rw_addr  [10],  core__csr__io_rw_addr  [11]})};
    wire  core__csr___csr_wen_T_4  =  core__csr__io_rw_cmd  ==3'h6|(&  core__csr__io_rw_cmd  )|  core__csr__io_rw_cmd  ==3'h5;
    wire[5:0]  core__csr___GEN_16  =  core__csr___wdata_T_2  [5:0]&  core__csr___wdata_T_6  [5:0];
    wire[47:0]  core__csr___newBPC_T_8  =((  core__csr__io_rw_cmd  [1] ? {  core__csr__reg_bp_0_control_dmode  ,46'h40000000000,  core__csr__reg_bp_0_control_action  }:48'h0)|  core__csr__io_rw_wdata  [59:12])&~((&(  core__csr__io_rw_cmd  [1:0])) ?   core__csr__io_rw_wdata  [59:12]:48'h0);
    wire  core__csr__dMode  =  core__csr___newBPC_T_8  [47]&  core__csr__reg_debug  ;
    wire[6:0]  core__csr__nextSmall  ={1'h0,  core__csr__small_0  }+{6'h0,  core__csr__io_retire  };
    wire  core__csr___GEN_17  =~  core__csr__insn_ret  |  core__csr___GEN_14  ;
    wire[31:0]  core__csr___new_dcsr_WIRE  =  core__csr___wdata_T_2  [31:0]&  core__csr___wdata_T_6  [31:0];
    wire[63:0]  core__csr__wdata  =  core__csr___wdata_T_2  &  core__csr___wdata_T_6  ;
    wire[33:0]  core__csr__epc  ={  core__csr__io_pc  [33:1],1'h0};
    wire  core__csr___GEN_18  =  core__csr__exception  &  core__csr__trapToDebug  &~  core__csr__reg_debug  ;
    wire  core__csr___GEN_19  =~  core__csr__exception  |  core__csr__trapToDebug  ;
    wire[33:0]  core__csr___GEN_20  ={  core__csr__wdata  [33:1],1'h0};
    wire  core__csr___GEN_21  =~  core__csr__reg_bp_0_control_dmode  |  core__csr__reg_debug  ;
    wire  core__csr___GEN_22  =  core__csr___csr_wen_T_4  &  core__csr___GEN_21  &(&  core__csr___decoded_decoded_T_116  );
    wire[7:0]  core__csr___newCfg_WIRE  =  core__csr___wdata_T_2  [7:0]&  core__csr___wdata_T_6  [7:0];
    wire  core__csr___GEN_23  =  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_78  )&~  core__csr__reg_pmp_cfg_l_0  ;
    wire[29:0]  core__csr___GEN_24  =  core__csr___wdata_T_2  [29:0]&  core__csr___wdata_T_6  [29:0];
    wire[7:0]  core__csr___newCfg_WIRE_1  =  core__csr___wdata_T_2  [15:8]&  core__csr___wdata_T_6  [15:8];
    wire  core__csr___GEN_25  =  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_78  )&~  core__csr__reg_pmp_cfg_l_1  ;
    wire[7:0]  core__csr___newCfg_WIRE_2  =  core__csr___wdata_T_2  [23:16]&  core__csr___wdata_T_6  [23:16];
    wire  core__csr___GEN_26  =  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_78  )&~  core__csr__reg_pmp_cfg_l_2  ;
    wire[7:0]  core__csr___newCfg_WIRE_3  =  core__csr___wdata_T_2  [31:24]&  core__csr___wdata_T_6  [31:24];
    wire  core__csr___GEN_27  =  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_78  )&~  core__csr__reg_pmp_cfg_l_3  ;
    wire[7:0]  core__csr___newCfg_WIRE_4  =  core__csr___wdata_T_2  [39:32]&  core__csr___wdata_T_6  [39:32];
    wire  core__csr___GEN_28  =  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_78  )&~  core__csr__reg_pmp_cfg_l_4  ;
    wire[7:0]  core__csr___newCfg_WIRE_5  =  core__csr___wdata_T_2  [47:40]&  core__csr___wdata_T_6  [47:40];
    wire  core__csr___GEN_29  =  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_78  )&~  core__csr__reg_pmp_cfg_l_5  ;
    wire[7:0]  core__csr___newCfg_WIRE_6  =  core__csr___wdata_T_2  [55:48]&  core__csr___wdata_T_6  [55:48];
    wire  core__csr___GEN_30  =  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_78  )&~  core__csr__reg_pmp_cfg_l_6  ;
    wire  core__csr___GEN_31  =  core__csr__reg_pmp_cfg_l_7  &~(  core__csr__reg_pmp_cfg_a_7  [1])&  core__csr__reg_pmp_cfg_a_7  [0];
    wire[7:0]  core__csr___newCfg_T_49  =  core__csr___wdata_T_2  [63:56]&  core__csr___wdata_T_6  [63:56];
    wire  core__csr___GEN_32  =  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_78  )&~  core__csr__reg_pmp_cfg_l_7  ;
    wire[63:0]  core__csr___reg_misa_T  =~  core__csr__wdata  ;
    always @( posedge   core__csr__clock  )
    begin
        if (  core__csr__reset  )
        begin
            core__csr__reg_mstatus_v   <=1'h0;
            core__csr__reg_mstatus_mpv   <=1'h0;
            core__csr__reg_mstatus_gva   <=1'h0;
            core__csr__reg_mstatus_mpp   <=2'h3;
            core__csr__reg_mstatus_mpie   <=1'h0;
            core__csr__reg_mstatus_mie   <=1'h0;
            core__csr__reg_dcsr_ebreakm   <=1'h0;
            core__csr__reg_dcsr_cause   <=3'h0;
            core__csr__reg_dcsr_v   <=1'h0;
            core__csr__reg_dcsr_step   <=1'h0;
            core__csr__reg_debug   <=1'h0;
            core__csr__reg_bp_0_control_dmode   <=1'h0;
            core__csr__reg_bp_0_control_action   <=1'h0;
            core__csr__reg_bp_0_control_x   <=1'h0;
            core__csr__reg_bp_0_control_w   <=1'h0;
            core__csr__reg_bp_0_control_r   <=1'h0;
            core__csr__reg_pmp_cfg_l_0   <=1'h0;
            core__csr__reg_pmp_cfg_l_1   <=1'h0;
            core__csr__reg_pmp_cfg_l_2   <=1'h0;
            core__csr__reg_pmp_cfg_l_3   <=1'h0;
            core__csr__reg_pmp_cfg_l_4   <=1'h0;
            core__csr__reg_pmp_cfg_l_5   <=1'h0;
            core__csr__reg_pmp_cfg_l_6   <=1'h0;
            core__csr__reg_pmp_cfg_l_7   <=1'h0;
            core__csr__reg_pmp_cfg_a_0   <=2'h0;
            core__csr__reg_pmp_cfg_a_1   <=2'h0;
            core__csr__reg_pmp_cfg_a_2   <=2'h0;
            core__csr__reg_pmp_cfg_a_3   <=2'h0;
            core__csr__reg_pmp_cfg_a_4   <=2'h0;
            core__csr__reg_pmp_cfg_a_5   <=2'h0;
            core__csr__reg_pmp_cfg_a_6   <=2'h0;
            core__csr__reg_pmp_cfg_a_7   <=2'h0;
            core__csr__reg_mcause   <=64'h0;
            core__csr__reg_mtvec   <=32'h0;
            core__csr__reg_mcountinhibit   <=3'h0;
            core__csr__small_0   <=6'h0;
            core__csr__large_0   <=58'h0;
            core__csr__reg_misa   <=64'h8000000000801105;
            core__csr__reg_custom_0   <=64'h208;
            core__csr__io_status_cease_r   <=1'h0;
        end
        else
        begin
            core__csr__reg_mstatus_v   <=~  core__csr__insn_ret  &(~  core__csr__exception  |  core__csr__trapToDebug  &  core__csr__reg_debug  )&  core__csr__reg_mstatus_v  ;
            core__csr__reg_mstatus_mpv   <=  core__csr___GEN_17  &(  core__csr___GEN_19   ?   core__csr__reg_mstatus_mpv  :  core__csr__reg_mstatus_v  );
            if (  core__csr___GEN_19  )
            begin
            end
            else
                core__csr__reg_mstatus_gva   <=  core__csr__io_gva  ;
            if (  core__csr___GEN_17  &  core__csr___GEN_19  )
            begin
            end
            else
                core__csr__reg_mstatus_mpp   <=2'h3;
            if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T  ))
            begin
                core__csr__reg_mstatus_mpie   <=  core__csr__wdata  [7];
                core__csr__reg_mstatus_mie   <=  core__csr__wdata  [3];
            end
            else
            begin
                core__csr__reg_mstatus_mpie   <=  core__csr__insn_ret  &~  core__csr___GEN_14  |(  core__csr___GEN_19   ?   core__csr__reg_mstatus_mpie  :  core__csr__reg_mstatus_mie  );
                if (  core__csr___GEN_17  )
                    core__csr__reg_mstatus_mie   <=  core__csr___GEN_19  &  core__csr__reg_mstatus_mie  ;
                else
                    core__csr__reg_mstatus_mie   <=  core__csr__reg_mstatus_mpie  ;
            end
            if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_122  ))
            begin
                core__csr__reg_dcsr_ebreakm   <=  core__csr___new_dcsr_WIRE  [15];
                core__csr__reg_dcsr_step   <=  core__csr___new_dcsr_WIRE  [2];
            end
            if (  core__csr___GEN_18  )
            begin
                core__csr__reg_dcsr_cause   <=  core__csr__reg_singleStepped   ? 3'h4:{1'h0,  core__csr__causeIsDebugInt   ? 2'h3:  core__csr__causeIsDebugTrigger   ? 2'h2:2'h1};
                core__csr__reg_dcsr_v   <=  core__csr__reg_mstatus_v  ;
            end
            core__csr__reg_debug   <=~(  core__csr__insn_ret  &  core__csr___GEN_14  )&(  core__csr___GEN_18  |  core__csr__reg_debug  );
            if (  core__csr___GEN_22  )
            begin
                core__csr__reg_bp_0_control_dmode   <=  core__csr__dMode  ;
                core__csr__reg_bp_0_control_action   <=  core__csr__dMode  &  core__csr___newBPC_T_8  [0];
                core__csr__reg_bp_0_control_x   <=  core__csr__wdata  [2];
                core__csr__reg_bp_0_control_w   <=  core__csr__wdata  [1];
                core__csr__reg_bp_0_control_r   <=  core__csr__wdata  [0];
            end
            if (  core__csr___GEN_23  )
            begin
                core__csr__reg_pmp_cfg_l_0   <=  core__csr___newCfg_WIRE  [7];
                core__csr__reg_pmp_cfg_a_0   <=  core__csr___newCfg_WIRE  [4:3];
            end
            if (  core__csr___GEN_25  )
            begin
                core__csr__reg_pmp_cfg_l_1   <=  core__csr___newCfg_WIRE_1  [7];
                core__csr__reg_pmp_cfg_a_1   <=  core__csr___newCfg_WIRE_1  [4:3];
            end
            if (  core__csr___GEN_26  )
            begin
                core__csr__reg_pmp_cfg_l_2   <=  core__csr___newCfg_WIRE_2  [7];
                core__csr__reg_pmp_cfg_a_2   <=  core__csr___newCfg_WIRE_2  [4:3];
            end
            if (  core__csr___GEN_27  )
            begin
                core__csr__reg_pmp_cfg_l_3   <=  core__csr___newCfg_WIRE_3  [7];
                core__csr__reg_pmp_cfg_a_3   <=  core__csr___newCfg_WIRE_3  [4:3];
            end
            if (  core__csr___GEN_28  )
            begin
                core__csr__reg_pmp_cfg_l_4   <=  core__csr___newCfg_WIRE_4  [7];
                core__csr__reg_pmp_cfg_a_4   <=  core__csr___newCfg_WIRE_4  [4:3];
            end
            if (  core__csr___GEN_29  )
            begin
                core__csr__reg_pmp_cfg_l_5   <=  core__csr___newCfg_WIRE_5  [7];
                core__csr__reg_pmp_cfg_a_5   <=  core__csr___newCfg_WIRE_5  [4:3];
            end
            if (  core__csr___GEN_30  )
            begin
                core__csr__reg_pmp_cfg_l_6   <=  core__csr___newCfg_WIRE_6  [7];
                core__csr__reg_pmp_cfg_a_6   <=  core__csr___newCfg_WIRE_6  [4:3];
            end
            if (  core__csr___GEN_32  )
            begin
                core__csr__reg_pmp_cfg_l_7   <=  core__csr___newCfg_T_49  [7];
                core__csr__reg_pmp_cfg_a_7   <=  core__csr___newCfg_T_49  [4:3];
            end
            if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_72  ))
                core__csr__reg_mcause   <=  core__csr__wdata  &64'h800000000000000F;
            else
                if (  core__csr___GEN_19  )
                begin
                end
                else
                    core__csr__reg_mcause   <=  core__csr__cause  ;
            if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_6  ))
                core__csr__reg_mtvec   <=  core__csr___new_dcsr_WIRE  ;
            if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_8  ))
                core__csr__reg_mcountinhibit   <=  core__csr___wdata_T_2  [2:0]&  core__csr___wdata_T_6  [2:0]&3'h5;
            if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_132  ))
            begin
                core__csr__small_0   <=  core__csr___GEN_16  ;
                core__csr__large_0   <=  core__csr___wdata_T_2  [63:6]&  core__csr___wdata_T_6  [63:6];
            end
            else
            begin
                if (  core__csr__reg_mcountinhibit  [2])
                begin
                end
                else
                    core__csr__small_0   <=  core__csr__nextSmall  [5:0];
                if (  core__csr__nextSmall  [6]&~(  core__csr__reg_mcountinhibit  [2]))
                    core__csr__large_0   <=  core__csr__large_0  +58'h1;
            end
            if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_2  )&(~(  core__csr__io_pc  [1])|  core__csr___wdata_T_2  [2]&  core__csr___wdata_T_6  [2]))
                core__csr__reg_misa   <=~{  core__csr___reg_misa_T  [63:4],  core__csr___reg_misa_T  [3:0]|{~(  core__csr___wdata_T_2  [5]&  core__csr___wdata_T_6  [5]),3'h0}}&64'h1005|  core__csr__reg_misa  &64'hFFFFFFFFFFFFEFFA;
            if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_128  ))
                core__csr__reg_custom_0   <=  core__csr__wdata  &64'h208|  core__csr__reg_custom_0  &64'hFFFFFFFFFFFFFDF7;
            core__csr__io_status_cease_r   <=  core__csr__system_insn  &(&{  core__csr__io_rw_addr  [2],  core__csr___GEN_11  [3],  core__csr___GEN_11  [4],  core__csr___GEN_11  [5],  core__csr___GEN_11  [6],  core__csr___GEN_11  [7],  core__csr__io_rw_addr  [8],  core__csr__io_rw_addr  [9],  core__csr___GEN_11  [10],  core__csr___GEN_11  [11]})|  core__csr__io_status_cease_r  ;
        end
        if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_124  ))
            core__csr__reg_dpc   <=  core__csr___GEN_20  ;
        else
            if (  core__csr___GEN_18  )
                core__csr__reg_dpc   <=  core__csr__epc  ;
        if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_126  ))
            core__csr__reg_dscratch0   <=  core__csr__wdata  ;
        core__csr__reg_singleStepped   <=  core__csr__io_singleStep_0  &(  core__csr__io_retire  |  core__csr__exception  |  core__csr__reg_singleStepped  );
        if (  core__csr___GEN_22  )
            core__csr__reg_bp_0_control_tmatch   <=  core__csr__wdata  [8:7];
        if (  core__csr___csr_wen_T_4  &  core__csr___GEN_21  &(&  core__csr___decoded_decoded_T_118  ))
            core__csr__reg_bp_0_address   <=  core__csr___wdata_T_2  [32:0]&  core__csr___wdata_T_6  [32:0];
        if (  core__csr___GEN_23  )
        begin
            core__csr__reg_pmp_cfg_x_0   <=  core__csr___newCfg_WIRE  [2];
            core__csr__reg_pmp_cfg_w_0   <=  core__csr___newCfg_WIRE  [1]&  core__csr___newCfg_WIRE  [0];
            core__csr__reg_pmp_cfg_r_0   <=  core__csr___newCfg_WIRE  [0];
        end
        if (  core__csr___GEN_25  )
        begin
            core__csr__reg_pmp_cfg_x_1   <=  core__csr___newCfg_WIRE_1  [2];
            core__csr__reg_pmp_cfg_w_1   <=  core__csr___newCfg_WIRE_1  [1]&  core__csr___newCfg_WIRE_1  [0];
            core__csr__reg_pmp_cfg_r_1   <=  core__csr___newCfg_WIRE_1  [0];
        end
        if (  core__csr___GEN_26  )
        begin
            core__csr__reg_pmp_cfg_x_2   <=  core__csr___newCfg_WIRE_2  [2];
            core__csr__reg_pmp_cfg_w_2   <=  core__csr___newCfg_WIRE_2  [1]&  core__csr___newCfg_WIRE_2  [0];
            core__csr__reg_pmp_cfg_r_2   <=  core__csr___newCfg_WIRE_2  [0];
        end
        if (  core__csr___GEN_27  )
        begin
            core__csr__reg_pmp_cfg_x_3   <=  core__csr___newCfg_WIRE_3  [2];
            core__csr__reg_pmp_cfg_w_3   <=  core__csr___newCfg_WIRE_3  [1]&  core__csr___newCfg_WIRE_3  [0];
            core__csr__reg_pmp_cfg_r_3   <=  core__csr___newCfg_WIRE_3  [0];
        end
        if (  core__csr___GEN_28  )
        begin
            core__csr__reg_pmp_cfg_x_4   <=  core__csr___newCfg_WIRE_4  [2];
            core__csr__reg_pmp_cfg_w_4   <=  core__csr___newCfg_WIRE_4  [1]&  core__csr___newCfg_WIRE_4  [0];
            core__csr__reg_pmp_cfg_r_4   <=  core__csr___newCfg_WIRE_4  [0];
        end
        if (  core__csr___GEN_29  )
        begin
            core__csr__reg_pmp_cfg_x_5   <=  core__csr___newCfg_WIRE_5  [2];
            core__csr__reg_pmp_cfg_w_5   <=  core__csr___newCfg_WIRE_5  [1]&  core__csr___newCfg_WIRE_5  [0];
            core__csr__reg_pmp_cfg_r_5   <=  core__csr___newCfg_WIRE_5  [0];
        end
        if (  core__csr___GEN_30  )
        begin
            core__csr__reg_pmp_cfg_x_6   <=  core__csr___newCfg_WIRE_6  [2];
            core__csr__reg_pmp_cfg_w_6   <=  core__csr___newCfg_WIRE_6  [1]&  core__csr___newCfg_WIRE_6  [0];
            core__csr__reg_pmp_cfg_r_6   <=  core__csr___newCfg_WIRE_6  [0];
        end
        if (  core__csr___GEN_32  )
        begin
            core__csr__reg_pmp_cfg_x_7   <=  core__csr___newCfg_T_49  [2];
            core__csr__reg_pmp_cfg_w_7   <=  core__csr___newCfg_T_49  [1]&  core__csr___newCfg_T_49  [0];
            core__csr__reg_pmp_cfg_r_7   <=  core__csr___newCfg_T_49  [0];
        end
        if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_82  )&~(  core__csr__reg_pmp_cfg_l_0  |  core__csr__reg_pmp_cfg_l_1  &~(  core__csr__reg_pmp_cfg_a_1  [1])&  core__csr__reg_pmp_cfg_a_1  [0]))
            core__csr__reg_pmp_addr_0   <=  core__csr___GEN_24  ;
        if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_84  )&~(  core__csr__reg_pmp_cfg_l_1  |  core__csr__reg_pmp_cfg_l_2  &~(  core__csr__reg_pmp_cfg_a_2  [1])&  core__csr__reg_pmp_cfg_a_2  [0]))
            core__csr__reg_pmp_addr_1   <=  core__csr___GEN_24  ;
        if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_86  )&~(  core__csr__reg_pmp_cfg_l_2  |  core__csr__reg_pmp_cfg_l_3  &~(  core__csr__reg_pmp_cfg_a_3  [1])&  core__csr__reg_pmp_cfg_a_3  [0]))
            core__csr__reg_pmp_addr_2   <=  core__csr___GEN_24  ;
        if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_88  )&~(  core__csr__reg_pmp_cfg_l_3  |  core__csr__reg_pmp_cfg_l_4  &~(  core__csr__reg_pmp_cfg_a_4  [1])&  core__csr__reg_pmp_cfg_a_4  [0]))
            core__csr__reg_pmp_addr_3   <=  core__csr___GEN_24  ;
        if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_90  )&~(  core__csr__reg_pmp_cfg_l_4  |  core__csr__reg_pmp_cfg_l_5  &~(  core__csr__reg_pmp_cfg_a_5  [1])&  core__csr__reg_pmp_cfg_a_5  [0]))
            core__csr__reg_pmp_addr_4   <=  core__csr___GEN_24  ;
        if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_92  )&~(  core__csr__reg_pmp_cfg_l_5  |  core__csr__reg_pmp_cfg_l_6  &~(  core__csr__reg_pmp_cfg_a_6  [1])&  core__csr__reg_pmp_cfg_a_6  [0]))
            core__csr__reg_pmp_addr_5   <=  core__csr___GEN_24  ;
        if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_94  )&~(  core__csr__reg_pmp_cfg_l_6  |  core__csr___GEN_31  ))
            core__csr__reg_pmp_addr_6   <=  core__csr___GEN_24  ;
        if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_96  )&~(  core__csr__reg_pmp_cfg_l_7  |  core__csr___GEN_31  ))
            core__csr__reg_pmp_addr_7   <=  core__csr___GEN_24  ;
        if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_4  ))
            core__csr__reg_mie   <={48'h0,  core__csr___wdata_T_2  [15:0]&  core__csr___wdata_T_6  [15:0]&16'h888};
        if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_70  ))
            core__csr__reg_mepc   <=  core__csr___GEN_20  ;
        else
            if (  core__csr___GEN_19  )
            begin
            end
            else
                core__csr__reg_mepc   <=  core__csr__epc  ;
        if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_74  ))
            core__csr__reg_mtval   <=  core__csr___wdata_T_2  [33:0]&  core__csr___wdata_T_6  [33:0];
        else
            if (  core__csr___GEN_19  )
            begin
            end
            else
                core__csr__reg_mtval   <=  core__csr__insn_break   ?   core__csr__epc  :  core__csr__io_tval  ;
        if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_68  ))
            core__csr__reg_mscratch   <=  core__csr__wdata  ;
    end

    wire[6:0]  core__csr__nextSmall_1  ={1'h0,  core__csr__small_1  }+{6'h0,~  core__csr__io_csr_stall_0  };
    always @( posedge   core__csr__io_ungated_clock  )
    begin
        if (  core__csr__reset  )
        begin
            core__csr__reg_wfi   <=1'h0;
            core__csr__small_1   <=6'h0;
            core__csr__large_1   <=58'h0;
        end
        else
        begin
            core__csr__reg_wfi   <=~((|{  core__csr___GEN  [11],  core__csr___GEN  [7],  core__csr___GEN  [3]})|  core__csr__io_interrupts_debug  |  core__csr__exception  )&(  core__csr__system_insn  &(&{  core__csr__io_rw_addr  [8],  core__csr___GEN_11  [9],  core__csr___GEN_11  [10],  core__csr___GEN_11  [11]})&~  core__csr__io_singleStep_0  &~  core__csr__reg_debug  |  core__csr__reg_wfi  );
            if (  core__csr___csr_wen_T_4  &(&  core__csr___decoded_decoded_T_130  ))
            begin
                core__csr__small_1   <=  core__csr___GEN_16  ;
                core__csr__large_1   <=  core__csr___wdata_T_2  [63:6]&  core__csr___wdata_T_6  [63:6];
            end
            else
            begin
                if (  core__csr__reg_mcountinhibit  [0])
                begin
                end
                else
                    core__csr__small_1   <=  core__csr__nextSmall_1  [5:0];
                if (  core__csr__nextSmall_1  [6]&~(  core__csr__reg_mcountinhibit  [0]))
                    core__csr__large_1   <=  core__csr__large_1  +58'h1;
            end
        end
    end

    assign   core__csr__io_rw_rdata  =  core__csr___io_rw_rdata_T_262  ;
    assign   core__csr__io_decode_0_read_illegal  =~  core__csr__csr_exists  |(&{  core__csr__io_decode_0_inst  [24],  core__csr__io_decode_0_inst  [25],  core__csr__io_decode_0_read_illegal_invInputs  [0],  core__csr__io_decode_0_inst  [27],  core__csr__io_decode_0_inst  [28],  core__csr__io_decode_0_inst  [29],  core__csr__io_decode_0_inst  [30],  core__csr__io_decode_0_read_illegal_invInputs  [5]})&~  core__csr__reg_debug  ;
    assign   core__csr__io_decode_0_write_illegal  =&(  core__csr__io_decode_0_inst  [31:30]);
    assign   core__csr__io_decode_0_write_flush  =~(  core__csr__io_decode_0_write_flush_addr_m  >12'h33F&  core__csr__io_decode_0_write_flush_addr_m  <12'h344);
    assign   core__csr__io_decode_0_system_illegal  =(|{&{  core__csr__decoded_invInputs_1  [0],  core__csr__decoded_invInputs_1  [1],  core__csr__decoded_invInputs_1  [2],  core__csr__decoded_invInputs_1  [3],  core__csr__decoded_invInputs_1  [4],  core__csr__decoded_invInputs_1  [5],  core__csr__io_decode_0_inst  [28],  core__csr__io_decode_0_inst  [29],  core__csr__decoded_invInputs_1  [8],  core__csr__decoded_invInputs_1  [9]},&{  core__csr__io_decode_0_inst  [30],  core__csr__decoded_invInputs_1  [9]}})&  core__csr__io_decode_0_inst  [30]&  core__csr__io_decode_0_inst  [27]&~  core__csr__reg_debug  ;
    assign   core__csr__io_decode_0_virtual_access_illegal  =  core__csr__reg_mstatus_v  &  core__csr__csr_exists  &(  core__csr__io_decode_0_inst  [29:28]==2'h2|(  core__csr__io_decode_0_inst  [31:20]>12'hBFF&  core__csr__io_decode_0_inst  [31:20]<12'hC20|  core__csr__io_decode_0_inst  [31:20]>12'hC7F&  core__csr__io_decode_0_inst  [31:20]<12'hCA0)&  core__csr___io_decode_0_virtual_access_illegal_T_3  [0]&~(  core__csr___io_decode_0_virtual_access_illegal_T_6  [0]));
    assign   core__csr__io_decode_0_virtual_system_illegal  =1'h0;
    assign   core__csr__io_csr_stall  =  core__csr__io_csr_stall_0  ;
    assign   core__csr__io_eret  =  core__csr___exception_T  |  core__csr__insn_ret  ;
    assign   core__csr__io_singleStep  =  core__csr__io_singleStep_0  ;
    assign   core__csr__io_status_debug  =  core__csr__reg_debug  ;
    assign   core__csr__io_status_wfi  =  core__csr__reg_wfi  ;
    assign   core__csr__io_status_isa  =  core__csr__reg_misa  [31:0];
    assign   core__csr__io_status_dv  =  core__csr__reg_mstatus_v  ;
    assign   core__csr__io_status_v  =  core__csr__reg_mstatus_v  ;
    assign   core__csr__io_evec  =  core__csr__insn_ret   ? (  core__csr___GEN_14   ? ~{  core__csr___io_evec_T_10  [33:2],  core__csr___io_evec_T_10  [1:0]|{~(  core__csr__reg_misa  [2]),1'h1}}:~{  core__csr___io_evec_T_20  [33:2],  core__csr___io_evec_T_20  [1:0]|{~(  core__csr__reg_misa  [2]),1'h1}}):  core__csr__trapToDebug   ? {22'h0,  core__csr__reg_debug   ? {8'h80,~  core__csr__insn_break  ,3'h0}:12'h800}:{2'h0,  core__csr___read_mtvec_T_5  [0]&  core__csr__cause  [63]&  core__csr__cause  [7:6]==2'h0 ? {  core__csr___read_mtvec_T_5  [31:8],  core__csr__cause  [5:0]}:  core__csr___read_mtvec_T_5  [31:2],2'h0};
    assign   core__csr__io_time  =  core__csr__io_time_0  ;
    assign   core__csr__io_interrupt  =((  core__csr__io_interrupts_debug  |  core__csr__m_interrupts  [15]|  core__csr__m_interrupts  [14]|  core__csr__m_interrupts  [13]|  core__csr__m_interrupts  [12]|  core__csr__m_interrupts  [11]|  core__csr__m_interrupts  [3]|  core__csr__m_interrupts  [7]|  core__csr__m_interrupts  [9]|  core__csr__m_interrupts  [1]|  core__csr__m_interrupts  [5]|  core__csr__m_interrupts  [10]|  core__csr__m_interrupts  [2]|  core__csr__m_interrupts  [6]|  core__csr__m_interrupts  [8]|  core__csr__m_interrupts  [0]|  core__csr__m_interrupts  [4])&~  core__csr__io_singleStep_0  |  core__csr__reg_singleStepped  )&~(  core__csr__reg_debug  |  core__csr__io_status_cease_r  );
    assign   core__csr__io_interrupt_cause  ={60'h0,  core__csr__io_interrupts_debug   ? 4'hE:  core__csr__m_interrupts  [15] ? 4'hF:  core__csr__m_interrupts  [14] ? 4'hE:  core__csr__m_interrupts  [13] ? 4'hD:  core__csr__m_interrupts  [12] ? 4'hC:  core__csr__m_interrupts  [11] ? 4'hB:  core__csr__m_interrupts  [3] ? 4'h3:  core__csr__m_interrupts  [7] ? 4'h7:  core__csr__m_interrupts  [9] ? 4'h9:  core__csr__m_interrupts  [1] ? 4'h1:  core__csr__m_interrupts  [5] ? 4'h5:  core__csr__m_interrupts  [10] ? 4'hA:  core__csr__m_interrupts  [2] ? 4'h2:  core__csr__m_interrupts  [6] ? 4'h6:  core__csr__m_interrupts  [8] ? 4'h8:{1'h0,~(  core__csr__m_interrupts  [0]),2'h0}}-64'h8000000000000000;
    assign   core__csr__io_bp_0_control_action  =  core__csr__reg_bp_0_control_action  ;
    assign   core__csr__io_bp_0_control_tmatch  =  core__csr__reg_bp_0_control_tmatch  ;
    assign   core__csr__io_bp_0_control_x  =  core__csr__reg_bp_0_control_x  ;
    assign   core__csr__io_bp_0_control_w  =  core__csr__reg_bp_0_control_w  ;
    assign   core__csr__io_bp_0_control_r  =  core__csr__reg_bp_0_control_r  ;
    assign   core__csr__io_bp_0_address  =  core__csr__reg_bp_0_address  ;
    assign   core__csr__io_pmp_cfg_l_0  =  core__csr__reg_pmp_cfg_l_0  ;
    assign   core__csr__io_pmp_cfg_l_1  =  core__csr__reg_pmp_cfg_l_1  ;
    assign   core__csr__io_pmp_cfg_l_2  =  core__csr__reg_pmp_cfg_l_2  ;
    assign   core__csr__io_pmp_cfg_l_3  =  core__csr__reg_pmp_cfg_l_3  ;
    assign   core__csr__io_pmp_cfg_l_4  =  core__csr__reg_pmp_cfg_l_4  ;
    assign   core__csr__io_pmp_cfg_l_5  =  core__csr__reg_pmp_cfg_l_5  ;
    assign   core__csr__io_pmp_cfg_l_6  =  core__csr__reg_pmp_cfg_l_6  ;
    assign   core__csr__io_pmp_cfg_l_7  =  core__csr__reg_pmp_cfg_l_7  ;
    assign   core__csr__io_pmp_cfg_a_0  =  core__csr__reg_pmp_cfg_a_0  ;
    assign   core__csr__io_pmp_cfg_a_1  =  core__csr__reg_pmp_cfg_a_1  ;
    assign   core__csr__io_pmp_cfg_a_2  =  core__csr__reg_pmp_cfg_a_2  ;
    assign   core__csr__io_pmp_cfg_a_3  =  core__csr__reg_pmp_cfg_a_3  ;
    assign   core__csr__io_pmp_cfg_a_4  =  core__csr__reg_pmp_cfg_a_4  ;
    assign   core__csr__io_pmp_cfg_a_5  =  core__csr__reg_pmp_cfg_a_5  ;
    assign   core__csr__io_pmp_cfg_a_6  =  core__csr__reg_pmp_cfg_a_6  ;
    assign   core__csr__io_pmp_cfg_a_7  =  core__csr__reg_pmp_cfg_a_7  ;
    assign   core__csr__io_pmp_cfg_x_0  =  core__csr__reg_pmp_cfg_x_0  ;
    assign   core__csr__io_pmp_cfg_x_1  =  core__csr__reg_pmp_cfg_x_1  ;
    assign   core__csr__io_pmp_cfg_x_2  =  core__csr__reg_pmp_cfg_x_2  ;
    assign   core__csr__io_pmp_cfg_x_3  =  core__csr__reg_pmp_cfg_x_3  ;
    assign   core__csr__io_pmp_cfg_x_4  =  core__csr__reg_pmp_cfg_x_4  ;
    assign   core__csr__io_pmp_cfg_x_5  =  core__csr__reg_pmp_cfg_x_5  ;
    assign   core__csr__io_pmp_cfg_x_6  =  core__csr__reg_pmp_cfg_x_6  ;
    assign   core__csr__io_pmp_cfg_x_7  =  core__csr__reg_pmp_cfg_x_7  ;
    assign   core__csr__io_pmp_cfg_w_0  =  core__csr__reg_pmp_cfg_w_0  ;
    assign   core__csr__io_pmp_cfg_w_1  =  core__csr__reg_pmp_cfg_w_1  ;
    assign   core__csr__io_pmp_cfg_w_2  =  core__csr__reg_pmp_cfg_w_2  ;
    assign   core__csr__io_pmp_cfg_w_3  =  core__csr__reg_pmp_cfg_w_3  ;
    assign   core__csr__io_pmp_cfg_w_4  =  core__csr__reg_pmp_cfg_w_4  ;
    assign   core__csr__io_pmp_cfg_w_5  =  core__csr__reg_pmp_cfg_w_5  ;
    assign   core__csr__io_pmp_cfg_w_6  =  core__csr__reg_pmp_cfg_w_6  ;
    assign   core__csr__io_pmp_cfg_w_7  =  core__csr__reg_pmp_cfg_w_7  ;
    assign   core__csr__io_pmp_cfg_r_0  =  core__csr__reg_pmp_cfg_r_0  ;
    assign   core__csr__io_pmp_cfg_r_1  =  core__csr__reg_pmp_cfg_r_1  ;
    assign   core__csr__io_pmp_cfg_r_2  =  core__csr__reg_pmp_cfg_r_2  ;
    assign   core__csr__io_pmp_cfg_r_3  =  core__csr__reg_pmp_cfg_r_3  ;
    assign   core__csr__io_pmp_cfg_r_4  =  core__csr__reg_pmp_cfg_r_4  ;
    assign   core__csr__io_pmp_cfg_r_5  =  core__csr__reg_pmp_cfg_r_5  ;
    assign   core__csr__io_pmp_cfg_r_6  =  core__csr__reg_pmp_cfg_r_6  ;
    assign   core__csr__io_pmp_cfg_r_7  =  core__csr__reg_pmp_cfg_r_7  ;
    assign   core__csr__io_pmp_addr_0  =  core__csr__reg_pmp_addr_0  ;
    assign   core__csr__io_pmp_addr_1  =  core__csr__reg_pmp_addr_1  ;
    assign   core__csr__io_pmp_addr_2  =  core__csr__reg_pmp_addr_2  ;
    assign   core__csr__io_pmp_addr_3  =  core__csr__reg_pmp_addr_3  ;
    assign   core__csr__io_pmp_addr_4  =  core__csr__reg_pmp_addr_4  ;
    assign   core__csr__io_pmp_addr_5  =  core__csr__reg_pmp_addr_5  ;
    assign   core__csr__io_pmp_addr_6  =  core__csr__reg_pmp_addr_6  ;
    assign   core__csr__io_pmp_addr_7  =  core__csr__reg_pmp_addr_7  ;
    assign   core__csr__io_pmp_mask_0  ={  core__csr___GEN_0  &~(  core__csr___GEN_0  +30'h1),2'h3};
    assign   core__csr__io_pmp_mask_1  ={  core__csr___GEN_1  &~(  core__csr___GEN_1  +30'h1),2'h3};
    assign   core__csr__io_pmp_mask_2  ={  core__csr___GEN_2  &~(  core__csr___GEN_2  +30'h1),2'h3};
    assign   core__csr__io_pmp_mask_3  ={  core__csr___GEN_3  &~(  core__csr___GEN_3  +30'h1),2'h3};
    assign   core__csr__io_pmp_mask_4  ={  core__csr___GEN_4  &~(  core__csr___GEN_4  +30'h1),2'h3};
    assign   core__csr__io_pmp_mask_5  ={  core__csr___GEN_5  &~(  core__csr___GEN_5  +30'h1),2'h3};
    assign   core__csr__io_pmp_mask_6  ={  core__csr___GEN_6  &~(  core__csr___GEN_6  +30'h1),2'h3};
    assign   core__csr__io_pmp_mask_7  ={  core__csr___GEN_7  &~(  core__csr___GEN_7  +30'h1),2'h3};
    assign   core__csr__io_inhibit_cycle  =  core__csr__reg_mcountinhibit  [0];
    assign   core__csr__io_trace_valid_0  =  core__csr__io_retire  |  core__csr__exception  ;
    assign   core__csr__io_trace_iaddr_0  =  core__csr__io_pc  ;
    assign   core__csr__io_trace_insn_0  =  core__csr__io_inst_0  ;
    assign   core__csr__io_trace_exception_0  =  core__csr__exception  ;
    assign   core__csr__io_customCSRs_0_value  =  core__csr__reg_custom_0  ;
    assign core__csr__clock = core__clock;
    assign core__csr__reset = core__reset;
    assign core__csr__io_ungated_clock = core__clock;
    assign core__csr__io_interrupts_debug = core__io_interrupts_debug;
    assign core__csr__io_interrupts_mtip = core__io_interrupts_mtip;
    assign core__csr__io_interrupts_msip = core__io_interrupts_msip;
    assign core__csr__io_interrupts_meip = core__io_interrupts_meip;
    assign core__csr__io_hartid = core__io_hartid;
    assign core__csr__io_rw_addr = core__wb_reg_inst[31:20];
    assign core__csr__io_rw_cmd = core__wb_ctrl_csr&{core__wb_reg_valid,2'h3};
    assign core___csr_io_rw_rdata = core__csr__io_rw_rdata;
    assign core__csr__io_rw_wdata = core__wb_reg_wdata;
    assign core__csr__io_decode_0_inst = core___ibuf_io_inst_0_bits_inst_bits;
    assign core___csr_io_decode_0_read_illegal = core__csr__io_decode_0_read_illegal;
    assign core___csr_io_decode_0_write_illegal = core__csr__io_decode_0_write_illegal;
    assign core___csr_io_decode_0_write_flush = core__csr__io_decode_0_write_flush;
    assign core___csr_io_decode_0_system_illegal = core__csr__io_decode_0_system_illegal;
    assign core___csr_io_decode_0_virtual_access_illegal = core__csr__io_decode_0_virtual_access_illegal;
    assign core___csr_io_decode_0_virtual_system_illegal = core__csr__io_decode_0_virtual_system_illegal;
    assign core___csr_io_csr_stall = core__csr__io_csr_stall;
    assign core___csr_io_eret = core__csr__io_eret;
    assign core___csr_io_singleStep = core__csr__io_singleStep;
    assign core___csr_io_status_debug = core__csr__io_status_debug;
    assign core__io_wfi = core__csr__io_status_wfi;
    assign core___csr_io_status_isa = core__csr__io_status_isa;
    assign core___csr_io_status_dv = core__csr__io_status_dv;
    assign core___csr_io_status_v = core__csr__io_status_v;
    assign core___csr_io_evec = core__csr__io_evec;
    assign core__csr__io_exception = core__wb_xcpt;
    assign core__csr__io_retire = core__wb_valid;
    assign core__csr__io_cause = core__wb_reg_xcpt ? core__wb_reg_cause:{59'h0,core___GEN_0 ? 5'hF:core___GEN_1 ? 5'hD:{2'h0,core___GEN_2 ? 3'h7:core___GEN_3 ? 3'h5:{1'h1,core___GEN_4,1'h0}}};
    assign core__csr__io_pc = core__wb_reg_pc;
    assign core__csr__io_tval = core__wb_xcpt&(core__tval_any_addr|core__wb_reg_cause==64'h2) ? {core__wb_reg_wdata[63:33]==31'h0|(&(core__wb_reg_wdata[63:33])) ? core__wb_reg_wdata[33]:~(core__wb_reg_wdata[32]),core__wb_reg_wdata[32:0]}:34'h0;
    assign core__csr__io_gva = core__wb_xcpt&(core__tval_any_addr&core___csr_io_status_v|~core__wb_reg_xcpt&core__wb_reg_hls_or_dv);
    assign core___csr_io_time = core__csr__io_time;
    assign core___csr_io_interrupt = core__csr__io_interrupt;
    assign core___csr_io_interrupt_cause = core__csr__io_interrupt_cause;
    assign core___csr_io_bp_0_control_action = core__csr__io_bp_0_control_action;
    assign core___csr_io_bp_0_control_tmatch = core__csr__io_bp_0_control_tmatch;
    assign core___csr_io_bp_0_control_x = core__csr__io_bp_0_control_x;
    assign core___csr_io_bp_0_control_w = core__csr__io_bp_0_control_w;
    assign core___csr_io_bp_0_control_r = core__csr__io_bp_0_control_r;
    assign core___csr_io_bp_0_address = core__csr__io_bp_0_address;
    assign core__io_ptw_pmp_cfg_l_0 = core__csr__io_pmp_cfg_l_0;
    assign core__io_ptw_pmp_cfg_l_1 = core__csr__io_pmp_cfg_l_1;
    assign core__io_ptw_pmp_cfg_l_2 = core__csr__io_pmp_cfg_l_2;
    assign core__io_ptw_pmp_cfg_l_3 = core__csr__io_pmp_cfg_l_3;
    assign core__io_ptw_pmp_cfg_l_4 = core__csr__io_pmp_cfg_l_4;
    assign core__io_ptw_pmp_cfg_l_5 = core__csr__io_pmp_cfg_l_5;
    assign core__io_ptw_pmp_cfg_l_6 = core__csr__io_pmp_cfg_l_6;
    assign core__io_ptw_pmp_cfg_l_7 = core__csr__io_pmp_cfg_l_7;
    assign core__io_ptw_pmp_cfg_a_0 = core__csr__io_pmp_cfg_a_0;
    assign core__io_ptw_pmp_cfg_a_1 = core__csr__io_pmp_cfg_a_1;
    assign core__io_ptw_pmp_cfg_a_2 = core__csr__io_pmp_cfg_a_2;
    assign core__io_ptw_pmp_cfg_a_3 = core__csr__io_pmp_cfg_a_3;
    assign core__io_ptw_pmp_cfg_a_4 = core__csr__io_pmp_cfg_a_4;
    assign core__io_ptw_pmp_cfg_a_5 = core__csr__io_pmp_cfg_a_5;
    assign core__io_ptw_pmp_cfg_a_6 = core__csr__io_pmp_cfg_a_6;
    assign core__io_ptw_pmp_cfg_a_7 = core__csr__io_pmp_cfg_a_7;
    assign core__io_ptw_pmp_cfg_x_0 = core__csr__io_pmp_cfg_x_0;
    assign core__io_ptw_pmp_cfg_x_1 = core__csr__io_pmp_cfg_x_1;
    assign core__io_ptw_pmp_cfg_x_2 = core__csr__io_pmp_cfg_x_2;
    assign core__io_ptw_pmp_cfg_x_3 = core__csr__io_pmp_cfg_x_3;
    assign core__io_ptw_pmp_cfg_x_4 = core__csr__io_pmp_cfg_x_4;
    assign core__io_ptw_pmp_cfg_x_5 = core__csr__io_pmp_cfg_x_5;
    assign core__io_ptw_pmp_cfg_x_6 = core__csr__io_pmp_cfg_x_6;
    assign core__io_ptw_pmp_cfg_x_7 = core__csr__io_pmp_cfg_x_7;
    assign core__io_ptw_pmp_cfg_w_0 = core__csr__io_pmp_cfg_w_0;
    assign core__io_ptw_pmp_cfg_w_1 = core__csr__io_pmp_cfg_w_1;
    assign core__io_ptw_pmp_cfg_w_2 = core__csr__io_pmp_cfg_w_2;
    assign core__io_ptw_pmp_cfg_w_3 = core__csr__io_pmp_cfg_w_3;
    assign core__io_ptw_pmp_cfg_w_4 = core__csr__io_pmp_cfg_w_4;
    assign core__io_ptw_pmp_cfg_w_5 = core__csr__io_pmp_cfg_w_5;
    assign core__io_ptw_pmp_cfg_w_6 = core__csr__io_pmp_cfg_w_6;
    assign core__io_ptw_pmp_cfg_w_7 = core__csr__io_pmp_cfg_w_7;
    assign core__io_ptw_pmp_cfg_r_0 = core__csr__io_pmp_cfg_r_0;
    assign core__io_ptw_pmp_cfg_r_1 = core__csr__io_pmp_cfg_r_1;
    assign core__io_ptw_pmp_cfg_r_2 = core__csr__io_pmp_cfg_r_2;
    assign core__io_ptw_pmp_cfg_r_3 = core__csr__io_pmp_cfg_r_3;
    assign core__io_ptw_pmp_cfg_r_4 = core__csr__io_pmp_cfg_r_4;
    assign core__io_ptw_pmp_cfg_r_5 = core__csr__io_pmp_cfg_r_5;
    assign core__io_ptw_pmp_cfg_r_6 = core__csr__io_pmp_cfg_r_6;
    assign core__io_ptw_pmp_cfg_r_7 = core__csr__io_pmp_cfg_r_7;
    assign core__io_ptw_pmp_addr_0 = core__csr__io_pmp_addr_0;
    assign core__io_ptw_pmp_addr_1 = core__csr__io_pmp_addr_1;
    assign core__io_ptw_pmp_addr_2 = core__csr__io_pmp_addr_2;
    assign core__io_ptw_pmp_addr_3 = core__csr__io_pmp_addr_3;
    assign core__io_ptw_pmp_addr_4 = core__csr__io_pmp_addr_4;
    assign core__io_ptw_pmp_addr_5 = core__csr__io_pmp_addr_5;
    assign core__io_ptw_pmp_addr_6 = core__csr__io_pmp_addr_6;
    assign core__io_ptw_pmp_addr_7 = core__csr__io_pmp_addr_7;
    assign core__io_ptw_pmp_mask_0 = core__csr__io_pmp_mask_0;
    assign core__io_ptw_pmp_mask_1 = core__csr__io_pmp_mask_1;
    assign core__io_ptw_pmp_mask_2 = core__csr__io_pmp_mask_2;
    assign core__io_ptw_pmp_mask_3 = core__csr__io_pmp_mask_3;
    assign core__io_ptw_pmp_mask_4 = core__csr__io_pmp_mask_4;
    assign core__io_ptw_pmp_mask_5 = core__csr__io_pmp_mask_5;
    assign core__io_ptw_pmp_mask_6 = core__csr__io_pmp_mask_6;
    assign core__io_ptw_pmp_mask_7 = core__csr__io_pmp_mask_7;
    assign core___csr_io_inhibit_cycle = core__csr__io_inhibit_cycle;
    assign core__csr__io_inst_0 = {(&(core__wb_reg_raw_inst[1:0])) ? core__wb_reg_inst[31:16]:16'h0,core__wb_reg_raw_inst[15:0]};
    assign core___csr_io_trace_valid_0 = core__csr__io_trace_valid_0;
    assign core___csr_io_trace_iaddr_0 = core__csr__io_trace_iaddr_0;
    assign core___csr_io_trace_insn_0 = core__csr__io_trace_insn_0;
    assign core___csr_io_trace_exception_0 = core__csr__io_trace_exception_0;
    assign core___csr_io_customCSRs_0_value = core__csr__io_customCSRs_0_value;


    wire  core__bpu__io_status_debug;
    wire  core__bpu__io_bp_0_control_action;
    wire [1:0] core__bpu__io_bp_0_control_tmatch;
    wire  core__bpu__io_bp_0_control_x;
    wire  core__bpu__io_bp_0_control_w;
    wire  core__bpu__io_bp_0_control_r;
    wire [32:0] core__bpu__io_bp_0_address;
    wire [32:0] core__bpu__io_pc;
    wire [32:0] core__bpu__io_ea;
    wire  core__bpu__io_xcpt_if;
    wire  core__bpu__io_xcpt_ld;
    wire  core__bpu__io_xcpt_st;
    wire  core__bpu__io_debug_if;
    wire  core__bpu__io_debug_ld;
    wire  core__bpu__io_debug_st;

    wire  core__bpu___w_T_2  =  core__bpu__io_ea  >=  core__bpu__io_bp_0_address  ;
    wire[32:0]  core__bpu___w_T_5  =~  core__bpu__io_ea  ;
    wire  core__bpu___r_T_8  =  core__bpu__io_bp_0_control_tmatch  [0]&  core__bpu__io_bp_0_address  [0];
    wire  core__bpu___r_T_10  =  core__bpu___r_T_8  &  core__bpu__io_bp_0_address  [1];
    wire[32:0]  core__bpu___x_T_15  =~  core__bpu__io_bp_0_address  ;
    wire  core__bpu___r_T_18  =  core__bpu__io_bp_0_control_tmatch  [0]&  core__bpu__io_bp_0_address  [0];
    wire  core__bpu___r_T_20  =  core__bpu___r_T_18  &  core__bpu__io_bp_0_address  [1];
    wire  core__bpu__r  =~  core__bpu__io_status_debug  &  core__bpu__io_bp_0_control_r  &(  core__bpu__io_bp_0_control_tmatch  [1] ?   core__bpu___w_T_2  ^  core__bpu__io_bp_0_control_tmatch  [0]:{  core__bpu___w_T_5  [32:4],  core__bpu___w_T_5  [3:0]|{  core__bpu___r_T_10  &  core__bpu__io_bp_0_address  [2],  core__bpu___r_T_10  ,  core__bpu___r_T_8  ,  core__bpu__io_bp_0_control_tmatch  [0]}}=={  core__bpu___x_T_15  [32:4],  core__bpu___x_T_15  [3:0]|{  core__bpu___r_T_20  &  core__bpu__io_bp_0_address  [2],  core__bpu___r_T_20  ,  core__bpu___r_T_18  ,  core__bpu__io_bp_0_control_tmatch  [0]}});
    wire  core__bpu___w_T_8  =  core__bpu__io_bp_0_control_tmatch  [0]&  core__bpu__io_bp_0_address  [0];
    wire  core__bpu___w_T_10  =  core__bpu___w_T_8  &  core__bpu__io_bp_0_address  [1];
    wire  core__bpu___w_T_18  =  core__bpu__io_bp_0_control_tmatch  [0]&  core__bpu__io_bp_0_address  [0];
    wire  core__bpu___w_T_20  =  core__bpu___w_T_18  &  core__bpu__io_bp_0_address  [1];
    wire  core__bpu__w  =~  core__bpu__io_status_debug  &  core__bpu__io_bp_0_control_w  &(  core__bpu__io_bp_0_control_tmatch  [1] ?   core__bpu___w_T_2  ^  core__bpu__io_bp_0_control_tmatch  [0]:{  core__bpu___w_T_5  [32:4],  core__bpu___w_T_5  [3:0]|{  core__bpu___w_T_10  &  core__bpu__io_bp_0_address  [2],  core__bpu___w_T_10  ,  core__bpu___w_T_8  ,  core__bpu__io_bp_0_control_tmatch  [0]}}=={  core__bpu___x_T_15  [32:4],  core__bpu___x_T_15  [3:0]|{  core__bpu___w_T_20  &  core__bpu__io_bp_0_address  [2],  core__bpu___w_T_20  ,  core__bpu___w_T_18  ,  core__bpu__io_bp_0_control_tmatch  [0]}});
    wire[32:0]  core__bpu___x_T_5  =~  core__bpu__io_pc  ;
    wire  core__bpu___x_T_8  =  core__bpu__io_bp_0_control_tmatch  [0]&  core__bpu__io_bp_0_address  [0];
    wire  core__bpu___x_T_10  =  core__bpu___x_T_8  &  core__bpu__io_bp_0_address  [1];
    wire  core__bpu___x_T_18  =  core__bpu__io_bp_0_control_tmatch  [0]&  core__bpu__io_bp_0_address  [0];
    wire  core__bpu___x_T_20  =  core__bpu___x_T_18  &  core__bpu__io_bp_0_address  [1];
    wire  core__bpu__x  =~  core__bpu__io_status_debug  &  core__bpu__io_bp_0_control_x  &(  core__bpu__io_bp_0_control_tmatch  [1] ?   core__bpu__io_pc  >=  core__bpu__io_bp_0_address  ^  core__bpu__io_bp_0_control_tmatch  [0]:{  core__bpu___x_T_5  [32:4],  core__bpu___x_T_5  [3:0]|{  core__bpu___x_T_10  &  core__bpu__io_bp_0_address  [2],  core__bpu___x_T_10  ,  core__bpu___x_T_8  ,  core__bpu__io_bp_0_control_tmatch  [0]}}=={  core__bpu___x_T_15  [32:4],  core__bpu___x_T_15  [3:0]|{  core__bpu___x_T_20  &  core__bpu__io_bp_0_address  [2],  core__bpu___x_T_20  ,  core__bpu___x_T_18  ,  core__bpu__io_bp_0_control_tmatch  [0]}});
    assign   core__bpu__io_xcpt_if  =  core__bpu__x  &~  core__bpu__io_bp_0_control_action  ;
    assign   core__bpu__io_xcpt_ld  =  core__bpu__r  &~  core__bpu__io_bp_0_control_action  ;
    assign   core__bpu__io_xcpt_st  =  core__bpu__w  &~  core__bpu__io_bp_0_control_action  ;
    assign   core__bpu__io_debug_if  =  core__bpu__x  &  core__bpu__io_bp_0_control_action  ;
    assign   core__bpu__io_debug_ld  =  core__bpu__r  &  core__bpu__io_bp_0_control_action  ;
    assign   core__bpu__io_debug_st  =  core__bpu__w  &  core__bpu__io_bp_0_control_action  ;
    assign core__bpu__io_status_debug = core___csr_io_status_debug;
    assign core__bpu__io_bp_0_control_action = core___csr_io_bp_0_control_action;
    assign core__bpu__io_bp_0_control_tmatch = core___csr_io_bp_0_control_tmatch;
    assign core__bpu__io_bp_0_control_x = core___csr_io_bp_0_control_x;
    assign core__bpu__io_bp_0_control_w = core___csr_io_bp_0_control_w;
    assign core__bpu__io_bp_0_control_r = core___csr_io_bp_0_control_r;
    assign core__bpu__io_bp_0_address = core___csr_io_bp_0_address;
    assign core__bpu__io_pc = core___ibuf_io_pc[32:0];
    assign core__bpu__io_ea = core__mem_reg_wdata[32:0];
    assign core___bpu_io_xcpt_if = core__bpu__io_xcpt_if;
    assign core___bpu_io_xcpt_ld = core__bpu__io_xcpt_ld;
    assign core___bpu_io_xcpt_st = core__bpu__io_xcpt_st;
    assign core___bpu_io_debug_if = core__bpu__io_debug_if;
    assign core___bpu_io_debug_ld = core__bpu__io_debug_ld;
    assign core___bpu_io_debug_st = core__bpu__io_debug_st;


    wire  core__alu__io_dw;
    wire [3:0] core__alu__io_fn;
    wire [63:0] core__alu__io_in2;
    wire [63:0] core__alu__io_in1;
    wire [63:0] core__alu__io_out;
    wire [63:0] core__alu__io_adder_out;
    wire  core__alu__io_cmp_out;

    wire[63:0]  core__alu__in2_inv  ={64{  core__alu__io_fn  [3]}}^  core__alu__io_in2  ;
    wire[63:0]  core__alu__in1_xor_in2  =  core__alu__io_in1  ^  core__alu__in2_inv  ;
    wire[63:0]  core__alu___io_adder_out_T_3  =  core__alu__io_in1  +  core__alu__in2_inv  +{63'h0,  core__alu__io_fn  [3]};
    wire  core__alu__slt  =  core__alu__io_in1  [63]==  core__alu__io_in2  [63] ?   core__alu___io_adder_out_T_3  [63]:  core__alu__io_fn  [1] ?   core__alu__io_in2  [63]:  core__alu__io_in1  [63];
    wire[31:0]  core__alu__shin_hi  =  core__alu__io_dw   ?   core__alu__io_in1  [63:32]:{32{  core__alu__io_fn  [3]&  core__alu__io_in1  [31]}};
    wire  core__alu___shout_T  =  core__alu__io_fn  ==4'h5;
    wire  core__alu___shout_T_1  =  core__alu__io_fn  ==4'hB;
    wire[31:0]  core__alu___GEN  ={  core__alu__io_in1  [31:16],16'h0}|  core__alu__shin_hi  &32'hFFFF;
    wire[31:0]  core__alu___GEN_0  ={{  core__alu__io_in1  [15:0],  core__alu___GEN  [31:24]}&24'hFF00FF,8'h0}|  core__alu___GEN  &32'hFF00FF;
    wire[31:0]  core__alu___GEN_1  ={{  core__alu__io_in1  [7:0],  core__alu___GEN_0  [31:12]}&28'hF0F0F0F,4'h0}|  core__alu___GEN_0  &32'hF0F0F0F;
    wire[45:0]  core__alu___GEN_2  ={  core__alu__io_in1  [3:0],  core__alu___GEN_1  ,  core__alu___GEN_0  [7:4],  core__alu___GEN  [11:8],  core__alu___GEN  [15:14]}&46'h333333333333;
    wire[31:0]  core__alu___GEN_3  =  core__alu___GEN_2  [45:14]|  core__alu___GEN_1  &32'h33333333;
    wire[1:0]  core__alu___GEN_4  =  core__alu___GEN_2  [11:10]|  core__alu___GEN_0  [5:4];
    wire[7:0]  core__alu___GEN_5  ={  core__alu___GEN_2  [5:0],2'h0}|{  core__alu___GEN  [15:12],  core__alu__shin_hi  [19:16]}&8'h33;
    wire[54:0]  core__alu___GEN_6  ={  core__alu__io_in1  [1:0],  core__alu___GEN_3  ,  core__alu___GEN_1  [3:2],  core__alu___GEN_4  ,  core__alu___GEN_0  [7:6],  core__alu___GEN  [9:8],  core__alu___GEN_5  ,  core__alu__shin_hi  [19:18],  core__alu__shin_hi  [21:20],  core__alu__shin_hi  [23]}&55'h55555555555555;
    wire[63:0]  core__alu__shin  =  core__alu___shout_T  |  core__alu___shout_T_1   ? {  core__alu__shin_hi  ,  core__alu__io_in1  [31:0]}:{  core__alu__io_in1  [0],  core__alu___GEN_6  [54:23]|  core__alu___GEN_3  &32'h55555555,  core__alu___GEN_3  [1],  core__alu___GEN_6  [21]|  core__alu___GEN_1  [2],{  core__alu___GEN_1  [3],1'h0}|  core__alu___GEN_4  &2'h1,  core__alu___GEN_6  [18:15]|{  core__alu___GEN_0  [7:6],  core__alu___GEN  [9:8]}&4'h5,  core__alu___GEN_6  [14:7]|  core__alu___GEN_5  &8'h55,  core__alu___GEN_5  [1],  core__alu___GEN_6  [5]|  core__alu__shin_hi  [18],  core__alu__shin_hi  [19],  core__alu__shin_hi  [20],{  core__alu___GEN_6  [2:0],1'h0}|{  core__alu__shin_hi  [23:22],  core__alu__shin_hi  [25:24]}&4'h5,  core__alu__shin_hi  [25],  core__alu__shin_hi  [26],  core__alu__shin_hi  [27],  core__alu__shin_hi  [28],  core__alu__shin_hi  [29],  core__alu__shin_hi  [30],  core__alu__shin_hi  [31]};
    wire[64:0]  core__alu___shout_r_T_5  =$signed($signed({  core__alu__io_fn  [3]&  core__alu__shin  [63],  core__alu__shin  })>>>{59'h0,  core__alu__io_in2  [5]&  core__alu__io_dw  ,  core__alu__io_in2  [4:0]});
    wire[15:0]  core__alu___GEN_7  ={{  core__alu___shout_r_T_5  [23:16],  core__alu___shout_r_T_5  [31:28]}&12'hF0F,4'h0}|{  core__alu___shout_r_T_5  [31:24],  core__alu___shout_r_T_5  [39:32]}&16'hF0F;
    wire[37:0]  core__alu___GEN_8  ={  core__alu___shout_r_T_5  [11:8],  core__alu___shout_r_T_5  [15:12],  core__alu___shout_r_T_5  [19:16],  core__alu___GEN_7  ,  core__alu___shout_r_T_5  [39:36],  core__alu___shout_r_T_5  [43:40],  core__alu___shout_r_T_5  [47:46]}&38'h3333333333;
    wire[7:0]  core__alu___GEN_9  =  core__alu___GEN_8  [37:30]|{  core__alu___shout_r_T_5  [15:12],  core__alu___shout_r_T_5  [19:16]}&8'h33;
    wire[15:0]  core__alu___GEN_10  =  core__alu___GEN_8  [29:14]|  core__alu___GEN_7  &16'h3333;
    wire[1:0]  core__alu___GEN_11  =  core__alu___GEN_8  [11:10]|  core__alu___shout_r_T_5  [37:36];
    wire[7:0]  core__alu___GEN_12  ={  core__alu___GEN_8  [5:0],2'h0}|{  core__alu___shout_r_T_5  [47:44],  core__alu___shout_r_T_5  [51:48]}&8'h33;
    wire[50:0]  core__alu___GEN_13  ={  core__alu___shout_r_T_5  [5:4],  core__alu___shout_r_T_5  [7:6],  core__alu___shout_r_T_5  [9:8],  core__alu___GEN_9  ,  core__alu___GEN_10  ,  core__alu___GEN_7  [3:2],  core__alu___GEN_11  ,  core__alu___shout_r_T_5  [39:38],  core__alu___shout_r_T_5  [41:40],  core__alu___GEN_12  ,  core__alu___shout_r_T_5  [51:50],  core__alu___shout_r_T_5  [53:52],  core__alu___shout_r_T_5  [55]}&51'h5555555555555;
    wire  core__alu___logic_T_4  =  core__alu__io_fn  ==4'h6;
    wire[63:0]  core__alu__out  =  core__alu__io_fn  ==4'h0|  core__alu__io_fn  ==4'hA ?   core__alu___io_adder_out_T_3  :{63'h0,  core__alu__io_fn  >4'hB&  core__alu__slt  }|(  core__alu__io_fn  ==4'h4|  core__alu___logic_T_4   ?   core__alu__in1_xor_in2  :64'h0)|(  core__alu___logic_T_4  |  core__alu__io_fn  ==4'h7 ?   core__alu__io_in1  &  core__alu__io_in2  :64'h0)|(  core__alu___shout_T  |  core__alu___shout_T_1   ?   core__alu___shout_r_T_5  [63:0]:64'h0)|(  core__alu__io_fn  ==4'h1 ? {  core__alu___shout_r_T_5  [0],  core__alu___shout_r_T_5  [1],  core__alu___shout_r_T_5  [2],  core__alu___shout_r_T_5  [3],  core__alu___shout_r_T_5  [4],  core__alu___GEN_13  [50:47]|{  core__alu___shout_r_T_5  [7:6],  core__alu___shout_r_T_5  [9:8]}&4'h5,  core__alu___GEN_13  [46:39]|  core__alu___GEN_9  &8'h55,  core__alu___GEN_13  [38:23]|  core__alu___GEN_10  &16'h5555,  core__alu___GEN_10  [1],  core__alu___GEN_13  [21]|  core__alu___GEN_7  [2],{  core__alu___GEN_7  [3],1'h0}|  core__alu___GEN_11  &2'h1,  core__alu___GEN_13  [18:15]|{  core__alu___shout_r_T_5  [39:38],  core__alu___shout_r_T_5  [41:40]}&4'h5,  core__alu___GEN_13  [14:7]|  core__alu___GEN_12  &8'h55,  core__alu___GEN_12  [1],  core__alu___GEN_13  [5]|  core__alu___shout_r_T_5  [50],  core__alu___shout_r_T_5  [51],  core__alu___shout_r_T_5  [52],{  core__alu___GEN_13  [2:0],1'h0}|{  core__alu___shout_r_T_5  [55:54],  core__alu___shout_r_T_5  [57:56]}&4'h5,  core__alu___shout_r_T_5  [57],  core__alu___shout_r_T_5  [58],  core__alu___shout_r_T_5  [59],  core__alu___shout_r_T_5  [60],  core__alu___shout_r_T_5  [61],  core__alu___shout_r_T_5  [62],  core__alu___shout_r_T_5  [63]}:64'h0);
    assign   core__alu__io_out  =  core__alu__io_dw   ?   core__alu__out  :{{32{  core__alu__out  [31]}},  core__alu__out  [31:0]};
    assign   core__alu__io_adder_out  =  core__alu___io_adder_out_T_3  ;
    assign   core__alu__io_cmp_out  =  core__alu__io_fn  [0]^(  core__alu__io_fn  [3] ?   core__alu__slt  :  core__alu__in1_xor_in2  ==64'h0);
    assign core__alu__io_dw = core__ex_ctrl_alu_dw;
    assign core__alu__io_fn = core__ex_ctrl_alu_fn;
    assign core__alu__io_in2 = core__casez_tmp_1;
    assign core__alu__io_in1 = core__ex_ctrl_sel_alu1==2'h2 ? {{30{core__ex_reg_pc[33]}},core__ex_reg_pc}:core__ex_ctrl_sel_alu1==2'h1 ? core__ex_rs_0:64'h0;
    assign core___alu_io_out = core__alu__io_out;
    assign core___alu_io_adder_out = core__alu__io_adder_out;
    assign core___alu_io_cmp_out = core__alu__io_cmp_out;


    wire  core__div__clock;
    wire  core__div__reset;
    wire  core__div__io_req_ready;
    wire  core__div__io_req_valid;
    wire [3:0] core__div__io_req_bits_fn;
    wire  core__div__io_req_bits_dw;
    wire [63:0] core__div__io_req_bits_in1;
    wire [63:0] core__div__io_req_bits_in2;
    wire [4:0] core__div__io_req_bits_tag;
    wire  core__div__io_kill;
    wire  core__div__io_resp_ready;
    wire  core__div__io_resp_valid;
    wire [63:0] core__div__io_resp_bits_data;
    wire [4:0] core__div__io_resp_bits_tag;

    reg[2:0]  core__div__state  ;
    reg  core__div__req_dw  ;
    reg[4:0]  core__div__req_tag  ;
    reg[6:0]  core__div__count  ;
    reg  core__div__neg_out  ;
    reg  core__div__isHi  ;
    reg  core__div__resHi  ;
    reg[64:0]  core__div__divisor  ;
    reg[129:0]  core__div__remainder  ;
    wire[63:0]  core__div__result  =  core__div__resHi   ?   core__div__remainder  [128:65]:  core__div__remainder  [63:0];
    wire[31:0]  core__div__loOut  =  core__div__req_dw  |  core__div__state  [0] ?   core__div__result  [31:0]:  core__div__result  [63:32];
    wire  core__div__io_resp_valid_0  =  core__div__state  ==3'h6|(&  core__div__state  );
    wire  core__div__io_req_ready_0  =  core__div__state  ==3'h0;
    wire[65:0]  core__div___prod_T_4  ={{65{  core__div__remainder  [64]}},  core__div__remainder  [0]}*{  core__div__divisor  [64],  core__div__divisor  }+{  core__div__remainder  [129],  core__div__remainder  [129:65]};
    wire[64:0]  core__div___subtractor_T_1  =  core__div__remainder  [128:64]-  core__div__divisor  ;
    wire[2:0]  core__div__decoded_invInputs  =~(  core__div__io_req_bits_fn  [2:0]);
    wire[1:0]  core__div___decoded_T_2  ={  core__div__decoded_invInputs  [1],  core__div__decoded_invInputs  [2]};
    wire  core__div__lhs_sign  =(|{  core__div__decoded_invInputs  [0],&  core__div___decoded_T_2  })&(  core__div__io_req_bits_dw   ?   core__div__io_req_bits_in1  [63]:  core__div__io_req_bits_in1  [31]);
    wire  core__div__rhs_sign  =(|{&  core__div___decoded_T_2  ,&{  core__div__decoded_invInputs  [0],  core__div__io_req_bits_fn  [2]}})&(  core__div__io_req_bits_dw   ?   core__div__io_req_bits_in2  [63]:  core__div__io_req_bits_in2  [31]);
    wire  core__div___GEN  =  core__div__state  ==3'h1;
    wire  core__div___GEN_0  =  core__div__state  ==3'h5;
    wire  core__div___GEN_1  =  core__div__state  ==3'h2;
    wire  core__div___GEN_2  =  core__div___GEN_1  &  core__div__count  ==7'h3F;
    wire  core__div___GEN_3  =  core__div__state  ==3'h3;
    wire  core__div___GEN_4  =  core__div__count  ==7'h40;
    wire  core__div___GEN_5  =  core__div__io_req_ready_0  &  core__div__io_req_valid  ;
    wire[1:0]  core__div___decoded_orMatrixOutputs_T_4  ={&{  core__div__io_req_bits_fn  [0],  core__div__decoded_invInputs  [2]},  core__div__io_req_bits_fn  [1]};
    always @( posedge   core__div__clock  )
    begin
        if (  core__div__reset  )
            core__div__state   <=3'h0;
        else
            if (  core__div___GEN_5  )
                core__div__state   <=  core__div__decoded_invInputs  [2] ? 3'h2:{1'h0,~(  core__div__lhs_sign  |  core__div__rhs_sign  ),1'h1};
            else
                if (  core__div__io_resp_ready  &  core__div__io_resp_valid_0  |  core__div__io_kill  )
                    core__div__state   <=3'h0;
                else
                    if (  core__div___GEN_3  &  core__div___GEN_4  )
                        core__div__state   <={1'h1,~  core__div__neg_out  ,1'h1};
                    else
                        if (  core__div___GEN_2  )
                            core__div__state   <=3'h6;
                        else
                            if (  core__div___GEN_0  )
                                core__div__state   <=3'h7;
                            else
                                if (  core__div___GEN  )
                                    core__div__state   <=3'h3;
        if (  core__div___GEN_5  )
        begin
            core__div__req_dw   <=  core__div__io_req_bits_dw  ;
            core__div__req_tag   <=  core__div__io_req_bits_tag  ;
            core__div__count   <={1'h0,  core__div__decoded_invInputs  [2]&~  core__div__io_req_bits_dw  ,5'h0};
            core__div__neg_out   <=(|  core__div___decoded_orMatrixOutputs_T_4  ) ?   core__div__lhs_sign  :  core__div__lhs_sign  !=  core__div__rhs_sign  ;
            core__div__isHi   <=|  core__div___decoded_orMatrixOutputs_T_4  ;
            core__div__divisor   <={  core__div__rhs_sign  ,  core__div__io_req_bits_dw   ?   core__div__io_req_bits_in2  [63:32]:{32{  core__div__rhs_sign  }},  core__div__io_req_bits_in2  [31:0]};
            core__div__remainder   <={66'h0,  core__div__io_req_bits_dw   ?   core__div__io_req_bits_in1  [63:32]:{32{  core__div__lhs_sign  }},  core__div__io_req_bits_in1  [31:0]};
        end
        else
        begin
            if (  core__div___GEN_3  )
            begin
                core__div__count   <=  core__div__count  +7'h1;
                core__div__remainder   <={1'h0,  core__div___subtractor_T_1  [64] ?   core__div__remainder  [127:64]:  core__div___subtractor_T_1  [63:0],  core__div__remainder  [63:0],~(  core__div___subtractor_T_1  [64])};
            end
            else
                if (  core__div___GEN_1  )
                begin
                    core__div__count   <=  core__div__count  +7'h1;
                    core__div__remainder   <={  core__div___prod_T_4  [65:1],  core__div__count  ==7'h3E&  core__div__neg_out  ,  core__div___prod_T_4  [0],  core__div__remainder  [63:1]};
                end
                else
                    if (  core__div___GEN_0  |  core__div___GEN  &  core__div__remainder  [63])
                        core__div__remainder   <={66'h0,64'h0-  core__div__result  };
            core__div__neg_out   <=~(  core__div___GEN_3  &  core__div__count  ==7'h0&~(  core__div___subtractor_T_1  [64])&~  core__div__isHi  )&  core__div__neg_out  ;
            if (  core__div___GEN  &  core__div__divisor  [63])
                core__div__divisor   <=  core__div___subtractor_T_1  ;
        end
        core__div__resHi   <=~  core__div___GEN_5  &(  core__div___GEN_3  &  core__div___GEN_4  |  core__div___GEN_2   ?   core__div__isHi  :~  core__div___GEN_0  &  core__div__resHi  );
    end

    assign   core__div__io_req_ready  =  core__div__io_req_ready_0  ;
    assign   core__div__io_resp_valid  =  core__div__io_resp_valid_0  ;
    assign   core__div__io_resp_bits_data  ={  core__div__req_dw   ?   core__div__result  [63:32]:{32{  core__div__loOut  [31]}},  core__div__loOut  };
    assign   core__div__io_resp_bits_tag  =  core__div__req_tag  ;
    assign core__div__clock = core__clock;
    assign core__div__reset = core__reset;
    assign core___div_io_req_ready = core__div__io_req_ready;
    assign core__div__io_req_valid = core__div_io_req_valid;
    assign core__div__io_req_bits_fn = core__ex_ctrl_alu_fn;
    assign core__div__io_req_bits_dw = core__ex_ctrl_alu_dw;
    assign core__div__io_req_bits_in1 = core__ex_rs_0;
    assign core__div__io_req_bits_in2 = core__ex_rs_1;
    assign core__div__io_req_bits_tag = core__ex_reg_inst[11:7];
    assign core__div__io_kill = core__killm_common&core__div_io_kill_REG;
    assign core__div__io_resp_ready = core__div_io_resp_ready;
    assign core___div_io_resp_valid = core__div__io_resp_valid;
    assign core___div_io_resp_bits_data = core__div__io_resp_bits_data;
    assign core___div_io_resp_bits_tag = core__div__io_resp_bits_tag;


    wire  core__PlusArgTimeout__clock;
    wire  core__PlusArgTimeout__reset;
    wire [31:0] core__PlusArgTimeout__io_count;

    wire[31:0]  core__PlusArgTimeout___plusarg_reader_out  ;
    always @( posedge   core__PlusArgTimeout__clock  )
    begin
        if ((|  core__PlusArgTimeout___plusarg_reader_out  )&~  core__PlusArgTimeout__reset  &  core__PlusArgTimeout__io_count  >=  core__PlusArgTimeout___plusarg_reader_out  )
        begin
            if (1)
                $display("Assertion failed: Timeout exceeded: Kill the emulation after INT rdtime cycles. Off if 0.\n    at PlusArg.scala:64 assert (io.count < max, s\"Timeout exceeded: $docstring\")\n");
            if (1)
                $display("");
        end
    end


    wire [ core__PlusArgTimeout__plusarg_reader__WIDTH -1:0] core__PlusArgTimeout__plusarg_reader__out;

    reg[  core__PlusArgTimeout__plusarg_reader__WIDTH  -1:0]  core__PlusArgTimeout__plusarg_reader__myplus  ;
    assign   core__PlusArgTimeout__plusarg_reader__out  =  core__PlusArgTimeout__plusarg_reader__myplus  ; initial
    begin
        if (!$value$plusargs(  core__PlusArgTimeout__plusarg_reader__FORMAT  ,  core__PlusArgTimeout__plusarg_reader__myplus  ))
            core__PlusArgTimeout__plusarg_reader__myplus   =  core__PlusArgTimeout__plusarg_reader__DEFAULT  ;
    end
    assign core__PlusArgTimeout___plusarg_reader_out = core__PlusArgTimeout__plusarg_reader__out;

    assign core__PlusArgTimeout__clock = core__clock;
    assign core__PlusArgTimeout__reset = core__reset;
    assign core__PlusArgTimeout__io_count = core___csr_io_time[31:0];

    assign   core__io_imem_might_request  =  core__imem_might_request_reg  ;
    assign   core__io_imem_req_valid  =  core__ibuf_io_kill  ;
    assign   core__io_imem_req_bits_pc  =  core__wb_xcpt  |  core___csr_io_eret   ?   core___csr_io_evec  :  core___replay_wb_T   ?   core__wb_reg_pc  :  core__mem_npc  ;
    assign   core__io_imem_req_bits_speculative  =~  core__take_pc_wb  ;
    assign   core__io_imem_btb_update_valid  =  core__mem_reg_valid  &~  core__take_pc_wb  &(  core__ex_pc_valid   ?   core__mem_npc  !=  core__ex_reg_pc  :~(  core___ibuf_io_inst_0_valid  |  core__io_imem_resp_valid  )|  core__mem_npc  !=  core___ibuf_io_pc  )&(~(  core__mem_ctrl_branch  |  core__mem_ctrl_jalr  |  core__mem_ctrl_jal  )|  core__mem_cfi_taken  );
    assign   core__io_imem_bht_update_valid  =  core__mem_reg_valid  &~  core__take_pc_wb  ;
    assign   core__io_imem_flush_icache  =  core__wb_reg_valid  &  core__wb_ctrl_fence_i  &~  core__io_dmem_s2_nack  ;
    assign   core__io_dmem_req_valid  =  core__io_dmem_req_valid_0  ;
    assign   core__io_dmem_req_bits_addr  ={  core__ex_rs_0  [63:33]==31'h0|(&(  core__ex_rs_0  [63:33])) ?   core___alu_io_adder_out  [33]:~(  core___alu_io_adder_out  [32]),  core___alu_io_adder_out  [32:0]};
    assign   core__io_dmem_req_bits_tag  ={  core__ex_reg_inst  [11:7],  core__ex_ctrl_fp  };
    assign   core__io_dmem_req_bits_cmd  =  core__ex_ctrl_mem_cmd  ;
    assign   core__io_dmem_req_bits_size  =  core__ex_reg_mem_size  ;
    assign   core__io_dmem_req_bits_signed  =~(  core__ex_reg_inst  [14]);
    assign   core__io_dmem_req_bits_dv  =  core___csr_io_status_dv  ;
    assign   core__io_dmem_s1_kill  =  core__killm_common  |  core__mem_ldst_xcpt  ;
    assign   core__io_dmem_s1_data_data  =  core__mem_reg_rs2  ;
    assign   core__io_ptw_status_debug  =  core___csr_io_status_debug  ;
    assign   core__io_ptw_customCSRs_csrs_0_value  =  core___csr_io_customCSRs_0_value  ;
    assign core__clock = clock;
    assign core__reset = reset;
    assign core__io_hartid = auto_hartid_in;
    assign core__io_interrupts_debug = _intXbar_auto_int_out_0;
    assign core__io_interrupts_mtip = _intXbar_auto_int_out_2;
    assign core__io_interrupts_msip = _intXbar_auto_int_out_1;
    assign core__io_interrupts_meip = _intXbar_auto_int_out_3;
    assign _core_io_imem_might_request = core__io_imem_might_request;
    assign _core_io_imem_req_valid = core__io_imem_req_valid;
    assign _core_io_imem_req_bits_pc = core__io_imem_req_bits_pc;
    assign _core_io_imem_req_bits_speculative = core__io_imem_req_bits_speculative;
    assign _core_io_imem_resp_ready = core__io_imem_resp_ready;
    assign core__io_imem_resp_valid = _frontend_io_cpu_resp_valid;
    assign core__io_imem_resp_bits_pc = _frontend_io_cpu_resp_bits_pc;
    assign core__io_imem_resp_bits_data = _frontend_io_cpu_resp_bits_data;
    assign core__io_imem_resp_bits_xcpt_pf_inst = _frontend_io_cpu_resp_bits_xcpt_pf_inst;
    assign core__io_imem_resp_bits_xcpt_gf_inst = _frontend_io_cpu_resp_bits_xcpt_gf_inst;
    assign core__io_imem_resp_bits_xcpt_ae_inst = _frontend_io_cpu_resp_bits_xcpt_ae_inst;
    assign core__io_imem_resp_bits_replay = _frontend_io_cpu_resp_bits_replay;
    assign _core_io_imem_btb_update_valid = core__io_imem_btb_update_valid;
    assign _core_io_imem_bht_update_valid = core__io_imem_bht_update_valid;
    assign _core_io_imem_flush_icache = core__io_imem_flush_icache;
    assign core__io_dmem_req_ready = _dcacheArb_io_requestor_0_req_ready;
    assign _core_io_dmem_req_valid = core__io_dmem_req_valid;
    assign _core_io_dmem_req_bits_addr = core__io_dmem_req_bits_addr;
    assign _core_io_dmem_req_bits_tag = core__io_dmem_req_bits_tag;
    assign _core_io_dmem_req_bits_cmd = core__io_dmem_req_bits_cmd;
    assign _core_io_dmem_req_bits_size = core__io_dmem_req_bits_size;
    assign _core_io_dmem_req_bits_signed = core__io_dmem_req_bits_signed;
    assign _core_io_dmem_req_bits_dv = core__io_dmem_req_bits_dv;
    assign _core_io_dmem_s1_kill = core__io_dmem_s1_kill;
    assign _core_io_dmem_s1_data_data = core__io_dmem_s1_data_data;
    assign core__io_dmem_s2_nack = _dcacheArb_io_requestor_0_s2_nack;
    assign core__io_dmem_resp_valid = _dcacheArb_io_requestor_0_resp_valid;
    assign core__io_dmem_resp_bits_tag = _dcacheArb_io_requestor_0_resp_bits_tag;
    assign core__io_dmem_resp_bits_data = _dcacheArb_io_requestor_0_resp_bits_data;
    assign core__io_dmem_resp_bits_replay = _dcacheArb_io_requestor_0_resp_bits_replay;
    assign core__io_dmem_resp_bits_has_data = _dcacheArb_io_requestor_0_resp_bits_has_data;
    assign core__io_dmem_resp_bits_data_word_bypass = _dcacheArb_io_requestor_0_resp_bits_data_word_bypass;
    assign core__io_dmem_replay_next = _dcacheArb_io_requestor_0_replay_next;
    assign core__io_dmem_s2_xcpt_ma_ld = _dcacheArb_io_requestor_0_s2_xcpt_ma_ld;
    assign core__io_dmem_s2_xcpt_ma_st = _dcacheArb_io_requestor_0_s2_xcpt_ma_st;
    assign core__io_dmem_s2_xcpt_pf_ld = _dcacheArb_io_requestor_0_s2_xcpt_pf_ld;
    assign core__io_dmem_s2_xcpt_pf_st = _dcacheArb_io_requestor_0_s2_xcpt_pf_st;
    assign core__io_dmem_s2_xcpt_ae_ld = _dcacheArb_io_requestor_0_s2_xcpt_ae_ld;
    assign core__io_dmem_s2_xcpt_ae_st = _dcacheArb_io_requestor_0_s2_xcpt_ae_st;
    assign core__io_dmem_ordered = _dcacheArb_io_requestor_0_ordered;
    assign core__io_dmem_perf_release = _dcacheArb_io_requestor_0_perf_release;
    assign core__io_dmem_perf_grant = _dcacheArb_io_requestor_0_perf_grant;
    assign _core_io_ptw_status_debug = core__io_ptw_status_debug;
    assign _core_io_ptw_pmp_cfg_l_0 = core__io_ptw_pmp_cfg_l_0;
    assign _core_io_ptw_pmp_cfg_l_1 = core__io_ptw_pmp_cfg_l_1;
    assign _core_io_ptw_pmp_cfg_l_2 = core__io_ptw_pmp_cfg_l_2;
    assign _core_io_ptw_pmp_cfg_l_3 = core__io_ptw_pmp_cfg_l_3;
    assign _core_io_ptw_pmp_cfg_l_4 = core__io_ptw_pmp_cfg_l_4;
    assign _core_io_ptw_pmp_cfg_l_5 = core__io_ptw_pmp_cfg_l_5;
    assign _core_io_ptw_pmp_cfg_l_6 = core__io_ptw_pmp_cfg_l_6;
    assign _core_io_ptw_pmp_cfg_l_7 = core__io_ptw_pmp_cfg_l_7;
    assign _core_io_ptw_pmp_cfg_a_0 = core__io_ptw_pmp_cfg_a_0;
    assign _core_io_ptw_pmp_cfg_a_1 = core__io_ptw_pmp_cfg_a_1;
    assign _core_io_ptw_pmp_cfg_a_2 = core__io_ptw_pmp_cfg_a_2;
    assign _core_io_ptw_pmp_cfg_a_3 = core__io_ptw_pmp_cfg_a_3;
    assign _core_io_ptw_pmp_cfg_a_4 = core__io_ptw_pmp_cfg_a_4;
    assign _core_io_ptw_pmp_cfg_a_5 = core__io_ptw_pmp_cfg_a_5;
    assign _core_io_ptw_pmp_cfg_a_6 = core__io_ptw_pmp_cfg_a_6;
    assign _core_io_ptw_pmp_cfg_a_7 = core__io_ptw_pmp_cfg_a_7;
    assign _core_io_ptw_pmp_cfg_x_0 = core__io_ptw_pmp_cfg_x_0;
    assign _core_io_ptw_pmp_cfg_x_1 = core__io_ptw_pmp_cfg_x_1;
    assign _core_io_ptw_pmp_cfg_x_2 = core__io_ptw_pmp_cfg_x_2;
    assign _core_io_ptw_pmp_cfg_x_3 = core__io_ptw_pmp_cfg_x_3;
    assign _core_io_ptw_pmp_cfg_x_4 = core__io_ptw_pmp_cfg_x_4;
    assign _core_io_ptw_pmp_cfg_x_5 = core__io_ptw_pmp_cfg_x_5;
    assign _core_io_ptw_pmp_cfg_x_6 = core__io_ptw_pmp_cfg_x_6;
    assign _core_io_ptw_pmp_cfg_x_7 = core__io_ptw_pmp_cfg_x_7;
    assign _core_io_ptw_pmp_cfg_w_0 = core__io_ptw_pmp_cfg_w_0;
    assign _core_io_ptw_pmp_cfg_w_1 = core__io_ptw_pmp_cfg_w_1;
    assign _core_io_ptw_pmp_cfg_w_2 = core__io_ptw_pmp_cfg_w_2;
    assign _core_io_ptw_pmp_cfg_w_3 = core__io_ptw_pmp_cfg_w_3;
    assign _core_io_ptw_pmp_cfg_w_4 = core__io_ptw_pmp_cfg_w_4;
    assign _core_io_ptw_pmp_cfg_w_5 = core__io_ptw_pmp_cfg_w_5;
    assign _core_io_ptw_pmp_cfg_w_6 = core__io_ptw_pmp_cfg_w_6;
    assign _core_io_ptw_pmp_cfg_w_7 = core__io_ptw_pmp_cfg_w_7;
    assign _core_io_ptw_pmp_cfg_r_0 = core__io_ptw_pmp_cfg_r_0;
    assign _core_io_ptw_pmp_cfg_r_1 = core__io_ptw_pmp_cfg_r_1;
    assign _core_io_ptw_pmp_cfg_r_2 = core__io_ptw_pmp_cfg_r_2;
    assign _core_io_ptw_pmp_cfg_r_3 = core__io_ptw_pmp_cfg_r_3;
    assign _core_io_ptw_pmp_cfg_r_4 = core__io_ptw_pmp_cfg_r_4;
    assign _core_io_ptw_pmp_cfg_r_5 = core__io_ptw_pmp_cfg_r_5;
    assign _core_io_ptw_pmp_cfg_r_6 = core__io_ptw_pmp_cfg_r_6;
    assign _core_io_ptw_pmp_cfg_r_7 = core__io_ptw_pmp_cfg_r_7;
    assign _core_io_ptw_pmp_addr_0 = core__io_ptw_pmp_addr_0;
    assign _core_io_ptw_pmp_addr_1 = core__io_ptw_pmp_addr_1;
    assign _core_io_ptw_pmp_addr_2 = core__io_ptw_pmp_addr_2;
    assign _core_io_ptw_pmp_addr_3 = core__io_ptw_pmp_addr_3;
    assign _core_io_ptw_pmp_addr_4 = core__io_ptw_pmp_addr_4;
    assign _core_io_ptw_pmp_addr_5 = core__io_ptw_pmp_addr_5;
    assign _core_io_ptw_pmp_addr_6 = core__io_ptw_pmp_addr_6;
    assign _core_io_ptw_pmp_addr_7 = core__io_ptw_pmp_addr_7;
    assign _core_io_ptw_pmp_mask_0 = core__io_ptw_pmp_mask_0;
    assign _core_io_ptw_pmp_mask_1 = core__io_ptw_pmp_mask_1;
    assign _core_io_ptw_pmp_mask_2 = core__io_ptw_pmp_mask_2;
    assign _core_io_ptw_pmp_mask_3 = core__io_ptw_pmp_mask_3;
    assign _core_io_ptw_pmp_mask_4 = core__io_ptw_pmp_mask_4;
    assign _core_io_ptw_pmp_mask_5 = core__io_ptw_pmp_mask_5;
    assign _core_io_ptw_pmp_mask_6 = core__io_ptw_pmp_mask_6;
    assign _core_io_ptw_pmp_mask_7 = core__io_ptw_pmp_mask_7;
    assign _core_io_ptw_customCSRs_csrs_0_value = core__io_ptw_customCSRs_csrs_0_value;
    assign _core_io_wfi = core__io_wfi;

    assign auto_wfi_out_0=wfiNodeOut_0_REG;
endmodule
