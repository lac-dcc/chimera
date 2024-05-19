// This program was cloned from: https://github.com/hipersys-team/lightning
// License: MIT License

/*

Project: [Lightning] A Reconfigurable Photonic-Electronic SmartNIC for Fast and Energy-Efficient Inference 
File: lenet_single_core.v
File Explanation: this module describes the top-level logic for executing fully-connected LeNet-300-100 neural networks
File Start Time: Februry 2022
Authors: Zhizhen Zhong (zhizhenz@mit.edu)
Language: Verilog 2001

*/


`resetall
`timescale 1ns / 1ps
`default_nettype none


module lenet_single_core # (
    parameter ADC_BITWIDTH = 256,
    parameter DAC_BITWIDTH = 256,
    parameter INFERENCE_INPUT_NUM = 784,
    parameter INFERENCE_INPUT_CYCLE = 49,
    parameter LAYER_1_OUTPUT_NUM = 300,
    parameter LAYER_1_OUTPUT_CYCLE = 19,
    parameter LAYER_1_ALL_CYCLE = 14700,
    parameter LAYER_2_OUTPUT_NUM = 100,
    parameter LAYER_2_OUTPUT_CYCLE = 7,
    parameter LAYER_2_ALL_CYCLE = 1900,
    parameter LAYER_3_OUTPUT_NUM = 10,
    parameter LAYER_3_OUTPUT_CYCLE = 1,
    parameter LAYER_3_ALL_CYCLE = 70
) (
    input wire                       clk,
    input wire                       rst,

    // initial input data from model runner, sourced from SRAM or CMAC
    input wire [DAC_BITWIDTH-1:0]    initial_input_axis_tdata,
    input wire                       initial_input_axis_tvalid,
    input wire                       initial_input_axis_tlast,
    output wire                      initial_input_axis_tready,

    // DNN weights data from model runner, sourced from SRAM or DRAM
    input wire [DAC_BITWIDTH-1:0]    weight_matrix_tdata,
    input wire                       weight_matrix_tvalid,
    output wire                      weight_matrix_tready,
    input wire [ADC_BITWIDTH/16-1:0] weight_sign_tdata,
    input wire                       weight_sign_tvalid,
    output wire                      weight_sign_tready,

    // received data from ADC channels
    input  wire [ADC_BITWIDTH-1:0]   adc_00_axis_tdata,  // photonic multiplication input
    input  wire                      adc_00_axis_tvalid,
    output wire                      adc_00_axis_tready,

    // send data to DAC channels
    output wire [DAC_BITWIDTH-1:0]   dac_00_axis_tdata,  // DNN input image data
    output wire                      dac_00_axis_tvalid,
    input  wire                      dac_00_axis_tready,

    output wire [DAC_BITWIDTH-1:0]   dac_01_axis_tdata,  // DNN weight data
    output wire                      dac_01_axis_tvalid,
    input  wire                      dac_01_axis_tready,

    // input control signals
    input  wire                      inference_start,  // start the inference
    input  wire                      calibration_start,  // start the calibration
    input  wire                      weight_ready,
    input  wire                      use_sparsity,
    input  wire [15:0]               input_image_index,
    input  wire [15:0]               optical_loss,
    input  wire [15:0]               monitor_cycle_length,
    input  wire [15:0]               preamble_cycle_length,
    input  wire [15:0]               calibration_length_wire,
    input  wire [15:0]               calibration_wave_type,
    input  wire [15:0]               estimate_photonic_slack_cycle_length,
    input  wire [15:0]               propagation_cycle_delay_between_modulators,
    input  wire [15:0]               propagation_cycle_shift_between_modulators,  // each cycle only has 16 numbers

    // output results
    output wire                      state_changed_wire,
    output wire                      reset_all_wire,
    output wire                      photonic_integration_start_wire,
    output reg [DAC_BITWIDTH-1:0]    final_result_tdata,
    output reg                       final_result_tvalid,
    output reg [15:0]                in_module_layer,
    output wire [255:0]              pattern_match_agg,
    output wire [15:0]               calibrated_loss,
    output wire                      calibrated_loss_valid,
    output reg [15:0]                start_clock_count,
    output reg [15:0]                final_clock_count
);

    reg                         state_changed;
    reg                         reset_all;
    reg                         photonic_integration_start;
    assign state_changed_wire = state_changed;
    assign reset_all_wire     = reset_all;
    assign photonic_integration_start_wire = photonic_integration_start;
    reg                     reset_all_state;

    reg [DAC_BITWIDTH-1:0]  calibration_input_tdata;
    reg                     calibration_input_tvalid;
    wire [DAC_BITWIDTH-1:0] calibration_output_tdata;
    wire                    calibration_output_tvalid;

    wire [DAC_BITWIDTH-1:0] layer_activation_tdata;
    wire                    layer_activation_tvalid;
    wire                    layer_activation_tlast;

    reg                     dac_0x_axis_tvalid;
    assign                  adc_00_axis_tready = 1'b1;

    reg  [DAC_BITWIDTH-1:0] dac_00_delay_tdata;
    reg                     dac_00_delay_tvalid;
    reg  [DAC_BITWIDTH-1:0] dac_01_delay_tdata;
    reg                     dac_01_delay_tvalid;

    wire [ADC_BITWIDTH-1:0] adc_00_accept_tdata;
    wire                    adc_00_accept_tvalid;

    wire [DAC_BITWIDTH/16-1:0] sparsity_tdata;
    wire                       sparsity_tvalid;
    wire [DAC_BITWIDTH/16-1:0] detected_sparsity_tdata;
    wire                       detected_sparsity_tvalid;

    wire                    photonic_multiplication_tvalid = adc_00_accept_tvalid;
    reg                     photonic_multiplication_tvalid_state;

    wire [ADC_BITWIDTH-1:0] amplified_adc_00_axis_tdata;
    wire                    amplified_adc_00_axis_tvalid;

    wire [ADC_BITWIDTH/16-1:0] integration_photonic_output_tdata;
    wire                    integration_photonic_output_tvalid;
    wire                    integration_photonic_output_tready;

    wire [ADC_BITWIDTH/16-1:0] nonlinear_photonic_output_tdata;
    wire                    nonlinear_photonic_output_tvalid;
    wire                    nonlinear_photonic_output_tready;

    wire [DAC_BITWIDTH-1:0] new_input_activation_tdata;
    wire                    new_input_activation_tvalid;
    wire                    new_input_activation_tlast;

    wire [DAC_BITWIDTH-1:0] final_softmax_tdata;
    wire                    final_softmax_tvalid;

    // handling control counters
    wire [15:0] new_layer = in_module_layer;  // layer information
    reg [15:0]              new_input;  // input image index
    reg [15:0]              current_layer;
    reg [15:0]              current_input;
    wire [2:0]              output_layer_info;

    /* performance metrics */
    `define COUNTER_PHOTONICS   0
    `define COUNTER_INTEGRATION 1
    `define COUNTER_RELU        2
    `define COUNTER_SOFTMAX     3

    `define SIGNAL_INPUT        0
    `define SIGNAL_OUTPUT       1

    reg [15:0]              latency_counter, compute_counter;
    reg [3:0]               module_countme;
    reg [1:0]               module_signals [3:0];

    // produce reset_all signal
    always @ (posedge clk) begin
        if (rst | reset_all) reset_all <= 0;
        else reset_all <= (!inference_start && !calibration_start);
    end

    always @ (posedge clk) begin
        if (rst | reset_all) begin
            new_input <= 16'b1111_1111_1111_1111;
        end else begin
            new_input <= input_image_index;
        end
    end

    always @ (posedge clk)
        if (rst | reset_all) begin
            in_module_layer <= 0;
        end else if (in_module_layer == 0) begin
            in_module_layer <= {15'd0, weight_ready};
        end else if (output_layer_info > 0) begin
            in_module_layer[2:0] <= output_layer_info;
        end

    assign module_signals[`COUNTER_PHOTONICS][`SIGNAL_INPUT] = dac_00_axis_tvalid;
    assign module_signals[`COUNTER_PHOTONICS][`SIGNAL_OUTPUT] = adc_00_axis_tvalid;

    assign module_signals[`COUNTER_INTEGRATION][`SIGNAL_INPUT] = photonic_multiplication_tvalid;
    assign module_signals[`COUNTER_INTEGRATION][`SIGNAL_OUTPUT] = integration_photonic_output_tvalid;

    assign module_signals[`COUNTER_RELU][`SIGNAL_INPUT] = integration_photonic_output_tvalid && (new_layer[0] || new_layer[1]);
    assign module_signals[`COUNTER_RELU][`SIGNAL_OUTPUT] = relu_output_tvalid;

    assign module_signals[`COUNTER_SOFTMAX][`SIGNAL_INPUT] = new_input_activation_tvalid && new_layer[0] && new_layer[1] && new_layer[2];
    assign module_signals[`COUNTER_SOFTMAX][`SIGNAL_OUTPUT] = final_softmax_tvalid;

    genvar g;
    generate
        for (g = 0; g < 4; g = g + 1)
            assign module_countme[g] = module_signals[g][`SIGNAL_INPUT] &&
              !module_signals[g][`SIGNAL_OUTPUT];
    endgenerate

    always @(posedge clk) begin
        if (rst | reset_all) begin
            latency_counter <= 0;
            compute_counter <= 0;

        end else if (inference_start) begin
            if (latency_counter < {16{1'b1}})
                latency_counter <= latency_counter + 1;

            if (module_countme > 0 && compute_counter < {16{1'b1}})
                compute_counter <= compute_counter + 1;
        end
    end

    always @ (posedge clk)
        if (rst | reset_all) begin
            state_changed <= 1'b0;
            current_layer <= 16'd0;
            current_input <= 16'b1111_1111_1111_1111;  // give a infeasible picture index
        end else begin
            if (weight_ready) begin
                current_layer <= new_layer;
                current_input <= new_input;
            end
            if (new_layer === current_layer) begin
                state_changed <= 1'b0;
            end else begin
                state_changed <= weight_ready;
            end
        end

    // pre-computing calibration process
    calibration # (
    ) calibration_inst (
        .clk(clk),
        .rst(rst | reset_all),
        .estimate_photonic_slack_cycle_length(estimate_photonic_slack_cycle_length),
        .calibration_start(calibration_start),
        .calibration_length(calibration_length_wire),
        .calibration_wave_type(calibration_wave_type),
        .input_tdata(calibration_input_tdata),
        .input_tvalid(calibration_input_tvalid),
        .output_tdata(calibration_output_tdata),
        .output_tvalid(calibration_output_tvalid),
        .loss(calibrated_loss),
        .loss_valid(calibrated_loss_valid)
    );

    // synchronizing buffer for the two DAC channels
    assign weight_matrix_tready = weight_matrix_tvalid && layer_activation_tvalid;  // do not receive data from input PIN when both weight and input are ready
    assign initial_input_axis_tready = weight_matrix_tvalid && layer_activation_tvalid;  // do not receive data from input PIN when both weight and input are ready

    always @ (posedge clk) begin
        if (rst | reset_all) begin
            dac_0x_axis_tvalid <= 1'b0;
            calibration_input_tdata <= 0;
            calibration_input_tvalid <= 0;

        end else begin
            if (calibration_start) begin
                dac_0x_axis_tvalid <= calibration_output_tvalid;
                dac_00_delay_tdata <= calibration_output_tdata;
                dac_00_delay_tvalid <= calibration_output_tvalid;
                dac_01_delay_tdata <= 256'h7FFC_7FFC_7FFC_7FFC_7FFC_7FFC_7FFC_7FFC_7FFC_7FFC_7FFC_7FFC_7FFC_7FFC_7FFC_7FFC;
                dac_01_delay_tvalid <= calibration_output_tvalid;
                calibration_input_tdata <= adc_00_axis_tdata;  // calibration should be based on raw data
                calibration_input_tvalid <= adc_00_axis_tvalid;  // calibration should be based on raw data

            end else begin
                calibration_input_tdata <= 0;
                calibration_input_tvalid <= 0;
                dac_0x_axis_tvalid <= weight_matrix_tvalid && layer_activation_tvalid;
                if (weight_matrix_tvalid && layer_activation_tvalid) begin
                    dac_00_delay_tdata <= layer_activation_tdata;
                    dac_00_delay_tvalid <= weight_matrix_tvalid && layer_activation_tvalid;
                    dac_01_delay_tdata <= weight_matrix_tdata;
                    dac_01_delay_tvalid <= weight_matrix_tvalid && layer_activation_tvalid;
                end else begin
                    dac_00_delay_tdata <= {DAC_BITWIDTH{1'b0}};
                    dac_00_delay_tvalid <= 1'b0;
                    dac_01_delay_tdata <= {DAC_BITWIDTH{1'b0}};
                    dac_01_delay_tvalid <= 1'b0;
                end
                // we need to assert tready signal to synchronize weight
            end
        end
    end

    // add intra cycle shift to DAC 00
    axis_adjustable_intra_cycle_delay # (
    ) axis_adjustable_intra_cycle_delay_inst (
        .clk(clk),
        .rst(rst | reset_all),
        .intra_cycle_delay_count(16'd16-propagation_cycle_shift_between_modulators),
        .s_axis_tdata(dac_00_delay_tdata),
        .s_axis_tvalid(dac_00_delay_tvalid),
        .s_axis_tlast(),
        .m_axis_tdata(dac_00_axis_tdata),
        .m_axis_tvalid(dac_00_axis_tvalid),
        .m_axis_tlast()
    );

    // add inter cycle shift to DAC 01
    axis_adjustable_delay # (
        .DATA_WIDTH(DAC_BITWIDTH)
    ) axis_adjustable_delay_inst (
        .clk(clk),
        .rst(rst | reset_all),
        .delay_count(propagation_cycle_delay_between_modulators),
        .s_axis_tdata(dac_01_delay_tdata),
        .s_axis_tvalid(dac_01_delay_tvalid),
        .s_axis_tlast(),
        .m_axis_tdata(dac_01_axis_tdata),
        .m_axis_tvalid(dac_01_axis_tvalid),
        .m_axis_tlast()
    );

    // multiplication sparsity detector
    sparsity_detect # (
    ) sparsity_detect_inst (
        .clk(clk),
        .rst(rst | reset_all),
        .state_changed(state_changed),
        .integration_start(photonic_integration_start),
        .preamble_cycle_length(preamble_cycle_length),
        .layer_activation_tdata(layer_activation_tdata),  // use synchronized data for sparsity detection
        .layer_activation_tvalid(layer_activation_tvalid),  // use synchronized data for sparsity detection
        .weight_tdata(weight_matrix_tdata),  // use synchronized data for sparsity detection
        .weight_tvalid(weight_matrix_tvalid),  // use synchronized data for sparsity detection
        .sparsity_tdata(detected_sparsity_tdata),
        .sparsity_tvalid(detected_sparsity_tvalid)
    );

    reg [DAC_BITWIDTH/16-1:0] sparsity_tdata_switch_reg;
    reg                       sparsity_tvalid_switch_reg;

    always @ (posedge clk)
        if (rst | reset_all) begin
            sparsity_tdata_switch_reg <= 16'b1111_1111_1111_1111;  // not sparse
            sparsity_tvalid_switch_reg <= 1'b0;
        end else if (use_sparsity) begin
            sparsity_tdata_switch_reg <= detected_sparsity_tdata;
            sparsity_tvalid_switch_reg <= detected_sparsity_tvalid;
        end else begin
            sparsity_tdata_switch_reg <= 16'b1111_1111_1111_1111;
            sparsity_tvalid_switch_reg <= 1'b1;
        end

    assign sparsity_tdata = sparsity_tdata_switch_reg;
    assign sparsity_tvalid = sparsity_tvalid_switch_reg;

    // layer-wise switch
    layer_activation_switch # (
        .DATA_WIDTH(DAC_BITWIDTH)
    ) layer_activation_switch_inst (
        .clk(clk),
        .rst(rst | reset_all),
        .layer(new_layer[2:0]),
        .initial_layer_tdata(initial_input_axis_tdata),
        .initial_layer_tvalid(initial_input_axis_tvalid),
        .initial_layer_tlast(initial_input_axis_tlast),
        .intermediate_layer_tdata(new_input_activation_tdata),
        .intermediate_layer_tvalid(new_input_activation_tvalid),
        .intermediate_layer_tlast(new_input_activation_tlast),
        .m_layer_tdata(layer_activation_tdata),
        .m_layer_tvalid(layer_activation_tvalid),
        .m_layer_tlast(layer_activation_tlast)
    );

    // compensating for optical propagation loss
    loss_compensator # (
    ) loss_compensator_inst (
        .clk(clk),
        .rst(rst | reset_all),
        .pre_mul_tdata(adc_00_axis_tdata),
        .pre_mul_tvalid(adc_00_axis_tvalid),
        .pre_mul_tready(),
        .multiply(optical_loss),  // the multiplication parameter
        .post_mul_tdata(amplified_adc_00_axis_tdata),
        .post_mul_tvalid(amplified_adc_00_axis_tvalid),
        .post_mul_tready()
    );

    // detect preamble from incoming ADC data stream
    preamble_detect # (
    ) preamble_detect_inst (
        .clk(clk),
        .rst(rst | reset_all),
        .state_changed(state_changed),
        .input_adc_tdata(amplified_adc_00_axis_tdata),
        .input_adc_tvalid(amplified_adc_00_axis_tvalid),
        .monitor_cycle_length(monitor_cycle_length),
        .preamble_cycle_length(preamble_cycle_length),
        .pattern_match_agg(pattern_match_agg),
        .matched_pattern(),
        .output_detected_tdata(adc_00_accept_tdata),
        .output_detected_tvalid(adc_00_accept_tvalid)
    );

    // Integration module for ADC accepting photonic multiplication output
    reg [15:0] integration_input_cycles;
    reg [15:0] integration_num_outputs;

    always @(posedge clk) begin
        if (new_layer[2:0] == 3'b001) begin
            integration_input_cycles <= INFERENCE_INPUT_CYCLE;
            integration_num_outputs <= LAYER_1_OUTPUT_NUM;
        end else if (new_layer[2:0] == 3'b010) begin
            integration_input_cycles <= LAYER_1_OUTPUT_CYCLE;
            integration_num_outputs <= LAYER_2_OUTPUT_NUM;
        end else if (new_layer[2:0] == 3'b100) begin
            integration_input_cycles <= LAYER_2_OUTPUT_CYCLE;
            integration_num_outputs <= LAYER_3_OUTPUT_NUM;
        end else begin
            integration_input_cycles <= LAYER_3_OUTPUT_CYCLE;
            integration_num_outputs <= 1;
        end
    end

    always @ (posedge clk)
        if (rst | reset_all) begin
            photonic_integration_start <= 1'b0;
            photonic_multiplication_tvalid_state <= 1'b0;
        end else begin
            if (photonic_multiplication_tvalid != photonic_multiplication_tvalid_state && !photonic_multiplication_tvalid_state) begin
                photonic_integration_start <= 1'b1;
                photonic_multiplication_tvalid_state <= photonic_multiplication_tvalid;
            end else if (photonic_multiplication_tvalid != photonic_multiplication_tvalid_state && photonic_multiplication_tvalid_state) begin
                photonic_integration_start <= 1'b0;
                photonic_multiplication_tvalid_state <= photonic_multiplication_tvalid;
            end else begin
                photonic_integration_start <= 1'b0;
            end
        end

    // accumulation of multiplication results
    integration # (
        .LOG2_INPUT_BITWIDTH(8),
        .LOG2_PARALLELISM(4),
        .CYCLE_COUNTER_BITWIDTH(16) /* fine tune me if you want */
    ) integration_inst(
        .clk(clk),
        .rst(rst | reset_all),
        .layer(new_layer[2:0]),
        .s_integration_tdata(adc_00_accept_tdata),
        .s_sign_tdata(weight_sign_tdata),
        .s_sparsity_tdata(sparsity_tdata),
        .s_integration_tvalid(photonic_multiplication_tvalid),
        .s_metadata_tvalid(weight_sign_tvalid),
        .num_input_cycles(integration_input_cycles),
        .num_outputs(integration_num_outputs),
        .m_integration_tdata(integration_photonic_output_tdata),
        .m_integration_tvalid(integration_photonic_output_tvalid)
    );

    // nonlinearity after accumulation
    // - layers 1-2: relu
    // - layer 3: nothing (just take a dead cycle for simplicity)
    wire [ADC_BITWIDTH/16 - 1:0] relu_output_tdata;
    wire relu_output_tvalid;

    assign nonlinear_photonic_output_tdata = (new_layer[0] || new_layer[1]) ?
            relu_output_tdata : integration_photonic_output_tdata;
    assign nonlinear_photonic_output_tvalid = (new_layer[0] || new_layer[1]) ?
            relu_output_tvalid : integration_photonic_output_tvalid;

    relu #(
        .DATA_WIDTH(ADC_BITWIDTH / 16)
    ) relu_inst(
        .clk(clk),
        .rst(rst | reset_all),
        .pre_relu_tdata(integration_photonic_output_tdata),
        .pre_relu_tvalid(integration_photonic_output_tvalid),
        .post_relu_tdata(relu_output_tdata),
        .post_relu_tvalid(relu_output_tvalid)
    );

    // inter layer buffer
    reg [8:0] output_cycle_counter;

    always @(posedge clk) begin
        if (new_layer[2:0] == 3'b001) output_cycle_counter <= LAYER_1_OUTPUT_NUM;
        else if (new_layer[2:0] == 3'b010) output_cycle_counter <= LAYER_2_OUTPUT_NUM;
        else if (new_layer[2:0] == 3'b100) output_cycle_counter <= LAYER_3_OUTPUT_NUM;
        else output_cycle_counter <= 1;
    end

    inter_layer_buffer # (
        .LOG2_PARALLEL_BITWIDTH(8),
        .LOG2_PARALLELISM(4),
        .NUM_LAYERS(3),
        .MAX_LAYER_ENTRIES(300),
        .PREAMBLE_CYCLES_BITWIDTH(16)
    ) inter_layer_buffer_inst (
        .clk(clk),
        .rst(rst | reset_all),
        .input_integrated_tdata(nonlinear_photonic_output_tdata),
        .input_integrated_tvalid(nonlinear_photonic_output_tvalid),
        .input_layer(new_layer[2:0]),
        .input_layer_entries(output_cycle_counter),
        .preamble_cycle_length(preamble_cycle_length),
        .output_mdata(new_input_activation_tdata),
        .output_mvalid(new_input_activation_tvalid),
        .output_mlast(new_input_activation_tlast),
        .output_layer(output_layer_info)
    );

    // final layer softmax
    parallel_logsoftmax # (
        .INPUT_WIDTH(DAC_BITWIDTH)
    ) parallel_logsoftmax_inst(
        .clk(clk),
        .rst(rst),
        .pre_softmax_tdata(new_input_activation_tdata),
        .pre_softmax_tvalid(new_input_activation_tvalid && new_layer[0] && new_layer[1] && new_layer[2]),  // only trigger logsoftmax at the final layer
        .pre_softmax_tlast(),
        .post_softmax_tdata(final_softmax_tdata),
        .post_softmax_tvalid(final_softmax_tvalid),
        .post_softmax_tlast()
    );

    // final results
    always @ (posedge clk)
        if (rst | reset_all) begin
            final_result_tdata <= {DAC_BITWIDTH{1'b0}};
            final_result_tvalid <= 1'b0;
        end else if (output_layer_info == 3'b111) begin
            if (final_softmax_tvalid) begin
                final_result_tdata <= final_softmax_tdata;
                final_result_tvalid <= final_softmax_tvalid;
            end else begin
                final_result_tvalid <= 1'b0;
            end
        end else begin
            final_result_tvalid <= 1'b0;
        end

    ////////////////////////////////////////////////////////////////
    `ifdef XILINX  // ILA monitoring
        ila_preamble_detect ila_preamble_detect_inst (
        .clk(clk),
        .probe0(adc_00_axis_tdata),
        .probe1(adc_00_axis_tvalid),
        .probe2(adc_00_accept_tdata),
        .probe3(adc_00_accept_tvalid),
        .probe4(dac_00_axis_tdata),
        .probe5(dac_00_axis_tvalid),
        .probe6(dac_01_axis_tdata),
        .probe7(dac_01_axis_tvalid),
        .probe8(state_changed)
    );
    `endif

    // print something out, only for verilator
    `ifdef VERILATOR
        integer i;

        always @(posedge clk) begin
            if (final_result_tvalid) begin
                for (i = 0; i < 10; i = i + 1) begin
                    $display("Result %d: %d", i, $signed(final_result_tdata[i*16 +: 16]));
                end
                $display("Overall latency (clock cycles): %d", latency_counter);
                $display("Compute latency (clock cycles): %d", compute_counter);
                $display("Datapath latency (clock cycles): %d", latency_counter - compute_counter);
            end
        end

        integer x;
        always @ (posedge clk) begin
            if (state_changed) begin
                $display("state changed! input image is %d", new_input);
            end
            if (calibrated_loss_valid) begin
                $display("calibrated_loss: %d", calibrated_loss);
            end
            if (final_result_tvalid) begin
                for (x=0; x<10; x=x+1) begin
                    /* verilator lint_off WIDTH */
                    reg_output($sformatf("final_result_tdata[%d]_%d", x, latency_counter), latency_counter, x, $signed(final_result_tdata[x*16 +: 15]));
                end
            end
            end
            // output the ADC readings
            integer r;
            always @ (posedge clk) begin
            if (photonic_multiplication_tvalid && new_layer[2:0] == 3'b001) begin
                for (r=0; r<ADC_BITWIDTH/16; r=r+1) begin
                    /* verilator lint_off WIDTH */
                    reg_output($sformatf("layer_1_adc_00_axis_tdata_%d_%d", latency_counter, r), latency_counter, r, adc_00_axis_tdata[r*16 +: 16]>>7);  // we encode 8 bits positive on photonics
                end
            end

            if (photonic_multiplication_tvalid && new_layer[2:0] == 3'b010) begin
                for (r=0; r<ADC_BITWIDTH/16; r=r+1) begin
                /* verilator lint_off WIDTH */
                reg_output($sformatf("layer_2_adc_00_axis_tdata_%d_%d", latency_counter, r), latency_counter, r, adc_00_axis_tdata[r*16 +: 16]>>7);
                end
            end

            if (photonic_multiplication_tvalid && new_layer[2:0] == 3'b100) begin
                for (r=0; r<ADC_BITWIDTH/16; r=r+1) begin
                /* verilator lint_off WIDTH */
                reg_output($sformatf("layer_3_adc_00_axis_tdata_%d_%d", latency_counter, r), latency_counter, r, adc_00_axis_tdata[r*16 +: 16]>>7);
                end
            end

            // output the post nonlinear values
            if (nonlinear_photonic_output_tvalid && new_layer[2:0] == 3'b001) begin
                for (r=0; r<ADC_BITWIDTH/16; r=r+1) begin
                /* verilator lint_off WIDTH */
                reg_output($sformatf("layer_1_nonlinear_photonic_output_tdata_%d_%d", latency_counter, r), latency_counter, r, $signed(nonlinear_photonic_output_tdata[r*16 +: 16]));
                end
            end

            if (nonlinear_photonic_output_tvalid && new_layer[2:0] == 3'b010) begin
                for (r=0; r<ADC_BITWIDTH/16; r=r+1) begin
                /* verilator lint_off WIDTH */
                reg_output($sformatf("layer_2_nonlinear_photonic_output_tdata_%d_%d", latency_counter, r), latency_counter, r, $signed(nonlinear_photonic_output_tdata[r*16 +: 16]));
                end
            end

            if (nonlinear_photonic_output_tvalid && new_layer[2:0] == 3'b100) begin
                for (r=0; r<ADC_BITWIDTH/16; r=r+1) begin
                /* verilator lint_off WIDTH */
                reg_output($sformatf("layer_3_nonlinear_photonic_output_tdata_%d_%d", latency_counter, r), latency_counter, r, $signed(nonlinear_photonic_output_tdata[r*16 +: 16]));
                end
            end
        end
    `endif

endmodule


`resetall
