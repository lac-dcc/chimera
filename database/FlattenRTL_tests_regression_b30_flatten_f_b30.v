// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module b30 #(
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_ph1_handle_state_type_ph1_1_state=0,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_ph1_handle_state_type_ph1_2_state=1,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_ph1_handle_state_type_ph1_1_state=0,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_ph1_handle_state_type_ph1_2_state=1,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_1_state=0,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_2_state=1,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_3_state=2,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_4_state=3,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_1_state=0,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_2_state=1,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_3_state=2,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_4_state=3,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_1_state=0,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_2_state=1,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_3_state=2,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_4_state=3,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_1_state=0,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_2_state=1,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_3_state=2,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_4_state=3,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_start_state=0,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph1bis_state=1,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph2_state=2,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph3_state=3,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph4_state=4,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph5_state=5,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph1_state=6,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_cc_vcc_state=7,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state=8,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int1_state=9,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int_2_state=10,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int3_state=11,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int4_state=12,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int5_state=13,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int6_state=14,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph6_state=15,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int7_state=16,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph7_state=17,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int8_state=18,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph8_state=19,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int9_state=20,
        parameter instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph9_state=21,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_start_state=0,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph1bis_state=1,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph2_state=2,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph3_state=3,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph4_state=4,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph5_state=5,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph1_state=6,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_cc_vcc_state=7,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state=8,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int1_state=9,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int_2_state=10,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int3_state=11,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int4_state=12,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int5_state=13,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int6_state=14,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph6_state=15,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int7_state=16,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph7_state=17,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int8_state=18,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph8_state=19,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int9_state=20,
        parameter instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph9_state=21,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_start_state=0,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_zero_1=1,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_zero_2=2,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_zero_3=3,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_one_0=4,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_one_1=5,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_one_2=6,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_one_3=7,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_start_state=0,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_zero_1=1,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_zero_2=2,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_zero_3=3,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_one_0=4,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_one_1=5,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_one_2=6,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_one_3=7,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_start_state=0,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_zero_1=1,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_zero_2=2,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_zero_3=3,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_one_0=4,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_one_1=5,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_one_2=6,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_one_3=7,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_start_state=0,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_zero_1=1,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_zero_2=2,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_zero_3=3,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_one_0=4,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_one_1=5,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_one_2=6,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_one_3=7,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_start_state=0,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_zero_1=1,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_zero_2=2,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_zero_3=3,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_one_0=4,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_one_1=5,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_one_2=6,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_one_3=7,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_start_state=0,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_zero_1=1,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_zero_2=2,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_zero_3=3,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_one_0=4,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_one_1=5,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_one_2=6,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_one_3=7,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_start_state=0,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_zero_1=1,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_zero_2=2,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_zero_3=3,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_one_0=4,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_one_1=5,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_one_2=6,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_one_3=7,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_start_state=0,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_zero_1=1,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_zero_2=2,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_zero_3=3,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_one_0=4,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_one_1=5,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_one_2=6,
        parameter instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_one_3=7,
        parameter instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock_fsm1_state_type_start_state=0,
        parameter instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock_fsm1_state_type_off1_state=1,
        parameter instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock_fsm1_state_type_sample_state=2,
        parameter instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock_fsm1_state_type_off2_state=3,
        parameter instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock_fsm2_state_type_start_state=0,
        parameter instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock_fsm2_state_type_off1_state=1,
        parameter instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock_fsm2_state_type_sample_state=2,
        parameter instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock_fsm2_state_type_off2_state=3) (
            input [6-1:0] a_bus,
            input clock,
            input cs,
            input [21-1:0] digital_input,
            input ds,
            input [3-1:0] fbk_pwm,
            input [6-1:0] inj_cmd,
            input in_speed,
            input [2-1:0] i_fbk,
            input [7-1:0] nssm_in,
            input reset,
            input rpm_in,
            input r_w,
            input seg_speed_hall,
            input seg_speed_pickup,
            input trg_knock1,
            input trg_knock2,
            input turbo_speed,
            input vehicle_speed,
            input [6-1:0] v_fbk,
            output cam_smot,
            output [7:0] digital_output,
            output [2-1:0] hlo,
            output in_speed_lev,
            output irq,
            output [2-1:0] knock1,
            output knock1u,
            output [2-1:0] knock2,
            output knock2u,
            output relpot,
            output rpm_out,
            output seg_speed_lev,
            output smot60,
            output [6-1:0] t1,
            output [6-1:0] t2,
            output [2-1:0] t3,
            output turbo,
            output turbo_speed_lev,
            output vehicle,
            inout [16-1:0] d_bus_ext) ;

    wire [6-1:0] instance_inj_ctrl_a_bus;
    wire  instance_inj_ctrl_clock;
    wire  instance_inj_ctrl_cs;
    wire [21-1:0] instance_inj_ctrl_digital_input;
    wire  instance_inj_ctrl_ds;
    wire [3-1:0] instance_inj_ctrl_fbk_pwm;
    wire [6-1:0] instance_inj_ctrl_inj_cmd;
    wire  instance_inj_ctrl_in_speed;
    wire [2-1:0] instance_inj_ctrl_i_fbk;
    wire [7-1:0] instance_inj_ctrl_nssm_in;
    wire  instance_inj_ctrl_rpm_in;
    wire  instance_inj_ctrl_rst;
    wire  instance_inj_ctrl_r_w;
    wire  instance_inj_ctrl_seg_speed_hall;
    wire  instance_inj_ctrl_seg_speed_pickup;
    wire  instance_inj_ctrl_trg_knock1;
    wire  instance_inj_ctrl_trg_knock2;
    wire  instance_inj_ctrl_turbo_speed;
    wire  instance_inj_ctrl_vehicle_speed;
    wire [6-1:0] instance_inj_ctrl_v_fbk;
    wire  instance_inj_ctrl_cam_smot;
    wire [7:0] instance_inj_ctrl_digital_output;
    wire [2-1:0] instance_inj_ctrl_hlo;
    wire  instance_inj_ctrl_in_speed_lev;
    wire  instance_inj_ctrl_irq;
    wire [2-1:0] instance_inj_ctrl_knock1;
    wire  instance_inj_ctrl_knock1u;
    wire [2-1:0] instance_inj_ctrl_knock2;
    wire  instance_inj_ctrl_knock2u;
    wire  instance_inj_ctrl_relpot;
    wire  instance_inj_ctrl_rpm_out;
    wire  instance_inj_ctrl_seg_speed_lev;
    wire  instance_inj_ctrl_smot60;
    wire [6-1:0] instance_inj_ctrl_t1;
    wire [6-1:0] instance_inj_ctrl_t2;
    wire [2-1:0] instance_inj_ctrl_t3;
    wire  instance_inj_ctrl_turbo;
    wire  instance_inj_ctrl_turbo_speed_lev;
    wire  instance_inj_ctrl_vehicle;
    wire [16-1:0] instance_inj_ctrl_d_bus_ext;

    wire[3-1:0]  instance_inj_ctrl_inj_cmd_034  ;
    wire  instance_inj_ctrl_i_fbk_034  ;
    wire[8-1:0]  instance_inj_ctrl_r_t1  ;
    wire[7-1:0]  instance_inj_ctrl_r_t2  ;
    wire[8-1:0]  instance_inj_ctrl_r_t3_034  ;
    wire[7-1:0]  instance_inj_ctrl_r_t4_034  ;
    wire[10-1:0]  instance_inj_ctrl_r_tb_034  ;
    wire[12-1:0]  instance_inj_ctrl_r_th_034  ;
    wire[7-1:0]  instance_inj_ctrl_r_tonh  ;
    wire[7-1:0]  instance_inj_ctrl_r_tonl  ;
    wire[7-1:0]  instance_inj_ctrl_r_tp  ;
    wire[11-1:0]  instance_inj_ctrl_status_reg_034  ;
    wire[3-1:0]  instance_inj_ctrl_test_en_034  ;
    wire[3-1:0]  instance_inj_ctrl_v_fbk_034  ;
    wire  instance_inj_ctrl_en_fbk_store_034  ;
    wire  instance_inj_ctrl_en_state_store_034  ;
    wire  instance_inj_ctrl_error1  ;
    wire[7-1:0]  instance_inj_ctrl_global_state_034  ;
    wire  instance_inj_ctrl_hl_034  ;
    wire  instance_inj_ctrl_relpot1  ;
    wire  instance_inj_ctrl_t1_0  ;
    wire  instance_inj_ctrl_t1_3  ;
    wire  instance_inj_ctrl_t1_4  ;
    wire  instance_inj_ctrl_t2_0  ;
    wire  instance_inj_ctrl_t2_3  ;
    wire  instance_inj_ctrl_t2_4  ;
    wire  instance_inj_ctrl_t3_034  ;
    wire[3-1:0]  instance_inj_ctrl_inj_cmd_125  ;
    wire  instance_inj_ctrl_i_fbk_125  ;
    wire[8-1:0]  instance_inj_ctrl_r_t3_125  ;
    wire[7-1:0]  instance_inj_ctrl_r_t4_125  ;
    wire[10-1:0]  instance_inj_ctrl_r_tb_125  ;
    wire[12-1:0]  instance_inj_ctrl_r_th_125  ;
    wire[11-1:0]  instance_inj_ctrl_status_reg_125  ;
    wire[3-1:0]  instance_inj_ctrl_test_en_125  ;
    wire[3-1:0]  instance_inj_ctrl_v_fbk_125  ;
    wire  instance_inj_ctrl_en_fbk_store_125  ;
    wire  instance_inj_ctrl_en_state_store_125  ;
    wire  instance_inj_ctrl_error2  ;
    wire[7-1:0]  instance_inj_ctrl_global_state_125  ;
    wire  instance_inj_ctrl_hl_125  ;
    wire  instance_inj_ctrl_relpot2  ;
    wire  instance_inj_ctrl_t1_1  ;
    wire  instance_inj_ctrl_t1_2  ;
    wire  instance_inj_ctrl_t1_5  ;
    wire  instance_inj_ctrl_t2_1  ;
    wire  instance_inj_ctrl_t2_2  ;
    wire  instance_inj_ctrl_t2_5  ;
    wire  instance_inj_ctrl_t3_125  ;
    wire  instance_inj_ctrl_rd_en  ;
    wire  instance_inj_ctrl_wr_en  ;
    wire[16-1:0]  instance_inj_ctrl_d_bus  ;
    wire[2-1:0]  instance_inj_ctrl_i_fbk_f  ;
    wire[6-1:0]  instance_inj_ctrl_v_fbk_f  ;
    wire  instance_inj_ctrl_rel_pot_en  ;
    wire  instance_inj_ctrl_pickup_hall  ;
    wire  instance_inj_ctrl_smot_camme_en  ;
    wire  instance_inj_ctrl_trg_knock_en  ;
    wire  instance_inj_ctrl_clock_internal  ;

    wire  instance_inj_ctrl_instance_block_034_clock;
    wire [3-1:0] instance_inj_ctrl_instance_block_034_inj_cmd;
    wire  instance_inj_ctrl_instance_block_034_i_fbk;
    wire  instance_inj_ctrl_instance_block_034_rst;
    wire [8-1:0] instance_inj_ctrl_instance_block_034_r_t1;
    wire [7-1:0] instance_inj_ctrl_instance_block_034_r_t2;
    wire [8-1:0] instance_inj_ctrl_instance_block_034_r_t3;
    wire [7-1:0] instance_inj_ctrl_instance_block_034_r_t4;
    wire [10-1:0] instance_inj_ctrl_instance_block_034_r_tb;
    wire [12-1:0] instance_inj_ctrl_instance_block_034_r_th;
    wire [7-1:0] instance_inj_ctrl_instance_block_034_r_tonh;
    wire [7-1:0] instance_inj_ctrl_instance_block_034_r_tonl;
    wire [7-1:0] instance_inj_ctrl_instance_block_034_r_tp;
    wire [11-1:0] instance_inj_ctrl_instance_block_034_status_reg;
    wire [3-1:0] instance_inj_ctrl_instance_block_034_test_en;
    wire [3-1:0] instance_inj_ctrl_instance_block_034_v_fbk;
    wire  instance_inj_ctrl_instance_block_034_en_fbk_store;
    wire  instance_inj_ctrl_instance_block_034_en_state_store;
    wire  instance_inj_ctrl_instance_block_034_error;
    wire [7-1:0] instance_inj_ctrl_instance_block_034_global_state_store;
    wire  instance_inj_ctrl_instance_block_034_hl;
    wire  instance_inj_ctrl_instance_block_034_relpot;
    wire  instance_inj_ctrl_instance_block_034_t1a;
    wire  instance_inj_ctrl_instance_block_034_t1b;
    wire  instance_inj_ctrl_instance_block_034_t1c;
    wire  instance_inj_ctrl_instance_block_034_t2a;
    wire  instance_inj_ctrl_instance_block_034_t2b;
    wire  instance_inj_ctrl_instance_block_034_t2c;
    wire  instance_inj_ctrl_instance_block_034_t3;
    wire  instance_inj_ctrl_instance_block_125_clock;
    wire [3-1:0] instance_inj_ctrl_instance_block_125_inj_cmd;
    wire  instance_inj_ctrl_instance_block_125_i_fbk;
    wire  instance_inj_ctrl_instance_block_125_rst;
    wire [8-1:0] instance_inj_ctrl_instance_block_125_r_t1;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_r_t2;
    wire [8-1:0] instance_inj_ctrl_instance_block_125_r_t3;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_r_t4;
    wire [10-1:0] instance_inj_ctrl_instance_block_125_r_tb;
    wire [12-1:0] instance_inj_ctrl_instance_block_125_r_th;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_r_tonh;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_r_tonl;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_r_tp;
    wire [11-1:0] instance_inj_ctrl_instance_block_125_status_reg;
    wire [3-1:0] instance_inj_ctrl_instance_block_125_test_en;
    wire [3-1:0] instance_inj_ctrl_instance_block_125_v_fbk;
    wire  instance_inj_ctrl_instance_block_125_en_fbk_store;
    wire  instance_inj_ctrl_instance_block_125_en_state_store;
    wire  instance_inj_ctrl_instance_block_125_error;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_global_state_store;
    wire  instance_inj_ctrl_instance_block_125_hl;
    wire  instance_inj_ctrl_instance_block_125_relpot;
    wire  instance_inj_ctrl_instance_block_125_t1a;
    wire  instance_inj_ctrl_instance_block_125_t1b;
    wire  instance_inj_ctrl_instance_block_125_t1c;
    wire  instance_inj_ctrl_instance_block_125_t2a;
    wire  instance_inj_ctrl_instance_block_125_t2b;
    wire  instance_inj_ctrl_instance_block_125_t2c;
    wire  instance_inj_ctrl_instance_block_125_t3;

    wire  instance_inj_ctrl_instance_block_034_cs8  ;
    wire  instance_inj_ctrl_instance_block_034_end_t0  ;
    wire  instance_inj_ctrl_instance_block_034_cs4  ;
    wire[7-1:0]  instance_inj_ctrl_instance_block_034_chop_count  ;
    wire[12-1:0]  instance_inj_ctrl_instance_block_034_count  ;
    wire[12-1:0]  instance_inj_ctrl_instance_block_034_stop_count_bus  ;
    wire  instance_inj_ctrl_instance_block_034_comp  ;
    wire  instance_inj_ctrl_instance_block_034_cs1  ;
    wire[3-1:0]  instance_inj_ctrl_instance_block_034_cmd_stored  ;
    wire  instance_inj_ctrl_instance_block_034_end_on  ;
    wire  instance_inj_ctrl_instance_block_034_end_period  ;
    wire  instance_inj_ctrl_instance_block_034_sh_mode  ;
    wire  instance_inj_ctrl_instance_block_034_t4_0  ;
    wire  instance_inj_ctrl_instance_block_034_test_en_cur  ;
    wire  instance_inj_ctrl_instance_block_034_th_0  ;
    wire  instance_inj_ctrl_instance_block_034_v_fbk_cur  ;
    wire[3-1:0]  instance_inj_ctrl_instance_block_034_v_fbk_mask  ;
    wire[4-1:0]  instance_inj_ctrl_instance_block_034_cs0  ;
    wire  instance_inj_ctrl_instance_block_034_cs2  ;
    wire  instance_inj_ctrl_instance_block_034_t1  ;
    wire  instance_inj_ctrl_instance_block_034_t2  ;
    wire[7-1:0]  instance_inj_ctrl_instance_block_034_ton_reg  ;
    wire[7-1:0]  instance_inj_ctrl_instance_block_034_tp_reg  ;

    wire  instance_inj_ctrl_instance_block_034_instance_anti_glitch_clock;
    wire  instance_inj_ctrl_instance_block_034_instance_anti_glitch_cs8;
    wire  instance_inj_ctrl_instance_block_034_instance_anti_glitch_rst;
    wire  instance_inj_ctrl_instance_block_034_instance_anti_glitch_end_t0;
    wire  instance_inj_ctrl_instance_block_125_instance_anti_glitch_clock;
    wire  instance_inj_ctrl_instance_block_125_instance_anti_glitch_cs8;
    wire  instance_inj_ctrl_instance_block_125_instance_anti_glitch_rst;
    wire  instance_inj_ctrl_instance_block_125_instance_anti_glitch_end_t0;

    reg[2:0]  instance_inj_ctrl_instance_block_034_instance_anti_glitch_counter  ;
    always @(  posedge    instance_inj_ctrl_instance_block_034_instance_anti_glitch_clock          or  negedge   instance_inj_ctrl_instance_block_034_instance_anti_glitch_rst  )
    begin :  instance_inj_ctrl_instance_block_034_instance_anti_glitch_vhdl_count
        if (  instance_inj_ctrl_instance_block_034_instance_anti_glitch_rst  ==1'b0)
            instance_inj_ctrl_instance_block_034_instance_anti_glitch_counter   <=3'b000;
        else
        begin
            if (  instance_inj_ctrl_instance_block_034_instance_anti_glitch_cs8  ==1'b1)
                instance_inj_ctrl_instance_block_034_instance_anti_glitch_counter   <=3'b000;
            else
                instance_inj_ctrl_instance_block_034_instance_anti_glitch_counter   <=  instance_inj_ctrl_instance_block_034_instance_anti_glitch_counter  +3'b001;
        end
    end

    assign   instance_inj_ctrl_instance_block_034_instance_anti_glitch_end_t0  =  instance_inj_ctrl_instance_block_034_instance_anti_glitch_counter  [0]&  instance_inj_ctrl_instance_block_034_instance_anti_glitch_counter  [1]&  instance_inj_ctrl_instance_block_034_instance_anti_glitch_counter  [2];


    wire  instance_inj_ctrl_instance_block_034_instance_chopper_count_clock;
    wire  instance_inj_ctrl_instance_block_034_instance_chopper_count_cs4;
    wire  instance_inj_ctrl_instance_block_034_instance_chopper_count_rst;
    wire [7-1:0] instance_inj_ctrl_instance_block_034_instance_chopper_count_chop_count;
    wire  instance_inj_ctrl_instance_block_125_instance_chopper_count_clock;
    wire  instance_inj_ctrl_instance_block_125_instance_chopper_count_cs4;
    wire  instance_inj_ctrl_instance_block_125_instance_chopper_count_rst;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_instance_chopper_count_chop_count;

    reg[7-1:0]  instance_inj_ctrl_instance_block_034_instance_chopper_count_int_counter  ;
    always @(  posedge    instance_inj_ctrl_instance_block_034_instance_chopper_count_clock          or  negedge   instance_inj_ctrl_instance_block_034_instance_chopper_count_rst  )
    begin :  instance_inj_ctrl_instance_block_034_instance_chopper_count_vhdl_chopper_count
        if (  instance_inj_ctrl_instance_block_034_instance_chopper_count_rst  ==1'b0)
            instance_inj_ctrl_instance_block_034_instance_chopper_count_int_counter   <={7{1'b0}};
        else
        begin
            if (  instance_inj_ctrl_instance_block_034_instance_chopper_count_cs4  ==1'b1)
                instance_inj_ctrl_instance_block_034_instance_chopper_count_int_counter   <={7{1'b0}};
            else
                instance_inj_ctrl_instance_block_034_instance_chopper_count_int_counter   <=  instance_inj_ctrl_instance_block_034_instance_chopper_count_int_counter  +7'b0000001;
        end
    end

    assign   instance_inj_ctrl_instance_block_034_instance_chopper_count_chop_count  =  instance_inj_ctrl_instance_block_034_instance_chopper_count_int_counter  ;


    wire [12-1:0] instance_inj_ctrl_instance_block_034_instance_comparator_count;
    wire [12-1:0] instance_inj_ctrl_instance_block_034_instance_comparator_stop_count_bus;
    reg  instance_inj_ctrl_instance_block_034_instance_comparator_comp;
    wire [12-1:0] instance_inj_ctrl_instance_block_125_instance_comparator_count;
    wire [12-1:0] instance_inj_ctrl_instance_block_125_instance_comparator_stop_count_bus;
    reg  instance_inj_ctrl_instance_block_125_instance_comparator_comp;

    always @(    instance_inj_ctrl_instance_block_034_instance_comparator_count            or    instance_inj_ctrl_instance_block_034_instance_comparator_stop_count_bus   )
    begin :  instance_inj_ctrl_instance_block_034_instance_comparator_vhdl_comparator
        if (  instance_inj_ctrl_instance_block_034_instance_comparator_count  ==  instance_inj_ctrl_instance_block_034_instance_comparator_stop_count_bus  )
            instance_inj_ctrl_instance_block_034_instance_comparator_comp   <=1'b1;
        else
            instance_inj_ctrl_instance_block_034_instance_comparator_comp   <=1'b0;
    end



    wire  instance_inj_ctrl_instance_block_034_instance_counter_clock;
    wire  instance_inj_ctrl_instance_block_034_instance_counter_cs1;
    wire  instance_inj_ctrl_instance_block_034_instance_counter_rst;
    wire [12-1:0] instance_inj_ctrl_instance_block_034_instance_counter_count;
    wire  instance_inj_ctrl_instance_block_125_instance_counter_clock;
    wire  instance_inj_ctrl_instance_block_125_instance_counter_cs1;
    wire  instance_inj_ctrl_instance_block_125_instance_counter_rst;
    wire [12-1:0] instance_inj_ctrl_instance_block_125_instance_counter_count;

    reg[12-1:0]  instance_inj_ctrl_instance_block_034_instance_counter_int_counter  ;
    always @(  posedge    instance_inj_ctrl_instance_block_034_instance_counter_clock          or  negedge   instance_inj_ctrl_instance_block_034_instance_counter_rst  )
    begin :  instance_inj_ctrl_instance_block_034_instance_counter_vhdl_counter
        if (  instance_inj_ctrl_instance_block_034_instance_counter_rst  ==1'b0)
            instance_inj_ctrl_instance_block_034_instance_counter_int_counter   <={12{1'b0}};
        else
        begin
            if (  instance_inj_ctrl_instance_block_034_instance_counter_cs1  ==1'b1)
                instance_inj_ctrl_instance_block_034_instance_counter_int_counter   <={12{1'b0}};
            else
                instance_inj_ctrl_instance_block_034_instance_counter_int_counter   <=  instance_inj_ctrl_instance_block_034_instance_counter_int_counter  +11'b00000000001;
        end
    end

    assign   instance_inj_ctrl_instance_block_034_instance_counter_count  =  instance_inj_ctrl_instance_block_034_instance_counter_int_counter  ;


    wire  instance_inj_ctrl_instance_block_034_instance_fsm_clock;
    wire [3-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_cmd_stored;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_comp;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_end_on;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_end_period;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_end_t0;
    wire [3-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_inj_cmd;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_i_fbk;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_rst;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_sh_mode;
    wire [11-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_status_reg;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_t4_0;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_test_en_cur;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_th_0;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_v_fbk_cur;
    wire [3-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_v_fbk_mask;
    wire [4-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_cs0;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_cs1;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_cs2;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_cs4;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_cs8;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_en_fbk_store;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_en_state_store;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_error;
    wire [7-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_global_state_store;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_hl;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_relpot;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_t1;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_t2;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_t3;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_clock;
    wire [3-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_cmd_stored;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_comp;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_end_on;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_end_period;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_end_t0;
    wire [3-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_inj_cmd;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_i_fbk;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_rst;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_sh_mode;
    wire [11-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_status_reg;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_t4_0;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_test_en_cur;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_th_0;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_v_fbk_cur;
    wire [3-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_v_fbk_mask;
    wire [4-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_cs0;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_cs1;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_cs2;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_cs4;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_cs8;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_en_fbk_store;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_en_state_store;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_error;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_global_state_store;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_hl;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_relpot;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_t1;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_t2;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_t3;

    wire[7-1:0]  instance_inj_ctrl_instance_block_034_instance_fsm_global_state  ;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_enable_check  ;
    wire[5-1:0]  instance_inj_ctrl_instance_block_034_instance_fsm_cur_state  ;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_cs11  ;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_global1_state  ;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_cs111  ;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_t31  ;
    wire[2-1:0]  instance_inj_ctrl_instance_block_034_instance_fsm_global2_state  ;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_cs42  ;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_t12  ;
    wire[2-1:0]  instance_inj_ctrl_instance_block_034_instance_fsm_global4_state  ;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_cs44  ;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_t14  ;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_en_fbk_store_internal  ;

    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_clock;
    wire [7-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_global_state;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_rst;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_test_en_cur;
    reg  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_enable_check;
    reg  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_en_fbk_store;
    reg  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_en_state_store;
    wire [7-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_global_state_store;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_clock;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_global_state;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_rst;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_test_en_cur;
    reg  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_enable_check;
    reg  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_en_fbk_store;
    reg  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_en_state_store;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_global_state_store;

    reg[6:0]  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_global_state_store_int  ;
    reg[3-1:0]  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_delay_counter  ;
    always @(  posedge    instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_clock          or  negedge   instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_rst  )
        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_rst  ==1'b0)
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_global_state_store_int   <=7'b0000000;
        else
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_global_state_store_int   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_global_state  ;

    always @(  posedge    instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_clock          or  negedge   instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_rst  )
        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_rst  ==1'b0)
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_delay_counter   <=3'b000;
        else
        begin
            if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_global_state_store_int  !=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_global_state  )
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_delay_counter   <=3'b000;
            else
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_delay_counter  [2]==1'b0)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_delay_counter   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_delay_counter  +3'b001;
        end

    always @(      instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_delay_counter      [2]          or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_test_en_cur            or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_global_state           or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_global_state_store_int   )
    begin
        if ((  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_delay_counter  [2]==1'b1)&(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_test_en_cur  ==1'b1)&(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_global_state  ==  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_global_state_store_int  ))
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_enable_check   <=1'b1;
        else
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_enable_check   <=1'b0;
        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_global_state_store_int  !=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_global_state  )
        begin
            if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_global_state  [6:5]!=2'b11)
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_en_state_store   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_en_fbk_store   <=1'b1;
            end
            else
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_en_state_store   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_en_fbk_store   <=1'b1;
            end
        end
        else
        begin
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_en_state_store   <=1'b0;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_en_fbk_store   <=1'b0;
        end
    end

    assign   instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_global_state_store  =  instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_global_state  ;


    wire [5-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cur_state;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_en_fbk_store;
    wire [4-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cs0;
    reg  instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cs11;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_error;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_relpot;
    wire [5-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cur_state;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_en_fbk_store;
    wire [4-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cs0;
    reg  instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cs11;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_error;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_relpot;

    assign   instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_relpot  =  instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cur_state  [4]&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cur_state  [3]&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cur_state  [2]&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cur_state  [0];
    assign   instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cs0  =  instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cur_state  [4:1];
    assign   instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_error  =  instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cur_state  [4]&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cur_state  [3]&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cur_state  [2]&(~(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_en_fbk_store  ));
    always @(   instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cur_state   )
    case (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cur_state  )
        5 'b00000:
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cs11   <=1'b1;
        5 'b00010:
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cs11   <=1'b1;
        5 'b00100:
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cs11   <=1'b1;
        5 'b00110:
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cs11   <=1'b1;
        5 'b01000:
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cs11   <=1'b1;
        5 'b01010:
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cs11   <=1'b1;
        5 'b01100:
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cs11   <=1'b1;
        5 'b01110:
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cs11   <=1'b1;
        5 'b11000:
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cs11   <=1'b1;
        default :
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cs11   <=1'b0;
    endcase



    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_clock;
    wire [3-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_cmd_stored;
    wire [5-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_cur_state;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_end_t0;
    wire [3-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_inj_cmd;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_rst;
    reg  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_global1_state;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_clock;
    wire [3-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_cmd_stored;
    wire [5-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_cur_state;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_end_t0;
    wire [3-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_inj_cmd;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_rst;
    reg  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_global1_state;

    reg[1:0]  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_current_state  ;
    reg[1:0]  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_next_state  ;
    always @(  posedge    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_clock          or  negedge   instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_rst  )
    begin :  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_clocked
        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_rst  ==1'b0)
        begin
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_current_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_ph1_handle_state_type_ph1_1_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_global1_state   <=1'b0;
        end
        else
        begin
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_current_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_next_state  ;
            case (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_next_state  )
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_ph1_handle_state_type_ph1_1_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_global1_state   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_ph1_handle_state_type_ph1_2_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_global1_state   <=1'b1;
                default :
                    ;
            endcase
        end
    end

    always @(         instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_current_state                      or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_clock               or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_cmd_stored              or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_cur_state             or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_end_t0            or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_inj_cmd           or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_rst   )
    begin :  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_set_next_state
        instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_current_state  ;
        case (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_current_state  )
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_ph1_handle_state_type_ph1_1_state   :
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_end_t0  ==1'b1&(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_inj_cmd  ==  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_cmd_stored  )&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_cur_state  ==5'b00001)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_ph1_handle_state_type_ph1_2_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_cur_state  !=5'b00001)
                        instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_ph1_handle_state_type_ph1_1_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_ph1_handle_state_type_ph1_2_state   :
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_cur_state  !=5'b00001)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_ph1_handle_state_type_ph1_1_state  ;
            default :
                ;
        endcase
    end



    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_output_handle_global1_state;
    reg  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_output_handle_cs111;
    reg  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_output_handle_t31;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_output_handle_global1_state;
    reg  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_output_handle_cs111;
    reg  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_output_handle_t31;

    always @(   instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_output_handle_global1_state   )
        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_output_handle_global1_state  ==1'b1)
        begin
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_output_handle_t31   <=1'b1;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_output_handle_cs111   <=1'b0;
        end
        else
        begin
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_output_handle_t31   <=1'b0;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_output_handle_cs111   <=1'b1;
        end



    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_clock;
    wire [5-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_cur_state;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_end_on;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_end_period;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_i_fbk;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_rst;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_sh_mode;
    reg [2-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_global2_state;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_clock;
    wire [5-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_cur_state;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_end_on;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_end_period;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_i_fbk;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_rst;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_sh_mode;
    reg [2-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_global2_state;

    reg[1:0]  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_current_state  ;
    reg[1:0]  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_next_state  ;
    always @(  posedge    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_clock          or  negedge   instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_rst  )
    begin :  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_clocked
        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_rst  ==1'b0)
        begin
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_current_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_1_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_global2_state   <=2'b01;
        end
        else
        begin
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_current_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_next_state  ;
            case (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_next_state  )
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_1_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_global2_state   <=2'b01;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_2_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_global2_state   <=2'b10;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_3_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_global2_state   <=2'b11;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_4_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_global2_state   <=2'b00;
                default :
                    ;
            endcase
        end
    end

    always @(          instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_current_state                        or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_clock                or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_cur_state               or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_end_on              or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_end_period             or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_i_fbk            or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_rst           or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_sh_mode   )
    begin :  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_set_next_state
        instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_current_state  ;
        case (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_current_state  )
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_1_state   :
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_cur_state  ==5'b00101&((  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_sh_mode  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_i_fbk  ==1'b1)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_sh_mode  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_end_on  ==1'b1)))
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_2_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_cur_state  !=5'b00101)
                        instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_1_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_2_state   :
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_cur_state  ==5'b00101)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_3_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_cur_state  !=5'b00101)
                        instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_1_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_3_state   :
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_cur_state  ==5'b00101&((  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_sh_mode  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_i_fbk  ==1'b0)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_sh_mode  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_end_period  ==1'b1)))
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_4_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_cur_state  !=5'b00101)
                        instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_1_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_4_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_1_state  ;
            default :
                ;
        endcase
    end



    wire [2-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_output_handle_global2_state;
    reg  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_output_handle_cs42;
    reg  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_output_handle_t12;
    wire [2-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_output_handle_global2_state;
    reg  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_output_handle_cs42;
    reg  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_output_handle_t12;

    always @(   instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_output_handle_global2_state   )
    begin
        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_output_handle_global2_state  ==2'b00)
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_output_handle_cs42   <=1'b1;
        else
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_output_handle_cs42   <=1'b0;
        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_output_handle_global2_state  [1]==1'b1)
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_output_handle_t12   <=1'b0;
        else
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_output_handle_t12   <=1'b1;
    end



    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_clock;
    wire [5-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_cur_state;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_end_on;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_end_period;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_i_fbk;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_rst;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_sh_mode;
    reg [2-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_global4_state;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_clock;
    wire [5-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_cur_state;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_end_on;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_end_period;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_i_fbk;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_rst;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_sh_mode;
    reg [2-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_global4_state;

    reg[1:0]  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_current_state  ;
    reg[1:0]  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_next_state  ;
    always @(  posedge    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_clock          or  negedge   instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_rst  )
    begin :  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_clocked
        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_rst  ==1'b0)
        begin
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_current_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_1_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_global4_state   <=2'b01;
        end
        else
        begin
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_current_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_next_state  ;
            case (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_next_state  )
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_1_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_global4_state   <=2'b01;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_2_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_global4_state   <=2'b10;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_3_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_global4_state   <=2'b11;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_4_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_global4_state   <=2'b00;
                default :
                    ;
            endcase
        end
    end

    always @(          instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_current_state                        or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_clock                or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_cur_state               or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_end_on              or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_end_period             or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_i_fbk            or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_rst           or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_sh_mode   )
    begin :  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_set_next_state
        instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_current_state  ;
        case (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_current_state  )
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_1_state   :
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_cur_state  ==5'b01001&((  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_sh_mode  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_i_fbk  ==1'b1)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_sh_mode  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_end_on  ==1'b1)))
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_2_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_cur_state  !=5'b01001&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_cur_state  !=5'b11001)
                        instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_1_state  ;
                    else
                        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_cur_state  ==5'b11001&((  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_sh_mode  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_i_fbk  ==1'b1)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_sh_mode  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_end_on  ==1'b1)))
                            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_2_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_2_state   :
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_cur_state  ==5'b01001|  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_cur_state  ==5'b11001)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_3_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_cur_state  !=5'b01001&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_cur_state  !=5'b11001)
                        instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_1_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_3_state   :
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_cur_state  ==5'b01001&((  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_sh_mode  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_i_fbk  ==1'b0)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_sh_mode  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_end_period  ==1'b1)))
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_4_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_cur_state  !=5'b01001&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_cur_state  !=5'b11001)
                        instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_1_state  ;
                    else
                        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_cur_state  ==5'b11001&((  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_sh_mode  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_i_fbk  ==1'b0)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_sh_mode  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_end_period  ==1'b1)))
                            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_4_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_4_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_1_state  ;
            default :
                ;
        endcase
    end



    wire [2-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_output_handle_global4_state;
    reg  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_output_handle_cs44;
    reg  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_output_handle_t14;
    wire [2-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_output_handle_global4_state;
    reg  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_output_handle_cs44;
    reg  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_output_handle_t14;

    always @(   instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_output_handle_global4_state   )
    begin
        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_output_handle_global4_state  ==2'b00)
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_output_handle_cs44   <=1'b1;
        else
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_output_handle_cs44   <=1'b0;
        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_output_handle_global4_state  [1]==1'b1)
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_output_handle_t14   <=1'b0;
        else
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_output_handle_t14   <=1'b1;
    end



    wire [5-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_cur_state;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t12;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t14;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t31;
    reg  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl;
    reg  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1;
    reg  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2;
    reg  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3;
    wire [5-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_cur_state;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t12;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t14;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t31;
    reg  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl;
    reg  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1;
    reg  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2;
    reg  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3;

    always @(      instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t31                or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t12            or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t14           or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_cur_state   )
    begin :  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_vhdl_sel_actuator
        case (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_cur_state  )
            5 'b00000:
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b00001:
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t31  ;
            end
            5 'b00010:
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3   <=1'b1;
            end
            5 'b00011:
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3   <=1'b1;
            end
            5 'b00100:
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b00101:
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t12  ;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b00110:
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b00111:
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b01000:
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b01001:
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t14  ;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b01010:
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b01011:
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b01100:
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b01101:
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b01110:
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b01111:
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b11000:
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b11001:
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t14  ;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b11100:
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b11101:
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            default :
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
        endcase
    end



    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_chop_control_cs42;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_chop_control_cs44;
    wire [5-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_chop_control_cur_state;
    reg  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_chop_control_cs4;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_chop_control_cs42;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_chop_control_cs44;
    wire [5-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_chop_control_cur_state;
    reg  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_chop_control_cs4;

    always @(     instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_chop_control_cs42              or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_chop_control_cs44           or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_chop_control_cur_state   )
    begin :  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_chop_control_vhdl_sel_chop_control
        case (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_chop_control_cur_state  )
            5 'b00101:
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_chop_control_cs4   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_chop_control_cs42  ;
            5 'b01001:
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_chop_control_cs4   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_chop_control_cs44  ;
            5 'b11001:
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_chop_control_cs4   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_chop_control_cs44  ;
            default :
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_chop_control_cs4   <=1'b1;
        endcase
    end



    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs11;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs111;
    wire [5-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cur_state;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_global1_state;
    reg  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs1;
    reg  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs2;
    reg  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs8;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs11;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs111;
    wire [5-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cur_state;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_global1_state;
    reg  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs1;
    reg  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs2;
    reg  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs8;

    always @(      instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs11                or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs111            or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cur_state           or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_global1_state   )
    begin :  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_vhdl_sel_glob_count_cs
        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cur_state  ==5'b00001)
        begin
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs1   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs111  ;
            if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_global1_state  ==1'b0)
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs2   <=1'b1;
            else
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs2   <=1'b0;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs8   <=1'b0;
        end
        else
            if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cur_state  ==5'b00000)
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs1   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs11  ;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs2   <=1'b1;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs8   <=1'b1;
            end
            else
            begin
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs1   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs11  ;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs2   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs8   <=1'b1;
            end
    end



    wire [5-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_cur_state;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_global1_state;
    wire [2-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_global2_state;
    wire [2-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_global4_state;
    reg [7-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_global_state;
    wire [5-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_cur_state;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_global1_state;
    wire [2-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_global2_state;
    wire [2-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_global4_state;
    reg [7-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_global_state;

    always @(      instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_cur_state                or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_global1_state            or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_global2_state           or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_global4_state   )
    begin
        instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_global_state   [6:2]<=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_cur_state  ;
        case (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_cur_state  )
            5 'b00001:
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_global_state   [1:0]<={1'b0,  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_global1_state  };
            5 'b00101:
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_global_state   [1:0]<=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_global2_state  ;
            5 'b01001:
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_global_state   [1:0]<=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_global4_state  ;
            5 'b11001:
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_global_state   [1:0]<=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_global4_state  ;
            default :
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_global_state   [1:0]<=2'b00;
        endcase
    end



    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_clock;
    wire [3-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cmd_stored;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_end_t0;
    wire [7-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state;
    wire [3-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_inj_cmd;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_i_fbk;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_rst;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_sh_mode;
    wire [11-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_status_reg;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_t4_0;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_th_0;
    wire  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur;
    wire [3-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_mask;
    reg [5-1:0] instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_clock;
    wire [3-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cmd_stored;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_end_t0;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state;
    wire [3-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_inj_cmd;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_i_fbk;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_rst;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_sh_mode;
    wire [11-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_status_reg;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_t4_0;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_th_0;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur;
    wire [3-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_mask;
    reg [5-1:0] instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state;

    reg[4:0]  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_current_state  ;
    reg[4:0]  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state  ;
    always @(  posedge    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_clock          or  negedge   instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_rst  )
    begin :  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_clocked
        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_rst  ==1'b0)
        begin
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_current_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_start_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b00000;
        end
        else
        begin
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_current_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state  ;
            case (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state  )
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_start_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b00000;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph1bis_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b00011;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph2_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b00101;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph3_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b00111;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph4_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b01001;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph5_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b01011;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph1_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b00001;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_cc_vcc_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b11100;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b11101;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int1_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b00010;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int_2_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b00100;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int3_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b00110;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int4_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b01000;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int5_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b01010;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int6_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b01100;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph6_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b01101;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int7_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b01110;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph7_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b01111;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int8_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b11000;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph8_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b11001;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int9_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b01010;
                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph9_state   :
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state   <=5'b01011;
                default :
                    ;
            endcase
        end
    end

    always @(                  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_current_state                                        or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_clock                        or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cmd_stored                       or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp                      or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check                     or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_end_t0                    or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state                   or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_inj_cmd                  or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_i_fbk                 or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_rst                or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_sh_mode               or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_status_reg              or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_t4_0             or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_th_0            or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur           or    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_mask   )
    begin :  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_set_next_state
        instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_current_state  ;
        case (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_current_state  )
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_start_state   :
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_inj_cmd  !=3'b000&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_mask  ==3'b000)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph1_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_inj_cmd  !=3'b000&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_mask  !=3'b000&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check  ==1'b0)
                        instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph1_state  ;
                    else
                        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_inj_cmd  !=3'b000&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_mask  !=3'b000&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph1bis_state   :
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int_2_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                        instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state  ;
                    else
                        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check  ==1'b0)
                            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int_2_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph2_state   :
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp  ==1'b1&((  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b11)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b10)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b01&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b00)))
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int3_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b01&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                        instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state  ;
                    else
                        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b11&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_cc_vcc_state  ;
                        else
                            if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp  ==1'b1&((  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b11)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b10)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b01&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b00))&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check  ==1'b0)
                                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int3_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph3_state   :
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_th_0  ==1'b0)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int4_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                        instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_cc_vcc_state  ;
                    else
                        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_th_0  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp  ==1'b1)
                            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int5_state  ;
                        else
                            if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_th_0  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check  ==1'b0)
                                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int4_state  ;
                            else
                                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_th_0  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check  ==1'b0)
                                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int5_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph4_state   :
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp  ==1'b1&((  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b11)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b10)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b01&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b00)))
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int5_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b11&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                        instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_cc_vcc_state  ;
                    else
                        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b01&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state  ;
                        else
                            if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp  ==1'b1&((  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b11)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b10)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b01&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b00))&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check  ==1'b0)
                                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int5_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph5_state   :
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_t4_0  ==1'b1)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_start_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_t4_0  ==1'b0)
                        instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int6_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph1_state   :
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&((  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_i_fbk  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_sh_mode  ==1'b1)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_sh_mode  ==1'b0)))
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int1_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                        instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state  ;
                    else
                        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [0]==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_i_fbk  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_sh_mode  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state  ;
                        else
                            if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_inj_cmd  !=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cmd_stored  &  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [0]==1'b0)
                                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_start_state  ;
                            else
                                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp  ==1'b1&(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0|((  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_i_fbk  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_sh_mode  ==1'b1)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_sh_mode  ==1'b0)))&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check  ==1'b0)
                                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int1_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_cc_vcc_state   :
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_status_reg  ==11'b00000000000)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_start_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state   :
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_status_reg  ==11'b00000000000)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_start_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int1_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph1bis_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int_2_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph2_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int3_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph3_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int4_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph4_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int5_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph5_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int6_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph6_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph6_state   :
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp  ==1'b1)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int7_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int7_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph7_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph7_state   :
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check  ==1'b0)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int8_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1)
                        instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int8_state  ;
                    else
                        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int8_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph8_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph8_state   :
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp  ==1'b1&((  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b11)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b10)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b01&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b00))&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check  ==1'b0)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int9_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp  ==1'b1&((  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b11)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b10)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b01&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1)|(  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b00)))
                        instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int9_state  ;
                    else
                        if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b11&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_cc_vcc_state  ;
                        else
                            if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state  [1:0]==2'b01&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                                instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_int9_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph9_state  ;
            instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_ph9_state   :
                if (  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp  ==1'b1)
                    instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_state_progression_state_type_start_state  ;
            default :
                ;
        endcase
    end


    assign   instance_inj_ctrl_instance_block_034_instance_fsm_en_fbk_store  =  instance_inj_ctrl_instance_block_034_instance_fsm_en_fbk_store_internal  ;


    wire  instance_inj_ctrl_instance_block_034_instance_internal_register_clock;
    wire [4-1:0] instance_inj_ctrl_instance_block_034_instance_internal_register_cs0;
    wire  instance_inj_ctrl_instance_block_034_instance_internal_register_cs2;
    wire  instance_inj_ctrl_instance_block_034_instance_internal_register_rst;
    wire [8-1:0] instance_inj_ctrl_instance_block_034_instance_internal_register_r_t1;
    wire [7-1:0] instance_inj_ctrl_instance_block_034_instance_internal_register_r_t2;
    wire [8-1:0] instance_inj_ctrl_instance_block_034_instance_internal_register_r_t3;
    wire [7-1:0] instance_inj_ctrl_instance_block_034_instance_internal_register_r_t4;
    wire [10-1:0] instance_inj_ctrl_instance_block_034_instance_internal_register_r_tb;
    wire [12-1:0] instance_inj_ctrl_instance_block_034_instance_internal_register_r_th;
    wire [7-1:0] instance_inj_ctrl_instance_block_034_instance_internal_register_r_tonh;
    wire [7-1:0] instance_inj_ctrl_instance_block_034_instance_internal_register_r_tonl;
    wire [7-1:0] instance_inj_ctrl_instance_block_034_instance_internal_register_r_tp;
    wire  instance_inj_ctrl_instance_block_034_instance_internal_register_sh_mode;
    wire [12-1:0] instance_inj_ctrl_instance_block_034_instance_internal_register_stop_count_bus;
    wire  instance_inj_ctrl_instance_block_034_instance_internal_register_t4_0;
    wire  instance_inj_ctrl_instance_block_034_instance_internal_register_th_0;
    wire [7-1:0] instance_inj_ctrl_instance_block_034_instance_internal_register_ton_reg;
    wire [7-1:0] instance_inj_ctrl_instance_block_034_instance_internal_register_tp_reg;
    wire  instance_inj_ctrl_instance_block_125_instance_internal_register_clock;
    wire [4-1:0] instance_inj_ctrl_instance_block_125_instance_internal_register_cs0;
    wire  instance_inj_ctrl_instance_block_125_instance_internal_register_cs2;
    wire  instance_inj_ctrl_instance_block_125_instance_internal_register_rst;
    wire [8-1:0] instance_inj_ctrl_instance_block_125_instance_internal_register_r_t1;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_instance_internal_register_r_t2;
    wire [8-1:0] instance_inj_ctrl_instance_block_125_instance_internal_register_r_t3;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_instance_internal_register_r_t4;
    wire [10-1:0] instance_inj_ctrl_instance_block_125_instance_internal_register_r_tb;
    wire [12-1:0] instance_inj_ctrl_instance_block_125_instance_internal_register_r_th;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_instance_internal_register_r_tonh;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_instance_internal_register_r_tonl;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_instance_internal_register_r_tp;
    wire  instance_inj_ctrl_instance_block_125_instance_internal_register_sh_mode;
    wire [12-1:0] instance_inj_ctrl_instance_block_125_instance_internal_register_stop_count_bus;
    wire  instance_inj_ctrl_instance_block_125_instance_internal_register_t4_0;
    wire  instance_inj_ctrl_instance_block_125_instance_internal_register_th_0;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_instance_internal_register_ton_reg;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_instance_internal_register_tp_reg;

    reg[12-1:0]  instance_inj_ctrl_instance_block_034_instance_internal_register_th  ;
    reg[10-1:0]  instance_inj_ctrl_instance_block_034_instance_internal_register_tb  ;
    reg[7-1:0]  instance_inj_ctrl_instance_block_034_instance_internal_register_tonh  ;
    reg[7-1:0]  instance_inj_ctrl_instance_block_034_instance_internal_register_tonl  ;
    always @(  posedge    instance_inj_ctrl_instance_block_034_instance_internal_register_clock          or  negedge   instance_inj_ctrl_instance_block_034_instance_internal_register_rst  )
    begin :  instance_inj_ctrl_instance_block_034_instance_internal_register_vhdl_internal_register
        if (  instance_inj_ctrl_instance_block_034_instance_internal_register_rst  ==1'b0)
        begin
            instance_inj_ctrl_instance_block_034_instance_internal_register_tb   <={10{1'b0}};
            instance_inj_ctrl_instance_block_034_instance_internal_register_th   <={12{1'b0}};
            instance_inj_ctrl_instance_block_034_instance_internal_register_tonh   <={7{1'b0}};
            instance_inj_ctrl_instance_block_034_instance_internal_register_tonl   <={7{1'b0}};
        end
        else
        begin
            if (  instance_inj_ctrl_instance_block_034_instance_internal_register_cs2  ==1'b1)
            begin
                instance_inj_ctrl_instance_block_034_instance_internal_register_tb   <=  instance_inj_ctrl_instance_block_034_instance_internal_register_r_tb  ;
                instance_inj_ctrl_instance_block_034_instance_internal_register_th   <=  instance_inj_ctrl_instance_block_034_instance_internal_register_r_th  ;
                instance_inj_ctrl_instance_block_034_instance_internal_register_tonh   <=  instance_inj_ctrl_instance_block_034_instance_internal_register_r_tonh  ;
                instance_inj_ctrl_instance_block_034_instance_internal_register_tonl   <=  instance_inj_ctrl_instance_block_034_instance_internal_register_r_tonl  ;
            end
        end
    end

    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_tp_reg  =  instance_inj_ctrl_instance_block_034_instance_internal_register_r_tp  ;
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_sh_mode  =  instance_inj_ctrl_instance_block_034_instance_internal_register_tb  [9];
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_th_0  =(~(  instance_inj_ctrl_instance_block_034_instance_internal_register_th  [0]|  instance_inj_ctrl_instance_block_034_instance_internal_register_th  [1]|  instance_inj_ctrl_instance_block_034_instance_internal_register_th  [2]|  instance_inj_ctrl_instance_block_034_instance_internal_register_th  [3]|  instance_inj_ctrl_instance_block_034_instance_internal_register_th  [4]|  instance_inj_ctrl_instance_block_034_instance_internal_register_th  [5]|  instance_inj_ctrl_instance_block_034_instance_internal_register_th  [6]|  instance_inj_ctrl_instance_block_034_instance_internal_register_th  [7]|  instance_inj_ctrl_instance_block_034_instance_internal_register_th  [8]|  instance_inj_ctrl_instance_block_034_instance_internal_register_th  [9]|  instance_inj_ctrl_instance_block_034_instance_internal_register_th  [10]|  instance_inj_ctrl_instance_block_034_instance_internal_register_th  [11]));
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_t4_0  =(~(  instance_inj_ctrl_instance_block_034_instance_internal_register_r_t4  [6]|  instance_inj_ctrl_instance_block_034_instance_internal_register_r_t4  [5]|  instance_inj_ctrl_instance_block_034_instance_internal_register_r_t4  [4]|  instance_inj_ctrl_instance_block_034_instance_internal_register_r_t4  [3]));
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_stop_count_bus  =(  instance_inj_ctrl_instance_block_034_instance_internal_register_cs0  ==4'b0000)?{5'b00000,  instance_inj_ctrl_instance_block_034_instance_internal_register_r_t1  [7:1]}:12'bZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_ton_reg  =(  instance_inj_ctrl_instance_block_034_instance_internal_register_cs0  ==4'b0000)?  instance_inj_ctrl_instance_block_034_instance_internal_register_tonh  :7'bZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_stop_count_bus  =(  instance_inj_ctrl_instance_block_034_instance_internal_register_cs0  ==4'b0001)?{5'b00000,  instance_inj_ctrl_instance_block_034_instance_internal_register_r_t1  [7:1]}:12'bZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_ton_reg  =(  instance_inj_ctrl_instance_block_034_instance_internal_register_cs0  ==4'b0001)?  instance_inj_ctrl_instance_block_034_instance_internal_register_tonh  :7'bZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_stop_count_bus  =(  instance_inj_ctrl_instance_block_034_instance_internal_register_cs0  ==4'b0010)?{3'b000,  instance_inj_ctrl_instance_block_034_instance_internal_register_tb  [8:0]}:12'bZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_ton_reg  =(  instance_inj_ctrl_instance_block_034_instance_internal_register_cs0  ==4'b0010)?  instance_inj_ctrl_instance_block_034_instance_internal_register_tonh  :7'bZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_stop_count_bus  =(  instance_inj_ctrl_instance_block_034_instance_internal_register_cs0  ==4'b0011)?{5'b00000,  instance_inj_ctrl_instance_block_034_instance_internal_register_r_t2  }:12'bZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_ton_reg  =(  instance_inj_ctrl_instance_block_034_instance_internal_register_cs0  ==4'b0011)?  instance_inj_ctrl_instance_block_034_instance_internal_register_tonl  :7'bZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_stop_count_bus  =(  instance_inj_ctrl_instance_block_034_instance_internal_register_cs0  ==4'b0100)?  instance_inj_ctrl_instance_block_034_instance_internal_register_th  :12'bZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_ton_reg  =(  instance_inj_ctrl_instance_block_034_instance_internal_register_cs0  ==4'b0100)?  instance_inj_ctrl_instance_block_034_instance_internal_register_tonl  :7'bZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_stop_count_bus  =(  instance_inj_ctrl_instance_block_034_instance_internal_register_cs0  ==4'b0101)?{5'b00000,  instance_inj_ctrl_instance_block_034_instance_internal_register_r_t1  [7:1]}:12'bZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_ton_reg  =(  instance_inj_ctrl_instance_block_034_instance_internal_register_cs0  ==4'b0101)?  instance_inj_ctrl_instance_block_034_instance_internal_register_tonl  :7'bZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_stop_count_bus  =(  instance_inj_ctrl_instance_block_034_instance_internal_register_cs0  ==4'b0110)?{4'b0000,  instance_inj_ctrl_instance_block_034_instance_internal_register_r_t3  }:12'bZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_ton_reg  =(  instance_inj_ctrl_instance_block_034_instance_internal_register_cs0  ==4'b0110)?  instance_inj_ctrl_instance_block_034_instance_internal_register_tonl  :7'bZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_stop_count_bus  =(  instance_inj_ctrl_instance_block_034_instance_internal_register_cs0  ==4'b0111)?{3'b000,  instance_inj_ctrl_instance_block_034_instance_internal_register_r_t1  ,1'b0}:12'bZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_ton_reg  =(  instance_inj_ctrl_instance_block_034_instance_internal_register_cs0  ==4'b0111)?  instance_inj_ctrl_instance_block_034_instance_internal_register_tonl  :7'bZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_stop_count_bus  =(  instance_inj_ctrl_instance_block_034_instance_internal_register_cs0  ==4'b1100)?{5'b00000,  instance_inj_ctrl_instance_block_034_instance_internal_register_r_t4  }:12'bZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_ton_reg  =(  instance_inj_ctrl_instance_block_034_instance_internal_register_cs0  ==4'b1100)?  instance_inj_ctrl_instance_block_034_instance_internal_register_tonl  :7'bZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_stop_count_bus  =(  instance_inj_ctrl_instance_block_034_instance_internal_register_cs0  [3:1]==3'b111)?{4'b0000,  instance_inj_ctrl_instance_block_034_instance_internal_register_r_t1  }:12'bZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_034_instance_internal_register_ton_reg  =(  instance_inj_ctrl_instance_block_034_instance_internal_register_cs0  [3:1]==3'b111)?  instance_inj_ctrl_instance_block_034_instance_internal_register_tonl  :7'bZZZZZZZ;


    wire [7-1:0] instance_inj_ctrl_instance_block_034_instance_on_comp_chop_count;
    wire [7-1:0] instance_inj_ctrl_instance_block_034_instance_on_comp_ton_reg;
    reg  instance_inj_ctrl_instance_block_034_instance_on_comp_end_on;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_instance_on_comp_chop_count;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_instance_on_comp_ton_reg;
    reg  instance_inj_ctrl_instance_block_125_instance_on_comp_end_on;

    always @(    instance_inj_ctrl_instance_block_034_instance_on_comp_chop_count            or    instance_inj_ctrl_instance_block_034_instance_on_comp_ton_reg   )
    begin :  instance_inj_ctrl_instance_block_034_instance_on_comp_vhdl_on_comp
        if (  instance_inj_ctrl_instance_block_034_instance_on_comp_chop_count  ==  instance_inj_ctrl_instance_block_034_instance_on_comp_ton_reg  )
            instance_inj_ctrl_instance_block_034_instance_on_comp_end_on   <=1'b1;
        else
            instance_inj_ctrl_instance_block_034_instance_on_comp_end_on   <=1'b0;
    end



    wire [3-1:0] instance_inj_ctrl_instance_block_034_instance_output_decoder_cmd_stored;
    wire  instance_inj_ctrl_instance_block_034_instance_output_decoder_t1;
    wire  instance_inj_ctrl_instance_block_034_instance_output_decoder_t2;
    reg  instance_inj_ctrl_instance_block_034_instance_output_decoder_t1a;
    reg  instance_inj_ctrl_instance_block_034_instance_output_decoder_t1b;
    reg  instance_inj_ctrl_instance_block_034_instance_output_decoder_t1c;
    reg  instance_inj_ctrl_instance_block_034_instance_output_decoder_t2a;
    reg  instance_inj_ctrl_instance_block_034_instance_output_decoder_t2b;
    reg  instance_inj_ctrl_instance_block_034_instance_output_decoder_t2c;
    wire [3-1:0] instance_inj_ctrl_instance_block_125_instance_output_decoder_cmd_stored;
    wire  instance_inj_ctrl_instance_block_125_instance_output_decoder_t1;
    wire  instance_inj_ctrl_instance_block_125_instance_output_decoder_t2;
    reg  instance_inj_ctrl_instance_block_125_instance_output_decoder_t1a;
    reg  instance_inj_ctrl_instance_block_125_instance_output_decoder_t1b;
    reg  instance_inj_ctrl_instance_block_125_instance_output_decoder_t1c;
    reg  instance_inj_ctrl_instance_block_125_instance_output_decoder_t2a;
    reg  instance_inj_ctrl_instance_block_125_instance_output_decoder_t2b;
    reg  instance_inj_ctrl_instance_block_125_instance_output_decoder_t2c;

    always @(     instance_inj_ctrl_instance_block_034_instance_output_decoder_cmd_stored              or    instance_inj_ctrl_instance_block_034_instance_output_decoder_t1           or    instance_inj_ctrl_instance_block_034_instance_output_decoder_t2   )
    begin :  instance_inj_ctrl_instance_block_034_instance_output_decoder_vhdl_output_decoder
        case (  instance_inj_ctrl_instance_block_034_instance_output_decoder_cmd_stored  )
            3 'b001:
            begin
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t1a   <=  instance_inj_ctrl_instance_block_034_instance_output_decoder_t1  ;
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t2a   <=  instance_inj_ctrl_instance_block_034_instance_output_decoder_t2  ;
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t1b   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t2b   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t1c   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t2c   <=1'b0;
            end
            3 'b010:
            begin
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t1b   <=  instance_inj_ctrl_instance_block_034_instance_output_decoder_t1  ;
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t2b   <=  instance_inj_ctrl_instance_block_034_instance_output_decoder_t2  ;
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t1a   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t2a   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t1c   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t2c   <=1'b0;
            end
            3 'b100:
            begin
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t1c   <=  instance_inj_ctrl_instance_block_034_instance_output_decoder_t1  ;
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t2c   <=  instance_inj_ctrl_instance_block_034_instance_output_decoder_t2  ;
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t1b   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t2b   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t1a   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t2a   <=1'b0;
            end
            default :
            begin
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t1a   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t2a   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t1b   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t2b   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t1c   <=1'b0;
                instance_inj_ctrl_instance_block_034_instance_output_decoder_t2c   <=1'b0;
            end
        endcase
    end



    wire [7-1:0] instance_inj_ctrl_instance_block_034_instance_period_comp_chop_count;
    wire [7-1:0] instance_inj_ctrl_instance_block_034_instance_period_comp_tp_reg;
    reg  instance_inj_ctrl_instance_block_034_instance_period_comp_end_period;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_instance_period_comp_chop_count;
    wire [7-1:0] instance_inj_ctrl_instance_block_125_instance_period_comp_tp_reg;
    reg  instance_inj_ctrl_instance_block_125_instance_period_comp_end_period;

    always @(    instance_inj_ctrl_instance_block_034_instance_period_comp_chop_count            or    instance_inj_ctrl_instance_block_034_instance_period_comp_tp_reg   )
    begin :  instance_inj_ctrl_instance_block_034_instance_period_comp_vhdl_period_comp
        if (  instance_inj_ctrl_instance_block_034_instance_period_comp_chop_count  ==  instance_inj_ctrl_instance_block_034_instance_period_comp_tp_reg  )
            instance_inj_ctrl_instance_block_034_instance_period_comp_end_period   <=1'b1;
        else
            instance_inj_ctrl_instance_block_034_instance_period_comp_end_period   <=1'b0;
    end



    wire  instance_inj_ctrl_instance_block_034_instance_sel_cmd_clock;
    wire  instance_inj_ctrl_instance_block_034_instance_sel_cmd_cs2;
    wire [3-1:0] instance_inj_ctrl_instance_block_034_instance_sel_cmd_inj_cmd;
    wire  instance_inj_ctrl_instance_block_034_instance_sel_cmd_rst;
    wire [3-1:0] instance_inj_ctrl_instance_block_034_instance_sel_cmd_test_en;
    wire [3-1:0] instance_inj_ctrl_instance_block_034_instance_sel_cmd_v_fbk;
    wire [3-1:0] instance_inj_ctrl_instance_block_034_instance_sel_cmd_cmd_stored;
    reg  instance_inj_ctrl_instance_block_034_instance_sel_cmd_test_en_cur;
    reg  instance_inj_ctrl_instance_block_034_instance_sel_cmd_v_fbk_cur;
    wire [3-1:0] instance_inj_ctrl_instance_block_034_instance_sel_cmd_v_fbk_mask;
    wire  instance_inj_ctrl_instance_block_125_instance_sel_cmd_clock;
    wire  instance_inj_ctrl_instance_block_125_instance_sel_cmd_cs2;
    wire [3-1:0] instance_inj_ctrl_instance_block_125_instance_sel_cmd_inj_cmd;
    wire  instance_inj_ctrl_instance_block_125_instance_sel_cmd_rst;
    wire [3-1:0] instance_inj_ctrl_instance_block_125_instance_sel_cmd_test_en;
    wire [3-1:0] instance_inj_ctrl_instance_block_125_instance_sel_cmd_v_fbk;
    wire [3-1:0] instance_inj_ctrl_instance_block_125_instance_sel_cmd_cmd_stored;
    reg  instance_inj_ctrl_instance_block_125_instance_sel_cmd_test_en_cur;
    reg  instance_inj_ctrl_instance_block_125_instance_sel_cmd_v_fbk_cur;
    wire [3-1:0] instance_inj_ctrl_instance_block_125_instance_sel_cmd_v_fbk_mask;

    reg[2:0]  instance_inj_ctrl_instance_block_034_instance_sel_cmd_cmd_stored_int  ;
    always @(  posedge    instance_inj_ctrl_instance_block_034_instance_sel_cmd_clock          or  negedge   instance_inj_ctrl_instance_block_034_instance_sel_cmd_rst  )
    begin :  instance_inj_ctrl_instance_block_034_instance_sel_cmd_vhdl_sel_cmd
        if (  instance_inj_ctrl_instance_block_034_instance_sel_cmd_rst  ==1'b0)
            instance_inj_ctrl_instance_block_034_instance_sel_cmd_cmd_stored_int   <=3'b000;
        else
        begin
            if (  instance_inj_ctrl_instance_block_034_instance_sel_cmd_cs2  ==1'b1)
                instance_inj_ctrl_instance_block_034_instance_sel_cmd_cmd_stored_int   <=  instance_inj_ctrl_instance_block_034_instance_sel_cmd_inj_cmd  ;
        end
    end

    always @(     instance_inj_ctrl_instance_block_034_instance_sel_cmd_v_fbk              or    instance_inj_ctrl_instance_block_034_instance_sel_cmd_cmd_stored_int           or    instance_inj_ctrl_instance_block_034_instance_sel_cmd_test_en   )
    case (  instance_inj_ctrl_instance_block_034_instance_sel_cmd_cmd_stored_int  )
        3 'b001:
        begin
            instance_inj_ctrl_instance_block_034_instance_sel_cmd_v_fbk_cur   <=  instance_inj_ctrl_instance_block_034_instance_sel_cmd_v_fbk  [0];
            instance_inj_ctrl_instance_block_034_instance_sel_cmd_test_en_cur   <=  instance_inj_ctrl_instance_block_034_instance_sel_cmd_test_en  [0];
        end
        3 'b010:
        begin
            instance_inj_ctrl_instance_block_034_instance_sel_cmd_v_fbk_cur   <=  instance_inj_ctrl_instance_block_034_instance_sel_cmd_v_fbk  [1];
            instance_inj_ctrl_instance_block_034_instance_sel_cmd_test_en_cur   <=  instance_inj_ctrl_instance_block_034_instance_sel_cmd_test_en  [1];
        end
        3 'b100:
        begin
            instance_inj_ctrl_instance_block_034_instance_sel_cmd_v_fbk_cur   <=  instance_inj_ctrl_instance_block_034_instance_sel_cmd_v_fbk  [2];
            instance_inj_ctrl_instance_block_034_instance_sel_cmd_test_en_cur   <=  instance_inj_ctrl_instance_block_034_instance_sel_cmd_test_en  [2];
        end
        default :
        begin
            instance_inj_ctrl_instance_block_034_instance_sel_cmd_v_fbk_cur   <=1'b0;
            instance_inj_ctrl_instance_block_034_instance_sel_cmd_test_en_cur   <=1'b1;
        end
    endcase

    assign   instance_inj_ctrl_instance_block_034_instance_sel_cmd_v_fbk_mask  [0]=  instance_inj_ctrl_instance_block_034_instance_sel_cmd_v_fbk  [0]&  instance_inj_ctrl_instance_block_034_instance_sel_cmd_test_en  [0];
    assign   instance_inj_ctrl_instance_block_034_instance_sel_cmd_v_fbk_mask  [1]=  instance_inj_ctrl_instance_block_034_instance_sel_cmd_v_fbk  [1]&  instance_inj_ctrl_instance_block_034_instance_sel_cmd_test_en  [1];
    assign   instance_inj_ctrl_instance_block_034_instance_sel_cmd_v_fbk_mask  [2]=  instance_inj_ctrl_instance_block_034_instance_sel_cmd_v_fbk  [2]&  instance_inj_ctrl_instance_block_034_instance_sel_cmd_test_en  [2];
    assign   instance_inj_ctrl_instance_block_034_instance_sel_cmd_cmd_stored  =  instance_inj_ctrl_instance_block_034_instance_sel_cmd_cmd_stored_int  ;




    wire  instance_inj_ctrl_instance_block_125_cs8  ;
    wire  instance_inj_ctrl_instance_block_125_end_t0  ;
    wire  instance_inj_ctrl_instance_block_125_cs4  ;
    wire[7-1:0]  instance_inj_ctrl_instance_block_125_chop_count  ;
    wire[12-1:0]  instance_inj_ctrl_instance_block_125_count  ;
    wire[12-1:0]  instance_inj_ctrl_instance_block_125_stop_count_bus  ;
    wire  instance_inj_ctrl_instance_block_125_comp  ;
    wire  instance_inj_ctrl_instance_block_125_cs1  ;
    wire[3-1:0]  instance_inj_ctrl_instance_block_125_cmd_stored  ;
    wire  instance_inj_ctrl_instance_block_125_end_on  ;
    wire  instance_inj_ctrl_instance_block_125_end_period  ;
    wire  instance_inj_ctrl_instance_block_125_sh_mode  ;
    wire  instance_inj_ctrl_instance_block_125_t4_0  ;
    wire  instance_inj_ctrl_instance_block_125_test_en_cur  ;
    wire  instance_inj_ctrl_instance_block_125_th_0  ;
    wire  instance_inj_ctrl_instance_block_125_v_fbk_cur  ;
    wire[3-1:0]  instance_inj_ctrl_instance_block_125_v_fbk_mask  ;
    wire[4-1:0]  instance_inj_ctrl_instance_block_125_cs0  ;
    wire  instance_inj_ctrl_instance_block_125_cs2  ;
    wire  instance_inj_ctrl_instance_block_125_t1  ;
    wire  instance_inj_ctrl_instance_block_125_t2  ;
    wire[7-1:0]  instance_inj_ctrl_instance_block_125_ton_reg  ;
    wire[7-1:0]  instance_inj_ctrl_instance_block_125_tp_reg  ;


    reg[2:0]  instance_inj_ctrl_instance_block_125_instance_anti_glitch_counter  ;
    always @(  posedge    instance_inj_ctrl_instance_block_125_instance_anti_glitch_clock          or  negedge   instance_inj_ctrl_instance_block_125_instance_anti_glitch_rst  )
    begin :  instance_inj_ctrl_instance_block_125_instance_anti_glitch_vhdl_count
        if (  instance_inj_ctrl_instance_block_125_instance_anti_glitch_rst  ==1'b0)
            instance_inj_ctrl_instance_block_125_instance_anti_glitch_counter   <=3'b000;
        else
        begin
            if (  instance_inj_ctrl_instance_block_125_instance_anti_glitch_cs8  ==1'b1)
                instance_inj_ctrl_instance_block_125_instance_anti_glitch_counter   <=3'b000;
            else
                instance_inj_ctrl_instance_block_125_instance_anti_glitch_counter   <=  instance_inj_ctrl_instance_block_125_instance_anti_glitch_counter  +3'b001;
        end
    end

    assign   instance_inj_ctrl_instance_block_125_instance_anti_glitch_end_t0  =  instance_inj_ctrl_instance_block_125_instance_anti_glitch_counter  [0]&  instance_inj_ctrl_instance_block_125_instance_anti_glitch_counter  [1]&  instance_inj_ctrl_instance_block_125_instance_anti_glitch_counter  [2];
    assign instance_inj_ctrl_instance_block_034_instance_anti_glitch_clock = instance_inj_ctrl_instance_block_034_clock;
    assign instance_inj_ctrl_instance_block_034_instance_anti_glitch_cs8 = instance_inj_ctrl_instance_block_034_cs8;
    assign instance_inj_ctrl_instance_block_034_instance_anti_glitch_rst = instance_inj_ctrl_instance_block_034_rst;
    assign instance_inj_ctrl_instance_block_034_end_t0 = instance_inj_ctrl_instance_block_034_instance_anti_glitch_end_t0;
    assign instance_inj_ctrl_instance_block_125_instance_anti_glitch_clock = instance_inj_ctrl_instance_block_125_clock;
    assign instance_inj_ctrl_instance_block_125_instance_anti_glitch_cs8 = instance_inj_ctrl_instance_block_125_cs8;
    assign instance_inj_ctrl_instance_block_125_instance_anti_glitch_rst = instance_inj_ctrl_instance_block_125_rst;
    assign instance_inj_ctrl_instance_block_125_end_t0 = instance_inj_ctrl_instance_block_125_instance_anti_glitch_end_t0;



    reg[7-1:0]  instance_inj_ctrl_instance_block_125_instance_chopper_count_int_counter  ;
    always @(  posedge    instance_inj_ctrl_instance_block_125_instance_chopper_count_clock          or  negedge   instance_inj_ctrl_instance_block_125_instance_chopper_count_rst  )
    begin :  instance_inj_ctrl_instance_block_125_instance_chopper_count_vhdl_chopper_count
        if (  instance_inj_ctrl_instance_block_125_instance_chopper_count_rst  ==1'b0)
            instance_inj_ctrl_instance_block_125_instance_chopper_count_int_counter   <={7{1'b0}};
        else
        begin
            if (  instance_inj_ctrl_instance_block_125_instance_chopper_count_cs4  ==1'b1)
                instance_inj_ctrl_instance_block_125_instance_chopper_count_int_counter   <={7{1'b0}};
            else
                instance_inj_ctrl_instance_block_125_instance_chopper_count_int_counter   <=  instance_inj_ctrl_instance_block_125_instance_chopper_count_int_counter  +7'b0000001;
        end
    end

    assign   instance_inj_ctrl_instance_block_125_instance_chopper_count_chop_count  =  instance_inj_ctrl_instance_block_125_instance_chopper_count_int_counter  ;
    assign instance_inj_ctrl_instance_block_034_instance_chopper_count_clock = instance_inj_ctrl_instance_block_034_clock;
    assign instance_inj_ctrl_instance_block_034_instance_chopper_count_cs4 = instance_inj_ctrl_instance_block_034_cs4;
    assign instance_inj_ctrl_instance_block_034_instance_chopper_count_rst = instance_inj_ctrl_instance_block_034_rst;
    assign instance_inj_ctrl_instance_block_034_chop_count = instance_inj_ctrl_instance_block_034_instance_chopper_count_chop_count;
    assign instance_inj_ctrl_instance_block_125_instance_chopper_count_clock = instance_inj_ctrl_instance_block_125_clock;
    assign instance_inj_ctrl_instance_block_125_instance_chopper_count_cs4 = instance_inj_ctrl_instance_block_125_cs4;
    assign instance_inj_ctrl_instance_block_125_instance_chopper_count_rst = instance_inj_ctrl_instance_block_125_rst;
    assign instance_inj_ctrl_instance_block_125_chop_count = instance_inj_ctrl_instance_block_125_instance_chopper_count_chop_count;



    always @(    instance_inj_ctrl_instance_block_125_instance_comparator_count            or    instance_inj_ctrl_instance_block_125_instance_comparator_stop_count_bus   )
    begin :  instance_inj_ctrl_instance_block_125_instance_comparator_vhdl_comparator
        if (  instance_inj_ctrl_instance_block_125_instance_comparator_count  ==  instance_inj_ctrl_instance_block_125_instance_comparator_stop_count_bus  )
            instance_inj_ctrl_instance_block_125_instance_comparator_comp   <=1'b1;
        else
            instance_inj_ctrl_instance_block_125_instance_comparator_comp   <=1'b0;
    end

    assign instance_inj_ctrl_instance_block_034_instance_comparator_count = instance_inj_ctrl_instance_block_034_count;
    assign instance_inj_ctrl_instance_block_034_instance_comparator_stop_count_bus = instance_inj_ctrl_instance_block_034_stop_count_bus;
    assign instance_inj_ctrl_instance_block_034_comp = instance_inj_ctrl_instance_block_034_instance_comparator_comp;
    assign instance_inj_ctrl_instance_block_125_instance_comparator_count = instance_inj_ctrl_instance_block_125_count;
    assign instance_inj_ctrl_instance_block_125_instance_comparator_stop_count_bus = instance_inj_ctrl_instance_block_125_stop_count_bus;
    assign instance_inj_ctrl_instance_block_125_comp = instance_inj_ctrl_instance_block_125_instance_comparator_comp;



    reg[12-1:0]  instance_inj_ctrl_instance_block_125_instance_counter_int_counter  ;
    always @(  posedge    instance_inj_ctrl_instance_block_125_instance_counter_clock          or  negedge   instance_inj_ctrl_instance_block_125_instance_counter_rst  )
    begin :  instance_inj_ctrl_instance_block_125_instance_counter_vhdl_counter
        if (  instance_inj_ctrl_instance_block_125_instance_counter_rst  ==1'b0)
            instance_inj_ctrl_instance_block_125_instance_counter_int_counter   <={12{1'b0}};
        else
        begin
            if (  instance_inj_ctrl_instance_block_125_instance_counter_cs1  ==1'b1)
                instance_inj_ctrl_instance_block_125_instance_counter_int_counter   <={12{1'b0}};
            else
                instance_inj_ctrl_instance_block_125_instance_counter_int_counter   <=  instance_inj_ctrl_instance_block_125_instance_counter_int_counter  +11'b00000000001;
        end
    end

    assign   instance_inj_ctrl_instance_block_125_instance_counter_count  =  instance_inj_ctrl_instance_block_125_instance_counter_int_counter  ;
    assign instance_inj_ctrl_instance_block_034_instance_counter_clock = instance_inj_ctrl_instance_block_034_clock;
    assign instance_inj_ctrl_instance_block_034_instance_counter_cs1 = instance_inj_ctrl_instance_block_034_cs1;
    assign instance_inj_ctrl_instance_block_034_instance_counter_rst = instance_inj_ctrl_instance_block_034_rst;
    assign instance_inj_ctrl_instance_block_034_count = instance_inj_ctrl_instance_block_034_instance_counter_count;
    assign instance_inj_ctrl_instance_block_125_instance_counter_clock = instance_inj_ctrl_instance_block_125_clock;
    assign instance_inj_ctrl_instance_block_125_instance_counter_cs1 = instance_inj_ctrl_instance_block_125_cs1;
    assign instance_inj_ctrl_instance_block_125_instance_counter_rst = instance_inj_ctrl_instance_block_125_rst;
    assign instance_inj_ctrl_instance_block_125_count = instance_inj_ctrl_instance_block_125_instance_counter_count;



    wire[7-1:0]  instance_inj_ctrl_instance_block_125_instance_fsm_global_state  ;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_enable_check  ;
    wire[5-1:0]  instance_inj_ctrl_instance_block_125_instance_fsm_cur_state  ;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_cs11  ;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_global1_state  ;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_cs111  ;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_t31  ;
    wire[2-1:0]  instance_inj_ctrl_instance_block_125_instance_fsm_global2_state  ;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_cs42  ;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_t12  ;
    wire[2-1:0]  instance_inj_ctrl_instance_block_125_instance_fsm_global4_state  ;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_cs44  ;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_t14  ;
    wire  instance_inj_ctrl_instance_block_125_instance_fsm_en_fbk_store_internal  ;


    reg[6:0]  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_global_state_store_int  ;
    reg[3-1:0]  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_delay_counter  ;
    always @(  posedge    instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_clock          or  negedge   instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_rst  )
        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_rst  ==1'b0)
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_global_state_store_int   <=7'b0000000;
        else
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_global_state_store_int   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_global_state  ;

    always @(  posedge    instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_clock          or  negedge   instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_rst  )
        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_rst  ==1'b0)
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_delay_counter   <=3'b000;
        else
        begin
            if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_global_state_store_int  !=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_global_state  )
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_delay_counter   <=3'b000;
            else
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_delay_counter  [2]==1'b0)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_delay_counter   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_delay_counter  +3'b001;
        end

    always @(      instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_delay_counter      [2]          or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_test_en_cur            or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_global_state           or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_global_state_store_int   )
    begin
        if ((  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_delay_counter  [2]==1'b1)&(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_test_en_cur  ==1'b1)&(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_global_state  ==  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_global_state_store_int  ))
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_enable_check   <=1'b1;
        else
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_enable_check   <=1'b0;
        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_global_state_store_int  !=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_global_state  )
        begin
            if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_global_state  [6:5]!=2'b11)
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_en_state_store   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_en_fbk_store   <=1'b1;
            end
            else
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_en_state_store   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_en_fbk_store   <=1'b1;
            end
        end
        else
        begin
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_en_state_store   <=1'b0;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_en_fbk_store   <=1'b0;
        end
    end

    assign   instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_global_state_store  =  instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_global_state  ;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_clock = instance_inj_ctrl_instance_block_034_instance_fsm_clock;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_global_state = instance_inj_ctrl_instance_block_034_instance_fsm_global_state;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_rst = instance_inj_ctrl_instance_block_034_instance_fsm_rst;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_test_en_cur = instance_inj_ctrl_instance_block_034_instance_fsm_test_en_cur;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_enable_check = instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_enable_check;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_en_fbk_store_internal = instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_en_fbk_store;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_en_state_store = instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_en_state_store;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_global_state_store = instance_inj_ctrl_instance_block_034_instance_fsm_instance_enable_fbk_chk_global_state_store;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_clock = instance_inj_ctrl_instance_block_125_instance_fsm_clock;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_global_state = instance_inj_ctrl_instance_block_125_instance_fsm_global_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_rst = instance_inj_ctrl_instance_block_125_instance_fsm_rst;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_test_en_cur = instance_inj_ctrl_instance_block_125_instance_fsm_test_en_cur;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_enable_check = instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_enable_check;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_en_fbk_store_internal = instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_en_fbk_store;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_en_state_store = instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_en_state_store;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_global_state_store = instance_inj_ctrl_instance_block_125_instance_fsm_instance_enable_fbk_chk_global_state_store;



    assign   instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_relpot  =  instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cur_state  [4]&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cur_state  [3]&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cur_state  [2]&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cur_state  [0];
    assign   instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cs0  =  instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cur_state  [4:1];
    assign   instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_error  =  instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cur_state  [4]&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cur_state  [3]&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cur_state  [2]&(~(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_en_fbk_store  ));
    always @(   instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cur_state   )
    case (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cur_state  )
        5 'b00000:
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cs11   <=1'b1;
        5 'b00010:
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cs11   <=1'b1;
        5 'b00100:
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cs11   <=1'b1;
        5 'b00110:
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cs11   <=1'b1;
        5 'b01000:
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cs11   <=1'b1;
        5 'b01010:
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cs11   <=1'b1;
        5 'b01100:
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cs11   <=1'b1;
        5 'b01110:
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cs11   <=1'b1;
        5 'b11000:
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cs11   <=1'b1;
        default :
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cs11   <=1'b0;
    endcase

    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cur_state = instance_inj_ctrl_instance_block_034_instance_fsm_cur_state;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_en_fbk_store = instance_inj_ctrl_instance_block_034_instance_fsm_en_fbk_store_internal;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_cs0 = instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cs0;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_cs11 = instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_cs11;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_error = instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_error;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_relpot = instance_inj_ctrl_instance_block_034_instance_fsm_instance_fsm_output_handle_relpot;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cur_state = instance_inj_ctrl_instance_block_125_instance_fsm_cur_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_en_fbk_store = instance_inj_ctrl_instance_block_125_instance_fsm_en_fbk_store_internal;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_cs0 = instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cs0;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_cs11 = instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_cs11;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_error = instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_error;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_relpot = instance_inj_ctrl_instance_block_125_instance_fsm_instance_fsm_output_handle_relpot;



    reg[1:0]  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_current_state  ;
    reg[1:0]  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_next_state  ;
    always @(  posedge    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_clock          or  negedge   instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_rst  )
    begin :  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_clocked
        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_rst  ==1'b0)
        begin
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_current_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_ph1_handle_state_type_ph1_1_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_global1_state   <=1'b0;
        end
        else
        begin
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_current_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_next_state  ;
            case (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_next_state  )
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_ph1_handle_state_type_ph1_1_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_global1_state   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_ph1_handle_state_type_ph1_2_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_global1_state   <=1'b1;
                default :
                    ;
            endcase
        end
    end

    always @(         instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_current_state                      or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_clock               or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_cmd_stored              or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_cur_state             or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_end_t0            or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_inj_cmd           or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_rst   )
    begin :  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_set_next_state
        instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_current_state  ;
        case (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_current_state  )
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_ph1_handle_state_type_ph1_1_state   :
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_end_t0  ==1'b1&(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_inj_cmd  ==  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_cmd_stored  )&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_cur_state  ==5'b00001)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_ph1_handle_state_type_ph1_2_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_cur_state  !=5'b00001)
                        instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_ph1_handle_state_type_ph1_1_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_ph1_handle_state_type_ph1_2_state   :
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_cur_state  !=5'b00001)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_ph1_handle_state_type_ph1_1_state  ;
            default :
                ;
        endcase
    end

    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_clock = instance_inj_ctrl_instance_block_034_instance_fsm_clock;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_cmd_stored = instance_inj_ctrl_instance_block_034_instance_fsm_cmd_stored;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_cur_state = instance_inj_ctrl_instance_block_034_instance_fsm_cur_state;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_end_t0 = instance_inj_ctrl_instance_block_034_instance_fsm_end_t0;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_inj_cmd = instance_inj_ctrl_instance_block_034_instance_fsm_inj_cmd;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_rst = instance_inj_ctrl_instance_block_034_instance_fsm_rst;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_global1_state = instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_handle_global1_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_clock = instance_inj_ctrl_instance_block_125_instance_fsm_clock;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_cmd_stored = instance_inj_ctrl_instance_block_125_instance_fsm_cmd_stored;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_cur_state = instance_inj_ctrl_instance_block_125_instance_fsm_cur_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_end_t0 = instance_inj_ctrl_instance_block_125_instance_fsm_end_t0;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_inj_cmd = instance_inj_ctrl_instance_block_125_instance_fsm_inj_cmd;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_rst = instance_inj_ctrl_instance_block_125_instance_fsm_rst;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_global1_state = instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_handle_global1_state;



    always @(   instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_output_handle_global1_state   )
        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_output_handle_global1_state  ==1'b1)
        begin
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_output_handle_t31   <=1'b1;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_output_handle_cs111   <=1'b0;
        end
        else
        begin
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_output_handle_t31   <=1'b0;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_output_handle_cs111   <=1'b1;
        end

    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_output_handle_global1_state = instance_inj_ctrl_instance_block_034_instance_fsm_global1_state;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_cs111 = instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_output_handle_cs111;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_t31 = instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph1_output_handle_t31;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_output_handle_global1_state = instance_inj_ctrl_instance_block_125_instance_fsm_global1_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_cs111 = instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_output_handle_cs111;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_t31 = instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph1_output_handle_t31;



    reg[1:0]  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_current_state  ;
    reg[1:0]  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_next_state  ;
    always @(  posedge    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_clock          or  negedge   instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_rst  )
    begin :  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_clocked
        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_rst  ==1'b0)
        begin
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_current_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_1_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_global2_state   <=2'b01;
        end
        else
        begin
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_current_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_next_state  ;
            case (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_next_state  )
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_1_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_global2_state   <=2'b01;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_2_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_global2_state   <=2'b10;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_3_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_global2_state   <=2'b11;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_4_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_global2_state   <=2'b00;
                default :
                    ;
            endcase
        end
    end

    always @(          instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_current_state                        or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_clock                or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_cur_state               or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_end_on              or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_end_period             or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_i_fbk            or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_rst           or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_sh_mode   )
    begin :  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_set_next_state
        instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_current_state  ;
        case (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_current_state  )
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_1_state   :
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_cur_state  ==5'b00101&((  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_sh_mode  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_i_fbk  ==1'b1)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_sh_mode  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_end_on  ==1'b1)))
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_2_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_cur_state  !=5'b00101)
                        instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_1_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_2_state   :
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_cur_state  ==5'b00101)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_3_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_cur_state  !=5'b00101)
                        instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_1_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_3_state   :
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_cur_state  ==5'b00101&((  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_sh_mode  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_i_fbk  ==1'b0)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_sh_mode  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_end_period  ==1'b1)))
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_4_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_cur_state  !=5'b00101)
                        instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_1_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_4_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_ph2_handle_state_type_ph2_1_state  ;
            default :
                ;
        endcase
    end

    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_clock = instance_inj_ctrl_instance_block_034_instance_fsm_clock;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_cur_state = instance_inj_ctrl_instance_block_034_instance_fsm_cur_state;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_end_on = instance_inj_ctrl_instance_block_034_instance_fsm_end_on;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_end_period = instance_inj_ctrl_instance_block_034_instance_fsm_end_period;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_i_fbk = instance_inj_ctrl_instance_block_034_instance_fsm_i_fbk;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_rst = instance_inj_ctrl_instance_block_034_instance_fsm_rst;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_sh_mode = instance_inj_ctrl_instance_block_034_instance_fsm_sh_mode;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_global2_state = instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_handle_global2_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_clock = instance_inj_ctrl_instance_block_125_instance_fsm_clock;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_cur_state = instance_inj_ctrl_instance_block_125_instance_fsm_cur_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_end_on = instance_inj_ctrl_instance_block_125_instance_fsm_end_on;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_end_period = instance_inj_ctrl_instance_block_125_instance_fsm_end_period;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_i_fbk = instance_inj_ctrl_instance_block_125_instance_fsm_i_fbk;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_rst = instance_inj_ctrl_instance_block_125_instance_fsm_rst;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_sh_mode = instance_inj_ctrl_instance_block_125_instance_fsm_sh_mode;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_global2_state = instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_handle_global2_state;



    always @(   instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_output_handle_global2_state   )
    begin
        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_output_handle_global2_state  ==2'b00)
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_output_handle_cs42   <=1'b1;
        else
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_output_handle_cs42   <=1'b0;
        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_output_handle_global2_state  [1]==1'b1)
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_output_handle_t12   <=1'b0;
        else
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_output_handle_t12   <=1'b1;
    end

    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_output_handle_global2_state = instance_inj_ctrl_instance_block_034_instance_fsm_global2_state;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_cs42 = instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_output_handle_cs42;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_t12 = instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph2_output_handle_t12;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_output_handle_global2_state = instance_inj_ctrl_instance_block_125_instance_fsm_global2_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_cs42 = instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_output_handle_cs42;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_t12 = instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph2_output_handle_t12;



    reg[1:0]  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_current_state  ;
    reg[1:0]  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_next_state  ;
    always @(  posedge    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_clock          or  negedge   instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_rst  )
    begin :  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_clocked
        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_rst  ==1'b0)
        begin
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_current_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_1_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_global4_state   <=2'b01;
        end
        else
        begin
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_current_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_next_state  ;
            case (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_next_state  )
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_1_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_global4_state   <=2'b01;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_2_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_global4_state   <=2'b10;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_3_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_global4_state   <=2'b11;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_4_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_global4_state   <=2'b00;
                default :
                    ;
            endcase
        end
    end

    always @(          instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_current_state                        or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_clock                or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_cur_state               or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_end_on              or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_end_period             or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_i_fbk            or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_rst           or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_sh_mode   )
    begin :  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_set_next_state
        instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_current_state  ;
        case (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_current_state  )
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_1_state   :
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_cur_state  ==5'b01001&((  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_sh_mode  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_i_fbk  ==1'b1)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_sh_mode  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_end_on  ==1'b1)))
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_2_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_cur_state  !=5'b01001&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_cur_state  !=5'b11001)
                        instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_1_state  ;
                    else
                        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_cur_state  ==5'b11001&((  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_sh_mode  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_i_fbk  ==1'b1)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_sh_mode  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_end_on  ==1'b1)))
                            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_2_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_2_state   :
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_cur_state  ==5'b01001|  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_cur_state  ==5'b11001)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_3_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_cur_state  !=5'b01001&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_cur_state  !=5'b11001)
                        instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_1_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_3_state   :
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_cur_state  ==5'b01001&((  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_sh_mode  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_i_fbk  ==1'b0)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_sh_mode  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_end_period  ==1'b1)))
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_4_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_cur_state  !=5'b01001&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_cur_state  !=5'b11001)
                        instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_1_state  ;
                    else
                        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_cur_state  ==5'b11001&((  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_sh_mode  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_i_fbk  ==1'b0)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_sh_mode  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_end_period  ==1'b1)))
                            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_4_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_4_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_ph4_handle_state_type_ph4_1_state  ;
            default :
                ;
        endcase
    end

    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_clock = instance_inj_ctrl_instance_block_034_instance_fsm_clock;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_cur_state = instance_inj_ctrl_instance_block_034_instance_fsm_cur_state;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_end_on = instance_inj_ctrl_instance_block_034_instance_fsm_end_on;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_end_period = instance_inj_ctrl_instance_block_034_instance_fsm_end_period;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_i_fbk = instance_inj_ctrl_instance_block_034_instance_fsm_i_fbk;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_rst = instance_inj_ctrl_instance_block_034_instance_fsm_rst;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_sh_mode = instance_inj_ctrl_instance_block_034_instance_fsm_sh_mode;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_global4_state = instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_handle_global4_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_clock = instance_inj_ctrl_instance_block_125_instance_fsm_clock;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_cur_state = instance_inj_ctrl_instance_block_125_instance_fsm_cur_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_end_on = instance_inj_ctrl_instance_block_125_instance_fsm_end_on;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_end_period = instance_inj_ctrl_instance_block_125_instance_fsm_end_period;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_i_fbk = instance_inj_ctrl_instance_block_125_instance_fsm_i_fbk;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_rst = instance_inj_ctrl_instance_block_125_instance_fsm_rst;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_sh_mode = instance_inj_ctrl_instance_block_125_instance_fsm_sh_mode;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_global4_state = instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_handle_global4_state;



    always @(   instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_output_handle_global4_state   )
    begin
        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_output_handle_global4_state  ==2'b00)
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_output_handle_cs44   <=1'b1;
        else
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_output_handle_cs44   <=1'b0;
        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_output_handle_global4_state  [1]==1'b1)
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_output_handle_t14   <=1'b0;
        else
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_output_handle_t14   <=1'b1;
    end

    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_output_handle_global4_state = instance_inj_ctrl_instance_block_034_instance_fsm_global4_state;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_cs44 = instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_output_handle_cs44;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_t14 = instance_inj_ctrl_instance_block_034_instance_fsm_instance_ph4_output_handle_t14;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_output_handle_global4_state = instance_inj_ctrl_instance_block_125_instance_fsm_global4_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_cs44 = instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_output_handle_cs44;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_t14 = instance_inj_ctrl_instance_block_125_instance_fsm_instance_ph4_output_handle_t14;



    always @(      instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t31                or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t12            or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t14           or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_cur_state   )
    begin :  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_vhdl_sel_actuator
        case (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_cur_state  )
            5 'b00000:
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b00001:
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t31  ;
            end
            5 'b00010:
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3   <=1'b1;
            end
            5 'b00011:
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3   <=1'b1;
            end
            5 'b00100:
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b00101:
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t12  ;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b00110:
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b00111:
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b01000:
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b01001:
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t14  ;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b01010:
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b01011:
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b01100:
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b01101:
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b01110:
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b01111:
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b11000:
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b11001:
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t14  ;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b11100:
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            5 'b11101:
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
            default :
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3   <=1'b0;
            end
        endcase
    end

    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_cur_state = instance_inj_ctrl_instance_block_034_instance_fsm_cur_state;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t12 = instance_inj_ctrl_instance_block_034_instance_fsm_t12;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t14 = instance_inj_ctrl_instance_block_034_instance_fsm_t14;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t31 = instance_inj_ctrl_instance_block_034_instance_fsm_t31;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_hl = instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_hl;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_t1 = instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t1;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_t2 = instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t2;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_t3 = instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_actuator_t3;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_cur_state = instance_inj_ctrl_instance_block_125_instance_fsm_cur_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t12 = instance_inj_ctrl_instance_block_125_instance_fsm_t12;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t14 = instance_inj_ctrl_instance_block_125_instance_fsm_t14;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t31 = instance_inj_ctrl_instance_block_125_instance_fsm_t31;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_hl = instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_hl;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_t1 = instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t1;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_t2 = instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t2;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_t3 = instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_actuator_t3;



    always @(     instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_chop_control_cs42              or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_chop_control_cs44           or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_chop_control_cur_state   )
    begin :  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_chop_control_vhdl_sel_chop_control
        case (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_chop_control_cur_state  )
            5 'b00101:
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_chop_control_cs4   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_chop_control_cs42  ;
            5 'b01001:
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_chop_control_cs4   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_chop_control_cs44  ;
            5 'b11001:
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_chop_control_cs4   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_chop_control_cs44  ;
            default :
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_chop_control_cs4   <=1'b1;
        endcase
    end

    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_chop_control_cs42 = instance_inj_ctrl_instance_block_034_instance_fsm_cs42;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_chop_control_cs44 = instance_inj_ctrl_instance_block_034_instance_fsm_cs44;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_chop_control_cur_state = instance_inj_ctrl_instance_block_034_instance_fsm_cur_state;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_cs4 = instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_chop_control_cs4;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_chop_control_cs42 = instance_inj_ctrl_instance_block_125_instance_fsm_cs42;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_chop_control_cs44 = instance_inj_ctrl_instance_block_125_instance_fsm_cs44;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_chop_control_cur_state = instance_inj_ctrl_instance_block_125_instance_fsm_cur_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_cs4 = instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_chop_control_cs4;



    always @(      instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs11                or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs111            or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cur_state           or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_global1_state   )
    begin :  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_vhdl_sel_glob_count_cs
        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cur_state  ==5'b00001)
        begin
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs1   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs111  ;
            if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_global1_state  ==1'b0)
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs2   <=1'b1;
            else
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs2   <=1'b0;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs8   <=1'b0;
        end
        else
            if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cur_state  ==5'b00000)
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs1   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs11  ;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs2   <=1'b1;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs8   <=1'b1;
            end
            else
            begin
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs1   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs11  ;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs2   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs8   <=1'b1;
            end
    end

    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs11 = instance_inj_ctrl_instance_block_034_instance_fsm_cs11;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs111 = instance_inj_ctrl_instance_block_034_instance_fsm_cs111;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cur_state = instance_inj_ctrl_instance_block_034_instance_fsm_cur_state;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_global1_state = instance_inj_ctrl_instance_block_034_instance_fsm_global1_state;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_cs1 = instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs1;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_cs2 = instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs2;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_cs8 = instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_glob_count_cs_cs8;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs11 = instance_inj_ctrl_instance_block_125_instance_fsm_cs11;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs111 = instance_inj_ctrl_instance_block_125_instance_fsm_cs111;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cur_state = instance_inj_ctrl_instance_block_125_instance_fsm_cur_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_global1_state = instance_inj_ctrl_instance_block_125_instance_fsm_global1_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_cs1 = instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs1;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_cs2 = instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs2;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_cs8 = instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_glob_count_cs_cs8;



    always @(      instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_cur_state                or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_global1_state            or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_global2_state           or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_global4_state   )
    begin
        instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_global_state   [6:2]<=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_cur_state  ;
        case (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_cur_state  )
            5 'b00001:
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_global_state   [1:0]<={1'b0,  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_global1_state  };
            5 'b00101:
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_global_state   [1:0]<=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_global2_state  ;
            5 'b01001:
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_global_state   [1:0]<=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_global4_state  ;
            5 'b11001:
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_global_state   [1:0]<=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_global4_state  ;
            default :
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_global_state   [1:0]<=2'b00;
        endcase
    end

    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_cur_state = instance_inj_ctrl_instance_block_034_instance_fsm_cur_state;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_global1_state = instance_inj_ctrl_instance_block_034_instance_fsm_global1_state;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_global2_state = instance_inj_ctrl_instance_block_034_instance_fsm_global2_state;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_global4_state = instance_inj_ctrl_instance_block_034_instance_fsm_global4_state;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_global_state = instance_inj_ctrl_instance_block_034_instance_fsm_instance_sel_global_state_global_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_cur_state = instance_inj_ctrl_instance_block_125_instance_fsm_cur_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_global1_state = instance_inj_ctrl_instance_block_125_instance_fsm_global1_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_global2_state = instance_inj_ctrl_instance_block_125_instance_fsm_global2_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_global4_state = instance_inj_ctrl_instance_block_125_instance_fsm_global4_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_global_state = instance_inj_ctrl_instance_block_125_instance_fsm_instance_sel_global_state_global_state;



    reg[4:0]  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_current_state  ;
    reg[4:0]  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state  ;
    always @(  posedge    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_clock          or  negedge   instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_rst  )
    begin :  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_clocked
        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_rst  ==1'b0)
        begin
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_current_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_start_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b00000;
        end
        else
        begin
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_current_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state  ;
            case (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state  )
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_start_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b00000;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph1bis_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b00011;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph2_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b00101;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph3_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b00111;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph4_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b01001;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph5_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b01011;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph1_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b00001;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_cc_vcc_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b11100;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b11101;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int1_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b00010;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int_2_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b00100;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int3_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b00110;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int4_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b01000;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int5_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b01010;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int6_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b01100;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph6_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b01101;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int7_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b01110;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph7_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b01111;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int8_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b11000;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph8_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b11001;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int9_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b01010;
                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph9_state   :
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state   <=5'b01011;
                default :
                    ;
            endcase
        end
    end

    always @(                  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_current_state                                        or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_clock                        or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cmd_stored                       or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp                      or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check                     or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_end_t0                    or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state                   or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_inj_cmd                  or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_i_fbk                 or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_rst                or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_sh_mode               or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_status_reg              or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_t4_0             or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_th_0            or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur           or    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_mask   )
    begin :  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_set_next_state
        instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_current_state  ;
        case (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_current_state  )
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_start_state   :
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_inj_cmd  !=3'b000&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_mask  ==3'b000)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph1_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_inj_cmd  !=3'b000&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_mask  !=3'b000&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check  ==1'b0)
                        instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph1_state  ;
                    else
                        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_inj_cmd  !=3'b000&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_mask  !=3'b000&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph1bis_state   :
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int_2_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                        instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state  ;
                    else
                        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check  ==1'b0)
                            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int_2_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph2_state   :
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp  ==1'b1&((  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b11)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b10)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b01&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b00)))
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int3_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b01&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                        instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state  ;
                    else
                        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b11&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_cc_vcc_state  ;
                        else
                            if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp  ==1'b1&((  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b11)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b10)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b01&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b00))&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check  ==1'b0)
                                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int3_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph3_state   :
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_th_0  ==1'b0)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int4_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                        instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_cc_vcc_state  ;
                    else
                        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_th_0  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp  ==1'b1)
                            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int5_state  ;
                        else
                            if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_th_0  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check  ==1'b0)
                                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int4_state  ;
                            else
                                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_th_0  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check  ==1'b0)
                                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int5_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph4_state   :
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp  ==1'b1&((  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b11)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b10)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b01&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b00)))
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int5_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b11&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                        instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_cc_vcc_state  ;
                    else
                        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b01&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state  ;
                        else
                            if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp  ==1'b1&((  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b11)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b10)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b01&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b00))&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check  ==1'b0)
                                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int5_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph5_state   :
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_t4_0  ==1'b1)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_start_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_t4_0  ==1'b0)
                        instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int6_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph1_state   :
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&((  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_i_fbk  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_sh_mode  ==1'b1)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_sh_mode  ==1'b0)))
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int1_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                        instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state  ;
                    else
                        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [0]==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_i_fbk  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_sh_mode  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state  ;
                        else
                            if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_inj_cmd  !=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cmd_stored  &  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [0]==1'b0)
                                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_start_state  ;
                            else
                                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp  ==1'b1&(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0|((  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_i_fbk  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_sh_mode  ==1'b1)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_sh_mode  ==1'b0)))&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check  ==1'b0)
                                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int1_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_cc_vcc_state   :
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_status_reg  ==11'b00000000000)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_start_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state   :
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_status_reg  ==11'b00000000000)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_start_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int1_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph1bis_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int_2_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph2_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int3_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph3_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int4_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph4_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int5_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph5_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int6_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph6_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph6_state   :
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp  ==1'b1)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int7_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int7_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph7_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph7_state   :
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check  ==1'b0)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int8_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1)
                        instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int8_state  ;
                    else
                        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int8_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph8_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph8_state   :
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp  ==1'b1&((  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b11)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b10)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b01&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b00))&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check  ==1'b0)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int9_state  ;
                else
                    if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp  ==1'b1&((  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b11)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b10)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b01&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1)|(  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b00)))
                        instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int9_state  ;
                    else
                        if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b11&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b1&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_cc_vcc_state  ;
                        else
                            if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state  [1:0]==2'b01&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur  ==1'b0&  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check  ==1'b1)
                                instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_cc_gnd_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_int9_state   :
                if (1'b1)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph9_state  ;
            instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_ph9_state   :
                if (  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp  ==1'b1)
                    instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_next_state   <=  instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_state_progression_state_type_start_state  ;
            default :
                ;
        endcase
    end

    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_clock = instance_inj_ctrl_instance_block_034_instance_fsm_clock;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cmd_stored = instance_inj_ctrl_instance_block_034_instance_fsm_cmd_stored;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_comp = instance_inj_ctrl_instance_block_034_instance_fsm_comp;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_enable_check = instance_inj_ctrl_instance_block_034_instance_fsm_enable_check;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_end_t0 = instance_inj_ctrl_instance_block_034_instance_fsm_end_t0;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_global_state = instance_inj_ctrl_instance_block_034_instance_fsm_global_state;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_inj_cmd = instance_inj_ctrl_instance_block_034_instance_fsm_inj_cmd;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_i_fbk = instance_inj_ctrl_instance_block_034_instance_fsm_i_fbk;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_rst = instance_inj_ctrl_instance_block_034_instance_fsm_rst;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_sh_mode = instance_inj_ctrl_instance_block_034_instance_fsm_sh_mode;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_status_reg = instance_inj_ctrl_instance_block_034_instance_fsm_status_reg;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_t4_0 = instance_inj_ctrl_instance_block_034_instance_fsm_t4_0;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_th_0 = instance_inj_ctrl_instance_block_034_instance_fsm_th_0;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_cur = instance_inj_ctrl_instance_block_034_instance_fsm_v_fbk_cur;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_v_fbk_mask = instance_inj_ctrl_instance_block_034_instance_fsm_v_fbk_mask;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_cur_state = instance_inj_ctrl_instance_block_034_instance_fsm_instance_state_progression_cur_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_clock = instance_inj_ctrl_instance_block_125_instance_fsm_clock;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cmd_stored = instance_inj_ctrl_instance_block_125_instance_fsm_cmd_stored;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_comp = instance_inj_ctrl_instance_block_125_instance_fsm_comp;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_enable_check = instance_inj_ctrl_instance_block_125_instance_fsm_enable_check;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_end_t0 = instance_inj_ctrl_instance_block_125_instance_fsm_end_t0;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_global_state = instance_inj_ctrl_instance_block_125_instance_fsm_global_state;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_inj_cmd = instance_inj_ctrl_instance_block_125_instance_fsm_inj_cmd;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_i_fbk = instance_inj_ctrl_instance_block_125_instance_fsm_i_fbk;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_rst = instance_inj_ctrl_instance_block_125_instance_fsm_rst;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_sh_mode = instance_inj_ctrl_instance_block_125_instance_fsm_sh_mode;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_status_reg = instance_inj_ctrl_instance_block_125_instance_fsm_status_reg;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_t4_0 = instance_inj_ctrl_instance_block_125_instance_fsm_t4_0;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_th_0 = instance_inj_ctrl_instance_block_125_instance_fsm_th_0;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_cur = instance_inj_ctrl_instance_block_125_instance_fsm_v_fbk_cur;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_v_fbk_mask = instance_inj_ctrl_instance_block_125_instance_fsm_v_fbk_mask;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_cur_state = instance_inj_ctrl_instance_block_125_instance_fsm_instance_state_progression_cur_state;

    assign   instance_inj_ctrl_instance_block_125_instance_fsm_en_fbk_store  =  instance_inj_ctrl_instance_block_125_instance_fsm_en_fbk_store_internal  ;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_clock = instance_inj_ctrl_instance_block_034_clock;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_cmd_stored = instance_inj_ctrl_instance_block_034_cmd_stored;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_comp = instance_inj_ctrl_instance_block_034_comp;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_end_on = instance_inj_ctrl_instance_block_034_end_on;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_end_period = instance_inj_ctrl_instance_block_034_end_period;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_end_t0 = instance_inj_ctrl_instance_block_034_end_t0;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_inj_cmd = instance_inj_ctrl_instance_block_034_inj_cmd;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_i_fbk = instance_inj_ctrl_instance_block_034_i_fbk;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_rst = instance_inj_ctrl_instance_block_034_rst;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_sh_mode = instance_inj_ctrl_instance_block_034_sh_mode;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_status_reg = instance_inj_ctrl_instance_block_034_status_reg;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_t4_0 = instance_inj_ctrl_instance_block_034_t4_0;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_test_en_cur = instance_inj_ctrl_instance_block_034_test_en_cur;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_th_0 = instance_inj_ctrl_instance_block_034_th_0;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_v_fbk_cur = instance_inj_ctrl_instance_block_034_v_fbk_cur;
    assign instance_inj_ctrl_instance_block_034_instance_fsm_v_fbk_mask = instance_inj_ctrl_instance_block_034_v_fbk_mask;
    assign instance_inj_ctrl_instance_block_034_cs0 = instance_inj_ctrl_instance_block_034_instance_fsm_cs0;
    assign instance_inj_ctrl_instance_block_034_cs1 = instance_inj_ctrl_instance_block_034_instance_fsm_cs1;
    assign instance_inj_ctrl_instance_block_034_cs2 = instance_inj_ctrl_instance_block_034_instance_fsm_cs2;
    assign instance_inj_ctrl_instance_block_034_cs4 = instance_inj_ctrl_instance_block_034_instance_fsm_cs4;
    assign instance_inj_ctrl_instance_block_034_cs8 = instance_inj_ctrl_instance_block_034_instance_fsm_cs8;
    assign instance_inj_ctrl_instance_block_034_en_fbk_store = instance_inj_ctrl_instance_block_034_instance_fsm_en_fbk_store;
    assign instance_inj_ctrl_instance_block_034_en_state_store = instance_inj_ctrl_instance_block_034_instance_fsm_en_state_store;
    assign instance_inj_ctrl_instance_block_034_error = instance_inj_ctrl_instance_block_034_instance_fsm_error;
    assign instance_inj_ctrl_instance_block_034_global_state_store = instance_inj_ctrl_instance_block_034_instance_fsm_global_state_store;
    assign instance_inj_ctrl_instance_block_034_hl = instance_inj_ctrl_instance_block_034_instance_fsm_hl;
    assign instance_inj_ctrl_instance_block_034_relpot = instance_inj_ctrl_instance_block_034_instance_fsm_relpot;
    assign instance_inj_ctrl_instance_block_034_t1 = instance_inj_ctrl_instance_block_034_instance_fsm_t1;
    assign instance_inj_ctrl_instance_block_034_t2 = instance_inj_ctrl_instance_block_034_instance_fsm_t2;
    assign instance_inj_ctrl_instance_block_034_t3 = instance_inj_ctrl_instance_block_034_instance_fsm_t3;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_clock = instance_inj_ctrl_instance_block_125_clock;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_cmd_stored = instance_inj_ctrl_instance_block_125_cmd_stored;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_comp = instance_inj_ctrl_instance_block_125_comp;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_end_on = instance_inj_ctrl_instance_block_125_end_on;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_end_period = instance_inj_ctrl_instance_block_125_end_period;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_end_t0 = instance_inj_ctrl_instance_block_125_end_t0;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_inj_cmd = instance_inj_ctrl_instance_block_125_inj_cmd;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_i_fbk = instance_inj_ctrl_instance_block_125_i_fbk;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_rst = instance_inj_ctrl_instance_block_125_rst;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_sh_mode = instance_inj_ctrl_instance_block_125_sh_mode;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_status_reg = instance_inj_ctrl_instance_block_125_status_reg;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_t4_0 = instance_inj_ctrl_instance_block_125_t4_0;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_test_en_cur = instance_inj_ctrl_instance_block_125_test_en_cur;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_th_0 = instance_inj_ctrl_instance_block_125_th_0;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_v_fbk_cur = instance_inj_ctrl_instance_block_125_v_fbk_cur;
    assign instance_inj_ctrl_instance_block_125_instance_fsm_v_fbk_mask = instance_inj_ctrl_instance_block_125_v_fbk_mask;
    assign instance_inj_ctrl_instance_block_125_cs0 = instance_inj_ctrl_instance_block_125_instance_fsm_cs0;
    assign instance_inj_ctrl_instance_block_125_cs1 = instance_inj_ctrl_instance_block_125_instance_fsm_cs1;
    assign instance_inj_ctrl_instance_block_125_cs2 = instance_inj_ctrl_instance_block_125_instance_fsm_cs2;
    assign instance_inj_ctrl_instance_block_125_cs4 = instance_inj_ctrl_instance_block_125_instance_fsm_cs4;
    assign instance_inj_ctrl_instance_block_125_cs8 = instance_inj_ctrl_instance_block_125_instance_fsm_cs8;
    assign instance_inj_ctrl_instance_block_125_en_fbk_store = instance_inj_ctrl_instance_block_125_instance_fsm_en_fbk_store;
    assign instance_inj_ctrl_instance_block_125_en_state_store = instance_inj_ctrl_instance_block_125_instance_fsm_en_state_store;
    assign instance_inj_ctrl_instance_block_125_error = instance_inj_ctrl_instance_block_125_instance_fsm_error;
    assign instance_inj_ctrl_instance_block_125_global_state_store = instance_inj_ctrl_instance_block_125_instance_fsm_global_state_store;
    assign instance_inj_ctrl_instance_block_125_hl = instance_inj_ctrl_instance_block_125_instance_fsm_hl;
    assign instance_inj_ctrl_instance_block_125_relpot = instance_inj_ctrl_instance_block_125_instance_fsm_relpot;
    assign instance_inj_ctrl_instance_block_125_t1 = instance_inj_ctrl_instance_block_125_instance_fsm_t1;
    assign instance_inj_ctrl_instance_block_125_t2 = instance_inj_ctrl_instance_block_125_instance_fsm_t2;
    assign instance_inj_ctrl_instance_block_125_t3 = instance_inj_ctrl_instance_block_125_instance_fsm_t3;



    reg[12-1:0]  instance_inj_ctrl_instance_block_125_instance_internal_register_th  ;
    reg[10-1:0]  instance_inj_ctrl_instance_block_125_instance_internal_register_tb  ;
    reg[7-1:0]  instance_inj_ctrl_instance_block_125_instance_internal_register_tonh  ;
    reg[7-1:0]  instance_inj_ctrl_instance_block_125_instance_internal_register_tonl  ;
    always @(  posedge    instance_inj_ctrl_instance_block_125_instance_internal_register_clock          or  negedge   instance_inj_ctrl_instance_block_125_instance_internal_register_rst  )
    begin :  instance_inj_ctrl_instance_block_125_instance_internal_register_vhdl_internal_register
        if (  instance_inj_ctrl_instance_block_125_instance_internal_register_rst  ==1'b0)
        begin
            instance_inj_ctrl_instance_block_125_instance_internal_register_tb   <={10{1'b0}};
            instance_inj_ctrl_instance_block_125_instance_internal_register_th   <={12{1'b0}};
            instance_inj_ctrl_instance_block_125_instance_internal_register_tonh   <={7{1'b0}};
            instance_inj_ctrl_instance_block_125_instance_internal_register_tonl   <={7{1'b0}};
        end
        else
        begin
            if (  instance_inj_ctrl_instance_block_125_instance_internal_register_cs2  ==1'b1)
            begin
                instance_inj_ctrl_instance_block_125_instance_internal_register_tb   <=  instance_inj_ctrl_instance_block_125_instance_internal_register_r_tb  ;
                instance_inj_ctrl_instance_block_125_instance_internal_register_th   <=  instance_inj_ctrl_instance_block_125_instance_internal_register_r_th  ;
                instance_inj_ctrl_instance_block_125_instance_internal_register_tonh   <=  instance_inj_ctrl_instance_block_125_instance_internal_register_r_tonh  ;
                instance_inj_ctrl_instance_block_125_instance_internal_register_tonl   <=  instance_inj_ctrl_instance_block_125_instance_internal_register_r_tonl  ;
            end
        end
    end

    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_tp_reg  =  instance_inj_ctrl_instance_block_125_instance_internal_register_r_tp  ;
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_sh_mode  =  instance_inj_ctrl_instance_block_125_instance_internal_register_tb  [9];
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_th_0  =(~(  instance_inj_ctrl_instance_block_125_instance_internal_register_th  [0]|  instance_inj_ctrl_instance_block_125_instance_internal_register_th  [1]|  instance_inj_ctrl_instance_block_125_instance_internal_register_th  [2]|  instance_inj_ctrl_instance_block_125_instance_internal_register_th  [3]|  instance_inj_ctrl_instance_block_125_instance_internal_register_th  [4]|  instance_inj_ctrl_instance_block_125_instance_internal_register_th  [5]|  instance_inj_ctrl_instance_block_125_instance_internal_register_th  [6]|  instance_inj_ctrl_instance_block_125_instance_internal_register_th  [7]|  instance_inj_ctrl_instance_block_125_instance_internal_register_th  [8]|  instance_inj_ctrl_instance_block_125_instance_internal_register_th  [9]|  instance_inj_ctrl_instance_block_125_instance_internal_register_th  [10]|  instance_inj_ctrl_instance_block_125_instance_internal_register_th  [11]));
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_t4_0  =(~(  instance_inj_ctrl_instance_block_125_instance_internal_register_r_t4  [6]|  instance_inj_ctrl_instance_block_125_instance_internal_register_r_t4  [5]|  instance_inj_ctrl_instance_block_125_instance_internal_register_r_t4  [4]|  instance_inj_ctrl_instance_block_125_instance_internal_register_r_t4  [3]));
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_stop_count_bus  =(  instance_inj_ctrl_instance_block_125_instance_internal_register_cs0  ==4'b0000)?{5'b00000,  instance_inj_ctrl_instance_block_125_instance_internal_register_r_t1  [7:1]}:12'bZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_ton_reg  =(  instance_inj_ctrl_instance_block_125_instance_internal_register_cs0  ==4'b0000)?  instance_inj_ctrl_instance_block_125_instance_internal_register_tonh  :7'bZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_stop_count_bus  =(  instance_inj_ctrl_instance_block_125_instance_internal_register_cs0  ==4'b0001)?{5'b00000,  instance_inj_ctrl_instance_block_125_instance_internal_register_r_t1  [7:1]}:12'bZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_ton_reg  =(  instance_inj_ctrl_instance_block_125_instance_internal_register_cs0  ==4'b0001)?  instance_inj_ctrl_instance_block_125_instance_internal_register_tonh  :7'bZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_stop_count_bus  =(  instance_inj_ctrl_instance_block_125_instance_internal_register_cs0  ==4'b0010)?{3'b000,  instance_inj_ctrl_instance_block_125_instance_internal_register_tb  [8:0]}:12'bZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_ton_reg  =(  instance_inj_ctrl_instance_block_125_instance_internal_register_cs0  ==4'b0010)?  instance_inj_ctrl_instance_block_125_instance_internal_register_tonh  :7'bZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_stop_count_bus  =(  instance_inj_ctrl_instance_block_125_instance_internal_register_cs0  ==4'b0011)?{5'b00000,  instance_inj_ctrl_instance_block_125_instance_internal_register_r_t2  }:12'bZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_ton_reg  =(  instance_inj_ctrl_instance_block_125_instance_internal_register_cs0  ==4'b0011)?  instance_inj_ctrl_instance_block_125_instance_internal_register_tonl  :7'bZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_stop_count_bus  =(  instance_inj_ctrl_instance_block_125_instance_internal_register_cs0  ==4'b0100)?  instance_inj_ctrl_instance_block_125_instance_internal_register_th  :12'bZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_ton_reg  =(  instance_inj_ctrl_instance_block_125_instance_internal_register_cs0  ==4'b0100)?  instance_inj_ctrl_instance_block_125_instance_internal_register_tonl  :7'bZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_stop_count_bus  =(  instance_inj_ctrl_instance_block_125_instance_internal_register_cs0  ==4'b0101)?{5'b00000,  instance_inj_ctrl_instance_block_125_instance_internal_register_r_t1  [7:1]}:12'bZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_ton_reg  =(  instance_inj_ctrl_instance_block_125_instance_internal_register_cs0  ==4'b0101)?  instance_inj_ctrl_instance_block_125_instance_internal_register_tonl  :7'bZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_stop_count_bus  =(  instance_inj_ctrl_instance_block_125_instance_internal_register_cs0  ==4'b0110)?{4'b0000,  instance_inj_ctrl_instance_block_125_instance_internal_register_r_t3  }:12'bZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_ton_reg  =(  instance_inj_ctrl_instance_block_125_instance_internal_register_cs0  ==4'b0110)?  instance_inj_ctrl_instance_block_125_instance_internal_register_tonl  :7'bZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_stop_count_bus  =(  instance_inj_ctrl_instance_block_125_instance_internal_register_cs0  ==4'b0111)?{3'b000,  instance_inj_ctrl_instance_block_125_instance_internal_register_r_t1  ,1'b0}:12'bZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_ton_reg  =(  instance_inj_ctrl_instance_block_125_instance_internal_register_cs0  ==4'b0111)?  instance_inj_ctrl_instance_block_125_instance_internal_register_tonl  :7'bZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_stop_count_bus  =(  instance_inj_ctrl_instance_block_125_instance_internal_register_cs0  ==4'b1100)?{5'b00000,  instance_inj_ctrl_instance_block_125_instance_internal_register_r_t4  }:12'bZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_ton_reg  =(  instance_inj_ctrl_instance_block_125_instance_internal_register_cs0  ==4'b1100)?  instance_inj_ctrl_instance_block_125_instance_internal_register_tonl  :7'bZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_stop_count_bus  =(  instance_inj_ctrl_instance_block_125_instance_internal_register_cs0  [3:1]==3'b111)?{4'b0000,  instance_inj_ctrl_instance_block_125_instance_internal_register_r_t1  }:12'bZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_block_125_instance_internal_register_ton_reg  =(  instance_inj_ctrl_instance_block_125_instance_internal_register_cs0  [3:1]==3'b111)?  instance_inj_ctrl_instance_block_125_instance_internal_register_tonl  :7'bZZZZZZZ;
    assign instance_inj_ctrl_instance_block_034_instance_internal_register_clock = instance_inj_ctrl_instance_block_034_clock;
    assign instance_inj_ctrl_instance_block_034_instance_internal_register_cs0 = instance_inj_ctrl_instance_block_034_cs0;
    assign instance_inj_ctrl_instance_block_034_instance_internal_register_cs2 = instance_inj_ctrl_instance_block_034_cs2;
    assign instance_inj_ctrl_instance_block_034_instance_internal_register_rst = instance_inj_ctrl_instance_block_034_rst;
    assign instance_inj_ctrl_instance_block_034_instance_internal_register_r_t1 = instance_inj_ctrl_instance_block_034_r_t1;
    assign instance_inj_ctrl_instance_block_034_instance_internal_register_r_t2 = instance_inj_ctrl_instance_block_034_r_t2;
    assign instance_inj_ctrl_instance_block_034_instance_internal_register_r_t3 = instance_inj_ctrl_instance_block_034_r_t3;
    assign instance_inj_ctrl_instance_block_034_instance_internal_register_r_t4 = instance_inj_ctrl_instance_block_034_r_t4;
    assign instance_inj_ctrl_instance_block_034_instance_internal_register_r_tb = instance_inj_ctrl_instance_block_034_r_tb;
    assign instance_inj_ctrl_instance_block_034_instance_internal_register_r_th = instance_inj_ctrl_instance_block_034_r_th;
    assign instance_inj_ctrl_instance_block_034_instance_internal_register_r_tonh = instance_inj_ctrl_instance_block_034_r_tonh;
    assign instance_inj_ctrl_instance_block_034_instance_internal_register_r_tonl = instance_inj_ctrl_instance_block_034_r_tonl;
    assign instance_inj_ctrl_instance_block_034_instance_internal_register_r_tp = instance_inj_ctrl_instance_block_034_r_tp;
    assign instance_inj_ctrl_instance_block_034_sh_mode = instance_inj_ctrl_instance_block_034_instance_internal_register_sh_mode;
    assign instance_inj_ctrl_instance_block_034_stop_count_bus = instance_inj_ctrl_instance_block_034_instance_internal_register_stop_count_bus;
    assign instance_inj_ctrl_instance_block_034_t4_0 = instance_inj_ctrl_instance_block_034_instance_internal_register_t4_0;
    assign instance_inj_ctrl_instance_block_034_th_0 = instance_inj_ctrl_instance_block_034_instance_internal_register_th_0;
    assign instance_inj_ctrl_instance_block_034_ton_reg = instance_inj_ctrl_instance_block_034_instance_internal_register_ton_reg;
    assign instance_inj_ctrl_instance_block_034_tp_reg = instance_inj_ctrl_instance_block_034_instance_internal_register_tp_reg;
    assign instance_inj_ctrl_instance_block_125_instance_internal_register_clock = instance_inj_ctrl_instance_block_125_clock;
    assign instance_inj_ctrl_instance_block_125_instance_internal_register_cs0 = instance_inj_ctrl_instance_block_125_cs0;
    assign instance_inj_ctrl_instance_block_125_instance_internal_register_cs2 = instance_inj_ctrl_instance_block_125_cs2;
    assign instance_inj_ctrl_instance_block_125_instance_internal_register_rst = instance_inj_ctrl_instance_block_125_rst;
    assign instance_inj_ctrl_instance_block_125_instance_internal_register_r_t1 = instance_inj_ctrl_instance_block_125_r_t1;
    assign instance_inj_ctrl_instance_block_125_instance_internal_register_r_t2 = instance_inj_ctrl_instance_block_125_r_t2;
    assign instance_inj_ctrl_instance_block_125_instance_internal_register_r_t3 = instance_inj_ctrl_instance_block_125_r_t3;
    assign instance_inj_ctrl_instance_block_125_instance_internal_register_r_t4 = instance_inj_ctrl_instance_block_125_r_t4;
    assign instance_inj_ctrl_instance_block_125_instance_internal_register_r_tb = instance_inj_ctrl_instance_block_125_r_tb;
    assign instance_inj_ctrl_instance_block_125_instance_internal_register_r_th = instance_inj_ctrl_instance_block_125_r_th;
    assign instance_inj_ctrl_instance_block_125_instance_internal_register_r_tonh = instance_inj_ctrl_instance_block_125_r_tonh;
    assign instance_inj_ctrl_instance_block_125_instance_internal_register_r_tonl = instance_inj_ctrl_instance_block_125_r_tonl;
    assign instance_inj_ctrl_instance_block_125_instance_internal_register_r_tp = instance_inj_ctrl_instance_block_125_r_tp;
    assign instance_inj_ctrl_instance_block_125_sh_mode = instance_inj_ctrl_instance_block_125_instance_internal_register_sh_mode;
    assign instance_inj_ctrl_instance_block_125_stop_count_bus = instance_inj_ctrl_instance_block_125_instance_internal_register_stop_count_bus;
    assign instance_inj_ctrl_instance_block_125_t4_0 = instance_inj_ctrl_instance_block_125_instance_internal_register_t4_0;
    assign instance_inj_ctrl_instance_block_125_th_0 = instance_inj_ctrl_instance_block_125_instance_internal_register_th_0;
    assign instance_inj_ctrl_instance_block_125_ton_reg = instance_inj_ctrl_instance_block_125_instance_internal_register_ton_reg;
    assign instance_inj_ctrl_instance_block_125_tp_reg = instance_inj_ctrl_instance_block_125_instance_internal_register_tp_reg;



    always @(    instance_inj_ctrl_instance_block_125_instance_on_comp_chop_count            or    instance_inj_ctrl_instance_block_125_instance_on_comp_ton_reg   )
    begin :  instance_inj_ctrl_instance_block_125_instance_on_comp_vhdl_on_comp
        if (  instance_inj_ctrl_instance_block_125_instance_on_comp_chop_count  ==  instance_inj_ctrl_instance_block_125_instance_on_comp_ton_reg  )
            instance_inj_ctrl_instance_block_125_instance_on_comp_end_on   <=1'b1;
        else
            instance_inj_ctrl_instance_block_125_instance_on_comp_end_on   <=1'b0;
    end

    assign instance_inj_ctrl_instance_block_034_instance_on_comp_chop_count = instance_inj_ctrl_instance_block_034_chop_count;
    assign instance_inj_ctrl_instance_block_034_instance_on_comp_ton_reg = instance_inj_ctrl_instance_block_034_ton_reg;
    assign instance_inj_ctrl_instance_block_034_end_on = instance_inj_ctrl_instance_block_034_instance_on_comp_end_on;
    assign instance_inj_ctrl_instance_block_125_instance_on_comp_chop_count = instance_inj_ctrl_instance_block_125_chop_count;
    assign instance_inj_ctrl_instance_block_125_instance_on_comp_ton_reg = instance_inj_ctrl_instance_block_125_ton_reg;
    assign instance_inj_ctrl_instance_block_125_end_on = instance_inj_ctrl_instance_block_125_instance_on_comp_end_on;



    always @(     instance_inj_ctrl_instance_block_125_instance_output_decoder_cmd_stored              or    instance_inj_ctrl_instance_block_125_instance_output_decoder_t1           or    instance_inj_ctrl_instance_block_125_instance_output_decoder_t2   )
    begin :  instance_inj_ctrl_instance_block_125_instance_output_decoder_vhdl_output_decoder
        case (  instance_inj_ctrl_instance_block_125_instance_output_decoder_cmd_stored  )
            3 'b001:
            begin
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t1a   <=  instance_inj_ctrl_instance_block_125_instance_output_decoder_t1  ;
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t2a   <=  instance_inj_ctrl_instance_block_125_instance_output_decoder_t2  ;
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t1b   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t2b   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t1c   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t2c   <=1'b0;
            end
            3 'b010:
            begin
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t1b   <=  instance_inj_ctrl_instance_block_125_instance_output_decoder_t1  ;
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t2b   <=  instance_inj_ctrl_instance_block_125_instance_output_decoder_t2  ;
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t1a   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t2a   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t1c   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t2c   <=1'b0;
            end
            3 'b100:
            begin
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t1c   <=  instance_inj_ctrl_instance_block_125_instance_output_decoder_t1  ;
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t2c   <=  instance_inj_ctrl_instance_block_125_instance_output_decoder_t2  ;
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t1b   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t2b   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t1a   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t2a   <=1'b0;
            end
            default :
            begin
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t1a   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t2a   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t1b   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t2b   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t1c   <=1'b0;
                instance_inj_ctrl_instance_block_125_instance_output_decoder_t2c   <=1'b0;
            end
        endcase
    end

    assign instance_inj_ctrl_instance_block_034_instance_output_decoder_cmd_stored = instance_inj_ctrl_instance_block_034_cmd_stored;
    assign instance_inj_ctrl_instance_block_034_instance_output_decoder_t1 = instance_inj_ctrl_instance_block_034_t1;
    assign instance_inj_ctrl_instance_block_034_instance_output_decoder_t2 = instance_inj_ctrl_instance_block_034_t2;
    assign instance_inj_ctrl_instance_block_034_t1a = instance_inj_ctrl_instance_block_034_instance_output_decoder_t1a;
    assign instance_inj_ctrl_instance_block_034_t1b = instance_inj_ctrl_instance_block_034_instance_output_decoder_t1b;
    assign instance_inj_ctrl_instance_block_034_t1c = instance_inj_ctrl_instance_block_034_instance_output_decoder_t1c;
    assign instance_inj_ctrl_instance_block_034_t2a = instance_inj_ctrl_instance_block_034_instance_output_decoder_t2a;
    assign instance_inj_ctrl_instance_block_034_t2b = instance_inj_ctrl_instance_block_034_instance_output_decoder_t2b;
    assign instance_inj_ctrl_instance_block_034_t2c = instance_inj_ctrl_instance_block_034_instance_output_decoder_t2c;
    assign instance_inj_ctrl_instance_block_125_instance_output_decoder_cmd_stored = instance_inj_ctrl_instance_block_125_cmd_stored;
    assign instance_inj_ctrl_instance_block_125_instance_output_decoder_t1 = instance_inj_ctrl_instance_block_125_t1;
    assign instance_inj_ctrl_instance_block_125_instance_output_decoder_t2 = instance_inj_ctrl_instance_block_125_t2;
    assign instance_inj_ctrl_instance_block_125_t1a = instance_inj_ctrl_instance_block_125_instance_output_decoder_t1a;
    assign instance_inj_ctrl_instance_block_125_t1b = instance_inj_ctrl_instance_block_125_instance_output_decoder_t1b;
    assign instance_inj_ctrl_instance_block_125_t1c = instance_inj_ctrl_instance_block_125_instance_output_decoder_t1c;
    assign instance_inj_ctrl_instance_block_125_t2a = instance_inj_ctrl_instance_block_125_instance_output_decoder_t2a;
    assign instance_inj_ctrl_instance_block_125_t2b = instance_inj_ctrl_instance_block_125_instance_output_decoder_t2b;
    assign instance_inj_ctrl_instance_block_125_t2c = instance_inj_ctrl_instance_block_125_instance_output_decoder_t2c;



    always @(    instance_inj_ctrl_instance_block_125_instance_period_comp_chop_count            or    instance_inj_ctrl_instance_block_125_instance_period_comp_tp_reg   )
    begin :  instance_inj_ctrl_instance_block_125_instance_period_comp_vhdl_period_comp
        if (  instance_inj_ctrl_instance_block_125_instance_period_comp_chop_count  ==  instance_inj_ctrl_instance_block_125_instance_period_comp_tp_reg  )
            instance_inj_ctrl_instance_block_125_instance_period_comp_end_period   <=1'b1;
        else
            instance_inj_ctrl_instance_block_125_instance_period_comp_end_period   <=1'b0;
    end

    assign instance_inj_ctrl_instance_block_034_instance_period_comp_chop_count = instance_inj_ctrl_instance_block_034_chop_count;
    assign instance_inj_ctrl_instance_block_034_instance_period_comp_tp_reg = instance_inj_ctrl_instance_block_034_tp_reg;
    assign instance_inj_ctrl_instance_block_034_end_period = instance_inj_ctrl_instance_block_034_instance_period_comp_end_period;
    assign instance_inj_ctrl_instance_block_125_instance_period_comp_chop_count = instance_inj_ctrl_instance_block_125_chop_count;
    assign instance_inj_ctrl_instance_block_125_instance_period_comp_tp_reg = instance_inj_ctrl_instance_block_125_tp_reg;
    assign instance_inj_ctrl_instance_block_125_end_period = instance_inj_ctrl_instance_block_125_instance_period_comp_end_period;



    reg[2:0]  instance_inj_ctrl_instance_block_125_instance_sel_cmd_cmd_stored_int  ;
    always @(  posedge    instance_inj_ctrl_instance_block_125_instance_sel_cmd_clock          or  negedge   instance_inj_ctrl_instance_block_125_instance_sel_cmd_rst  )
    begin :  instance_inj_ctrl_instance_block_125_instance_sel_cmd_vhdl_sel_cmd
        if (  instance_inj_ctrl_instance_block_125_instance_sel_cmd_rst  ==1'b0)
            instance_inj_ctrl_instance_block_125_instance_sel_cmd_cmd_stored_int   <=3'b000;
        else
        begin
            if (  instance_inj_ctrl_instance_block_125_instance_sel_cmd_cs2  ==1'b1)
                instance_inj_ctrl_instance_block_125_instance_sel_cmd_cmd_stored_int   <=  instance_inj_ctrl_instance_block_125_instance_sel_cmd_inj_cmd  ;
        end
    end

    always @(     instance_inj_ctrl_instance_block_125_instance_sel_cmd_v_fbk              or    instance_inj_ctrl_instance_block_125_instance_sel_cmd_cmd_stored_int           or    instance_inj_ctrl_instance_block_125_instance_sel_cmd_test_en   )
    case (  instance_inj_ctrl_instance_block_125_instance_sel_cmd_cmd_stored_int  )
        3 'b001:
        begin
            instance_inj_ctrl_instance_block_125_instance_sel_cmd_v_fbk_cur   <=  instance_inj_ctrl_instance_block_125_instance_sel_cmd_v_fbk  [0];
            instance_inj_ctrl_instance_block_125_instance_sel_cmd_test_en_cur   <=  instance_inj_ctrl_instance_block_125_instance_sel_cmd_test_en  [0];
        end
        3 'b010:
        begin
            instance_inj_ctrl_instance_block_125_instance_sel_cmd_v_fbk_cur   <=  instance_inj_ctrl_instance_block_125_instance_sel_cmd_v_fbk  [1];
            instance_inj_ctrl_instance_block_125_instance_sel_cmd_test_en_cur   <=  instance_inj_ctrl_instance_block_125_instance_sel_cmd_test_en  [1];
        end
        3 'b100:
        begin
            instance_inj_ctrl_instance_block_125_instance_sel_cmd_v_fbk_cur   <=  instance_inj_ctrl_instance_block_125_instance_sel_cmd_v_fbk  [2];
            instance_inj_ctrl_instance_block_125_instance_sel_cmd_test_en_cur   <=  instance_inj_ctrl_instance_block_125_instance_sel_cmd_test_en  [2];
        end
        default :
        begin
            instance_inj_ctrl_instance_block_125_instance_sel_cmd_v_fbk_cur   <=1'b0;
            instance_inj_ctrl_instance_block_125_instance_sel_cmd_test_en_cur   <=1'b1;
        end
    endcase

    assign   instance_inj_ctrl_instance_block_125_instance_sel_cmd_v_fbk_mask  [0]=  instance_inj_ctrl_instance_block_125_instance_sel_cmd_v_fbk  [0]&  instance_inj_ctrl_instance_block_125_instance_sel_cmd_test_en  [0];
    assign   instance_inj_ctrl_instance_block_125_instance_sel_cmd_v_fbk_mask  [1]=  instance_inj_ctrl_instance_block_125_instance_sel_cmd_v_fbk  [1]&  instance_inj_ctrl_instance_block_125_instance_sel_cmd_test_en  [1];
    assign   instance_inj_ctrl_instance_block_125_instance_sel_cmd_v_fbk_mask  [2]=  instance_inj_ctrl_instance_block_125_instance_sel_cmd_v_fbk  [2]&  instance_inj_ctrl_instance_block_125_instance_sel_cmd_test_en  [2];
    assign   instance_inj_ctrl_instance_block_125_instance_sel_cmd_cmd_stored  =  instance_inj_ctrl_instance_block_125_instance_sel_cmd_cmd_stored_int  ;
    assign instance_inj_ctrl_instance_block_034_instance_sel_cmd_clock = instance_inj_ctrl_instance_block_034_clock;
    assign instance_inj_ctrl_instance_block_034_instance_sel_cmd_cs2 = instance_inj_ctrl_instance_block_034_cs2;
    assign instance_inj_ctrl_instance_block_034_instance_sel_cmd_inj_cmd = instance_inj_ctrl_instance_block_034_inj_cmd;
    assign instance_inj_ctrl_instance_block_034_instance_sel_cmd_rst = instance_inj_ctrl_instance_block_034_rst;
    assign instance_inj_ctrl_instance_block_034_instance_sel_cmd_test_en = instance_inj_ctrl_instance_block_034_test_en;
    assign instance_inj_ctrl_instance_block_034_instance_sel_cmd_v_fbk = instance_inj_ctrl_instance_block_034_v_fbk;
    assign instance_inj_ctrl_instance_block_034_cmd_stored = instance_inj_ctrl_instance_block_034_instance_sel_cmd_cmd_stored;
    assign instance_inj_ctrl_instance_block_034_test_en_cur = instance_inj_ctrl_instance_block_034_instance_sel_cmd_test_en_cur;
    assign instance_inj_ctrl_instance_block_034_v_fbk_cur = instance_inj_ctrl_instance_block_034_instance_sel_cmd_v_fbk_cur;
    assign instance_inj_ctrl_instance_block_034_v_fbk_mask = instance_inj_ctrl_instance_block_034_instance_sel_cmd_v_fbk_mask;
    assign instance_inj_ctrl_instance_block_125_instance_sel_cmd_clock = instance_inj_ctrl_instance_block_125_clock;
    assign instance_inj_ctrl_instance_block_125_instance_sel_cmd_cs2 = instance_inj_ctrl_instance_block_125_cs2;
    assign instance_inj_ctrl_instance_block_125_instance_sel_cmd_inj_cmd = instance_inj_ctrl_instance_block_125_inj_cmd;
    assign instance_inj_ctrl_instance_block_125_instance_sel_cmd_rst = instance_inj_ctrl_instance_block_125_rst;
    assign instance_inj_ctrl_instance_block_125_instance_sel_cmd_test_en = instance_inj_ctrl_instance_block_125_test_en;
    assign instance_inj_ctrl_instance_block_125_instance_sel_cmd_v_fbk = instance_inj_ctrl_instance_block_125_v_fbk;
    assign instance_inj_ctrl_instance_block_125_cmd_stored = instance_inj_ctrl_instance_block_125_instance_sel_cmd_cmd_stored;
    assign instance_inj_ctrl_instance_block_125_test_en_cur = instance_inj_ctrl_instance_block_125_instance_sel_cmd_test_en_cur;
    assign instance_inj_ctrl_instance_block_125_v_fbk_cur = instance_inj_ctrl_instance_block_125_instance_sel_cmd_v_fbk_cur;
    assign instance_inj_ctrl_instance_block_125_v_fbk_mask = instance_inj_ctrl_instance_block_125_instance_sel_cmd_v_fbk_mask;

    assign instance_inj_ctrl_instance_block_034_clock = instance_inj_ctrl_clock_internal;
    assign instance_inj_ctrl_instance_block_034_inj_cmd = instance_inj_ctrl_inj_cmd_034;
    assign instance_inj_ctrl_instance_block_034_i_fbk = instance_inj_ctrl_i_fbk_034;
    assign instance_inj_ctrl_instance_block_034_rst = instance_inj_ctrl_rst;
    assign instance_inj_ctrl_instance_block_034_r_t1 = instance_inj_ctrl_r_t1;
    assign instance_inj_ctrl_instance_block_034_r_t2 = instance_inj_ctrl_r_t2;
    assign instance_inj_ctrl_instance_block_034_r_t3 = instance_inj_ctrl_r_t3_034;
    assign instance_inj_ctrl_instance_block_034_r_t4 = instance_inj_ctrl_r_t4_034;
    assign instance_inj_ctrl_instance_block_034_r_tb = instance_inj_ctrl_r_tb_034;
    assign instance_inj_ctrl_instance_block_034_r_th = instance_inj_ctrl_r_th_034;
    assign instance_inj_ctrl_instance_block_034_r_tonh = instance_inj_ctrl_r_tonh;
    assign instance_inj_ctrl_instance_block_034_r_tonl = instance_inj_ctrl_r_tonl;
    assign instance_inj_ctrl_instance_block_034_r_tp = instance_inj_ctrl_r_tp;
    assign instance_inj_ctrl_instance_block_034_status_reg = instance_inj_ctrl_status_reg_034;
    assign instance_inj_ctrl_instance_block_034_test_en = instance_inj_ctrl_test_en_034;
    assign instance_inj_ctrl_instance_block_034_v_fbk = instance_inj_ctrl_v_fbk_034;
    assign instance_inj_ctrl_en_fbk_store_034 = instance_inj_ctrl_instance_block_034_en_fbk_store;
    assign instance_inj_ctrl_en_state_store_034 = instance_inj_ctrl_instance_block_034_en_state_store;
    assign instance_inj_ctrl_error1 = instance_inj_ctrl_instance_block_034_error;
    assign instance_inj_ctrl_global_state_034 = instance_inj_ctrl_instance_block_034_global_state_store;
    assign instance_inj_ctrl_hl_034 = instance_inj_ctrl_instance_block_034_hl;
    assign instance_inj_ctrl_relpot1 = instance_inj_ctrl_instance_block_034_relpot;
    assign instance_inj_ctrl_t1_0 = instance_inj_ctrl_instance_block_034_t1a;
    assign instance_inj_ctrl_t1_3 = instance_inj_ctrl_instance_block_034_t1b;
    assign instance_inj_ctrl_t1_4 = instance_inj_ctrl_instance_block_034_t1c;
    assign instance_inj_ctrl_t2_0 = instance_inj_ctrl_instance_block_034_t2a;
    assign instance_inj_ctrl_t2_3 = instance_inj_ctrl_instance_block_034_t2b;
    assign instance_inj_ctrl_t2_4 = instance_inj_ctrl_instance_block_034_t2c;
    assign instance_inj_ctrl_t3_034 = instance_inj_ctrl_instance_block_034_t3;
    assign instance_inj_ctrl_instance_block_125_clock = instance_inj_ctrl_clock_internal;
    assign instance_inj_ctrl_instance_block_125_inj_cmd = instance_inj_ctrl_inj_cmd_125;
    assign instance_inj_ctrl_instance_block_125_i_fbk = instance_inj_ctrl_i_fbk_125;
    assign instance_inj_ctrl_instance_block_125_rst = instance_inj_ctrl_rst;
    assign instance_inj_ctrl_instance_block_125_r_t1 = instance_inj_ctrl_r_t1;
    assign instance_inj_ctrl_instance_block_125_r_t2 = instance_inj_ctrl_r_t2;
    assign instance_inj_ctrl_instance_block_125_r_t3 = instance_inj_ctrl_r_t3_125;
    assign instance_inj_ctrl_instance_block_125_r_t4 = instance_inj_ctrl_r_t4_125;
    assign instance_inj_ctrl_instance_block_125_r_tb = instance_inj_ctrl_r_tb_125;
    assign instance_inj_ctrl_instance_block_125_r_th = instance_inj_ctrl_r_th_125;
    assign instance_inj_ctrl_instance_block_125_r_tonh = instance_inj_ctrl_r_tonh;
    assign instance_inj_ctrl_instance_block_125_r_tonl = instance_inj_ctrl_r_tonl;
    assign instance_inj_ctrl_instance_block_125_r_tp = instance_inj_ctrl_r_tp;
    assign instance_inj_ctrl_instance_block_125_status_reg = instance_inj_ctrl_status_reg_125;
    assign instance_inj_ctrl_instance_block_125_test_en = instance_inj_ctrl_test_en_125;
    assign instance_inj_ctrl_instance_block_125_v_fbk = instance_inj_ctrl_v_fbk_125;
    assign instance_inj_ctrl_en_fbk_store_125 = instance_inj_ctrl_instance_block_125_en_fbk_store;
    assign instance_inj_ctrl_en_state_store_125 = instance_inj_ctrl_instance_block_125_en_state_store;
    assign instance_inj_ctrl_error2 = instance_inj_ctrl_instance_block_125_error;
    assign instance_inj_ctrl_global_state_125 = instance_inj_ctrl_instance_block_125_global_state_store;
    assign instance_inj_ctrl_hl_125 = instance_inj_ctrl_instance_block_125_hl;
    assign instance_inj_ctrl_relpot2 = instance_inj_ctrl_instance_block_125_relpot;
    assign instance_inj_ctrl_t1_1 = instance_inj_ctrl_instance_block_125_t1a;
    assign instance_inj_ctrl_t1_2 = instance_inj_ctrl_instance_block_125_t1b;
    assign instance_inj_ctrl_t1_5 = instance_inj_ctrl_instance_block_125_t1c;
    assign instance_inj_ctrl_t2_1 = instance_inj_ctrl_instance_block_125_t2a;
    assign instance_inj_ctrl_t2_2 = instance_inj_ctrl_instance_block_125_t2b;
    assign instance_inj_ctrl_t2_5 = instance_inj_ctrl_instance_block_125_t2c;
    assign instance_inj_ctrl_t3_125 = instance_inj_ctrl_instance_block_125_t3;


    wire  instance_inj_ctrl_instance_clock_gen_clock_i;
    wire  instance_inj_ctrl_instance_clock_gen_rst;
    wire  instance_inj_ctrl_instance_clock_gen_clock_o;

    reg[3:0]  instance_inj_ctrl_instance_clock_gen_counter  ;
    reg  instance_inj_ctrl_instance_clock_gen_clock_int  ;
    always @(  posedge    instance_inj_ctrl_instance_clock_gen_clock_i          or  negedge   instance_inj_ctrl_instance_clock_gen_rst  )
    begin :  instance_inj_ctrl_instance_clock_gen_vhdl_clock_gen
        if (  instance_inj_ctrl_instance_clock_gen_rst  ==1'b0)
        begin
            instance_inj_ctrl_instance_clock_gen_counter   <={4{1'b0}};
            instance_inj_ctrl_instance_clock_gen_clock_int   <=1'b0;
        end
        else
        begin
            if (  instance_inj_ctrl_instance_clock_gen_counter  ==4'b1001)
            begin
                instance_inj_ctrl_instance_clock_gen_counter   <=4'b0000;
                instance_inj_ctrl_instance_clock_gen_clock_int   <=(~  instance_inj_ctrl_instance_clock_gen_clock_int  );
            end
            else
                instance_inj_ctrl_instance_clock_gen_counter   <=  instance_inj_ctrl_instance_clock_gen_counter  +4'b0001;
        end
    end

    assign   instance_inj_ctrl_instance_clock_gen_clock_o  =  instance_inj_ctrl_instance_clock_gen_clock_int  ;
    assign instance_inj_ctrl_clock = instance_inj_ctrl_instance_clock_gen_clock_i;
    assign instance_inj_ctrl_instance_clock_gen_rst = instance_inj_ctrl_rst;
    assign instance_inj_ctrl_clock_internal = instance_inj_ctrl_instance_clock_gen_clock_o;


    wire  instance_inj_ctrl_instance_d_bus_interface_clock;
    wire  instance_inj_ctrl_instance_d_bus_interface_cs;
    wire  instance_inj_ctrl_instance_d_bus_interface_ds;
    wire  instance_inj_ctrl_instance_d_bus_interface_rst;
    wire  instance_inj_ctrl_instance_d_bus_interface_r_w;
    wire  instance_inj_ctrl_instance_d_bus_interface_rd_en;
    wire  instance_inj_ctrl_instance_d_bus_interface_wr_en;
    wire [16-1:0] instance_inj_ctrl_instance_d_bus_interface_d_bus;
    wire [16-1:0] instance_inj_ctrl_instance_d_bus_interface_d_bus_ext;

    wire  instance_inj_ctrl_instance_d_bus_interface_rd_en_internal  ;
    wire  instance_inj_ctrl_instance_d_bus_interface_wr_en_internal  ;

    wire  instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_clock;
    wire  instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_rd_en;
    wire  instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_rst;
    wire  instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_wr_en;
    wire [16-1:0] instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_d_bus;
    wire [16-1:0] instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_d_bus_ext;

    reg[16-1:0]  instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_d_bus_int  ;
    assign   instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_d_bus  =((  instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_wr_en  ==1'b1))?  instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_d_bus_int  :16'bZZZZZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_d_bus_ext  =((  instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_rd_en  ==1'b1))?  instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_d_bus  :16'bZZZZZZZZZZZZZZZZ;
    always @(  posedge    instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_clock          or  negedge   instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_rst  )
    begin :  instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_vhdl_d_bus_handle
        if (  instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_rst  ==1'b0)
            instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_d_bus_int   <={16{1'b0}};
        else
            instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_d_bus_int   <=  instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_d_bus_ext  ;
    end

    assign instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_clock = instance_inj_ctrl_instance_d_bus_interface_clock;
    assign instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_rd_en = instance_inj_ctrl_instance_d_bus_interface_rd_en_internal;
    assign instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_rst = instance_inj_ctrl_instance_d_bus_interface_rst;
    assign instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_wr_en = instance_inj_ctrl_instance_d_bus_interface_wr_en_internal;
    assign instance_inj_ctrl_instance_d_bus_interface_d_bus = instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_d_bus;
    assign instance_inj_ctrl_instance_d_bus_interface_d_bus_ext = instance_inj_ctrl_instance_d_bus_interface_instance_d_bus_handle_d_bus_ext;


    wire  instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_clock;
    wire  instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_cs;
    wire  instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_ds;
    wire  instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_rst;
    wire  instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_r_w;
    wire  instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_rd_en;
    reg  instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_wr_en;

    wire  instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_wr_en_int  ;
    assign   instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_rd_en  =(~(  instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_cs  ))&  instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_r_w  ;
    assign   instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_wr_en_int  =(~(  instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_cs  ))&(~(  instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_ds  ))&(~(  instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_r_w  ));
    always @(  posedge    instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_clock          or  negedge   instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_rst  )
    begin :  instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_vhdl_ds_handle
        if (  instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_rst  ==1'b0)
            instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_wr_en   <=1'b0;
        else
            instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_wr_en   <=  instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_wr_en_int  ;
    end

    assign instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_clock = instance_inj_ctrl_instance_d_bus_interface_clock;
    assign instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_cs = instance_inj_ctrl_instance_d_bus_interface_cs;
    assign instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_ds = instance_inj_ctrl_instance_d_bus_interface_ds;
    assign instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_rst = instance_inj_ctrl_instance_d_bus_interface_rst;
    assign instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_r_w = instance_inj_ctrl_instance_d_bus_interface_r_w;
    assign instance_inj_ctrl_instance_d_bus_interface_rd_en_internal = instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_rd_en;
    assign instance_inj_ctrl_instance_d_bus_interface_wr_en_internal = instance_inj_ctrl_instance_d_bus_interface_instance_ds_handle_wr_en;

    assign   instance_inj_ctrl_instance_d_bus_interface_rd_en  =  instance_inj_ctrl_instance_d_bus_interface_rd_en_internal  ;
    assign   instance_inj_ctrl_instance_d_bus_interface_wr_en  =  instance_inj_ctrl_instance_d_bus_interface_wr_en_internal  ;
    assign instance_inj_ctrl_instance_d_bus_interface_clock = instance_inj_ctrl_clock;
    assign instance_inj_ctrl_instance_d_bus_interface_cs = instance_inj_ctrl_cs;
    assign instance_inj_ctrl_instance_d_bus_interface_ds = instance_inj_ctrl_ds;
    assign instance_inj_ctrl_instance_d_bus_interface_rst = instance_inj_ctrl_rst;
    assign instance_inj_ctrl_instance_d_bus_interface_r_w = instance_inj_ctrl_r_w;
    assign instance_inj_ctrl_rd_en = instance_inj_ctrl_instance_d_bus_interface_rd_en;
    assign instance_inj_ctrl_wr_en = instance_inj_ctrl_instance_d_bus_interface_wr_en;
    assign instance_inj_ctrl_d_bus = instance_inj_ctrl_instance_d_bus_interface_d_bus;
    assign instance_inj_ctrl_d_bus_ext = instance_inj_ctrl_instance_d_bus_interface_d_bus_ext;


    wire  instance_inj_ctrl_instance_filter_feedback_clock;
    wire [2-1:0] instance_inj_ctrl_instance_filter_feedback_i_fbk;
    wire  instance_inj_ctrl_instance_filter_feedback_rst;
    wire [6-1:0] instance_inj_ctrl_instance_filter_feedback_v_fbk;
    wire [2-1:0] instance_inj_ctrl_instance_filter_feedback_i_fbk_f;
    wire [6-1:0] instance_inj_ctrl_instance_filter_feedback_v_fbk_f;

    wire  instance_inj_ctrl_instance_filter_feedback_v_fbk_0  ;
    wire  instance_inj_ctrl_instance_filter_feedback_v_fbk_f0  ;
    wire  instance_inj_ctrl_instance_filter_feedback_v_fbk_1  ;
    wire  instance_inj_ctrl_instance_filter_feedback_v_fbk_f1  ;
    wire  instance_inj_ctrl_instance_filter_feedback_v_fbk_2  ;
    wire  instance_inj_ctrl_instance_filter_feedback_v_fbk_f2  ;
    wire  instance_inj_ctrl_instance_filter_feedback_v_fbk_3  ;
    wire  instance_inj_ctrl_instance_filter_feedback_v_fbk_f3  ;
    wire  instance_inj_ctrl_instance_filter_feedback_v_fbk_4  ;
    wire  instance_inj_ctrl_instance_filter_feedback_v_fbk_f4  ;
    wire  instance_inj_ctrl_instance_filter_feedback_v_fbk_5  ;
    wire  instance_inj_ctrl_instance_filter_feedback_v_fbk_f5  ;
    wire  instance_inj_ctrl_instance_filter_feedback_i_fbk_0  ;
    wire  instance_inj_ctrl_instance_filter_feedback_i_fbk_f0  ;
    wire  instance_inj_ctrl_instance_filter_feedback_i_fbk_1  ;
    wire  instance_inj_ctrl_instance_filter_feedback_i_fbk_f1  ;

    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt0_clock;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt0_new_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt0_rst;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt0_filtered_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt1_clock;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt1_new_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt1_rst;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt1_filtered_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt2_clock;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt2_new_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt2_rst;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt2_filtered_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt3_clock;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt3_new_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt3_rst;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt3_filtered_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt4_clock;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt4_new_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt4_rst;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt4_filtered_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt5_clock;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt5_new_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt5_rst;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt5_filtered_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt6_clock;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt6_new_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt6_rst;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt6_filtered_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt7_clock;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt7_new_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt7_rst;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt7_filtered_value;


    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_clock;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_new_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_rst;
    reg  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filtered_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_clock;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_new_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_rst;
    reg  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filtered_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_clock;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_new_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_rst;
    reg  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filtered_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_clock;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_new_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_rst;
    reg  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filtered_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_clock;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_new_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_rst;
    reg  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filtered_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_clock;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_new_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_rst;
    reg  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filtered_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_clock;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_new_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_rst;
    reg  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filtered_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_clock;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_new_value;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_rst;
    reg  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filtered_value;

    reg[2:0]  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_current_state  ;
    reg[2:0]  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_next_state  ;
    always @(  posedge    instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_clock          or  negedge   instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_rst  )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_clocked
        if (  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_rst  ==1'b0)
            instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_current_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_start_state  ;
        else
            instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_current_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_next_state  ;
    end

    always @(      instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_current_state                or    instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_clock            or    instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_new_value           or    instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_rst   )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_set_next_state
        instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_current_state  ;
        case (  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_current_state  )
            instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_start_state   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_new_value  ==1'b0)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_start_state  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_new_value  ==1'b1)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_zero_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_zero_1   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_zero_2  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_start_state  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_zero_2   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_zero_3  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_zero_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_zero_3   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_zero_2  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_one_0   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_one_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_one_1   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_one_2  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_one_2   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_one_1  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_one_3  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_one_3   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_one_2  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_start_state  ;
            default :
                ;
        endcase
    end

    always @(   instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_current_state   )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_unclocked
        case (  instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_current_state  )
            instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_start_state   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_zero_1   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_zero_2   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_zero_3   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_one_0   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_one_1   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_one_2   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filter_state_type_one_3   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filtered_value   <=1'b1;
            default :
                ;
        endcase
    end







    reg[2:0]  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_current_state  ;
    reg[2:0]  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_next_state  ;
    always @(  posedge    instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_clock          or  negedge   instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_rst  )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_clocked
        if (  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_rst  ==1'b0)
            instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_current_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_start_state  ;
        else
            instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_current_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_next_state  ;
    end

    always @(      instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_current_state                or    instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_clock            or    instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_new_value           or    instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_rst   )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_set_next_state
        instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_current_state  ;
        case (  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_current_state  )
            instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_start_state   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_new_value  ==1'b0)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_start_state  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_new_value  ==1'b1)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_zero_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_zero_1   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_zero_2  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_start_state  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_zero_2   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_zero_3  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_zero_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_zero_3   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_zero_2  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_one_0   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_one_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_one_1   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_one_2  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_one_2   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_one_1  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_one_3  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_one_3   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_one_2  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_start_state  ;
            default :
                ;
        endcase
    end

    always @(   instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_current_state   )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_unclocked
        case (  instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_current_state  )
            instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_start_state   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_zero_1   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_zero_2   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_zero_3   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_one_0   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_one_1   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_one_2   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filter_state_type_one_3   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filtered_value   <=1'b1;
            default :
                ;
        endcase
    end







    reg[2:0]  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_current_state  ;
    reg[2:0]  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_next_state  ;
    always @(  posedge    instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_clock          or  negedge   instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_rst  )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_clocked
        if (  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_rst  ==1'b0)
            instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_current_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_start_state  ;
        else
            instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_current_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_next_state  ;
    end

    always @(      instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_current_state                or    instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_clock            or    instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_new_value           or    instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_rst   )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_set_next_state
        instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_current_state  ;
        case (  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_current_state  )
            instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_start_state   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_new_value  ==1'b0)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_start_state  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_new_value  ==1'b1)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_zero_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_zero_1   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_zero_2  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_start_state  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_zero_2   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_zero_3  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_zero_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_zero_3   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_zero_2  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_one_0   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_one_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_one_1   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_one_2  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_one_2   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_one_1  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_one_3  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_one_3   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_one_2  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_start_state  ;
            default :
                ;
        endcase
    end

    always @(   instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_current_state   )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_unclocked
        case (  instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_current_state  )
            instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_start_state   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_zero_1   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_zero_2   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_zero_3   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_one_0   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_one_1   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_one_2   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filter_state_type_one_3   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filtered_value   <=1'b1;
            default :
                ;
        endcase
    end







    reg[2:0]  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_current_state  ;
    reg[2:0]  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_next_state  ;
    always @(  posedge    instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_clock          or  negedge   instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_rst  )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_clocked
        if (  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_rst  ==1'b0)
            instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_current_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_start_state  ;
        else
            instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_current_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_next_state  ;
    end

    always @(      instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_current_state                or    instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_clock            or    instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_new_value           or    instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_rst   )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_set_next_state
        instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_current_state  ;
        case (  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_current_state  )
            instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_start_state   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_new_value  ==1'b0)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_start_state  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_new_value  ==1'b1)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_zero_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_zero_1   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_zero_2  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_start_state  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_zero_2   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_zero_3  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_zero_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_zero_3   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_zero_2  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_one_0   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_one_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_one_1   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_one_2  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_one_2   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_one_1  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_one_3  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_one_3   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_one_2  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_start_state  ;
            default :
                ;
        endcase
    end

    always @(   instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_current_state   )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_unclocked
        case (  instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_current_state  )
            instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_start_state   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_zero_1   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_zero_2   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_zero_3   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_one_0   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_one_1   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_one_2   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filter_state_type_one_3   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filtered_value   <=1'b1;
            default :
                ;
        endcase
    end







    reg[2:0]  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_current_state  ;
    reg[2:0]  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_next_state  ;
    always @(  posedge    instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_clock          or  negedge   instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_rst  )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_clocked
        if (  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_rst  ==1'b0)
            instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_current_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_start_state  ;
        else
            instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_current_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_next_state  ;
    end

    always @(      instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_current_state                or    instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_clock            or    instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_new_value           or    instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_rst   )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_set_next_state
        instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_current_state  ;
        case (  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_current_state  )
            instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_start_state   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_new_value  ==1'b0)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_start_state  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_new_value  ==1'b1)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_zero_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_zero_1   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_zero_2  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_start_state  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_zero_2   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_zero_3  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_zero_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_zero_3   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_zero_2  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_one_0   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_one_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_one_1   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_one_2  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_one_2   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_one_1  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_one_3  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_one_3   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_one_2  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_start_state  ;
            default :
                ;
        endcase
    end

    always @(   instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_current_state   )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_unclocked
        case (  instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_current_state  )
            instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_start_state   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_zero_1   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_zero_2   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_zero_3   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_one_0   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_one_1   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_one_2   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filter_state_type_one_3   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filtered_value   <=1'b1;
            default :
                ;
        endcase
    end







    reg[2:0]  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_current_state  ;
    reg[2:0]  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_next_state  ;
    always @(  posedge    instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_clock          or  negedge   instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_rst  )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_clocked
        if (  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_rst  ==1'b0)
            instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_current_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_start_state  ;
        else
            instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_current_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_next_state  ;
    end

    always @(      instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_current_state                or    instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_clock            or    instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_new_value           or    instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_rst   )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_set_next_state
        instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_current_state  ;
        case (  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_current_state  )
            instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_start_state   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_new_value  ==1'b0)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_start_state  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_new_value  ==1'b1)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_zero_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_zero_1   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_zero_2  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_start_state  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_zero_2   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_zero_3  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_zero_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_zero_3   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_zero_2  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_one_0   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_one_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_one_1   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_one_2  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_one_2   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_one_1  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_one_3  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_one_3   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_one_2  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_start_state  ;
            default :
                ;
        endcase
    end

    always @(   instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_current_state   )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_unclocked
        case (  instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_current_state  )
            instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_start_state   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_zero_1   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_zero_2   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_zero_3   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_one_0   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_one_1   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_one_2   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filter_state_type_one_3   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filtered_value   <=1'b1;
            default :
                ;
        endcase
    end







    reg[2:0]  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_current_state  ;
    reg[2:0]  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_next_state  ;
    always @(  posedge    instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_clock          or  negedge   instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_rst  )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_clocked
        if (  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_rst  ==1'b0)
            instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_current_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_start_state  ;
        else
            instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_current_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_next_state  ;
    end

    always @(      instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_current_state                or    instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_clock            or    instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_new_value           or    instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_rst   )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_set_next_state
        instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_current_state  ;
        case (  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_current_state  )
            instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_start_state   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_new_value  ==1'b0)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_start_state  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_new_value  ==1'b1)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_zero_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_zero_1   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_zero_2  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_start_state  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_zero_2   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_zero_3  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_zero_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_zero_3   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_zero_2  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_one_0   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_one_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_one_1   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_one_2  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_one_2   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_one_1  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_one_3  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_one_3   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_one_2  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_start_state  ;
            default :
                ;
        endcase
    end

    always @(   instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_current_state   )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_unclocked
        case (  instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_current_state  )
            instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_start_state   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_zero_1   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_zero_2   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_zero_3   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_one_0   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_one_1   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_one_2   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filter_state_type_one_3   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filtered_value   <=1'b1;
            default :
                ;
        endcase
    end







    reg[2:0]  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_current_state  ;
    reg[2:0]  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_next_state  ;
    always @(  posedge    instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_clock          or  negedge   instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_rst  )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_clocked
        if (  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_rst  ==1'b0)
            instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_current_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_start_state  ;
        else
            instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_current_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_next_state  ;
    end

    always @(      instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_current_state                or    instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_clock            or    instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_new_value           or    instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_rst   )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_set_next_state
        instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_current_state  ;
        case (  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_current_state  )
            instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_start_state   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_new_value  ==1'b0)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_start_state  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_new_value  ==1'b1)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_zero_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_zero_1   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_zero_2  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_start_state  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_zero_2   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_zero_3  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_zero_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_zero_3   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_zero_2  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_one_0   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_one_1  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_one_1   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_one_0  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_one_2  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_one_2   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_one_1  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_one_3  ;
            instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_one_3   :
                if (  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_new_value  ==1'b1)
                    instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_one_2  ;
                else
                    if (  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_new_value  ==1'b0)
                        instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_next_state   <=  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_start_state  ;
            default :
                ;
        endcase
    end

    always @(   instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_current_state   )
    begin :  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_unclocked
        case (  instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_current_state  )
            instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_start_state   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_zero_1   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_zero_2   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_zero_3   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filtered_value   <=1'b0;
            instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_one_0   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_one_1   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_one_2   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filtered_value   <=1'b1;
            instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filter_state_type_one_3   :
                instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filtered_value   <=1'b1;
            default :
                ;
        endcase
    end

    assign instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_clock = instance_inj_ctrl_instance_filter_feedback_instance_filt0_clock;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_new_value = instance_inj_ctrl_instance_filter_feedback_instance_filt0_new_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_rst = instance_inj_ctrl_instance_filter_feedback_instance_filt0_rst;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt0_filtered_value = instance_inj_ctrl_instance_filter_feedback_instance_filt0_instance_filter_filtered_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_clock = instance_inj_ctrl_instance_filter_feedback_instance_filt1_clock;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_new_value = instance_inj_ctrl_instance_filter_feedback_instance_filt1_new_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_rst = instance_inj_ctrl_instance_filter_feedback_instance_filt1_rst;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt1_filtered_value = instance_inj_ctrl_instance_filter_feedback_instance_filt1_instance_filter_filtered_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_clock = instance_inj_ctrl_instance_filter_feedback_instance_filt2_clock;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_new_value = instance_inj_ctrl_instance_filter_feedback_instance_filt2_new_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_rst = instance_inj_ctrl_instance_filter_feedback_instance_filt2_rst;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt2_filtered_value = instance_inj_ctrl_instance_filter_feedback_instance_filt2_instance_filter_filtered_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_clock = instance_inj_ctrl_instance_filter_feedback_instance_filt3_clock;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_new_value = instance_inj_ctrl_instance_filter_feedback_instance_filt3_new_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_rst = instance_inj_ctrl_instance_filter_feedback_instance_filt3_rst;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt3_filtered_value = instance_inj_ctrl_instance_filter_feedback_instance_filt3_instance_filter_filtered_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_clock = instance_inj_ctrl_instance_filter_feedback_instance_filt4_clock;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_new_value = instance_inj_ctrl_instance_filter_feedback_instance_filt4_new_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_rst = instance_inj_ctrl_instance_filter_feedback_instance_filt4_rst;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt4_filtered_value = instance_inj_ctrl_instance_filter_feedback_instance_filt4_instance_filter_filtered_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_clock = instance_inj_ctrl_instance_filter_feedback_instance_filt5_clock;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_new_value = instance_inj_ctrl_instance_filter_feedback_instance_filt5_new_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_rst = instance_inj_ctrl_instance_filter_feedback_instance_filt5_rst;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt5_filtered_value = instance_inj_ctrl_instance_filter_feedback_instance_filt5_instance_filter_filtered_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_clock = instance_inj_ctrl_instance_filter_feedback_instance_filt6_clock;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_new_value = instance_inj_ctrl_instance_filter_feedback_instance_filt6_new_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_rst = instance_inj_ctrl_instance_filter_feedback_instance_filt6_rst;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt6_filtered_value = instance_inj_ctrl_instance_filter_feedback_instance_filt6_instance_filter_filtered_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_clock = instance_inj_ctrl_instance_filter_feedback_instance_filt7_clock;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_new_value = instance_inj_ctrl_instance_filter_feedback_instance_filt7_new_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_rst = instance_inj_ctrl_instance_filter_feedback_instance_filt7_rst;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt7_filtered_value = instance_inj_ctrl_instance_filter_feedback_instance_filt7_instance_filter_filtered_value;

    assign instance_inj_ctrl_instance_filter_feedback_instance_filt0_clock = instance_inj_ctrl_instance_filter_feedback_clock;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt0_new_value = instance_inj_ctrl_instance_filter_feedback_v_fbk_0;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt0_rst = instance_inj_ctrl_instance_filter_feedback_rst;
    assign instance_inj_ctrl_instance_filter_feedback_v_fbk_f0 = instance_inj_ctrl_instance_filter_feedback_instance_filt0_filtered_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt1_clock = instance_inj_ctrl_instance_filter_feedback_clock;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt1_new_value = instance_inj_ctrl_instance_filter_feedback_v_fbk_1;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt1_rst = instance_inj_ctrl_instance_filter_feedback_rst;
    assign instance_inj_ctrl_instance_filter_feedback_v_fbk_f1 = instance_inj_ctrl_instance_filter_feedback_instance_filt1_filtered_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt2_clock = instance_inj_ctrl_instance_filter_feedback_clock;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt2_new_value = instance_inj_ctrl_instance_filter_feedback_v_fbk_2;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt2_rst = instance_inj_ctrl_instance_filter_feedback_rst;
    assign instance_inj_ctrl_instance_filter_feedback_v_fbk_f2 = instance_inj_ctrl_instance_filter_feedback_instance_filt2_filtered_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt3_clock = instance_inj_ctrl_instance_filter_feedback_clock;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt3_new_value = instance_inj_ctrl_instance_filter_feedback_v_fbk_3;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt3_rst = instance_inj_ctrl_instance_filter_feedback_rst;
    assign instance_inj_ctrl_instance_filter_feedback_v_fbk_f3 = instance_inj_ctrl_instance_filter_feedback_instance_filt3_filtered_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt4_clock = instance_inj_ctrl_instance_filter_feedback_clock;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt4_new_value = instance_inj_ctrl_instance_filter_feedback_v_fbk_4;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt4_rst = instance_inj_ctrl_instance_filter_feedback_rst;
    assign instance_inj_ctrl_instance_filter_feedback_v_fbk_f4 = instance_inj_ctrl_instance_filter_feedback_instance_filt4_filtered_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt5_clock = instance_inj_ctrl_instance_filter_feedback_clock;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt5_new_value = instance_inj_ctrl_instance_filter_feedback_v_fbk_5;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt5_rst = instance_inj_ctrl_instance_filter_feedback_rst;
    assign instance_inj_ctrl_instance_filter_feedback_v_fbk_f5 = instance_inj_ctrl_instance_filter_feedback_instance_filt5_filtered_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt6_clock = instance_inj_ctrl_instance_filter_feedback_clock;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt6_new_value = instance_inj_ctrl_instance_filter_feedback_i_fbk_0;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt6_rst = instance_inj_ctrl_instance_filter_feedback_rst;
    assign instance_inj_ctrl_instance_filter_feedback_i_fbk_f0 = instance_inj_ctrl_instance_filter_feedback_instance_filt6_filtered_value;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt7_clock = instance_inj_ctrl_instance_filter_feedback_clock;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt7_new_value = instance_inj_ctrl_instance_filter_feedback_i_fbk_1;
    assign instance_inj_ctrl_instance_filter_feedback_instance_filt7_rst = instance_inj_ctrl_instance_filter_feedback_rst;
    assign instance_inj_ctrl_instance_filter_feedback_i_fbk_f1 = instance_inj_ctrl_instance_filter_feedback_instance_filt7_filtered_value;


    wire [2-1:0] instance_inj_ctrl_instance_filter_feedback_instance_interface_i_fbk;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_interface_i_fbk_f0;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_interface_i_fbk_f1;
    wire [6-1:0] instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f0;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f1;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f2;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f3;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f4;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f5;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_interface_i_fbk_0;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_interface_i_fbk_1;
    wire [2-1:0] instance_inj_ctrl_instance_filter_feedback_instance_interface_i_fbk_f;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_0;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_1;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_2;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_3;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_4;
    wire  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_5;
    wire [6-1:0] instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f;

    assign   instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_0  =  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk  [0];
    assign   instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_1  =  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk  [1];
    assign   instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_2  =  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk  [2];
    assign   instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_3  =  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk  [3];
    assign   instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_4  =  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk  [4];
    assign   instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_5  =  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk  [5];
    assign   instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f  [0]=  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f0  ;
    assign   instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f  [1]=  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f1  ;
    assign   instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f  [2]=  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f2  ;
    assign   instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f  [3]=  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f3  ;
    assign   instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f  [4]=  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f4  ;
    assign   instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f  [5]=  instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f5  ;
    assign   instance_inj_ctrl_instance_filter_feedback_instance_interface_i_fbk_0  =(~(  instance_inj_ctrl_instance_filter_feedback_instance_interface_i_fbk  [0]));
    assign   instance_inj_ctrl_instance_filter_feedback_instance_interface_i_fbk_1  =(~(  instance_inj_ctrl_instance_filter_feedback_instance_interface_i_fbk  [1]));
    assign   instance_inj_ctrl_instance_filter_feedback_instance_interface_i_fbk_f  [0]=  instance_inj_ctrl_instance_filter_feedback_instance_interface_i_fbk_f0  ;
    assign   instance_inj_ctrl_instance_filter_feedback_instance_interface_i_fbk_f  [1]=  instance_inj_ctrl_instance_filter_feedback_instance_interface_i_fbk_f1  ;
    assign instance_inj_ctrl_instance_filter_feedback_instance_interface_i_fbk = instance_inj_ctrl_instance_filter_feedback_i_fbk;
    assign instance_inj_ctrl_instance_filter_feedback_instance_interface_i_fbk_f0 = instance_inj_ctrl_instance_filter_feedback_i_fbk_f0;
    assign instance_inj_ctrl_instance_filter_feedback_instance_interface_i_fbk_f1 = instance_inj_ctrl_instance_filter_feedback_i_fbk_f1;
    assign instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk = instance_inj_ctrl_instance_filter_feedback_v_fbk;
    assign instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f0 = instance_inj_ctrl_instance_filter_feedback_v_fbk_f0;
    assign instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f1 = instance_inj_ctrl_instance_filter_feedback_v_fbk_f1;
    assign instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f2 = instance_inj_ctrl_instance_filter_feedback_v_fbk_f2;
    assign instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f3 = instance_inj_ctrl_instance_filter_feedback_v_fbk_f3;
    assign instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f4 = instance_inj_ctrl_instance_filter_feedback_v_fbk_f4;
    assign instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f5 = instance_inj_ctrl_instance_filter_feedback_v_fbk_f5;
    assign instance_inj_ctrl_instance_filter_feedback_i_fbk_0 = instance_inj_ctrl_instance_filter_feedback_instance_interface_i_fbk_0;
    assign instance_inj_ctrl_instance_filter_feedback_i_fbk_1 = instance_inj_ctrl_instance_filter_feedback_instance_interface_i_fbk_1;
    assign instance_inj_ctrl_instance_filter_feedback_i_fbk_f = instance_inj_ctrl_instance_filter_feedback_instance_interface_i_fbk_f;
    assign instance_inj_ctrl_instance_filter_feedback_v_fbk_0 = instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_0;
    assign instance_inj_ctrl_instance_filter_feedback_v_fbk_1 = instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_1;
    assign instance_inj_ctrl_instance_filter_feedback_v_fbk_2 = instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_2;
    assign instance_inj_ctrl_instance_filter_feedback_v_fbk_3 = instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_3;
    assign instance_inj_ctrl_instance_filter_feedback_v_fbk_4 = instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_4;
    assign instance_inj_ctrl_instance_filter_feedback_v_fbk_5 = instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_5;
    assign instance_inj_ctrl_instance_filter_feedback_v_fbk_f = instance_inj_ctrl_instance_filter_feedback_instance_interface_v_fbk_f;

    assign instance_inj_ctrl_instance_filter_feedback_clock = instance_inj_ctrl_clock_internal;
    assign instance_inj_ctrl_instance_filter_feedback_i_fbk = instance_inj_ctrl_i_fbk;
    assign instance_inj_ctrl_instance_filter_feedback_rst = instance_inj_ctrl_rst;
    assign instance_inj_ctrl_instance_filter_feedback_v_fbk = instance_inj_ctrl_v_fbk;
    assign instance_inj_ctrl_i_fbk_f = instance_inj_ctrl_instance_filter_feedback_i_fbk_f;
    assign instance_inj_ctrl_v_fbk_f = instance_inj_ctrl_instance_filter_feedback_v_fbk_f;


    wire  instance_inj_ctrl_instance_merge_error1;
    wire  instance_inj_ctrl_instance_merge_error2;
    wire  instance_inj_ctrl_instance_merge_hl_034;
    wire  instance_inj_ctrl_instance_merge_hl_125;
    wire  instance_inj_ctrl_instance_merge_relpot1;
    wire  instance_inj_ctrl_instance_merge_relpot2;
    wire [2-1:0] instance_inj_ctrl_instance_merge_hlo;
    wire  instance_inj_ctrl_instance_merge_irq;
    wire  instance_inj_ctrl_instance_merge_rel_pot_en;

    assign   instance_inj_ctrl_instance_merge_rel_pot_en  =  instance_inj_ctrl_instance_merge_relpot2  |  instance_inj_ctrl_instance_merge_relpot1  ;
    assign   instance_inj_ctrl_instance_merge_hlo  [0]=(~(  instance_inj_ctrl_instance_merge_hl_034  ));
    assign   instance_inj_ctrl_instance_merge_hlo  [1]=(~(  instance_inj_ctrl_instance_merge_hl_125  ));
    assign   instance_inj_ctrl_instance_merge_irq  =(~(  instance_inj_ctrl_instance_merge_error1  |  instance_inj_ctrl_instance_merge_error2  ));
    assign instance_inj_ctrl_instance_merge_error1 = instance_inj_ctrl_error1;
    assign instance_inj_ctrl_instance_merge_error2 = instance_inj_ctrl_error2;
    assign instance_inj_ctrl_instance_merge_hl_034 = instance_inj_ctrl_hl_034;
    assign instance_inj_ctrl_instance_merge_hl_125 = instance_inj_ctrl_hl_125;
    assign instance_inj_ctrl_instance_merge_relpot1 = instance_inj_ctrl_relpot1;
    assign instance_inj_ctrl_instance_merge_relpot2 = instance_inj_ctrl_relpot2;
    assign instance_inj_ctrl_hlo = instance_inj_ctrl_instance_merge_hlo;
    assign instance_inj_ctrl_irq = instance_inj_ctrl_instance_merge_irq;
    assign instance_inj_ctrl_rel_pot_en = instance_inj_ctrl_instance_merge_rel_pot_en;


    wire  instance_inj_ctrl_instance_merge_actuators_t1_0;
    wire  instance_inj_ctrl_instance_merge_actuators_t1_1;
    wire  instance_inj_ctrl_instance_merge_actuators_t1_2;
    wire  instance_inj_ctrl_instance_merge_actuators_t1_3;
    wire  instance_inj_ctrl_instance_merge_actuators_t1_4;
    wire  instance_inj_ctrl_instance_merge_actuators_t1_5;
    wire  instance_inj_ctrl_instance_merge_actuators_t2_0;
    wire  instance_inj_ctrl_instance_merge_actuators_t2_1;
    wire  instance_inj_ctrl_instance_merge_actuators_t2_2;
    wire  instance_inj_ctrl_instance_merge_actuators_t2_3;
    wire  instance_inj_ctrl_instance_merge_actuators_t2_4;
    wire  instance_inj_ctrl_instance_merge_actuators_t2_5;
    wire  instance_inj_ctrl_instance_merge_actuators_t3_034;
    wire  instance_inj_ctrl_instance_merge_actuators_t3_125;
    wire [6-1:0] instance_inj_ctrl_instance_merge_actuators_t1;
    wire [6-1:0] instance_inj_ctrl_instance_merge_actuators_t2;
    wire [2-1:0] instance_inj_ctrl_instance_merge_actuators_t3;


    wire  instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_0;
    wire  instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_1;
    wire  instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_2;
    wire  instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_3;
    wire  instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_4;
    wire  instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_5;
    reg [6-1:0] instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1;

    always @(        instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_0                    or    instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_1              or    instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_2             or    instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_3            or    instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_4           or    instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_5   )
    begin :  instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_vhdl_merge_t1
        instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1   [0]<=(~(  instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_0  ));
        instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1   [1]<=(~(  instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_1  ));
        instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1   [2]<=(~(  instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_2  ));
        instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1   [3]<=(~(  instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_3  ));
        instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1   [4]<=(~(  instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_4  ));
        instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1   [5]<=(~(  instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_5  ));
    end

    assign instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_0 = instance_inj_ctrl_instance_merge_actuators_t1_0;
    assign instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_1 = instance_inj_ctrl_instance_merge_actuators_t1_1;
    assign instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_2 = instance_inj_ctrl_instance_merge_actuators_t1_2;
    assign instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_3 = instance_inj_ctrl_instance_merge_actuators_t1_3;
    assign instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_4 = instance_inj_ctrl_instance_merge_actuators_t1_4;
    assign instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1_5 = instance_inj_ctrl_instance_merge_actuators_t1_5;
    assign instance_inj_ctrl_instance_merge_actuators_t1 = instance_inj_ctrl_instance_merge_actuators_instance_merge_t1_t1;


    wire  instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_0;
    wire  instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_1;
    wire  instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_2;
    wire  instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_3;
    wire  instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_4;
    wire  instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_5;
    reg [6-1:0] instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2;

    always @(        instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_0                    or    instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_1              or    instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_2             or    instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_3            or    instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_4           or    instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_5   )
    begin :  instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_vhdl_merge_t2
        instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2   [0]<=  instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_0  ;
        instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2   [1]<=  instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_1  ;
        instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2   [2]<=  instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_2  ;
        instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2   [3]<=  instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_3  ;
        instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2   [4]<=  instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_4  ;
        instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2   [5]<=  instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_5  ;
    end

    assign instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_0 = instance_inj_ctrl_instance_merge_actuators_t2_0;
    assign instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_1 = instance_inj_ctrl_instance_merge_actuators_t2_1;
    assign instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_2 = instance_inj_ctrl_instance_merge_actuators_t2_2;
    assign instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_3 = instance_inj_ctrl_instance_merge_actuators_t2_3;
    assign instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_4 = instance_inj_ctrl_instance_merge_actuators_t2_4;
    assign instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2_5 = instance_inj_ctrl_instance_merge_actuators_t2_5;
    assign instance_inj_ctrl_instance_merge_actuators_t2 = instance_inj_ctrl_instance_merge_actuators_instance_merge_t2_t2;


    wire  instance_inj_ctrl_instance_merge_actuators_instance_merge_t3_t3_034;
    wire  instance_inj_ctrl_instance_merge_actuators_instance_merge_t3_t3_125;
    reg [2-1:0] instance_inj_ctrl_instance_merge_actuators_instance_merge_t3_t3;

    always @(    instance_inj_ctrl_instance_merge_actuators_instance_merge_t3_t3_034            or    instance_inj_ctrl_instance_merge_actuators_instance_merge_t3_t3_125   )
    begin :  instance_inj_ctrl_instance_merge_actuators_instance_merge_t3_vhdl_merge_t3
        instance_inj_ctrl_instance_merge_actuators_instance_merge_t3_t3   [0]<=(~(  instance_inj_ctrl_instance_merge_actuators_instance_merge_t3_t3_034  ));
        instance_inj_ctrl_instance_merge_actuators_instance_merge_t3_t3   [1]<=(~(  instance_inj_ctrl_instance_merge_actuators_instance_merge_t3_t3_125  ));
    end

    assign instance_inj_ctrl_instance_merge_actuators_instance_merge_t3_t3_034 = instance_inj_ctrl_instance_merge_actuators_t3_034;
    assign instance_inj_ctrl_instance_merge_actuators_instance_merge_t3_t3_125 = instance_inj_ctrl_instance_merge_actuators_t3_125;
    assign instance_inj_ctrl_instance_merge_actuators_t3 = instance_inj_ctrl_instance_merge_actuators_instance_merge_t3_t3;

    assign instance_inj_ctrl_instance_merge_actuators_t1_0 = instance_inj_ctrl_t1_0;
    assign instance_inj_ctrl_instance_merge_actuators_t1_1 = instance_inj_ctrl_t1_1;
    assign instance_inj_ctrl_instance_merge_actuators_t1_2 = instance_inj_ctrl_t1_2;
    assign instance_inj_ctrl_instance_merge_actuators_t1_3 = instance_inj_ctrl_t1_3;
    assign instance_inj_ctrl_instance_merge_actuators_t1_4 = instance_inj_ctrl_t1_4;
    assign instance_inj_ctrl_instance_merge_actuators_t1_5 = instance_inj_ctrl_t1_5;
    assign instance_inj_ctrl_instance_merge_actuators_t2_0 = instance_inj_ctrl_t2_0;
    assign instance_inj_ctrl_instance_merge_actuators_t2_1 = instance_inj_ctrl_t2_1;
    assign instance_inj_ctrl_instance_merge_actuators_t2_2 = instance_inj_ctrl_t2_2;
    assign instance_inj_ctrl_instance_merge_actuators_t2_3 = instance_inj_ctrl_t2_3;
    assign instance_inj_ctrl_instance_merge_actuators_t2_4 = instance_inj_ctrl_t2_4;
    assign instance_inj_ctrl_instance_merge_actuators_t2_5 = instance_inj_ctrl_t2_5;
    assign instance_inj_ctrl_instance_merge_actuators_t3_034 = instance_inj_ctrl_t3_034;
    assign instance_inj_ctrl_instance_merge_actuators_t3_125 = instance_inj_ctrl_t3_125;
    assign instance_inj_ctrl_t1 = instance_inj_ctrl_instance_merge_actuators_t1;
    assign instance_inj_ctrl_t2 = instance_inj_ctrl_instance_merge_actuators_t2;
    assign instance_inj_ctrl_t3 = instance_inj_ctrl_instance_merge_actuators_t3;


    wire [6-1:0] instance_inj_ctrl_instance_registers_a_bus;
    wire  instance_inj_ctrl_instance_registers_clock;
    wire [21-1:0] instance_inj_ctrl_instance_registers_digital_input;
    wire  instance_inj_ctrl_instance_registers_en_fbk_store_034;
    wire  instance_inj_ctrl_instance_registers_en_fbk_store_125;
    wire  instance_inj_ctrl_instance_registers_en_state_store_034;
    wire  instance_inj_ctrl_instance_registers_en_state_store_125;
    wire [3-1:0] instance_inj_ctrl_instance_registers_fbk_pwm;
    wire [7-1:0] instance_inj_ctrl_instance_registers_global_state_034;
    wire [7-1:0] instance_inj_ctrl_instance_registers_global_state_125;
    wire [2-1:0] instance_inj_ctrl_instance_registers_i_fbk_f;
    wire [7-1:0] instance_inj_ctrl_instance_registers_nssm_in;
    wire  instance_inj_ctrl_instance_registers_rd_en;
    wire  instance_inj_ctrl_instance_registers_rel_pot_en;
    wire  instance_inj_ctrl_instance_registers_rst;
    wire [6-1:0] instance_inj_ctrl_instance_registers_v_fbk_f;
    wire  instance_inj_ctrl_instance_registers_wr_en;
    wire [7:0] instance_inj_ctrl_instance_registers_digital_output;
    wire  instance_inj_ctrl_instance_registers_in_speed_lev;
    wire  instance_inj_ctrl_instance_registers_knock1u;
    wire  instance_inj_ctrl_instance_registers_knock2u;
    wire  instance_inj_ctrl_instance_registers_pickup_hall;
    wire  instance_inj_ctrl_instance_registers_relpot;
    wire [8-1:0] instance_inj_ctrl_instance_registers_r_t1;
    wire [7-1:0] instance_inj_ctrl_instance_registers_r_t2;
    wire [8-1:0] instance_inj_ctrl_instance_registers_r_t3_034;
    wire [8-1:0] instance_inj_ctrl_instance_registers_r_t3_125;
    wire [7-1:0] instance_inj_ctrl_instance_registers_r_t4_034;
    wire [7-1:0] instance_inj_ctrl_instance_registers_r_t4_125;
    wire [10-1:0] instance_inj_ctrl_instance_registers_r_tb_034;
    wire [10-1:0] instance_inj_ctrl_instance_registers_r_tb_125;
    wire [12-1:0] instance_inj_ctrl_instance_registers_r_th_034;
    wire [12-1:0] instance_inj_ctrl_instance_registers_r_th_125;
    wire [7-1:0] instance_inj_ctrl_instance_registers_r_tonh;
    wire [7-1:0] instance_inj_ctrl_instance_registers_r_tonl;
    wire [7-1:0] instance_inj_ctrl_instance_registers_r_tp;
    wire  instance_inj_ctrl_instance_registers_seg_speed_lev;
    wire  instance_inj_ctrl_instance_registers_smot_camme_en;
    wire [11-1:0] instance_inj_ctrl_instance_registers_status_reg_034;
    wire [11-1:0] instance_inj_ctrl_instance_registers_status_reg_125;
    wire [3-1:0] instance_inj_ctrl_instance_registers_test_en_034;
    wire [3-1:0] instance_inj_ctrl_instance_registers_test_en_125;
    wire  instance_inj_ctrl_instance_registers_trg_knock_en;
    wire  instance_inj_ctrl_instance_registers_turbo_speed_lev;
    wire [16-1:0] instance_inj_ctrl_instance_registers_d_bus;

    wire[13-1:0]  instance_inj_ctrl_instance_registers_add_decoded  ;
    wire[13-1:0]  instance_inj_ctrl_instance_registers_add_decoded_r  ;
    wire  instance_inj_ctrl_instance_registers_add_test_en  ;
    wire[2-1:0]  instance_inj_ctrl_instance_registers_a_dig_in  ;
    wire  instance_inj_ctrl_instance_registers_a_dig_out  ;
    wire[2-1:0]  instance_inj_ctrl_instance_registers_a_fault_dec  ;
    wire[2-1:0]  instance_inj_ctrl_instance_registers_a_fault_dec_r  ;

    wire [6-1:0] instance_inj_ctrl_instance_registers_instance_add_dec_a_bus;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_clock;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_rst;
    reg [13-1:0] instance_inj_ctrl_instance_registers_instance_add_dec_add_decoded;
    wire [13-1:0] instance_inj_ctrl_instance_registers_instance_add_dec_add_decoded_r;
    reg  instance_inj_ctrl_instance_registers_instance_add_dec_add_test_en;
    wire [2-1:0] instance_inj_ctrl_instance_registers_instance_add_dec_a_dig_in;
    reg  instance_inj_ctrl_instance_registers_instance_add_dec_a_dig_out;
    reg [2-1:0] instance_inj_ctrl_instance_registers_instance_add_dec_a_fault_dec;
    wire [2-1:0] instance_inj_ctrl_instance_registers_instance_add_dec_a_fault_dec_r;

    wire[13-1:0]  instance_inj_ctrl_instance_registers_instance_add_dec_add_decoded_int  ;
    wire[2-1:0]  instance_inj_ctrl_instance_registers_instance_add_dec_a_fault_dec_int  ;
    wire[2-1:0]  instance_inj_ctrl_instance_registers_instance_add_dec_a_dig_in_int  ;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_a_dig_out_int  ;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_add_test_en_int  ;
    wire[4:0]  instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus  ;
    always @(  posedge    instance_inj_ctrl_instance_registers_instance_add_dec_clock          or  negedge   instance_inj_ctrl_instance_registers_instance_add_dec_rst  )
    begin :  instance_inj_ctrl_instance_registers_instance_add_dec_vhdl_add_dec
        if (  instance_inj_ctrl_instance_registers_instance_add_dec_rst  ==1'b0)
        begin
            instance_inj_ctrl_instance_registers_instance_add_dec_add_decoded   <={13{1'b0}};
            instance_inj_ctrl_instance_registers_instance_add_dec_a_fault_dec   <={2{1'b0}};
            instance_inj_ctrl_instance_registers_instance_add_dec_a_dig_out   <=1'b0;
            instance_inj_ctrl_instance_registers_instance_add_dec_add_test_en   <=1'b0;
        end
        else
        begin
            instance_inj_ctrl_instance_registers_instance_add_dec_add_decoded   <=  instance_inj_ctrl_instance_registers_instance_add_dec_add_decoded_int  &13'b1111111111111;
            instance_inj_ctrl_instance_registers_instance_add_dec_a_fault_dec   <=  instance_inj_ctrl_instance_registers_instance_add_dec_a_fault_dec_int  &2'b11;
            instance_inj_ctrl_instance_registers_instance_add_dec_a_dig_out   <=  instance_inj_ctrl_instance_registers_instance_add_dec_a_dig_out_int  &1'b1;
            instance_inj_ctrl_instance_registers_instance_add_dec_add_test_en   <=  instance_inj_ctrl_instance_registers_instance_add_dec_add_test_en_int  &1'b1;
        end
    end

    assign   instance_inj_ctrl_instance_registers_instance_add_dec_a_dig_in  ={2{  instance_inj_ctrl_instance_registers_instance_add_dec_a_dig_in_int  }}&2'b11;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_add_decoded_r  =  instance_inj_ctrl_instance_registers_instance_add_dec_add_decoded_int  &13'b1111111111111;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_a_fault_dec_r  =  instance_inj_ctrl_instance_registers_instance_add_dec_a_fault_dec_int  &2'b11;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus  [0]=(~(  instance_inj_ctrl_instance_registers_instance_add_dec_a_bus  [0]));
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus  [1]=(~(  instance_inj_ctrl_instance_registers_instance_add_dec_a_bus  [1]));
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus  [2]=(~(  instance_inj_ctrl_instance_registers_instance_add_dec_a_bus  [2]));
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus  [3]=(~(  instance_inj_ctrl_instance_registers_instance_add_dec_a_bus  [3]));
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus  [4]=(~(  instance_inj_ctrl_instance_registers_instance_add_dec_a_bus  [4]));

    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t1_i0;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t1_i1;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t1_i2;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t1_i3;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t1_i4;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t2_i0;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t2_i1;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t2_i2;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t2_i3;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t2_i4;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tab_i0;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tab_i1;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tab_i2;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tab_i3;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tab_i4;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tah_i0;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tah_i1;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tah_i2;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tah_i3;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tah_i4;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbb_i0;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbb_i1;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbb_i2;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbb_i3;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbb_i4;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbh_i0;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbh_i1;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbh_i2;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbh_i3;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbh_i4;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonh_i0;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonh_i1;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonh_i2;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonh_i3;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonh_i4;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonl_i0;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonl_i1;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonl_i2;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonl_i3;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonl_i4;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tp_i0;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tp_i1;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tp_i2;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tp_i3;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tp_i4;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_034_i0;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_034_i1;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_034_i2;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_034_i3;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_034_i4;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_125_i0;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_125_i1;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_125_i2;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_125_i3;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_125_i4;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_034_i0;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_034_i1;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_034_i2;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_034_i3;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_034_i4;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_125_i0;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_125_i1;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_125_i2;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_125_i3;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_125_i4;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr1_i0;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr1_i1;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr1_i2;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr1_i3;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr1_i4;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr2_i0;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr2_i1;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr2_i2;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr2_i3;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr2_i4;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int_i0;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int_i1;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int_i2;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int_i3;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int_i4;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int1_i0;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int1_i1;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int1_i2;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int1_i3;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int1_i4;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_out_i0;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_out_i1;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_out_i2;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_out_i3;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_out_i4;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_test_en_int_i0;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_test_en_int_i1;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_test_en_int_i2;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_test_en_int_i3;
    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_test_en_int_i4;

    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t1_o  ;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t1_o  =(  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t1_i0  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t1_i1  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t1_i2  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t1_i3  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t1_i4  );



    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t2_o  ;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t2_o  =(  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t2_i0  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t2_i1  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t2_i2  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t2_i3  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t2_i4  );



    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tab_o  ;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tab_o  =(  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tab_i0  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tab_i1  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tab_i2  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tab_i3  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tab_i4  );



    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tah_o  ;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tah_o  =(  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tah_i0  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tah_i1  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tah_i2  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tah_i3  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tah_i4  );



    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbb_o  ;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbb_o  =(  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbb_i0  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbb_i1  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbb_i2  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbb_i3  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbb_i4  );



    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbh_o  ;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbh_o  =(  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbh_i0  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbh_i1  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbh_i2  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbh_i3  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbh_i4  );



    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonh_o  ;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonh_o  =(  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonh_i0  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonh_i1  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonh_i2  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonh_i3  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonh_i4  );



    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonl_o  ;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonl_o  =(  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonl_i0  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonl_i1  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonl_i2  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonl_i3  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonl_i4  );



    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tp_o  ;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tp_o  =(  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tp_i0  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tp_i1  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tp_i2  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tp_i3  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tp_i4  );



    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_034_o  ;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_034_o  =(  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_034_i0  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_034_i1  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_034_i2  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_034_i3  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_034_i4  );



    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_125_o  ;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_125_o  =(  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_125_i0  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_125_i1  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_125_i2  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_125_i3  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_125_i4  );



    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_034_o  ;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_034_o  =(  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_034_i0  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_034_i1  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_034_i2  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_034_i3  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_034_i4  );



    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_125_o  ;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_125_o  =(  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_125_i0  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_125_i1  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_125_i2  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_125_i3  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_125_i4  );



    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr1_o  ;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr1_o  =(  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr1_i0  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr1_i1  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr1_i2  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr1_i3  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr1_i4  );



    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr2_o  ;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr2_o  =(  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr2_i0  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr2_i1  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr2_i2  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr2_i3  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr2_i4  );



    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int_o  ;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int_o  =(  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int_i0  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int_i1  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int_i2  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int_i3  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int_i4  );



    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int1_o  ;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int1_o  =(  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int1_i0  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int1_i1  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int1_i2  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int1_i3  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int1_i4  );



    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_out_o  ;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_out_o  =(  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_out_i0  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_out_i1  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_out_i2  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_out_i3  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_out_i4  );



    wire  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_test_en_int_o  ;
    assign   instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_test_en_int_o  =(  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_test_en_int_i0  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_test_en_int_i1  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_test_en_int_i2  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_test_en_int_i3  &  instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_test_en_int_i4  );
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t1_i0 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[4];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t1_i1 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[3];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t1_i2 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[2];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t1_i3 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[1];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t1_i4 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[0];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t2_i0 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[4];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t2_i1 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[3];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t2_i2 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[2];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t2_i3 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[1];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t2_i4 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[0];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tab_i0 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[4];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tab_i1 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[3];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tab_i2 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[2];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tab_i3 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[1];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tab_i4 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[0];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tah_i0 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[4];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tah_i1 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[3];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tah_i2 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[2];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tah_i3 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[1];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tah_i4 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[0];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbb_i0 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[4];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbb_i1 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[3];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbb_i2 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[2];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbb_i3 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[1];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbb_i4 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[0];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbh_i0 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[4];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbh_i1 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[3];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbh_i2 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[2];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbh_i3 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[1];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tbh_i4 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[0];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonh_i0 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[4];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonh_i1 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[3];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonh_i2 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[2];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonh_i3 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[1];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonh_i4 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[0];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonl_i0 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[4];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonl_i1 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[3];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonl_i2 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[2];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonl_i3 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[1];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tonl_i4 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[0];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tp_i0 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[4];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tp_i1 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[3];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tp_i2 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[2];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tp_i3 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[1];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_tp_i4 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[0];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_034_i0 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[4];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_034_i1 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[3];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_034_i2 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[2];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_034_i3 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[1];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_034_i4 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[0];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_125_i0 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[4];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_125_i1 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[3];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_125_i2 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[2];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_125_i3 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[1];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t3_125_i4 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[0];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_034_i0 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[4];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_034_i1 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[3];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_034_i2 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[2];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_034_i3 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[1];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_034_i4 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[0];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_125_i0 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[4];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_125_i1 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[3];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_125_i2 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[2];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_125_i3 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[1];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_t4_125_i4 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[0];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr1_i0 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[4];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr1_i1 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[3];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr1_i2 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[2];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr1_i3 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[1];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr1_i4 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[0];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr2_i0 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[4];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr2_i1 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[3];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr2_i2 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[2];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr2_i3 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[1];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_fr2_i4 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[0];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int_i0 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[4];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int_i1 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[3];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int_i2 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[2];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int_i3 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[1];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int_i4 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[0];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int1_i0 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[4];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int1_i1 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[3];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int1_i2 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[2];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int1_i3 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[1];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_in_int1_i4 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[0];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_out_i0 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[4];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_out_i1 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[3];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_out_i2 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[2];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_out_i3 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[1];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_a_dig_out_i4 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[0];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_test_en_int_i0 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[4];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_test_en_int_i1 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[3];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_test_en_int_i2 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[2];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_test_en_int_i3 = instance_inj_ctrl_instance_registers_instance_add_dec_a_bus[1];
    assign instance_inj_ctrl_instance_registers_instance_add_dec_dwand_add_test_en_int_i4 = instance_inj_ctrl_instance_registers_instance_add_dec_not_a_bus[0];

    assign instance_inj_ctrl_instance_registers_instance_add_dec_a_bus = instance_inj_ctrl_instance_registers_a_bus;
    assign instance_inj_ctrl_instance_registers_instance_add_dec_clock = instance_inj_ctrl_instance_registers_clock;
    assign instance_inj_ctrl_instance_registers_instance_add_dec_rst = instance_inj_ctrl_instance_registers_rst;
    assign instance_inj_ctrl_instance_registers_add_decoded = instance_inj_ctrl_instance_registers_instance_add_dec_add_decoded;
    assign instance_inj_ctrl_instance_registers_add_decoded_r = instance_inj_ctrl_instance_registers_instance_add_dec_add_decoded_r;
    assign instance_inj_ctrl_instance_registers_add_test_en = instance_inj_ctrl_instance_registers_instance_add_dec_add_test_en;
    assign instance_inj_ctrl_instance_registers_a_dig_in = instance_inj_ctrl_instance_registers_instance_add_dec_a_dig_in;
    assign instance_inj_ctrl_instance_registers_a_dig_out = instance_inj_ctrl_instance_registers_instance_add_dec_a_dig_out;
    assign instance_inj_ctrl_instance_registers_a_fault_dec = instance_inj_ctrl_instance_registers_instance_add_dec_a_fault_dec;
    assign instance_inj_ctrl_instance_registers_a_fault_dec_r = instance_inj_ctrl_instance_registers_instance_add_dec_a_fault_dec_r;


    wire [2-1:0] instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_a_dig_in;
    wire  instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_clock;
    wire [21-1:0] instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_digital_input;
    wire [3-1:0] instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_fbk_pwm;
    wire [7-1:0] instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_nssm_in;
    wire  instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_rd_en;
    wire  instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_rst;
    wire [16-1:0] instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_d_bus;

    reg[31:0]  instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_store_digital_input  ;
    always @(  posedge    instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_clock          or  negedge   instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_rst  )
    begin :  instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_vhdl_digital_inputs_handle
        if (  instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_rst  ==1'b0)
            instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_store_digital_input   <={32{1'b0}};
        else
        begin
            instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_store_digital_input   [20:0]<=  instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_digital_input  ;
            instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_store_digital_input   [23:21]<=  instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_fbk_pwm  ;
            instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_store_digital_input   [30:24]<=  instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_nssm_in  ;
        end
    end

    assign   instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_d_bus  =((  instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_a_dig_in  [0]==1'b1&  instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_rd_en  ==1'b1))?  instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_store_digital_input  [15:0]:16'bZZZZZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_d_bus  =((  instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_a_dig_in  [1]==1'b1&  instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_rd_en  ==1'b1))?{1'b0,  instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_store_digital_input  [30:16]}:16'bZZZZZZZZZZZZZZZZ;
    assign instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_a_dig_in = instance_inj_ctrl_instance_registers_a_dig_in;
    assign instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_clock = instance_inj_ctrl_instance_registers_clock;
    assign instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_digital_input = instance_inj_ctrl_instance_registers_digital_input;
    assign instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_fbk_pwm = instance_inj_ctrl_instance_registers_fbk_pwm;
    assign instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_nssm_in = instance_inj_ctrl_instance_registers_nssm_in;
    assign instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_rd_en = instance_inj_ctrl_instance_registers_rd_en;
    assign instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_rst = instance_inj_ctrl_instance_registers_rst;
    assign instance_inj_ctrl_instance_registers_d_bus = instance_inj_ctrl_instance_registers_instance_digital_inputs_handle_d_bus;


    wire  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_a_dig_out;
    wire  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_clock;
    wire [16-1:0] instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_d_bus;
    wire  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_rst;
    wire  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_wr_en;
    wire [7:0] instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_digital_output;
    wire  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_in_speed_lev;
    wire  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_knock1u;
    wire  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_knock2u;
    wire  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_pickup_hall;
    wire  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_seg_speed_lev;
    wire  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_smot_camme_en;
    wire  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_trg_knock_en;
    wire  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_turbo_speed_lev;

    reg[7:0]  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_digital_output_store  ;
    reg  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_smot_camme_store  ;
    reg  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_trg_knock_store  ;
    reg  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_knock1_store  ;
    reg  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_knock2_store  ;
    reg  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_in_speed_lev_store  ;
    reg  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_seg_speed_lev_store  ;
    reg  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_turbo_speed_lev_store  ;
    reg  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_pickup_hall_store  ;
    assign   instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_digital_output  =  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_digital_output_store  ;
    assign   instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_smot_camme_en  =  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_smot_camme_store  ;
    assign   instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_trg_knock_en  =  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_trg_knock_store  ;
    assign   instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_pickup_hall  =  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_pickup_hall_store  ;
    assign   instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_in_speed_lev  =  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_in_speed_lev_store  ;
    assign   instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_seg_speed_lev  =  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_seg_speed_lev_store  ;
    assign   instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_turbo_speed_lev  =  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_turbo_speed_lev_store  ;
    assign   instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_knock1u  =  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_knock1_store  ;
    assign   instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_knock2u  =  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_knock2_store  ;
    always @(  posedge    instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_clock          or  negedge   instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_rst  )
    begin :  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_vhdl_digital_outputs_handle
        if (  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_rst  ==1'b0)
        begin
            instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_digital_output_store   <={8{1'b0}};
            instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_smot_camme_store   <=1'b0;
            instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_trg_knock_store   <=1'b0;
            instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_pickup_hall_store   <=1'b0;
            instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_in_speed_lev_store   <=1'b0;
            instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_seg_speed_lev_store   <=1'b0;
            instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_turbo_speed_lev_store   <=1'b0;
            instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_knock1_store   <=1'b0;
            instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_knock2_store   <=1'b0;
        end
        else
        begin
            if (  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_a_dig_out  ==1'b1&  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_wr_en  ==1'b1)
            begin
                instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_digital_output_store   <=  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_d_bus  [7:0];
                instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_smot_camme_store   <=  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_d_bus  [8];
                instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_trg_knock_store   <=  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_d_bus  [9];
                instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_pickup_hall_store   <=  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_d_bus  [10];
                instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_in_speed_lev_store   <=  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_d_bus  [11];
                instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_seg_speed_lev_store   <=  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_d_bus  [12];
                instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_turbo_speed_lev_store   <=  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_d_bus  [13];
                instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_knock1_store   <=  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_d_bus  [14];
                instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_knock2_store   <=  instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_d_bus  [15];
            end
        end
    end

    assign instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_a_dig_out = instance_inj_ctrl_instance_registers_a_dig_out;
    assign instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_clock = instance_inj_ctrl_instance_registers_clock;
    assign instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_d_bus = instance_inj_ctrl_instance_registers_d_bus;
    assign instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_rst = instance_inj_ctrl_instance_registers_rst;
    assign instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_wr_en = instance_inj_ctrl_instance_registers_wr_en;
    assign instance_inj_ctrl_instance_registers_digital_output = instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_digital_output;
    assign instance_inj_ctrl_instance_registers_in_speed_lev = instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_in_speed_lev;
    assign instance_inj_ctrl_instance_registers_knock1u = instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_knock1u;
    assign instance_inj_ctrl_instance_registers_knock2u = instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_knock2u;
    assign instance_inj_ctrl_instance_registers_pickup_hall = instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_pickup_hall;
    assign instance_inj_ctrl_instance_registers_seg_speed_lev = instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_seg_speed_lev;
    assign instance_inj_ctrl_instance_registers_smot_camme_en = instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_smot_camme_en;
    assign instance_inj_ctrl_instance_registers_trg_knock_en = instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_trg_knock_en;
    assign instance_inj_ctrl_instance_registers_turbo_speed_lev = instance_inj_ctrl_instance_registers_instance_digital_outputs_handle_turbo_speed_lev;


    wire [2-1:0] instance_inj_ctrl_instance_registers_instance_error_handle_a_fault_dec;
    wire [2-1:0] instance_inj_ctrl_instance_registers_instance_error_handle_a_fault_dec_r;
    wire  instance_inj_ctrl_instance_registers_instance_error_handle_clock;
    wire  instance_inj_ctrl_instance_registers_instance_error_handle_en_fbk_store_034;
    wire  instance_inj_ctrl_instance_registers_instance_error_handle_en_fbk_store_125;
    wire  instance_inj_ctrl_instance_registers_instance_error_handle_en_state_store_034;
    wire  instance_inj_ctrl_instance_registers_instance_error_handle_en_state_store_125;
    wire [7-1:0] instance_inj_ctrl_instance_registers_instance_error_handle_global_state_034;
    wire [7-1:0] instance_inj_ctrl_instance_registers_instance_error_handle_global_state_125;
    wire [2-1:0] instance_inj_ctrl_instance_registers_instance_error_handle_i_fbk_f;
    wire  instance_inj_ctrl_instance_registers_instance_error_handle_rd_en;
    wire  instance_inj_ctrl_instance_registers_instance_error_handle_rel_pot_en;
    wire  instance_inj_ctrl_instance_registers_instance_error_handle_rst;
    wire [6-1:0] instance_inj_ctrl_instance_registers_instance_error_handle_v_fbk_f;
    wire  instance_inj_ctrl_instance_registers_instance_error_handle_wr_en;
    wire  instance_inj_ctrl_instance_registers_instance_error_handle_relpot;
    wire [11-1:0] instance_inj_ctrl_instance_registers_instance_error_handle_status_reg_034;
    wire [11-1:0] instance_inj_ctrl_instance_registers_instance_error_handle_status_reg_125;
    wire [16-1:0] instance_inj_ctrl_instance_registers_instance_error_handle_d_bus;

    reg[10:0]  instance_inj_ctrl_instance_registers_instance_error_handle_sr_034  ;
    reg[10:0]  instance_inj_ctrl_instance_registers_instance_error_handle_sr_125  ;
    assign   instance_inj_ctrl_instance_registers_instance_error_handle_status_reg_034  =  instance_inj_ctrl_instance_registers_instance_error_handle_sr_034  [10:0];
    assign   instance_inj_ctrl_instance_registers_instance_error_handle_status_reg_125  =  instance_inj_ctrl_instance_registers_instance_error_handle_sr_125  [10:0];
    assign   instance_inj_ctrl_instance_registers_instance_error_handle_relpot  =  instance_inj_ctrl_instance_registers_instance_error_handle_rel_pot_en  ;
    always @(   posedge     instance_inj_ctrl_instance_registers_instance_error_handle_clock           or  negedge   instance_inj_ctrl_instance_registers_instance_error_handle_rst          or  posedge   instance_inj_ctrl_instance_registers_instance_error_handle_wr_en  )
    begin :  instance_inj_ctrl_instance_registers_instance_error_handle_vhdl_st_reg_wr_034
        if ((  instance_inj_ctrl_instance_registers_instance_error_handle_rst  ==1'b0)|(  instance_inj_ctrl_instance_registers_instance_error_handle_a_fault_dec  [0]==1'b1&  instance_inj_ctrl_instance_registers_instance_error_handle_wr_en  ==1'b1))
            instance_inj_ctrl_instance_registers_instance_error_handle_sr_034   <={11{1'b0}};
        else
        begin
            if (  instance_inj_ctrl_instance_registers_instance_error_handle_en_state_store_034  ==1'b1)
                instance_inj_ctrl_instance_registers_instance_error_handle_sr_034   [6:0]<=  instance_inj_ctrl_instance_registers_instance_error_handle_global_state_034  ;
            if (  instance_inj_ctrl_instance_registers_instance_error_handle_en_fbk_store_034  ==1'b1)
            begin
                instance_inj_ctrl_instance_registers_instance_error_handle_sr_034   [7]<=  instance_inj_ctrl_instance_registers_instance_error_handle_i_fbk_f  [0];
                instance_inj_ctrl_instance_registers_instance_error_handle_sr_034   [8]<=  instance_inj_ctrl_instance_registers_instance_error_handle_v_fbk_f  [0];
                instance_inj_ctrl_instance_registers_instance_error_handle_sr_034   [9]<=  instance_inj_ctrl_instance_registers_instance_error_handle_v_fbk_f  [3];
                instance_inj_ctrl_instance_registers_instance_error_handle_sr_034   [10]<=  instance_inj_ctrl_instance_registers_instance_error_handle_v_fbk_f  [4];
            end
        end
    end

    always @(   posedge     instance_inj_ctrl_instance_registers_instance_error_handle_clock           or  negedge   instance_inj_ctrl_instance_registers_instance_error_handle_rst          or  posedge   instance_inj_ctrl_instance_registers_instance_error_handle_wr_en  )
    begin :  instance_inj_ctrl_instance_registers_instance_error_handle_vhdl_st_reg_wr_125
        if ((  instance_inj_ctrl_instance_registers_instance_error_handle_rst  ==1'b0)|(  instance_inj_ctrl_instance_registers_instance_error_handle_a_fault_dec  [1]==1'b1&  instance_inj_ctrl_instance_registers_instance_error_handle_wr_en  ==1'b1))
            instance_inj_ctrl_instance_registers_instance_error_handle_sr_125   <={11{1'b0}};
        else
        begin
            if (  instance_inj_ctrl_instance_registers_instance_error_handle_en_state_store_125  ==1'b1)
                instance_inj_ctrl_instance_registers_instance_error_handle_sr_125   [6:0]<=  instance_inj_ctrl_instance_registers_instance_error_handle_global_state_125  ;
            if (  instance_inj_ctrl_instance_registers_instance_error_handle_en_fbk_store_125  ==1'b1)
            begin
                instance_inj_ctrl_instance_registers_instance_error_handle_sr_125   [7]<=  instance_inj_ctrl_instance_registers_instance_error_handle_i_fbk_f  [1];
                instance_inj_ctrl_instance_registers_instance_error_handle_sr_125   [8]<=  instance_inj_ctrl_instance_registers_instance_error_handle_v_fbk_f  [1];
                instance_inj_ctrl_instance_registers_instance_error_handle_sr_125   [9]<=  instance_inj_ctrl_instance_registers_instance_error_handle_v_fbk_f  [2];
                instance_inj_ctrl_instance_registers_instance_error_handle_sr_125   [10]<=  instance_inj_ctrl_instance_registers_instance_error_handle_v_fbk_f  [5];
            end
        end
    end

    assign   instance_inj_ctrl_instance_registers_instance_error_handle_d_bus  =((  instance_inj_ctrl_instance_registers_instance_error_handle_a_fault_dec_r  [0]==1'b1&  instance_inj_ctrl_instance_registers_instance_error_handle_rd_en  ==1'b1))?{5'b00000,  instance_inj_ctrl_instance_registers_instance_error_handle_sr_034  }:16'bZZZZZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_registers_instance_error_handle_d_bus  =((  instance_inj_ctrl_instance_registers_instance_error_handle_a_fault_dec_r  [1]==1'b1&  instance_inj_ctrl_instance_registers_instance_error_handle_rd_en  ==1'b1))?{5'b00000,  instance_inj_ctrl_instance_registers_instance_error_handle_sr_125  }:16'bZZZZZZZZZZZZZZZZ;
    assign instance_inj_ctrl_instance_registers_instance_error_handle_a_fault_dec = instance_inj_ctrl_instance_registers_a_fault_dec;
    assign instance_inj_ctrl_instance_registers_instance_error_handle_a_fault_dec_r = instance_inj_ctrl_instance_registers_a_fault_dec_r;
    assign instance_inj_ctrl_instance_registers_instance_error_handle_clock = instance_inj_ctrl_instance_registers_clock;
    assign instance_inj_ctrl_instance_registers_instance_error_handle_en_fbk_store_034 = instance_inj_ctrl_instance_registers_en_fbk_store_034;
    assign instance_inj_ctrl_instance_registers_instance_error_handle_en_fbk_store_125 = instance_inj_ctrl_instance_registers_en_fbk_store_125;
    assign instance_inj_ctrl_instance_registers_instance_error_handle_en_state_store_034 = instance_inj_ctrl_instance_registers_en_state_store_034;
    assign instance_inj_ctrl_instance_registers_instance_error_handle_en_state_store_125 = instance_inj_ctrl_instance_registers_en_state_store_125;
    assign instance_inj_ctrl_instance_registers_instance_error_handle_global_state_034 = instance_inj_ctrl_instance_registers_global_state_034;
    assign instance_inj_ctrl_instance_registers_instance_error_handle_global_state_125 = instance_inj_ctrl_instance_registers_global_state_125;
    assign instance_inj_ctrl_instance_registers_instance_error_handle_i_fbk_f = instance_inj_ctrl_instance_registers_i_fbk_f;
    assign instance_inj_ctrl_instance_registers_instance_error_handle_rd_en = instance_inj_ctrl_instance_registers_rd_en;
    assign instance_inj_ctrl_instance_registers_instance_error_handle_rel_pot_en = instance_inj_ctrl_instance_registers_rel_pot_en;
    assign instance_inj_ctrl_instance_registers_instance_error_handle_rst = instance_inj_ctrl_instance_registers_rst;
    assign instance_inj_ctrl_instance_registers_instance_error_handle_v_fbk_f = instance_inj_ctrl_instance_registers_v_fbk_f;
    assign instance_inj_ctrl_instance_registers_instance_error_handle_wr_en = instance_inj_ctrl_instance_registers_wr_en;
    assign instance_inj_ctrl_instance_registers_relpot = instance_inj_ctrl_instance_registers_instance_error_handle_relpot;
    assign instance_inj_ctrl_instance_registers_status_reg_034 = instance_inj_ctrl_instance_registers_instance_error_handle_status_reg_034;
    assign instance_inj_ctrl_instance_registers_status_reg_125 = instance_inj_ctrl_instance_registers_instance_error_handle_status_reg_125;
    assign instance_inj_ctrl_instance_registers_d_bus = instance_inj_ctrl_instance_registers_instance_error_handle_d_bus;


    wire [13-1:0] instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded;
    wire [13-1:0] instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded_r;
    wire  instance_inj_ctrl_instance_registers_instance_in_reg_clock;
    wire  instance_inj_ctrl_instance_registers_instance_in_reg_rd_en;
    wire  instance_inj_ctrl_instance_registers_instance_in_reg_rst;
    wire  instance_inj_ctrl_instance_registers_instance_in_reg_wr_en;
    wire [8-1:0] instance_inj_ctrl_instance_registers_instance_in_reg_r_t1;
    wire [7-1:0] instance_inj_ctrl_instance_registers_instance_in_reg_r_t2;
    wire [8-1:0] instance_inj_ctrl_instance_registers_instance_in_reg_r_t3_034;
    wire [8-1:0] instance_inj_ctrl_instance_registers_instance_in_reg_r_t3_125;
    wire [7-1:0] instance_inj_ctrl_instance_registers_instance_in_reg_r_t4_034;
    wire [7-1:0] instance_inj_ctrl_instance_registers_instance_in_reg_r_t4_125;
    wire [10-1:0] instance_inj_ctrl_instance_registers_instance_in_reg_r_tb_034;
    wire [10-1:0] instance_inj_ctrl_instance_registers_instance_in_reg_r_tb_125;
    wire [12-1:0] instance_inj_ctrl_instance_registers_instance_in_reg_r_th_034;
    wire [12-1:0] instance_inj_ctrl_instance_registers_instance_in_reg_r_th_125;
    wire [7-1:0] instance_inj_ctrl_instance_registers_instance_in_reg_r_tonh;
    wire [7-1:0] instance_inj_ctrl_instance_registers_instance_in_reg_r_tonl;
    wire [7-1:0] instance_inj_ctrl_instance_registers_instance_in_reg_r_tp;
    wire [16-1:0] instance_inj_ctrl_instance_registers_instance_in_reg_d_bus;

    reg[12-1:0]  instance_inj_ctrl_instance_registers_instance_in_reg_th_034  ;
    reg[12-1:0]  instance_inj_ctrl_instance_registers_instance_in_reg_th_125  ;
    reg[7-1:0]  instance_inj_ctrl_instance_registers_instance_in_reg_t2  ;
    reg[7-1:0]  instance_inj_ctrl_instance_registers_instance_in_reg_tp  ;
    reg[7-1:0]  instance_inj_ctrl_instance_registers_instance_in_reg_t4_034  ;
    reg[7-1:0]  instance_inj_ctrl_instance_registers_instance_in_reg_t4_125  ;
    reg[7-1:0]  instance_inj_ctrl_instance_registers_instance_in_reg_tonh  ;
    reg[7-1:0]  instance_inj_ctrl_instance_registers_instance_in_reg_tonl  ;
    reg[8-1:0]  instance_inj_ctrl_instance_registers_instance_in_reg_t1  ;
    reg[8-1:0]  instance_inj_ctrl_instance_registers_instance_in_reg_t3_034  ;
    reg[8-1:0]  instance_inj_ctrl_instance_registers_instance_in_reg_t3_125  ;
    reg[10-1:0]  instance_inj_ctrl_instance_registers_instance_in_reg_tb_034  ;
    reg[10-1:0]  instance_inj_ctrl_instance_registers_instance_in_reg_tb_125  ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_r_t1  =  instance_inj_ctrl_instance_registers_instance_in_reg_t1  ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_r_t2  =  instance_inj_ctrl_instance_registers_instance_in_reg_t2  ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_r_tb_034  =  instance_inj_ctrl_instance_registers_instance_in_reg_tb_034  ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_r_th_034  =  instance_inj_ctrl_instance_registers_instance_in_reg_th_034  ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_r_tb_125  =  instance_inj_ctrl_instance_registers_instance_in_reg_tb_125  ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_r_th_125  =  instance_inj_ctrl_instance_registers_instance_in_reg_th_125  ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_r_tonh  =  instance_inj_ctrl_instance_registers_instance_in_reg_tonh  ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_r_tonl  =  instance_inj_ctrl_instance_registers_instance_in_reg_tonl  ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_r_tp  =  instance_inj_ctrl_instance_registers_instance_in_reg_tp  ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_r_t3_034  =  instance_inj_ctrl_instance_registers_instance_in_reg_t3_034  ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_r_t3_125  =  instance_inj_ctrl_instance_registers_instance_in_reg_t3_125  ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_r_t4_034  =  instance_inj_ctrl_instance_registers_instance_in_reg_t4_034  ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_r_t4_125  =  instance_inj_ctrl_instance_registers_instance_in_reg_t4_125  ;
    always @(  posedge    instance_inj_ctrl_instance_registers_instance_in_reg_clock          or  negedge   instance_inj_ctrl_instance_registers_instance_in_reg_rst  )
    begin :  instance_inj_ctrl_instance_registers_instance_in_reg_vhdl_in_reg
        if (  instance_inj_ctrl_instance_registers_instance_in_reg_rst  ==1'b0)
        begin
            instance_inj_ctrl_instance_registers_instance_in_reg_t1   <={8{1'b0}};
            instance_inj_ctrl_instance_registers_instance_in_reg_t2   <={7{1'b0}};
            instance_inj_ctrl_instance_registers_instance_in_reg_tb_034   <={10{1'b0}};
            instance_inj_ctrl_instance_registers_instance_in_reg_th_034   <={12{1'b0}};
            instance_inj_ctrl_instance_registers_instance_in_reg_tb_125   <={10{1'b0}};
            instance_inj_ctrl_instance_registers_instance_in_reg_th_125   <={12{1'b0}};
            instance_inj_ctrl_instance_registers_instance_in_reg_tonh   <={7{1'b0}};
            instance_inj_ctrl_instance_registers_instance_in_reg_tonl   <={7{1'b0}};
            instance_inj_ctrl_instance_registers_instance_in_reg_tp   <={7{1'b0}};
            instance_inj_ctrl_instance_registers_instance_in_reg_t3_034   <={8{1'b0}};
            instance_inj_ctrl_instance_registers_instance_in_reg_t3_125   <={8{1'b0}};
            instance_inj_ctrl_instance_registers_instance_in_reg_t4_034   <={7{1'b0}};
            instance_inj_ctrl_instance_registers_instance_in_reg_t4_125   <={7{1'b0}};
        end
        else
        begin
            if (  instance_inj_ctrl_instance_registers_instance_in_reg_wr_en  ==1'b1)
            begin
                if (  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded  [0]==1'b1)
                    instance_inj_ctrl_instance_registers_instance_in_reg_t1   <=  instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  [7:0];
                if (  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded  [1]==1'b1)
                    instance_inj_ctrl_instance_registers_instance_in_reg_t2   <=  instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  [6:0];
                if (  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded  [2]==1'b1)
                    instance_inj_ctrl_instance_registers_instance_in_reg_tb_034   <=  instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  [9:0];
                if (  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded  [3]==1'b1)
                    instance_inj_ctrl_instance_registers_instance_in_reg_th_034   <=  instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  [11:0];
                if (  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded  [4]==1'b1)
                    instance_inj_ctrl_instance_registers_instance_in_reg_tb_125   <=  instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  [9:0];
                if (  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded  [5]==1'b1)
                    instance_inj_ctrl_instance_registers_instance_in_reg_th_125   <=  instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  [11:0];
                if (  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded  [6]==1'b1)
                    instance_inj_ctrl_instance_registers_instance_in_reg_tonh   <=  instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  [6:0];
                if (  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded  [7]==1'b1)
                    instance_inj_ctrl_instance_registers_instance_in_reg_tonl   <=  instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  [6:0];
                if (  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded  [8]==1'b1)
                    instance_inj_ctrl_instance_registers_instance_in_reg_tp   <=  instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  [6:0];
                if (  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded  [9]==1'b1)
                    instance_inj_ctrl_instance_registers_instance_in_reg_t3_034   <=  instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  [7:0];
                if (  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded  [10]==1'b1)
                    instance_inj_ctrl_instance_registers_instance_in_reg_t3_125   <=  instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  [7:0];
                if (  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded  [11]==1'b1)
                    instance_inj_ctrl_instance_registers_instance_in_reg_t4_034   <=  instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  [6:0];
                if (  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded  [12]==1'b1)
                    instance_inj_ctrl_instance_registers_instance_in_reg_t4_125   <=  instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  [6:0];
            end
        end
    end

    assign   instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  =((  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded_r  [0]==1'b1&  instance_inj_ctrl_instance_registers_instance_in_reg_rd_en  ==1'b1))?{8'b00000000,  instance_inj_ctrl_instance_registers_instance_in_reg_t1  }:16'bZZZZZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  =((  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded_r  [1]==1'b1&  instance_inj_ctrl_instance_registers_instance_in_reg_rd_en  ==1'b1))?{9'b000000000,  instance_inj_ctrl_instance_registers_instance_in_reg_t2  }:16'bZZZZZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  =((  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded_r  [2]==1'b1&  instance_inj_ctrl_instance_registers_instance_in_reg_rd_en  ==1'b1))?{6'b000000,  instance_inj_ctrl_instance_registers_instance_in_reg_tb_034  }:16'bZZZZZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  =((  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded_r  [3]==1'b1&  instance_inj_ctrl_instance_registers_instance_in_reg_rd_en  ==1'b1))?{4'b0000,  instance_inj_ctrl_instance_registers_instance_in_reg_th_034  }:16'bZZZZZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  =((  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded_r  [4]==1'b1&  instance_inj_ctrl_instance_registers_instance_in_reg_rd_en  ==1'b1))?{6'b000000,  instance_inj_ctrl_instance_registers_instance_in_reg_tb_125  }:16'bZZZZZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  =((  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded_r  [5]==1'b1&  instance_inj_ctrl_instance_registers_instance_in_reg_rd_en  ==1'b1))?{4'b0000,  instance_inj_ctrl_instance_registers_instance_in_reg_th_125  }:16'bZZZZZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  =((  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded_r  [6]==1'b1&  instance_inj_ctrl_instance_registers_instance_in_reg_rd_en  ==1'b1))?{9'b000000000,  instance_inj_ctrl_instance_registers_instance_in_reg_tonh  }:16'bZZZZZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  =((  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded_r  [7]==1'b1&  instance_inj_ctrl_instance_registers_instance_in_reg_rd_en  ==1'b1))?{9'b000000000,  instance_inj_ctrl_instance_registers_instance_in_reg_tonl  }:16'bZZZZZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  =((  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded_r  [8]==1'b1&  instance_inj_ctrl_instance_registers_instance_in_reg_rd_en  ==1'b1))?{9'b000000000,  instance_inj_ctrl_instance_registers_instance_in_reg_tp  }:16'bZZZZZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  =((  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded_r  [9]==1'b1&  instance_inj_ctrl_instance_registers_instance_in_reg_rd_en  ==1'b1))?{8'b00000000,  instance_inj_ctrl_instance_registers_instance_in_reg_t3_034  }:16'bZZZZZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  =((  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded_r  [10]==1'b1&  instance_inj_ctrl_instance_registers_instance_in_reg_rd_en  ==1'b1))?{8'b00000000,  instance_inj_ctrl_instance_registers_instance_in_reg_t3_125  }:16'bZZZZZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  =((  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded_r  [11]==1'b1&  instance_inj_ctrl_instance_registers_instance_in_reg_rd_en  ==1'b1))?{9'b000000000,  instance_inj_ctrl_instance_registers_instance_in_reg_t4_034  }:16'bZZZZZZZZZZZZZZZZ;
    assign   instance_inj_ctrl_instance_registers_instance_in_reg_d_bus  =((  instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded_r  [12]==1'b1&  instance_inj_ctrl_instance_registers_instance_in_reg_rd_en  ==1'b1))?{9'b000000000,  instance_inj_ctrl_instance_registers_instance_in_reg_t4_125  }:16'bZZZZZZZZZZZZZZZZ;
    assign instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded = instance_inj_ctrl_instance_registers_add_decoded;
    assign instance_inj_ctrl_instance_registers_instance_in_reg_add_decoded_r = instance_inj_ctrl_instance_registers_add_decoded_r;
    assign instance_inj_ctrl_instance_registers_instance_in_reg_clock = instance_inj_ctrl_instance_registers_clock;
    assign instance_inj_ctrl_instance_registers_instance_in_reg_rd_en = instance_inj_ctrl_instance_registers_rd_en;
    assign instance_inj_ctrl_instance_registers_instance_in_reg_rst = instance_inj_ctrl_instance_registers_rst;
    assign instance_inj_ctrl_instance_registers_instance_in_reg_wr_en = instance_inj_ctrl_instance_registers_wr_en;
    assign instance_inj_ctrl_instance_registers_r_t1 = instance_inj_ctrl_instance_registers_instance_in_reg_r_t1;
    assign instance_inj_ctrl_instance_registers_r_t2 = instance_inj_ctrl_instance_registers_instance_in_reg_r_t2;
    assign instance_inj_ctrl_instance_registers_r_t3_034 = instance_inj_ctrl_instance_registers_instance_in_reg_r_t3_034;
    assign instance_inj_ctrl_instance_registers_r_t3_125 = instance_inj_ctrl_instance_registers_instance_in_reg_r_t3_125;
    assign instance_inj_ctrl_instance_registers_r_t4_034 = instance_inj_ctrl_instance_registers_instance_in_reg_r_t4_034;
    assign instance_inj_ctrl_instance_registers_r_t4_125 = instance_inj_ctrl_instance_registers_instance_in_reg_r_t4_125;
    assign instance_inj_ctrl_instance_registers_r_tb_034 = instance_inj_ctrl_instance_registers_instance_in_reg_r_tb_034;
    assign instance_inj_ctrl_instance_registers_r_tb_125 = instance_inj_ctrl_instance_registers_instance_in_reg_r_tb_125;
    assign instance_inj_ctrl_instance_registers_r_th_034 = instance_inj_ctrl_instance_registers_instance_in_reg_r_th_034;
    assign instance_inj_ctrl_instance_registers_r_th_125 = instance_inj_ctrl_instance_registers_instance_in_reg_r_th_125;
    assign instance_inj_ctrl_instance_registers_r_tonh = instance_inj_ctrl_instance_registers_instance_in_reg_r_tonh;
    assign instance_inj_ctrl_instance_registers_r_tonl = instance_inj_ctrl_instance_registers_instance_in_reg_r_tonl;
    assign instance_inj_ctrl_instance_registers_r_tp = instance_inj_ctrl_instance_registers_instance_in_reg_r_tp;
    assign instance_inj_ctrl_instance_registers_d_bus = instance_inj_ctrl_instance_registers_instance_in_reg_d_bus;


    wire  instance_inj_ctrl_instance_registers_instance_test_en_add_test_en;
    wire  instance_inj_ctrl_instance_registers_instance_test_en_clock;
    wire [16-1:0] instance_inj_ctrl_instance_registers_instance_test_en_d_bus;
    wire  instance_inj_ctrl_instance_registers_instance_test_en_rd_en;
    wire  instance_inj_ctrl_instance_registers_instance_test_en_rst;
    wire  instance_inj_ctrl_instance_registers_instance_test_en_wr_en;
    reg [3-1:0] instance_inj_ctrl_instance_registers_instance_test_en_test_en_034;
    reg [3-1:0] instance_inj_ctrl_instance_registers_instance_test_en_test_en_125;

    always @(  posedge    instance_inj_ctrl_instance_registers_instance_test_en_clock          or  negedge   instance_inj_ctrl_instance_registers_instance_test_en_rst  )
    begin :  instance_inj_ctrl_instance_registers_instance_test_en_vhdl_test_en
        if (  instance_inj_ctrl_instance_registers_instance_test_en_rst  ==1'b0)
        begin
            instance_inj_ctrl_instance_registers_instance_test_en_test_en_034   <={3{1'b0}};
            instance_inj_ctrl_instance_registers_instance_test_en_test_en_125   <={3{1'b0}};
        end
        else
        begin
            if (  instance_inj_ctrl_instance_registers_instance_test_en_add_test_en  ==1'b1&  instance_inj_ctrl_instance_registers_instance_test_en_wr_en  ==1'b1)
            begin
                instance_inj_ctrl_instance_registers_instance_test_en_test_en_034   [0]<=  instance_inj_ctrl_instance_registers_instance_test_en_d_bus  [0];
                instance_inj_ctrl_instance_registers_instance_test_en_test_en_034   [1]<=  instance_inj_ctrl_instance_registers_instance_test_en_d_bus  [3];
                instance_inj_ctrl_instance_registers_instance_test_en_test_en_034   [2]<=  instance_inj_ctrl_instance_registers_instance_test_en_d_bus  [4];
                instance_inj_ctrl_instance_registers_instance_test_en_test_en_125   [0]<=  instance_inj_ctrl_instance_registers_instance_test_en_d_bus  [1];
                instance_inj_ctrl_instance_registers_instance_test_en_test_en_125   [1]<=  instance_inj_ctrl_instance_registers_instance_test_en_d_bus  [2];
                instance_inj_ctrl_instance_registers_instance_test_en_test_en_125   [2]<=  instance_inj_ctrl_instance_registers_instance_test_en_d_bus  [5];
            end
        end
    end

    assign instance_inj_ctrl_instance_registers_instance_test_en_add_test_en = instance_inj_ctrl_instance_registers_add_test_en;
    assign instance_inj_ctrl_instance_registers_instance_test_en_clock = instance_inj_ctrl_instance_registers_clock;
    assign instance_inj_ctrl_instance_registers_instance_test_en_d_bus = instance_inj_ctrl_instance_registers_d_bus;
    assign instance_inj_ctrl_instance_registers_instance_test_en_rd_en = instance_inj_ctrl_instance_registers_rd_en;
    assign instance_inj_ctrl_instance_registers_instance_test_en_rst = instance_inj_ctrl_instance_registers_rst;
    assign instance_inj_ctrl_instance_registers_instance_test_en_wr_en = instance_inj_ctrl_instance_registers_wr_en;
    assign instance_inj_ctrl_instance_registers_test_en_034 = instance_inj_ctrl_instance_registers_instance_test_en_test_en_034;
    assign instance_inj_ctrl_instance_registers_test_en_125 = instance_inj_ctrl_instance_registers_instance_test_en_test_en_125;

    assign instance_inj_ctrl_instance_registers_a_bus = instance_inj_ctrl_a_bus;
    assign instance_inj_ctrl_instance_registers_clock = instance_inj_ctrl_clock;
    assign instance_inj_ctrl_instance_registers_digital_input = instance_inj_ctrl_digital_input;
    assign instance_inj_ctrl_instance_registers_en_fbk_store_034 = instance_inj_ctrl_en_fbk_store_034;
    assign instance_inj_ctrl_instance_registers_en_fbk_store_125 = instance_inj_ctrl_en_fbk_store_125;
    assign instance_inj_ctrl_instance_registers_en_state_store_034 = instance_inj_ctrl_en_state_store_034;
    assign instance_inj_ctrl_instance_registers_en_state_store_125 = instance_inj_ctrl_en_state_store_125;
    assign instance_inj_ctrl_instance_registers_fbk_pwm = instance_inj_ctrl_fbk_pwm;
    assign instance_inj_ctrl_instance_registers_global_state_034 = instance_inj_ctrl_global_state_034;
    assign instance_inj_ctrl_instance_registers_global_state_125 = instance_inj_ctrl_global_state_125;
    assign instance_inj_ctrl_instance_registers_i_fbk_f = instance_inj_ctrl_i_fbk_f;
    assign instance_inj_ctrl_instance_registers_nssm_in = instance_inj_ctrl_nssm_in;
    assign instance_inj_ctrl_instance_registers_rd_en = instance_inj_ctrl_rd_en;
    assign instance_inj_ctrl_instance_registers_rel_pot_en = instance_inj_ctrl_rel_pot_en;
    assign instance_inj_ctrl_instance_registers_rst = instance_inj_ctrl_rst;
    assign instance_inj_ctrl_instance_registers_v_fbk_f = instance_inj_ctrl_v_fbk_f;
    assign instance_inj_ctrl_instance_registers_wr_en = instance_inj_ctrl_wr_en;
    assign instance_inj_ctrl_digital_output = instance_inj_ctrl_instance_registers_digital_output;
    assign instance_inj_ctrl_in_speed_lev = instance_inj_ctrl_instance_registers_in_speed_lev;
    assign instance_inj_ctrl_knock1u = instance_inj_ctrl_instance_registers_knock1u;
    assign instance_inj_ctrl_knock2u = instance_inj_ctrl_instance_registers_knock2u;
    assign instance_inj_ctrl_pickup_hall = instance_inj_ctrl_instance_registers_pickup_hall;
    assign instance_inj_ctrl_relpot = instance_inj_ctrl_instance_registers_relpot;
    assign instance_inj_ctrl_r_t1 = instance_inj_ctrl_instance_registers_r_t1;
    assign instance_inj_ctrl_r_t2 = instance_inj_ctrl_instance_registers_r_t2;
    assign instance_inj_ctrl_r_t3_034 = instance_inj_ctrl_instance_registers_r_t3_034;
    assign instance_inj_ctrl_r_t3_125 = instance_inj_ctrl_instance_registers_r_t3_125;
    assign instance_inj_ctrl_r_t4_034 = instance_inj_ctrl_instance_registers_r_t4_034;
    assign instance_inj_ctrl_r_t4_125 = instance_inj_ctrl_instance_registers_r_t4_125;
    assign instance_inj_ctrl_r_tb_034 = instance_inj_ctrl_instance_registers_r_tb_034;
    assign instance_inj_ctrl_r_tb_125 = instance_inj_ctrl_instance_registers_r_tb_125;
    assign instance_inj_ctrl_r_th_034 = instance_inj_ctrl_instance_registers_r_th_034;
    assign instance_inj_ctrl_r_th_125 = instance_inj_ctrl_instance_registers_r_th_125;
    assign instance_inj_ctrl_r_tonh = instance_inj_ctrl_instance_registers_r_tonh;
    assign instance_inj_ctrl_r_tonl = instance_inj_ctrl_instance_registers_r_tonl;
    assign instance_inj_ctrl_r_tp = instance_inj_ctrl_instance_registers_r_tp;
    assign instance_inj_ctrl_seg_speed_lev = instance_inj_ctrl_instance_registers_seg_speed_lev;
    assign instance_inj_ctrl_smot_camme_en = instance_inj_ctrl_instance_registers_smot_camme_en;
    assign instance_inj_ctrl_status_reg_034 = instance_inj_ctrl_instance_registers_status_reg_034;
    assign instance_inj_ctrl_status_reg_125 = instance_inj_ctrl_instance_registers_status_reg_125;
    assign instance_inj_ctrl_test_en_034 = instance_inj_ctrl_instance_registers_test_en_034;
    assign instance_inj_ctrl_test_en_125 = instance_inj_ctrl_instance_registers_test_en_125;
    assign instance_inj_ctrl_trg_knock_en = instance_inj_ctrl_instance_registers_trg_knock_en;
    assign instance_inj_ctrl_turbo_speed_lev = instance_inj_ctrl_instance_registers_turbo_speed_lev;
    assign instance_inj_ctrl_d_bus = instance_inj_ctrl_instance_registers_d_bus;


    wire  instance_inj_ctrl_instance_smot_knock_handle_clock;
    wire  instance_inj_ctrl_instance_smot_knock_handle_in_speed;
    wire  instance_inj_ctrl_instance_smot_knock_handle_pickup_hall;
    wire  instance_inj_ctrl_instance_smot_knock_handle_rst;
    wire  instance_inj_ctrl_instance_smot_knock_handle_seg_speed_hall;
    wire  instance_inj_ctrl_instance_smot_knock_handle_seg_speed_pickup;
    wire  instance_inj_ctrl_instance_smot_knock_handle_smot_camme_en;
    wire  instance_inj_ctrl_instance_smot_knock_handle_trg_knock1;
    wire  instance_inj_ctrl_instance_smot_knock_handle_trg_knock2;
    wire  instance_inj_ctrl_instance_smot_knock_handle_trg_knock_en;
    wire  instance_inj_ctrl_instance_smot_knock_handle_cam_smot;
    wire [2-1:0] instance_inj_ctrl_instance_smot_knock_handle_knock1;
    wire [2-1:0] instance_inj_ctrl_instance_smot_knock_handle_knock2;
    wire  instance_inj_ctrl_instance_smot_knock_handle_smot60;

    wire  instance_inj_ctrl_instance_smot_knock_handle_internal_trg_knock1  ;

    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_clock;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_internal_trg_knock1;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_rst;
    wire [2-1:0] instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_knock1;

    wire[6-1:0]  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_count1  ;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_en_comp1  ;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_impulse  ;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_long  ;

    wire [6-1:0] instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_comp1_count1;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_comp1_en_comp1;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_comp1_impulse;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_comp1_long;

    assign   instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_comp1_impulse  =(  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_comp1_count1  [5]|  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_comp1_count1  [4]|  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_comp1_count1  [3])&(~(  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_comp1_en_comp1  ));
    assign   instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_comp1_long  =  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_comp1_count1  [0]&  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_comp1_count1  [1]&  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_comp1_count1  [2]&  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_comp1_count1  [3]&  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_comp1_count1  [4]&  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_comp1_count1  [5];
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_comp1_count1 = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_count1;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_comp1_en_comp1 = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_en_comp1;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_impulse = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_comp1_impulse;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_long = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_comp1_long;


    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_clock;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_internal_trg_knock1;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_rst;
    wire [6-1:0] instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_count1;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_en_comp1;

    reg  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_store_trg_knock1  ;
    reg  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_store_reset_trg  ;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_rst_int  ;
    reg[6-1:0]  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_int_counter1  ;
    always @(  posedge    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_clock          or  negedge   instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_rst  )
    begin :  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_vhdl_knock_store
        if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_rst  ==1'b0)
        begin
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_store_trg_knock1   <=1'b0;
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_store_reset_trg   <=1'b0;
        end
        else
        begin
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_store_trg_knock1   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_internal_trg_knock1  ;
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_store_reset_trg   <=(~(  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_store_trg_knock1  ));
        end
    end

    assign   instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_rst_int  =  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_rst  &(~(  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_store_reset_trg  ));
    assign   instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_en_comp1  =  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_store_trg_knock1  ;
    always @(  posedge    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_clock          or  negedge   instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_rst_int  )
        if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_rst_int  ==1'b0)
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_int_counter1   <={6{1'b0}};
        else
        begin
            if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_store_trg_knock1  ==1'b1)
                instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_int_counter1   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_int_counter1  +6'b000001;
        end

    assign   instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_count1  =  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_int_counter1  ;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_clock = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_clock;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_internal_trg_knock1 = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_internal_trg_knock1;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_rst = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_rst;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_count1 = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_count1;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_en_comp1 = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_count1_en_comp1;


    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_clock;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_impulse;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_long;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_rst;
    reg [2-1:0] instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock1;

    reg[1:0]  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_current_state  ;
    reg[1:0]  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_next_state  ;
    always @(  posedge    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_clock          or  negedge   instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_rst  )
    begin :  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_clocked
        if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_rst  ==1'b0)
        begin
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_current_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock_fsm1_state_type_start_state  ;
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock1   <=2'b01;
        end
        else
        begin
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_current_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_next_state  ;
            case (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_next_state  )
                instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock_fsm1_state_type_start_state   :
                    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock1   <=2'b01;
                instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock_fsm1_state_type_off1_state   :
                    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock1   <=2'b00;
                instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock_fsm1_state_type_sample_state   :
                    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock1   <=2'b10;
                instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock_fsm1_state_type_off2_state   :
                    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock1   <=2'b00;
                default :
                    ;
            endcase
        end
    end

    always @(       instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_current_state                  or    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_clock             or    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_impulse            or    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_long           or    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_rst   )
    begin :  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_set_next_state
        instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_next_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_current_state  ;
        case (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_current_state  )
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock_fsm1_state_type_start_state   :
                if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_long  ==1'b1)
                    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_next_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock_fsm1_state_type_start_state  ;
                else
                    if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_impulse  ==1'b1)
                        instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_next_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock_fsm1_state_type_off1_state  ;
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock_fsm1_state_type_off1_state   :
                if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_impulse  ==1'b1)
                    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_next_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock_fsm1_state_type_sample_state  ;
                else
                    if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_long  ==1'b1)
                        instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_next_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock_fsm1_state_type_start_state  ;
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock_fsm1_state_type_sample_state   :
                if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_impulse  ==1'b1)
                    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_next_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock_fsm1_state_type_off2_state  ;
                else
                    if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_long  ==1'b1)
                        instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_next_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock_fsm1_state_type_start_state  ;
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock_fsm1_state_type_off2_state   :
                if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_long  ==1'b1)
                    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_next_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock_fsm1_state_type_start_state  ;
                else
                    if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_impulse  ==1'b1)
                        instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_next_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock_fsm1_state_type_start_state  ;
            default :
                ;
        endcase
    end

    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_clock = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_clock;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_impulse = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_impulse;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_long = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_long;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_rst = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_rst;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_knock1 = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_instance_knock_fsm1_knock1;

    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_clock = instance_inj_ctrl_instance_smot_knock_handle_clock;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_internal_trg_knock1 = instance_inj_ctrl_instance_smot_knock_handle_internal_trg_knock1;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_rst = instance_inj_ctrl_instance_smot_knock_handle_rst;
    assign instance_inj_ctrl_instance_smot_knock_handle_knock1 = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm1_knock1;


    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_clock;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_rst;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_trg_knock2;
    wire [2-1:0] instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_knock2;

    wire[6-1:0]  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_count2  ;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_en_comp2  ;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_impulse  ;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_long  ;

    wire [6-1:0] instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_comp2_count2;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_comp2_en_comp2;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_comp2_impulse;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_comp2_long;

    assign   instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_comp2_impulse  =(  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_comp2_count2  [5]|  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_comp2_count2  [4]|  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_comp2_count2  [3])&(~(  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_comp2_en_comp2  ));
    assign   instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_comp2_long  =  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_comp2_count2  [0]&  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_comp2_count2  [1]&  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_comp2_count2  [2]&  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_comp2_count2  [3]&  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_comp2_count2  [4]&  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_comp2_count2  [5];
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_comp2_count2 = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_count2;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_comp2_en_comp2 = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_en_comp2;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_impulse = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_comp2_impulse;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_long = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_comp2_long;


    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_clock;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_rst;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_trg_knock2;
    wire [6-1:0] instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_count2;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_en_comp2;

    reg  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_store_trg_knock2  ;
    reg  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_store_reset_trg  ;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_rst_int  ;
    reg[6-1:0]  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_int_counter2  ;
    always @(  posedge    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_clock          or  negedge   instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_rst  )
    begin :  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_vhdl_knock_store
        if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_rst  ==1'b0)
        begin
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_store_trg_knock2   <=1'b0;
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_store_reset_trg   <=1'b0;
        end
        else
        begin
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_store_trg_knock2   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_trg_knock2  ;
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_store_reset_trg   <=(~(  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_store_trg_knock2  ));
        end
    end

    assign   instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_rst_int  =  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_rst  &(~(  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_store_reset_trg  ));
    assign   instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_en_comp2  =  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_store_trg_knock2  ;
    always @(  posedge    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_clock          or  negedge   instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_rst_int  )
        if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_rst_int  ==1'b0)
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_int_counter2   <={6{1'b0}};
        else
        begin
            if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_store_trg_knock2  ==1'b1)
                instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_int_counter2   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_int_counter2  +6'b000001;
        end

    assign   instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_count2  =  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_int_counter2  ;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_clock = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_clock;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_rst = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_rst;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_trg_knock2 = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_trg_knock2;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_count2 = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_count2;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_en_comp2 = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_count2_en_comp2;


    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_clock;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_impulse;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_long;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_rst;
    reg [2-1:0] instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock2;

    reg[1:0]  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_current_state  ;
    reg[1:0]  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_next_state  ;
    always @(  posedge    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_clock          or  negedge   instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_rst  )
    begin :  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_clocked
        if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_rst  ==1'b0)
        begin
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_current_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock_fsm2_state_type_start_state  ;
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock2   <=2'b01;
        end
        else
        begin
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_current_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_next_state  ;
            case (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_next_state  )
                instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock_fsm2_state_type_start_state   :
                    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock2   <=2'b01;
                instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock_fsm2_state_type_off1_state   :
                    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock2   <=2'b00;
                instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock_fsm2_state_type_sample_state   :
                    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock2   <=2'b10;
                instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock_fsm2_state_type_off2_state   :
                    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock2   <=2'b00;
                default :
                    ;
            endcase
        end
    end

    always @(       instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_current_state                  or    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_clock             or    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_impulse            or    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_long           or    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_rst   )
    begin :  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_set_next_state
        instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_next_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_current_state  ;
        case (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_current_state  )
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock_fsm2_state_type_start_state   :
                if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_long  ==1'b1)
                    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_next_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock_fsm2_state_type_start_state  ;
                else
                    if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_impulse  ==1'b1)
                        instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_next_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock_fsm2_state_type_off1_state  ;
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock_fsm2_state_type_off1_state   :
                if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_impulse  ==1'b1)
                    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_next_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock_fsm2_state_type_sample_state  ;
                else
                    if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_long  ==1'b1)
                        instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_next_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock_fsm2_state_type_start_state  ;
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock_fsm2_state_type_sample_state   :
                if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_impulse  ==1'b1)
                    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_next_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock_fsm2_state_type_off2_state  ;
                else
                    if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_long  ==1'b1)
                        instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_next_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock_fsm2_state_type_start_state  ;
            instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock_fsm2_state_type_off2_state   :
                if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_long  ==1'b1)
                    instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_next_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock_fsm2_state_type_start_state  ;
                else
                    if (  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_impulse  ==1'b1)
                        instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_next_state   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock_fsm2_state_type_start_state  ;
            default :
                ;
        endcase
    end

    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_clock = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_clock;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_impulse = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_impulse;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_long = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_long;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_rst = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_rst;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_knock2 = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_instance_knock_fsm2_knock2;

    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_clock = instance_inj_ctrl_instance_smot_knock_handle_clock;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_rst = instance_inj_ctrl_instance_smot_knock_handle_rst;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_trg_knock2 = instance_inj_ctrl_instance_smot_knock_handle_trg_knock2;
    assign instance_inj_ctrl_instance_smot_knock_handle_knock2 = instance_inj_ctrl_instance_smot_knock_handle_instance_knock_detection_fsm2_knock2;


    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_in_speed;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_pickup_hall;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_seg_speed_hall;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_seg_speed_pickup;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_smot_camme_en;
    reg  instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_cam_smot;

    always @(       instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_seg_speed_pickup                  or    instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_seg_speed_hall             or    instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_pickup_hall            or    instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_in_speed           or    instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_smot_camme_en   )
    begin :  instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_vhdl_smot_camme_mux
        if (  instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_smot_camme_en  ==1'b0)
            instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_cam_smot   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_in_speed  ;
        else
            if (  instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_pickup_hall  ==1'b1)
                instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_cam_smot   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_seg_speed_pickup  ;
            else
                instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_cam_smot   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_seg_speed_hall  ;
    end

    assign instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_in_speed = instance_inj_ctrl_instance_smot_knock_handle_in_speed;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_pickup_hall = instance_inj_ctrl_instance_smot_knock_handle_pickup_hall;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_seg_speed_hall = instance_inj_ctrl_instance_smot_knock_handle_seg_speed_hall;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_seg_speed_pickup = instance_inj_ctrl_instance_smot_knock_handle_seg_speed_pickup;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_smot_camme_en = instance_inj_ctrl_instance_smot_knock_handle_smot_camme_en;
    assign instance_inj_ctrl_instance_smot_knock_handle_cam_smot = instance_inj_ctrl_instance_smot_knock_handle_instance_smot_camme_mux_cam_smot;


    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_in_speed;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_trg_knock1;
    wire  instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_trg_knock_en;
    reg  instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_internal_trg_knock1;
    reg  instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_smot60;

    always @(     instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_in_speed              or    instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_trg_knock1           or    instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_trg_knock_en   )
    begin :  instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_vhdl_trg_knock1_handle
        if (  instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_trg_knock_en  ==1'b0)
        begin
            instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_smot60   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_in_speed  |  instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_trg_knock1  ;
            instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_internal_trg_knock1   <=1'b0;
        end
        else
        begin
            instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_smot60   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_in_speed  ;
            instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_internal_trg_knock1   <=  instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_trg_knock1  ;
        end
    end

    assign instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_in_speed = instance_inj_ctrl_instance_smot_knock_handle_in_speed;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_trg_knock1 = instance_inj_ctrl_instance_smot_knock_handle_trg_knock1;
    assign instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_trg_knock_en = instance_inj_ctrl_instance_smot_knock_handle_trg_knock_en;
    assign instance_inj_ctrl_instance_smot_knock_handle_internal_trg_knock1 = instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_internal_trg_knock1;
    assign instance_inj_ctrl_instance_smot_knock_handle_smot60 = instance_inj_ctrl_instance_smot_knock_handle_instance_trg_knock1_handle_smot60;

    assign instance_inj_ctrl_instance_smot_knock_handle_clock = instance_inj_ctrl_clock_internal;
    assign instance_inj_ctrl_instance_smot_knock_handle_in_speed = instance_inj_ctrl_in_speed;
    assign instance_inj_ctrl_instance_smot_knock_handle_pickup_hall = instance_inj_ctrl_pickup_hall;
    assign instance_inj_ctrl_instance_smot_knock_handle_rst = instance_inj_ctrl_rst;
    assign instance_inj_ctrl_instance_smot_knock_handle_seg_speed_hall = instance_inj_ctrl_seg_speed_hall;
    assign instance_inj_ctrl_instance_smot_knock_handle_seg_speed_pickup = instance_inj_ctrl_seg_speed_pickup;
    assign instance_inj_ctrl_instance_smot_knock_handle_smot_camme_en = instance_inj_ctrl_smot_camme_en;
    assign instance_inj_ctrl_instance_smot_knock_handle_trg_knock1 = instance_inj_ctrl_trg_knock1;
    assign instance_inj_ctrl_instance_smot_knock_handle_trg_knock2 = instance_inj_ctrl_trg_knock2;
    assign instance_inj_ctrl_instance_smot_knock_handle_trg_knock_en = instance_inj_ctrl_trg_knock_en;
    assign instance_inj_ctrl_cam_smot = instance_inj_ctrl_instance_smot_knock_handle_cam_smot;
    assign instance_inj_ctrl_knock1 = instance_inj_ctrl_instance_smot_knock_handle_knock1;
    assign instance_inj_ctrl_knock2 = instance_inj_ctrl_instance_smot_knock_handle_knock2;
    assign instance_inj_ctrl_smot60 = instance_inj_ctrl_instance_smot_knock_handle_smot60;


    wire  instance_inj_ctrl_instance_split_clock;
    wire  instance_inj_ctrl_instance_split_rst;
    wire [6-1:0] instance_inj_ctrl_instance_split_inj_cmd;
    wire [2-1:0] instance_inj_ctrl_instance_split_i_fbk_f;
    wire [6-1:0] instance_inj_ctrl_instance_split_v_fbk_f;
    reg [3-1:0] instance_inj_ctrl_instance_split_inj_cmd_034;
    reg [3-1:0] instance_inj_ctrl_instance_split_inj_cmd_125;
    reg  instance_inj_ctrl_instance_split_i_fbk_034;
    reg  instance_inj_ctrl_instance_split_i_fbk_125;
    reg [3-1:0] instance_inj_ctrl_instance_split_v_fbk_034;
    reg [3-1:0] instance_inj_ctrl_instance_split_v_fbk_125;

    reg[5:0]  instance_inj_ctrl_instance_split_inj_cmd_int  ;
    always @(  posedge    instance_inj_ctrl_instance_split_clock          or  negedge   instance_inj_ctrl_instance_split_rst  )
        if (  instance_inj_ctrl_instance_split_rst  ==1'b0)
            instance_inj_ctrl_instance_split_inj_cmd_int   <={6{1'b0}};
        else
            instance_inj_ctrl_instance_split_inj_cmd_int   <=  instance_inj_ctrl_instance_split_inj_cmd  ;

    always @(     instance_inj_ctrl_instance_split_i_fbk_f              or    instance_inj_ctrl_instance_split_inj_cmd_int           or    instance_inj_ctrl_instance_split_v_fbk_f   )
    begin :  instance_inj_ctrl_instance_split_vhdl_split
        instance_inj_ctrl_instance_split_i_fbk_034   <=  instance_inj_ctrl_instance_split_i_fbk_f  [0];
        instance_inj_ctrl_instance_split_i_fbk_125   <=  instance_inj_ctrl_instance_split_i_fbk_f  [1];
        instance_inj_ctrl_instance_split_inj_cmd_034   [0]<=  instance_inj_ctrl_instance_split_inj_cmd_int  [0];
        instance_inj_ctrl_instance_split_inj_cmd_034   [1]<=  instance_inj_ctrl_instance_split_inj_cmd_int  [3];
        instance_inj_ctrl_instance_split_inj_cmd_034   [2]<=  instance_inj_ctrl_instance_split_inj_cmd_int  [4];
        instance_inj_ctrl_instance_split_inj_cmd_125   [0]<=  instance_inj_ctrl_instance_split_inj_cmd_int  [1];
        instance_inj_ctrl_instance_split_inj_cmd_125   [1]<=  instance_inj_ctrl_instance_split_inj_cmd_int  [2];
        instance_inj_ctrl_instance_split_inj_cmd_125   [2]<=  instance_inj_ctrl_instance_split_inj_cmd_int  [5];
        instance_inj_ctrl_instance_split_v_fbk_034   [0]<=  instance_inj_ctrl_instance_split_v_fbk_f  [0];
        instance_inj_ctrl_instance_split_v_fbk_034   [1]<=  instance_inj_ctrl_instance_split_v_fbk_f  [3];
        instance_inj_ctrl_instance_split_v_fbk_034   [2]<=  instance_inj_ctrl_instance_split_v_fbk_f  [4];
        instance_inj_ctrl_instance_split_v_fbk_125   [0]<=  instance_inj_ctrl_instance_split_v_fbk_f  [1];
        instance_inj_ctrl_instance_split_v_fbk_125   [1]<=  instance_inj_ctrl_instance_split_v_fbk_f  [2];
        instance_inj_ctrl_instance_split_v_fbk_125   [2]<=  instance_inj_ctrl_instance_split_v_fbk_f  [5];
    end

    assign instance_inj_ctrl_instance_split_clock = instance_inj_ctrl_clock_internal;
    assign instance_inj_ctrl_instance_split_rst = instance_inj_ctrl_rst;
    assign instance_inj_ctrl_instance_split_inj_cmd = instance_inj_ctrl_inj_cmd;
    assign instance_inj_ctrl_instance_split_i_fbk_f = instance_inj_ctrl_i_fbk_f;
    assign instance_inj_ctrl_instance_split_v_fbk_f = instance_inj_ctrl_v_fbk_f;
    assign instance_inj_ctrl_inj_cmd_034 = instance_inj_ctrl_instance_split_inj_cmd_034;
    assign instance_inj_ctrl_inj_cmd_125 = instance_inj_ctrl_instance_split_inj_cmd_125;
    assign instance_inj_ctrl_i_fbk_034 = instance_inj_ctrl_instance_split_i_fbk_034;
    assign instance_inj_ctrl_i_fbk_125 = instance_inj_ctrl_instance_split_i_fbk_125;
    assign instance_inj_ctrl_v_fbk_034 = instance_inj_ctrl_instance_split_v_fbk_034;
    assign instance_inj_ctrl_v_fbk_125 = instance_inj_ctrl_instance_split_v_fbk_125;


    wire  instance_inj_ctrl_instance_turbo_vehicle_speed_rpm_in;
    wire  instance_inj_ctrl_instance_turbo_vehicle_speed_turbo_speed;
    wire  instance_inj_ctrl_instance_turbo_vehicle_speed_vehicle_speed;
    wire  instance_inj_ctrl_instance_turbo_vehicle_speed_rpm_out;
    wire  instance_inj_ctrl_instance_turbo_vehicle_speed_turbo;
    wire  instance_inj_ctrl_instance_turbo_vehicle_speed_vehicle;

    assign   instance_inj_ctrl_instance_turbo_vehicle_speed_turbo  =  instance_inj_ctrl_instance_turbo_vehicle_speed_turbo_speed  ;
    assign   instance_inj_ctrl_instance_turbo_vehicle_speed_vehicle  =  instance_inj_ctrl_instance_turbo_vehicle_speed_vehicle_speed  ;
    assign   instance_inj_ctrl_instance_turbo_vehicle_speed_rpm_out  =  instance_inj_ctrl_instance_turbo_vehicle_speed_rpm_in  ;
    assign instance_inj_ctrl_instance_turbo_vehicle_speed_rpm_in = instance_inj_ctrl_rpm_in;
    assign instance_inj_ctrl_instance_turbo_vehicle_speed_turbo_speed = instance_inj_ctrl_turbo_speed;
    assign instance_inj_ctrl_instance_turbo_vehicle_speed_vehicle_speed = instance_inj_ctrl_vehicle_speed;
    assign instance_inj_ctrl_rpm_out = instance_inj_ctrl_instance_turbo_vehicle_speed_rpm_out;
    assign instance_inj_ctrl_turbo = instance_inj_ctrl_instance_turbo_vehicle_speed_turbo;
    assign instance_inj_ctrl_vehicle = instance_inj_ctrl_instance_turbo_vehicle_speed_vehicle;

    assign   instance_inj_ctrl_clock  =  instance_inj_ctrl_clock_internal  ;
    assign instance_inj_ctrl_a_bus = a_bus;
    assign instance_inj_ctrl_clock = clock;
    assign instance_inj_ctrl_cs = cs;
    assign instance_inj_ctrl_digital_input = digital_input;
    assign instance_inj_ctrl_ds = ds;
    assign instance_inj_ctrl_fbk_pwm = fbk_pwm;
    assign instance_inj_ctrl_inj_cmd = inj_cmd;
    assign instance_inj_ctrl_in_speed = in_speed;
    assign instance_inj_ctrl_i_fbk = i_fbk;
    assign instance_inj_ctrl_nssm_in = nssm_in;
    assign instance_inj_ctrl_rpm_in = rpm_in;
    assign instance_inj_ctrl_rst = reset;
    assign instance_inj_ctrl_r_w = r_w;
    assign instance_inj_ctrl_seg_speed_hall = seg_speed_hall;
    assign instance_inj_ctrl_seg_speed_pickup = seg_speed_pickup;
    assign instance_inj_ctrl_trg_knock1 = trg_knock1;
    assign instance_inj_ctrl_trg_knock2 = trg_knock2;
    assign instance_inj_ctrl_turbo_speed = turbo_speed;
    assign instance_inj_ctrl_vehicle_speed = vehicle_speed;
    assign instance_inj_ctrl_v_fbk = v_fbk;
    assign cam_smot = instance_inj_ctrl_cam_smot;
    assign digital_output = instance_inj_ctrl_digital_output;
    assign hlo = instance_inj_ctrl_hlo;
    assign in_speed_lev = instance_inj_ctrl_in_speed_lev;
    assign irq = instance_inj_ctrl_irq;
    assign knock1 = instance_inj_ctrl_knock1;
    assign knock1u = instance_inj_ctrl_knock1u;
    assign knock2 = instance_inj_ctrl_knock2;
    assign knock2u = instance_inj_ctrl_knock2u;
    assign relpot = instance_inj_ctrl_relpot;
    assign rpm_out = instance_inj_ctrl_rpm_out;
    assign seg_speed_lev = instance_inj_ctrl_seg_speed_lev;
    assign smot60 = instance_inj_ctrl_smot60;
    assign t1 = instance_inj_ctrl_t1;
    assign t2 = instance_inj_ctrl_t2;
    assign t3 = instance_inj_ctrl_t3;
    assign turbo = instance_inj_ctrl_turbo;
    assign turbo_speed_lev = instance_inj_ctrl_turbo_speed_lev;
    assign vehicle = instance_inj_ctrl_vehicle;
    assign d_bus_ext = instance_inj_ctrl_d_bus_ext;


    wire  instance_rst_inv_reset;

    wire  instance_rst_inv_rst_neg  ;
    assign   instance_rst_inv_rst_neg  =(~(  instance_rst_inv_reset  ));

    wire  instance_rst_inv_u0_gsr;

    assign instance_rst_inv_u0_gsr = instance_rst_inv_rst_neg;

    assign instance_rst_inv_reset = reset;

endmodule
