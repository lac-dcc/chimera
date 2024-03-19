//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Jun 28 10:22:47 2017
// Version: v11.8 11.8.0.26
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// top
module top(
    // Inputs
    clock,
    input_data,
    reset,
    trigger_signal,
    // Outputs
    RSS_EN,
    clock_out,
    output_data_rate,
    output_signal,
    ref_signal,
    signal_into_switch
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input        clock;
input  [9:0] input_data;
input        reset;
input        trigger_signal;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output       RSS_EN;
output       clock_out;
output       output_data_rate;
output       output_signal;
output       ref_signal;
output       signal_into_switch;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire         AND2_0_Y;
wire         AND2_1_Y;
wire         AND2_2_Y;
wire         AND2_3_Y;
wire         clock;
wire         clock_out_0;
wire         data_path_signal;
wire         data_source_0_output_data;
wire   [9:0] input_data;
wire         INV_1_Y;
wire         INV_2_Y;
wire         output_data_rate_net_0;
wire         output_signal_net_0;
wire         pll_core_0_GLA;
wire         ref_signal_net_0;
wire         reset;
wire         signal_into_switch_net_0;
wire         trigger_signal;
wire         whitening_0_output_whitening;
wire         Y;
wire         signal_into_switch_net_1;
wire         ref_signal_net_1;
wire         output_data_rate_net_1;
wire         clock_out_0_net_0;
wire         output_signal_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire         VCC_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign VCC_net = 1'b1;
//--------------------------------------------------------------------
// TieOff assignments
//--------------------------------------------------------------------
assign RSS_EN                   = 1'b1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign signal_into_switch_net_1 = signal_into_switch_net_0;
assign signal_into_switch       = signal_into_switch_net_1;
assign ref_signal_net_1         = ref_signal_net_0;
assign ref_signal               = ref_signal_net_1;
assign output_data_rate_net_1   = output_data_rate_net_0;
assign output_data_rate         = output_data_rate_net_1;
assign clock_out_0_net_0        = clock_out_0;
assign clock_out                = clock_out_0_net_0;
assign output_signal_net_1      = output_signal_net_0;
assign output_signal            = output_signal_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------AND2
AND2 AND2_0(
        // Inputs
        .A ( ref_signal_net_0 ),
        .B ( output_data_rate_net_0 ),
        // Outputs
        .Y ( AND2_0_Y ) 
        );

//--------AND2
AND2 AND2_1(
        // Inputs
        .A ( Y ),
        .B ( INV_1_Y ),
        // Outputs
        .Y ( AND2_1_Y ) 
        );

//--------AND2
AND2 AND2_2(
        // Inputs
        .A ( data_path_signal ),
        .B ( output_signal_net_0 ),
        // Outputs
        .Y ( AND2_2_Y ) 
        );

//--------AND2
AND2 AND2_3(
        // Inputs
        .A ( ref_signal_net_0 ),
        .B ( INV_2_Y ),
        // Outputs
        .Y ( AND2_3_Y ) 
        );

//--------data_rate
data_rate data_rate_0(
        // Inputs
        .clock            ( ref_signal_net_0 ),
        .reset            ( reset ),
        .trigger          ( output_signal_net_0 ),
        // Outputs
        .output_data_rate (  ) 
        );

//--------data_source
data_source data_source_0(
        // Inputs
        .clock       ( ref_signal_net_0 ),
        .reset       ( reset ),
        .trigger     ( output_signal_net_0 ),
        .input_data  ( input_data ),
        // Outputs
        .output_data ( data_source_0_output_data ) 
        );

//--------dbpsk_modulator
dbpsk_modulator dbpsk_modulator_0(
        // Inputs
        .clock        ( ref_signal_net_0 ),
        .reset        ( reset ),
        .input_data   ( whitening_0_output_whitening ),
        .trigger      ( output_signal_net_0 ),
        // Outputs
        .output_dbpsk ( output_data_rate_net_0 ) 
        );

//--------INV
INV INV_0(
        // Inputs
        .A ( ref_signal_net_0 ),
        // Outputs
        .Y ( Y ) 
        );

//--------INV
INV INV_1(
        // Inputs
        .A ( output_data_rate_net_0 ),
        // Outputs
        .Y ( INV_1_Y ) 
        );

//--------INV
INV INV_2(
        // Inputs
        .A ( output_signal_net_0 ),
        // Outputs
        .Y ( INV_2_Y ) 
        );

//--------main_clock
main_clock main_clock_0(
        // Inputs
        .clock     ( pll_core_0_GLA ),
        .reset     ( reset ),
        // Outputs
        .clock_out ( ref_signal_net_0 ) 
        );

//--------modulator
modulator modulator_0(
        // Inputs
        .clock          ( ref_signal_net_0 ),
        .reset          ( reset ),
        .trigger_signal ( trigger_signal ),
        // Outputs
        .output_signal  ( output_signal_net_0 ) 
        );

//--------OR2
OR2 OR2_0(
        // Inputs
        .A ( AND2_0_Y ),
        .B ( AND2_1_Y ),
        // Outputs
        .Y ( data_path_signal ) 
        );

//--------OR2
OR2 OR2_1(
        // Inputs
        .A ( AND2_2_Y ),
        .B ( AND2_3_Y ),
        // Outputs
        .Y ( signal_into_switch_net_0 ) 
        );

//--------pll_core
pll_core pll_core_0(
        // Inputs
        .POWERDOWN ( VCC_net ),
        .CLKA      ( clock ),
        // Outputs
        .LOCK      (  ),
        .GLA       ( pll_core_0_GLA ) 
        );

//--------ten_mhz_clock
ten_mhz_clock ten_mhz_clock_0(
        // Inputs
        .clock_in  ( pll_core_0_GLA ),
        .reset     ( reset ),
        // Outputs
        .clock_out (  ) 
        );

//--------two_mhz_clock
two_mhz_clock two_mhz_clock_0(
        // Inputs
        .clock_in  ( pll_core_0_GLA ),
        .reset     ( reset ),
        // Outputs
        .clock_out ( clock_out_0 ) 
        );

//--------whitening
whitening whitening_0(
        // Inputs
        .clock            ( ref_signal_net_0 ),
        .reset            ( reset ),
        .input_data       ( data_source_0_output_data ),
        .trigger          ( output_signal_net_0 ),
        // Outputs
        .output_whitening ( whitening_0_output_whitening ) 
        );


endmodule
