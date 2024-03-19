module cycloneii_lcell_ff(regout, datain, clk, aclr, sclr, sload, sdata, ena, devpor, devclrn);

parameter lpm_type = "cycloneii_lcell_ff";

input datain, clk, aclr, sclr, sload, sdata, ena, devpor, devclrn;
output regout;

endmodule


module cycloneii_lcell_comb(combout, cout, dataa, datab, datac, datad, cin);

parameter lpm_type = "cycloneii_lcell_comb";
parameter lut_mask = 16'h0000;
parameter sum_lutc_input = "datac";

input dataa, datab, datac, datad, cin;
output combout, cout;

endmodule


module cycloneii_io(
    datain, oe,
    outclk, outclkena, inclk, inclkena, areset, sreset,
    devclrn, devpor, devoe,
    linkin,
    differentialin,
    differentialout,
    padio,
    combout, regout,
    linkout
    );

parameter lpm_type = "cycloneii_io";

parameter operation_mode = "input";
parameter open_drain_output = "false";
parameter bus_hold = "false";

parameter output_register_mode = "none";
parameter output_async_reset = "none";
parameter output_sync_reset = "none";
parameter output_power_up = "low";
parameter tie_off_output_clock_enable = "false";

parameter oe_register_mode = "none";
parameter oe_async_reset = "none";
parameter oe_sync_reset = "none";
parameter oe_power_up = "low";
parameter tie_off_oe_clock_enable = "false";

parameter input_register_mode = "none";
parameter input_async_reset = "none";
parameter input_sync_reset = "none";
parameter input_power_up = "low";

parameter use_differential_input  = "false";

inout   padio;
input	datain, oe;
input	outclk, outclkena, inclk, inclkena, areset, sreset;
input	devclrn, devpor, devoe;
input   linkin;
input	differentialin;
output	differentialout;
output	combout, regout;
output  linkout;

endmodule


module cycloneii_clkctrl(
    inclk, 
    clkselect, 
    ena, 
    devpor, 
    devclrn, 
    outclk
    );
   
parameter lpm_type = "cycloneii_clkctrl";
parameter clock_type = "auto";
parameter ena_register_mode = "falling edge";

input [3:0] inclk;
input [1:0] clkselect;
input ena; 
input devpor; 
input devclrn; 
output outclk;

endmodule


module cycloneii_mac_mult(
    dataa, 
    datab,
    signa, 
    signb,
    clk, 
    aclr, 
    ena,
    dataout,
    devclrn,
    devpor);
    
parameter lpm_type = "cycloneii_mac_mult";
parameter dataa_width = 18;
parameter datab_width = 18;
parameter dataa_clock = "none";
parameter datab_clock = "none";
parameter signa_clock = "none"; 
parameter signb_clock = "none";
parameter lpm_hint = "true";
    
input [dataa_width-1:0] dataa;
input [datab_width-1:0] datab;
input signa;
input signb;
input clk;
input aclr;
input ena;
input devclrn;
input devpor;
output [dataa_width+datab_width-1:0] dataout;
    
endmodule


module cycloneii_mac_out(
    dataa, 
    clk,
    aclr,
    ena,
    dataout,
    devclrn,
    devpor);
 
parameter lpm_type = "cycloneii_mac_out";
parameter dataa_width = 36;
parameter output_clock = "none";
parameter lpm_hint = "true";

input	[dataa_width-1:0]	dataa;
output	[dataa_width-1:0]	dataout;
input clk;
input aclr;
input ena;
input 	devclrn;
input 	devpor;
    
endmodule


module cycloneii_pll(
    inclk,
    ena,
    clkswitch,
    areset,
    pfdena,
    testclearlock,
    clk,
    locked,
    testupout,
    testdownout,
    sbdin,
    sbdout
    );

parameter lpm_type = "cycloneii_pll";

parameter operation_mode                       = "normal";
parameter pll_type                             = "auto";
parameter compensate_clock                     = "clk0";
parameter feedback_source                      = "clk0";
parameter qualify_conf_done                    = "off";

parameter test_input_comp_delay_chain_bits     = 0;
parameter test_feedback_comp_delay_chain_bits  = 0;

parameter inclk0_input_frequency               = 10000;
parameter inclk1_input_frequency               = 10000;

parameter gate_lock_signal                     = "no";
parameter gate_lock_counter                    = 1;
parameter self_reset_on_gated_loss_lock        = "off";
parameter valid_lock_multiplier                = 1;
parameter invalid_lock_multiplier              = 5;

parameter switch_over_type                     = "manual";
parameter switch_over_on_lossclk               = "off";
parameter switch_over_on_gated_lock            = "off";
parameter switch_over_counter                  = 1;
parameter enable_switch_over_counter           = "on";

parameter bandwidth                            = 0;
parameter bandwidth_type                       = "auto";
parameter spread_frequency                     = 0;
parameter use_dc_coupling                      = "false";

parameter clk0_output_frequency                = 0;
parameter clk0_multiply_by                     = 1;
parameter clk0_divide_by                       = 1;
parameter clk0_phase_shift                     = "0";
parameter clk0_duty_cycle                      = 50;

parameter clk1_output_frequency                = 0;
parameter clk1_multiply_by                     = 1;
parameter clk1_divide_by                       = 1;
parameter clk1_phase_shift                     = "0";
parameter clk1_duty_cycle                      = 50;

parameter clk2_output_frequency                = 0;
parameter clk2_multiply_by                     = 1;
parameter clk2_divide_by                       = 1;
parameter clk2_phase_shift                     = "0";
parameter clk2_duty_cycle                      = 50;

parameter clk3_output_frequency                = 0;
parameter clk3_multiply_by                     = 1;
parameter clk3_divide_by                       = 1;
parameter clk3_phase_shift                     = "0";
parameter clk3_duty_cycle                      = 50;

parameter clk4_output_frequency                = 0;
parameter clk4_multiply_by                     = 1;
parameter clk4_divide_by                       = 1;
parameter clk4_phase_shift                     = "0";
parameter clk4_duty_cycle                      = 50;

parameter clk5_output_frequency                = 0;
parameter clk5_multiply_by                     = 1;
parameter clk5_divide_by                       = 1;
parameter clk5_phase_shift                     = "0";
parameter clk5_duty_cycle                      = 50;

parameter pfd_min                              = 0;
parameter pfd_max                              = 0;
parameter vco_min                              = 0;
parameter vco_max                              = 0;
parameter vco_center                           = 0;

parameter m_initial = 1;
parameter m = 0;
parameter n = 1;
parameter m2 = 1;
parameter n2 = 1;
parameter ss = 0;
parameter c0_high = 1;
parameter c0_low = 1;
parameter c0_initial = 1;
parameter c0_mode = "bypass";
parameter c0_ph = 0;
parameter c1_high = 1;
parameter c1_low = 1;
parameter c1_initial = 1;
parameter c1_mode = "bypass";
parameter c1_ph = 0;
parameter c2_high = 1;
parameter c2_low = 1;
parameter c2_initial = 1;
parameter c2_mode = "bypass";
parameter c2_ph = 0;
parameter c3_high = 1;
parameter c3_low = 1;
parameter c3_initial = 1;
parameter c3_mode = "bypass";
parameter c3_ph = 0;
parameter c4_high = 1;
parameter c4_low = 1;
parameter c4_initial = 1;
parameter c4_mode = "bypass";
parameter c4_ph = 0;
parameter c5_high = 1;
parameter c5_low = 1;
parameter c5_initial = 1;
parameter c5_mode = "bypass";
parameter c5_ph = 0;
parameter m_ph = 0;
parameter clk0_counter = "c0";
parameter clk1_counter = "c1";
parameter clk2_counter = "c2";
parameter clk3_counter = "c3";
parameter clk4_counter = "c4";
parameter clk5_counter = "c5";
parameter c1_use_casc_in = "off";
parameter c2_use_casc_in = "off";
parameter c3_use_casc_in = "off";
parameter c4_use_casc_in = "off";
parameter c5_use_casc_in = "off";
parameter m_test_source = 5;
parameter c0_test_source = 5;
parameter c1_test_source = 5;
parameter c2_test_source = 5;
parameter c3_test_source = 5;
parameter c4_test_source = 5;
parameter c5_test_source = 5;

parameter vco_multiply_by = 0;
parameter vco_divide_by = 0;
parameter vco_post_scale = 1;
parameter charge_pump_current = 52;
parameter loop_filter_r = "1.0";
parameter loop_filter_c = 16;
parameter pll_compensation_delay = 0;
parameter simulation_type = "functional";

parameter down_spread                          = "0.0";
parameter sim_gate_lock_device_behavior        = "off";
parameter clk0_phase_shift_num = 0;
parameter clk1_phase_shift_num = 0;
parameter clk2_phase_shift_num = 0;
parameter family_name = "alta";
parameter clk0_use_even_counter_mode = "off";
parameter clk1_use_even_counter_mode = "off";
parameter clk2_use_even_counter_mode = "off";
parameter clk3_use_even_counter_mode = "off";
parameter clk4_use_even_counter_mode = "off";
parameter clk5_use_even_counter_mode = "off";
parameter clk0_use_even_counter_value = "off";
parameter clk1_use_even_counter_value = "off";
parameter clk2_use_even_counter_value = "off";
parameter clk3_use_even_counter_value = "off";
parameter clk4_use_even_counter_value = "off";
parameter clk5_use_even_counter_value = "off";

input [1:0] inclk;
input ena;
input clkswitch;
input areset;
input pfdena;
input testclearlock;
input sbdin;
output [2:0] clk;
output locked;
output sbdout;
output testupout;
output testdownout;

endmodule


module cycloneii_asmiblock(
    dclkin,
    scein,
    sdoin,
    data0out,
    oe
    );

parameter lpm_type = "cycloneii_asmiblock";

input dclkin;
input scein;
input sdoin;
input oe;
output data0out;

endmodule  // cycloneii_asmiblock


module cycloneii_crcblock(
    clk,
    shiftnld,
    ldsrc,
    crcerror,
    regout
    );

parameter lpm_type = "cycloneii_crcblock";
parameter oscillator_divider = 1;

input clk;
input shiftnld;
input ldsrc;
output crcerror;
output regout;

endmodule


module cycloneii_ram_block(
    portadatain,
    portaaddr,
    portawe,
    portbdatain,
    portbaddr,
    portbrewe,
    clk0, clk1,
    ena0, ena1,
    clr0, clr1,
    portabyteenamasks,
    portbbyteenamasks,
    portaaddrstall,
    portbaddrstall,
    devclrn,
    devpor,
    portadataout,
    portbdataout);

parameter lpm_type = "cycloneii_ram_block";
parameter operation_mode = "single_port";
parameter mixed_port_feed_through_mode = "dont_care";
parameter ram_block_type = "auto";
parameter logical_ram_name = "ram_name";
parameter init_file = "init_file.hex";
parameter init_file_layout = "none";
parameter data_interleave_width_in_bits = 1;
parameter data_interleave_offset_in_bits = 1;
parameter port_a_logical_ram_depth = 0;
parameter port_a_logical_ram_width = 0;
parameter port_a_first_address = 0;
parameter port_a_last_address = 0;
parameter port_a_first_bit_number = 0;
parameter port_a_data_out_clear = "none";
parameter port_a_data_out_clock = "none";
parameter port_a_data_width = 64;
parameter port_a_address_width = 32;
parameter port_a_byte_enable_mask_width = 8;
parameter port_b_logical_ram_depth = 0;
parameter port_b_logical_ram_width = 0;
parameter port_b_first_address = 0;
parameter port_b_last_address = 0;
parameter port_b_first_bit_number = 0;
parameter port_b_data_in_clear = "none";
parameter port_b_address_clear = "none";
parameter port_b_read_enable_write_enable_clear = "none";
parameter port_b_byte_enable_clear = "none";
parameter port_b_data_out_clear = "none";
parameter port_b_data_in_clock = "clock1";
parameter port_b_address_clock = "clock1";
parameter port_b_read_enable_write_enable_clock = "clock1";
parameter port_b_byte_enable_clock = "clock1";
parameter port_b_data_out_clock = "none";
parameter port_b_data_width = 64;
parameter port_b_address_width = 32;
parameter port_b_byte_enable_mask_width = 8;
parameter power_up_uninitialized = "false";
parameter lpm_hint = "true";
parameter connectivity_checking = "off";
parameter mem_init0 = 2048'b0;
parameter mem_init1 = 2560'b0;
parameter port_a_byte_size = 0;
parameter port_a_disable_ce_on_input_registers = "off";
parameter port_a_disable_ce_on_output_registers = "off";
parameter port_b_byte_size = 0;
parameter port_b_disable_ce_on_input_registers = "off";
parameter port_b_disable_ce_on_output_registers = "off";
parameter safe_write = "err_on_2clk";
parameter init_file_restructured = "unused";
parameter port_a_data_in_clear = "none";
parameter port_a_address_clear = "none";
parameter port_a_write_enable_clear = "none";
parameter port_a_byte_enable_clear = "none";
parameter port_a_data_in_clock = "clock0";
parameter port_a_address_clock = "clock0";
parameter port_a_write_enable_clock = "clock0";
parameter port_a_byte_enable_clock = "clock0";

input portawe;
input [port_a_data_width - 1:0] portadatain;
input [port_a_address_width - 1:0] portaaddr;
input [port_a_byte_enable_mask_width - 1:0] portabyteenamasks;
input portbrewe;
input [port_b_data_width - 1:0] portbdatain;
input [port_b_address_width - 1:0] portbaddr;
input [port_b_byte_enable_mask_width - 1:0] portbbyteenamasks;
input clr0,clr1;
input clk0,clk1;
input ena0,ena1;
input devclrn,devpor;
input portaaddrstall;
input portbaddrstall;
output [port_a_data_width - 1:0] portadataout;
output [port_b_data_width - 1:0] portbdataout;

endmodule


module cycloneii_jtag(
    tms, 
    tck,
    tdi, 
    ntrst,
    tdoutap,
    tdouser,
    tdo,
    tmsutap,
    tckutap,
    tdiutap,
    shiftuser,
    clkdruser,
    updateuser,
    runidleuser,
    usr1user);

parameter lpm_type = "cycloneii_jtag";

input tms;
input tck;
input tdi;
input ntrst;
input tdoutap;
input tdouser;

output tdo;
output tmsutap;
output tckutap;
output tdiutap;
output shiftuser;
output clkdruser;
output updateuser;
output runidleuser;
output usr1user;

endmodule


module cycloneii_clk_delay_ctrl(
    clk, 
    delayctrlin, 
    disablecalibration,
    pllcalibrateclkdelayedin,
    devpor, 
    devclrn, 
    clkout
    );
   
parameter lpm_type = "cycloneii_clk_delay_ctrl";
parameter behavioral_sim_delay = 0;
parameter delay_chain = "54";  // or "1362ps"
parameter delay_chain_mode = "static";
parameter uses_calibration = "false";
parameter use_new_style_dq_detection = "false";
parameter tan_delay_under_delay_ctrl_signal = "unused";
parameter delay_ctrl_sim_delay_15_0  = 512'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter delay_ctrl_sim_delay_31_16 = 512'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter delay_ctrl_sim_delay_47_32 = 512'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
parameter delay_ctrl_sim_delay_63_48 = 512'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

input clk; 
input [5:0] delayctrlin; 
input disablecalibration;
input pllcalibrateclkdelayedin;
input devpor; 
input devclrn; 
output clkout;
   
endmodule

module lpm_latch(q, data, gate, aclr, aset, aconst);
parameter lpm_type="LPM_LATCH";
parameter lpm_width=1;
input data, gate, aclr, aset, aconst;
output q;
endmodule

module XAND2 (OUT, I0, I1);
input I0, I1;
output OUT;
parameter lpm_type="XAND2";
endmodule

module XMUX1 (OUT0, A0, B0, SEL);
input A0, B0, SEL;
output OUT0;
parameter lpm_type="XMUX1";
endmodule


module dffeas ( clk, d, asdata, clrn, aload, sclr, sload, ena, devclrn, devpor,
                q, prn);
   input clk, d, asdata, clrn, aload, sclr, sload, ena, devclrn, devpor, prn;
   output q;
endmodule     

module cycloneive_latch(D, ENA, PRE, CLR, Q);
   input D;
   input ENA, PRE, CLR;
   output Q;
endmodule

module cycloneive_pll (inclk,
                    fbin,
                    fbout,
                    clkswitch,
                    areset,
                    pfdena,
                    scanclk,
                    scandata,
                    scanclkena,
                    configupdate,
                    clk,
                    phasecounterselect,
                    phaseupdown,
                    phasestep,
                    clkbad,
                    activeclock,
                    locked,
                    scandataout,
                    scandone,
                    phasedone,
                    vcooverrange,
                    vcounderrange
                    );

    parameter operation_mode                       = "normal";
    parameter pll_type                             = "auto"; // auto,fast(left_right),enhanced(top_bottom)
    parameter compensate_clock                     = "clock0";


    parameter inclk0_input_frequency               = 0;
    parameter inclk1_input_frequency               = 0;

    parameter self_reset_on_loss_lock        = "off";
    parameter switch_over_type                     = "auto";

    parameter switch_over_counter                  = 1;
    parameter enable_switch_over_counter           = "off";

    parameter bandwidth                            = 0;
    parameter bandwidth_type                       = "auto";
    parameter use_dc_coupling                      = "false";

    parameter lock_high = 0; // 0 .. 4095
    parameter lock_low = 0;  // 0 .. 7
    parameter lock_window_ui = "0.05"; // "0.05", "0.1", "0.15", "0.2"
    parameter test_bypass_lock_detect              = "off";
    
    parameter clk0_output_frequency                = 0;
    parameter clk0_multiply_by                     = 0;
    parameter clk0_divide_by                       = 0;
    parameter clk0_phase_shift                     = "0";
    parameter clk0_duty_cycle                      = 50;

    parameter clk1_output_frequency                = 0;
    parameter clk1_multiply_by                     = 0;
    parameter clk1_divide_by                       = 0;
    parameter clk1_phase_shift                     = "0";
    parameter clk1_duty_cycle                      = 50;

    parameter clk2_output_frequency                = 0;
    parameter clk2_multiply_by                     = 0;
    parameter clk2_divide_by                       = 0;
    parameter clk2_phase_shift                     = "0";
    parameter clk2_duty_cycle                      = 50;

    parameter clk3_output_frequency                = 0;
    parameter clk3_multiply_by                     = 0;
    parameter clk3_divide_by                       = 0;
    parameter clk3_phase_shift                     = "0";
    parameter clk3_duty_cycle                      = 50;

    parameter clk4_output_frequency                = 0;
    parameter clk4_multiply_by                     = 0;
    parameter clk4_divide_by                       = 0;
    parameter clk4_phase_shift                     = "0";
    parameter clk4_duty_cycle                      = 50;

    parameter pfd_min                              = 0;
    parameter pfd_max                              = 0;
    parameter vco_min                              = 0;
    parameter vco_max                              = 0;
    parameter vco_center                           = 0;

    // ADVANCED USE PARAMETERS
    parameter m_initial = 1;
    parameter m = 0;
    parameter n = 1;

    parameter c0_high = 1;
    parameter c0_low = 1;
    parameter c0_initial = 1;
    parameter c0_mode = "bypass";
    parameter c0_ph = 0;

    parameter c1_high = 1;
    parameter c1_low = 1;
    parameter c1_initial = 1;
    parameter c1_mode = "bypass";
    parameter c1_ph = 0;

    parameter c2_high = 1;
    parameter c2_low = 1;
    parameter c2_initial = 1;
    parameter c2_mode = "bypass";
    parameter c2_ph = 0;

    parameter c3_high = 1;
    parameter c3_low = 1;
    parameter c3_initial = 1;
    parameter c3_mode = "bypass";
    parameter c3_ph = 0;

    parameter c4_high = 1;
    parameter c4_low = 1;
    parameter c4_initial = 1;
    parameter c4_mode = "bypass";
    parameter c4_ph = 0;

    parameter m_ph = 0;

    parameter clk0_counter = "unused";
    parameter clk1_counter = "unused";
    parameter clk2_counter = "unused";
    parameter clk3_counter = "unused";
    parameter clk4_counter = "unused";

    parameter c1_use_casc_in = "off";
    parameter c2_use_casc_in = "off";
    parameter c3_use_casc_in = "off";
    parameter c4_use_casc_in = "off";

    parameter m_test_source  = 1;
    parameter c0_test_source = 1;
    parameter c1_test_source = 1;
    parameter c2_test_source = 1;
    parameter c3_test_source = 1;
    parameter c4_test_source = 1;

    parameter vco_multiply_by = 0;
    parameter vco_divide_by = 0;
    parameter vco_post_scale = 1; // 1 .. 2
    parameter vco_frequency_control = "auto";
    parameter vco_phase_shift_step = 0;
    
    parameter charge_pump_current = 10;
    parameter loop_filter_r = "1.0";    // "1.0", "2.0", "4.0", "6.0", "8.0", "12.0", "16.0", "20.0"
    parameter loop_filter_c = 0;        // 0 , 2 , 4

    parameter pll_compensation_delay = 0;
    parameter simulation_type = "functional";
    parameter lpm_type = "cycloneive_pll";

// SIMULATION_ONLY_PARAMETERS_BEGIN

    parameter down_spread                          = "0.0";
    parameter lock_c = 4;

    parameter sim_gate_lock_device_behavior        = "off";

    parameter clk0_phase_shift_num = 0;
    parameter clk1_phase_shift_num = 0;
    parameter clk2_phase_shift_num = 0;
    parameter clk3_phase_shift_num = 0;
    parameter clk4_phase_shift_num = 0;
    parameter family_name = "Cycloneive";

    parameter clk0_use_even_counter_mode = "off";
    parameter clk1_use_even_counter_mode = "off";
    parameter clk2_use_even_counter_mode = "off";
    parameter clk3_use_even_counter_mode = "off";
    parameter clk4_use_even_counter_mode = "off";

    parameter clk0_use_even_counter_value = "off";
    parameter clk1_use_even_counter_value = "off";
    parameter clk2_use_even_counter_value = "off";
    parameter clk3_use_even_counter_value = "off";
    parameter clk4_use_even_counter_value = "off";

    // TEST ONLY
    
    parameter init_block_reset_a_count = 1;
    parameter init_block_reset_b_count = 1;

// SIMULATION_ONLY_PARAMETERS_END
    
// LOCAL_PARAMETERS_BEGIN

    parameter phase_counter_select_width = 3;
    parameter lock_window = 5;
    parameter inclk0_freq = inclk0_input_frequency;
    parameter inclk1_freq = inclk1_input_frequency;
   
parameter charge_pump_current_bits = 0;
parameter lock_window_ui_bits = 0;
parameter loop_filter_c_bits = 0;
parameter loop_filter_r_bits = 0;
parameter test_counter_c0_delay_chain_bits = 0;
parameter test_counter_c1_delay_chain_bits = 0;
parameter test_counter_c2_delay_chain_bits = 0;
parameter test_counter_c3_delay_chain_bits = 0;
parameter test_counter_c4_delay_chain_bits = 0;
parameter test_counter_c5_delay_chain_bits = 0;
parameter test_counter_m_delay_chain_bits = 0;
parameter test_counter_n_delay_chain_bits = 0;
parameter test_feedback_comp_delay_chain_bits = 0;
parameter test_input_comp_delay_chain_bits = 0;
parameter test_volt_reg_output_mode_bits = 0;
parameter test_volt_reg_output_voltage_bits = 0;
parameter test_volt_reg_test_mode = "false";
parameter vco_range_detector_high_bits = 1;
parameter vco_range_detector_low_bits = 1;
parameter scan_chain_mif_file = ""; 


parameter auto_settings = "true";

    input [1:0] inclk;
    input fbin;
    input clkswitch;
    input areset;
    input pfdena;
    input [phase_counter_select_width - 1:0] phasecounterselect;
    input phaseupdown;
    input phasestep;
    input scanclk;
    input scanclkena;
    input scandata;
    input configupdate;

    output [4:0] clk;
    output [1:0] clkbad;
    output activeclock;
    output locked;
    output scandataout;
    output scandone;
    output fbout;
    output phasedone;
    output vcooverrange;
    output vcounderrange;
endmodule // cycloneive_pll

module cycloneive_lcell_comb (
                             dataa, 
                             datab, 
                             datac, 
                             datad,
                             cin,
                             combout,
                             cout
                            );
   
input dataa;
input datab;
input datac;
input datad;
input cin;

output combout;
output cout;

parameter lut_mask = 16'hFFFF;
parameter sum_lutc_input = "datac";
parameter dont_touch = "off";
parameter lpm_type = "cycloneive_lcell_comb";
endmodule

module cycloneive_ff (
    d, 
    clk, 
    clrn, 
    aload, 
    sclr, 
    sload, 
    asdata, 
    ena, 
    devclrn, 
    devpor, 
    q
    );
   
parameter power_up = "low";
parameter x_on_violation = "on";
parameter lpm_type = "cycloneive_ff";

input d;
input clk;
input clrn;
input aload; 
input sclr; 
input sload; 
input asdata; 
input ena; 
input devclrn; 
input devpor; 
output q;
endmodule

module cycloneive_ram_block
    (
     portadatain,
     portaaddr,
     portawe,
     portare,
     portbdatain,
     portbaddr,
     portbwe,
     portbre,
     clk0, clk1,
     ena0, ena1,
     ena2, ena3,
     clr0, clr1,
     portabyteenamasks,
     portbbyteenamasks,
     portaaddrstall,
     portbaddrstall,
     devclrn,
     devpor,
     portadataout,
     portbdataout
     );
parameter port_a_data_width = 64;
parameter port_a_address_width = 32;
parameter port_a_byte_enable_mask_width = 8;
parameter port_b_data_width = 64;
parameter port_b_address_width = 32;
parameter port_b_byte_enable_mask_width = 8;

input portawe;
input portare;
input [port_a_data_width - 1:0] portadatain;
input [port_a_address_width - 1:0] portaaddr;
input [port_a_byte_enable_mask_width - 1:0] portabyteenamasks;

input portbwe, portbre;
input [port_b_data_width - 1:0] portbdatain;
input [port_b_address_width - 1:0] portbaddr;
input [port_b_byte_enable_mask_width - 1:0] portbbyteenamasks;

input clr0,clr1;
input clk0,clk1;
input ena0,ena1;
input ena2,ena3;

input devclrn,devpor;
input portaaddrstall;
input portbaddrstall;
output [port_a_data_width - 1:0] portadataout;
output [port_b_data_width - 1:0] portbdataout;
endmodule // cycloneive_ram_block

module cycloneive_mac_mult	
   (
    dataa, 
    datab,
    signa, 
    signb,
    clk, 
    aclr, 
    ena,
    dataout,
    devclrn,
    devpor
    );
    
    parameter dataa_width    = 18;
    parameter datab_width    = 18;
    parameter dataa_clock	= "none";
    parameter datab_clock	= "none";
    parameter signa_clock	= "none"; 
    parameter signb_clock	= "none";
    parameter lpm_hint       = "true";
    parameter lpm_type       = "cycloneive_mac_mult";
    
// SIMULATION_ONLY_PARAMETERS_BEGIN

    parameter dataout_width  = 36;

// SIMULATION_ONLY_PARAMETERS_END

    input [dataa_width-1:0] dataa;
    input [datab_width-1:0] datab;
    input 	signa;
    input 	signb;
    input clk;
    input aclr;
    input ena;
    input 	devclrn;
    input 	devpor;
 
    output [dataout_width-1:0] dataout;
endmodule

module cycloneive_mac_out	
   (
    dataa, 
    clk,
    aclr,
    ena,
    dataout,
    devclrn,
    devpor
    );
 
    parameter dataa_width = 36;
    parameter output_clock  = "none";
    parameter lpm_hint      = "true";
    parameter lpm_type      = "cycloneive_mac_out";
    parameter dataout_width = 36;

    input [dataa_width-1:0] dataa;
    input clk;
    input aclr;
    input ena;
    input 	devclrn;
    input 	devpor;
    output [dataout_width-1:0] dataout; 
endmodule

module cycloneive_io_ibuf (
                      i,
                      ibar,
                      o
                     );

// SIMULATION_ONLY_PARAMETERS_BEGIN

parameter differential_mode = "false";
parameter bus_hold = "false";
parameter simulate_z_as = "Z";
parameter lpm_type = "cycloneive_io_ibuf";

// SIMULATION_ONLY_PARAMETERS_END

//Input Ports Declaration
input i;
input ibar;

//Output Ports Declaration
output o;
endmodule

module cycloneive_io_obuf (
                      i,
                      oe,
                      seriesterminationcontrol,
                      devoe,
                      o,
                      obar
                    );

//Parameter Declaration
parameter open_drain_output = "false";
parameter bus_hold = "false";
parameter lpm_type = "cycloneive_io_obuf";

//Input Ports Declaration
input i;
input oe;
input devoe;
input [15:0] seriesterminationcontrol; 

//Outout Ports Declaration
output o;
output obar;
endmodule

module cycloneive_ddio_out (
                        datainlo,
                        datainhi,
                        clk,
                        clkhi,
                        clklo,
                        muxsel,
                        ena,
                        areset,
                        sreset,
                        dataout,
                        dfflo,
                        dffhi,
                        devpor,
                        devclrn
                     );

//Parameters Declaration
parameter power_up = "low";
parameter async_mode = "none";
parameter sync_mode = "none";
parameter use_new_clocking_model = "false";
parameter lpm_type = "cycloneive_ddio_out";

//Input Ports Declaration
input datainlo;
input datainhi;
input clk;
input clkhi;
input clklo;
input muxsel;
input ena;
input areset;
input sreset;
input devpor;
input devclrn;

//Output Ports Declaration
output dataout;

//Buried Ports Declaration
output dfflo;
output dffhi ;
endmodule

module cycloneive_ddio_oe (
                       oe,
                       clk,
                       ena,
                       areset,
                       sreset,
                       dataout,
                       dfflo,
                       dffhi,
                       devpor,
                       devclrn
                    );

//Parameters Declaration
parameter power_up = "low";
parameter async_mode = "none";
parameter sync_mode = "none";
parameter lpm_type = "cycloneive_ddio_oe";

//Input Ports Declaration
input oe;
input clk;
input ena;
input areset;
input sreset;
input devpor;
input devclrn;

//Output Ports Declaration
output dataout;

//Buried Ports Declaration
output dfflo;
output dffhi;
endmodule

module cycloneive_clkctrl (
                        inclk, 
                        clkselect, 
                        ena, 
                        devpor, 
                        devclrn, 
                        outclk
                        );
   
parameter lpm_type = "cycloneive_clkctrl";
parameter clock_type = "auto";
parameter ena_register_mode = "falling edge";

input [3:0] inclk;
input [1:0] clkselect;
input ena; 
input devpor; 
input devclrn; 

output outclk;
endmodule

module  cycloneive_rublock 
	(
	clk, 
	shiftnld, 
	captnupdt, 
	regin, 
	rsttimer, 
	rconfig, 
	regout
	);

	parameter sim_init_config = "factory";
	parameter sim_init_watchdog_value = 0;
	parameter sim_init_status = 0;
	parameter lpm_type = "cycloneive_rublock";

	input clk;
	input shiftnld;
	input captnupdt;
	input regin;
	input rsttimer;
	input rconfig;

	output regout;
endmodule

module cycloneive_termination (
    rup,
    rdn,
    terminationclock,
    terminationclear,
    devpor,
    devclrn,
    comparatorprobe,
    terminationcontrolprobe,
    calibrationdone,
    terminationcontrol);
    
input         rup;
input 	      rdn;
input 	      terminationclock;
input 	      terminationclear;
input         devpor;
input         devclrn;

output        comparatorprobe;
output        terminationcontrolprobe;
output        calibrationdone;
output [15:0] terminationcontrol;
endmodule

module  cycloneive_jtag (
    tms, 
    tck,
    tdi, 
    tdoutap,
    tdouser,
    tdo,
    tmsutap,
    tckutap,
    tdiutap,
    shiftuser,
    clkdruser,
    updateuser,
    runidleuser,
    usr1user);

input tms;
input tck;
input tdi;
input tdoutap;
input tdouser;

output tdo;
output tmsutap;
output tckutap;
output tdiutap;
output shiftuser;
output clkdruser;
output updateuser;
output runidleuser;
output usr1user;

parameter lpm_type = "cycloneive_jtag";

endmodule

module  cycloneive_crcblock (
    clk,
    shiftnld,
    ldsrc,
    crcerror,
    regout);

input clk;
input shiftnld;
input ldsrc;

output crcerror;
output regout;

parameter oscillator_divider = 1;
parameter lpm_type = "cycloneive_crcblock";

endmodule

module  cycloneive_oscillator 
    (
    oscena,
    clkout 
    );

    parameter lpm_type = "cycloneive_oscillator";

    input oscena;
    
    output clkout;
endmodule

module  cycloneive_pseudo_diff_out (
    i,
    o,
    obar);

input i;

output o;
output obar;

parameter lpm_type = "cycloneive_pseudo_diff_out";

endmodule

module  cycloneive_routing_wire  (
    datain,
    dataout);

input datain;

output dataout;

parameter lpm_type = "cycloneive_routing_wire";

endmodule

