// This program was cloned from: https://github.com/hipersys-team/lightning
// License: MIT License

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

/*
 * FPGA top-level module in verilator
 */
module lenet_sim # (
  parameter ADC_BITWIDTH = 256,
  parameter DAC_BITWIDTH = 256,
  parameter LAYER_1_OUTPUT_NUM = 300,
  parameter LAYER_1_OUTPUT_CYCLE = 19,
  parameter LAYER_1_ALL_CYCLE = 14700,
  parameter LAYER_2_OUTPUT_NUM = 100,
  parameter LAYER_2_OUTPUT_CYCLE = 7,
  parameter LAYER_2_ALL_CYCLE = 1900,
  parameter LAYER_3_OUTPUT_NUM = 10,
  parameter LAYER_3_OUTPUT_CYCLE = 1,
  parameter LAYER_3_ALL_CYCLE = 70,
  // Width of input (slave) AXI interface data bus in bits
  parameter AXI_ADDR_WIDTH = 32,
  parameter AXI_DATA_WIDTH = 32,
  parameter AXI_STRB_WIDTH = 4,
  // Width of AXI ID signal
  parameter AXI_ID_WIDTH = 16,
  parameter AXI_RAM_DATA_WIDTH = 256,
  parameter CONFIG_REGS_ADDR_WIDTH = 5,  // Width of config_regs address bus in bits
  parameter PHOTONIC_SLACK_CYCLE = 10  // assume the photonic slack time is 10 cycles = 40 ns
) (
  input  wire                      clk,
  input  wire                      rst,

  // AXIl
  input wire [CONFIG_REGS_ADDR_WIDTH-1:0]  s_axil_user_awaddr,
  input wire [2:0]                 s_axil_user_awprot,
  input  wire                      s_axil_user_awvalid,
  output wire                      s_axil_user_awready,
  input  wire [AXI_DATA_WIDTH-1:0] s_axil_user_wdata,
  input wire [AXI_STRB_WIDTH-1:0]  s_axil_user_wstrb,
  input  wire                      s_axil_user_wvalid,
  output wire                      s_axil_user_wready,
  output wire [1:0]                s_axil_user_bresp,
  output wire                      s_axil_user_bvalid,
  input  wire                      s_axil_user_bready,
  input  wire [CONFIG_REGS_ADDR_WIDTH-1:0] s_axil_user_araddr,
  input wire [2:0]                 s_axil_user_arprot,
  input  wire                      s_axil_user_arvalid,
  output wire                      s_axil_user_arready,
  output wire [AXI_DATA_WIDTH-1:0] s_axil_user_rdata,
  output wire [1:0]                s_axil_user_rresp,
  output wire                      s_axil_user_rvalid,
  input  wire                      s_axil_user_rready,

  // AXI RAM interface to initialize weights
    input  wire [AXI_ID_WIDTH-1:0]    s_axi_ram_b_awid,
    input  wire [AXI_ADDR_WIDTH-1:0]  s_axi_ram_b_awaddr,
    input  wire [7:0]             s_axi_ram_b_awlen,
    input  wire [2:0]             s_axi_ram_b_awsize,
    input  wire [1:0]             s_axi_ram_b_awburst,
    input  wire                   s_axi_ram_b_awlock,
    input  wire [3:0]             s_axi_ram_b_awcache,
    input  wire [2:0]             s_axi_ram_b_awprot,
    input  wire                   s_axi_ram_b_awvalid,
    output wire                   s_axi_ram_b_awready,
    input  wire [AXI_RAM_DATA_WIDTH-1:0]  s_axi_ram_b_wdata,
    input  wire [AXI_RAM_DATA_WIDTH/8-1:0]  s_axi_ram_b_wstrb,
    input  wire                   s_axi_ram_b_wlast,
    input  wire                   s_axi_ram_b_wvalid,
    output wire                   s_axi_ram_b_wready,
    output wire [AXI_ID_WIDTH-1:0]    s_axi_ram_b_bid,
    output wire [1:0]             s_axi_ram_b_bresp,
    output wire                   s_axi_ram_b_bvalid,
    input  wire                   s_axi_ram_b_bready,
    input  wire [AXI_ID_WIDTH-1:0]    s_axi_ram_b_arid,
    input  wire [AXI_ADDR_WIDTH-1:0]  s_axi_ram_b_araddr,
    input  wire [7:0]             s_axi_ram_b_arlen,
    input  wire [2:0]             s_axi_ram_b_arsize,
    input  wire [1:0]             s_axi_ram_b_arburst,
    input  wire                   s_axi_ram_b_arlock,
    input  wire [3:0]             s_axi_ram_b_arcache,
    input  wire [2:0]             s_axi_ram_b_arprot,
    input  wire                   s_axi_ram_b_arvalid,
    output wire                   s_axi_ram_b_arready,
    output wire [AXI_ID_WIDTH-1:0]    s_axi_ram_b_rid,
    output wire [AXI_RAM_DATA_WIDTH-1:0]  s_axi_ram_b_rdata,
    output wire [1:0]             s_axi_ram_b_rresp,
    output wire                   s_axi_ram_b_rlast,
    output wire                   s_axi_ram_b_rvalid,
    input  wire                   s_axi_ram_b_rready

);

  ////////////////////       User's logic       //////////////////////
  // ADC channels
  wire [ADC_BITWIDTH-1:0]   adc_00_axis_tdata;
  wire                      adc_00_axis_tvalid;
  wire                      adc_00_axis_tready;

    // DAC channels
  wire [DAC_BITWIDTH-1:0]   dac_00_axis_tdata;
  wire                      dac_00_axis_tvalid;
  wire                      dac_00_axis_tready;

  wire [DAC_BITWIDTH-1:0]   dac_01_axis_tdata;
  wire                      dac_01_axis_tvalid;
  wire                      dac_01_axis_tready;

  wire                      inference_start_signal;


  ////////////////////////////////////////////////////////////////////
  // Simulating the equipment connections
  ////////////////////////////////////////////////////////////////////
  // assign qsfp_tx_axis_tready = 1'b1;

  photonic_multiplier # (
    .LATENCY(PHOTONIC_SLACK_CYCLE)
  ) photonic_multiplier_inst(
    .clk(clk),
    .rst(rst | reset_all_wire),
    .pre_mul_1_tdata(dac_00_axis_tdata),
    .pre_mul_1_tvalid(dac_00_axis_tvalid),
    .pre_mul_1_tready(),
    .pre_mul_2_tdata(dac_01_axis_tdata),
    .pre_mul_2_tvalid(dac_01_axis_tvalid),
    .pre_mul_2_tready(),
    .post_mul_tdata(adc_00_axis_tdata),
    .post_mul_tvalid(adc_00_axis_tvalid),
    .post_mul_tready()
  );

  // AXI register interface begin
  // Width of input (slave) AXI interface wstrb (width of data bus in words)
  wire [CONFIG_REGS_ADDR_WIDTH-1:0]	 reg_wr_addr;
  wire [AXI_DATA_WIDTH-1:0]	         reg_wr_data;
  wire [AXI_STRB_WIDTH-1:0]	         reg_wr_strb;
  wire                               reg_wr_en;
  wire                               reg_wr_wait = 1'b0;
  reg                                reg_wr_ack;
  wire [CONFIG_REGS_ADDR_WIDTH-1:0]  reg_rd_addr;
  wire                               reg_rd_en;
  reg [AXI_DATA_WIDTH-1:0]           reg_rd_data;
  wire                               reg_rd_wait = 1'b0;
  reg                                reg_rd_ack;

  reg [31:0] config_regs [0:31] = '{default:32'b0};  // we have 32 registers each with 32 bit width

  axil_reg_if #(
    .DATA_WIDTH(AXI_DATA_WIDTH),
    .ADDR_WIDTH(CONFIG_REGS_ADDR_WIDTH)
  ) axil_reg_if_inst (
    .clk(clk),
    .rst(rst),
    .s_axil_awaddr(s_axil_user_awaddr),
    .s_axil_awprot(s_axil_user_awprot),
    .s_axil_awvalid(s_axil_user_awvalid),
    .s_axil_awready(s_axil_user_awready),
    .s_axil_wdata(s_axil_user_wdata),
    .s_axil_wstrb(s_axil_user_wstrb),
    .s_axil_wvalid(s_axil_user_wvalid),
    .s_axil_wready(s_axil_user_wready),
    .s_axil_bresp(s_axil_user_bresp),
    .s_axil_bvalid(s_axil_user_bvalid),
    .s_axil_bready(s_axil_user_bready),

    .s_axil_araddr(s_axil_user_araddr),
    .s_axil_arprot(s_axil_user_arprot),
    .s_axil_arvalid(s_axil_user_arvalid),
    .s_axil_arready(s_axil_user_arready),
    .s_axil_rdata(s_axil_user_rdata),
    .s_axil_rresp(s_axil_user_rresp),
    .s_axil_rvalid(s_axil_user_rvalid),
    .s_axil_rready(s_axil_user_rready),

    .reg_wr_addr(reg_wr_addr),
    .reg_wr_data(reg_wr_data),
    .reg_wr_strb(reg_wr_strb),
    .reg_wr_en(reg_wr_en),
    .reg_wr_wait(reg_wr_wait),
    .reg_wr_ack(reg_wr_ack),

    .reg_rd_addr(reg_rd_addr),
    .reg_rd_en(reg_rd_en),
    .reg_rd_data(reg_rd_data),
    .reg_rd_wait(reg_rd_wait),
    .reg_rd_ack(reg_rd_ack)
    );

  reg result_output_valid;

  always @(posedge clk) begin
    if (rst | reset_all_wire) begin
      reg_wr_ack <= 1'b0;
      config_regs[31] <= 32'h2242;
      result_output_valid <= 1'b0;
      reg_rd_data <= '{default:'0};
    end else begin
      reg_wr_ack <= 1'b0;
      reg_rd_data <= '{default:'0};

      if (reg_rd_en == 1'b1) begin
        /* verilator lint_off WIDTH */
        reg_rd_data <= config_regs[reg_rd_addr[4:0]];
        reg_rd_ack <= 1'b1;
      end else begin
        reg_rd_ack <= 1'b0;
      end

      if (reg_wr_en == 1'b1) begin
        config_regs[reg_wr_addr[4:0]] <= reg_wr_data;
        reg_wr_ack <= 1'b1;
      end else begin
        // config_regs[30] <= latency_counter;
        // config_regs[29][2:0] <= new_layer[2:0];
        // config_regs[16][31:16] <= calibrated_loss;

        if (final_result_tvalid == 1'b1) begin
          result_output_valid <= 1'b1;
          config_regs[13] <= final_result_tdata[015:000];
          config_regs[12] <= final_result_tdata[031:016];
          config_regs[11] <= final_result_tdata[047:032];
          config_regs[10] <= final_result_tdata[063:048];
          config_regs[09] <= final_result_tdata[079:064];
          config_regs[08] <= final_result_tdata[095:080];
          config_regs[07] <= final_result_tdata[111:096];
          config_regs[06] <= final_result_tdata[127:112];
          config_regs[05] <= final_result_tdata[143:128];
          config_regs[04] <= final_result_tdata[159:144];
        end

        if (!inference_start) begin
          config_regs[4:14] <= '{default:32'b0}; // Reset final result values
        end

        if (result_output_valid) begin
          result_output_valid <= 1'b0;
        end
      end
    end
  end  // AXI register interface end

  ////////////////////////////////////////////////////////////////////
  // Memory logic
  ////////////////////////////////////////////////////////////////////
  wire [DAC_BITWIDTH-1:0]   initial_input_axis_tdata;
  wire                      initial_input_axis_tvalid;
  wire                      initial_input_axis_tlast;

  // RAM that stores the input activations (different images)
  input_activation_lenet # (
      .ACTIVATION_DATA_WIDTH(DAC_BITWIDTH),
      .REPETITION_TIMES(LAYER_1_OUTPUT_NUM)
  ) input_activation_inst(
      .clk(clk),
      .rst(rst | reset_all_wire),
      .index(input_image_index[15:0]),
      .layer(in_module_layer[2:0]),
      .state_changed(state_changed_wire),
      .data_out(initial_input_axis_tdata),
      .data_valid(initial_input_axis_tvalid),
      .data_last(initial_input_axis_tlast)
  );

  wire [DAC_BITWIDTH-1:0] weight_matrix_tdata_sram;
  wire weight_matrix_tvalid_sram;
  wire [DAC_BITWIDTH/16-1:0] weight_sign_tdata_sram;
  wire weight_sign_tvalid_sram;
  wire [DAC_BITWIDTH-1:0] weight_matrix_tdata_dram;
  wire weight_matrix_tvalid_dram;
  wire [DAC_BITWIDTH-1:0] weight_matrix_tdata_temp;
  wire weight_matrix_tvalid_temp;

  wire photonic_integration_start_wire;

  weight_matrix_absolute_lenet # (
      .WEIGHT_DATA_BITWIDTH(DAC_BITWIDTH),
      .WEIGHT_CYCLE_NUM_1(LAYER_1_ALL_CYCLE),
      .WEIGHT_CYCLE_NUM_2(LAYER_2_ALL_CYCLE),
      .WEIGHT_CYCLE_NUM_3(LAYER_3_ALL_CYCLE)
  ) weight_matrix_absolute_inst(
      .clk(clk),
      .rst(rst | reset_all_wire),
      .layer(in_module_layer[2:0]),
      .state_changed(state_changed_wire),
      .data_out(weight_matrix_tdata_temp),
      .data_valid(weight_matrix_tvalid_temp)
  );

  axis_delay # (
      .DATA_WIDTH(DAC_BITWIDTH),
      .LATENCY(1)
  ) delay_weight_sram (
      .clk(clk),
      .rst(rst | reset_all_wire),
      .s_axis_tdata(weight_matrix_tdata_temp),
      .s_axis_tvalid(weight_matrix_tvalid_temp),
      .s_axis_tlast(),
      .m_axis_tdata(weight_matrix_tdata_sram),
      .m_axis_tvalid(weight_matrix_tvalid_sram),
      .m_axis_tlast()
  );

  // RAM for the sign of lenet
  weight_matrix_sign_lenet # (
    .WEIGHT_SIGN_BITWIDTH(DAC_BITWIDTH/16),
    .WEIGHT_CYCLE_NUM_1(LAYER_1_ALL_CYCLE),
    .WEIGHT_CYCLE_NUM_2(LAYER_2_ALL_CYCLE),
    .WEIGHT_CYCLE_NUM_3(LAYER_3_ALL_CYCLE)
  )weight_matrix_sign_inst(
    .clk(clk),
    .rst(rst | reset_all_wire),
    .layer(in_module_layer[2:0]),
    .integration_start(photonic_integration_start_wire),
    .sign_out(weight_sign_tdata_sram),
    .sign_valid(weight_sign_tvalid_sram)
  );

  ////////////////////////////////////////////////////////////////////
  // Top module of model runner
  ////////////////////////////////////////////////////////////////////
  wire [15:0] input_image_index = config_regs[00][15:0];
  wire inference_start = config_regs[03][0];
  wire calibration_start = config_regs[03][1];
  wire use_ddr_for_weight = config_regs[03][2];
  wire use_sparsity_wire = config_regs[03][3];
  wire [15:0] optical_loss = config_regs[17][15:0];
  wire [15:0] calibration_length_wire = config_regs[18][15:0];
  wire [15:0] calibration_wave_type = config_regs[19][15:0];
  wire [15:0] estimate_photonic_slack_cycle_length = config_regs[20][15:0];
  wire [15:0] monitor_cycle_length = config_regs[27][15:0];   // monitor_cycle_length >= preamble_cycle_length + estimate_photonic_slack_cycle_length + 9
  wire [3:0] preamble_cycle_length = config_regs[28][3:0];
  wire [15:0] propagation_cycle_delay_between_modulators = config_regs[29][15:0];
  wire [15:0] propagation_cycle_shift_between_modulators = config_regs[30][15:0];

  wire [DAC_BITWIDTH-1:0] final_result_tdata;
  wire final_result_tvalid;

  wire [255:0] pattern_match_agg;
  wire state_changed_wire;
  wire [15:0] in_module_layer;
  wire reset_all_wire;

  reg weight_ready_reg;
  always @ (posedge clk)
      weight_ready_reg <= inference_start;

  lenet_single_core # (
    .ADC_BITWIDTH(ADC_BITWIDTH),
    .DAC_BITWIDTH(DAC_BITWIDTH)
  ) lenet_single_core_inst (
    .clk(clk),
    .rst(rst),

    // initial input data from model runner, sourced from SRAM or CMAC
    .initial_input_axis_tdata(initial_input_axis_tdata),
    .initial_input_axis_tvalid(initial_input_axis_tvalid),
    .initial_input_axis_tlast(initial_input_axis_tlast),
    .initial_input_axis_tready(),

    // DNN weights data from model runner, sourced from SRAM or DRAM
    .weight_matrix_tdata(weight_matrix_tdata_sram),
    .weight_matrix_tvalid(weight_matrix_tvalid_sram),
    .weight_matrix_tready(),
    .weight_sign_tdata(weight_sign_tdata_sram),
    .weight_sign_tvalid(weight_sign_tvalid_sram),
    .weight_sign_tready(),

    // ADC channels
    .adc_00_axis_tdata (adc_00_axis_tdata),
    .adc_00_axis_tvalid(adc_00_axis_tvalid),
    .adc_00_axis_tready(adc_00_axis_tready),

    // DAC channels
    .dac_00_axis_tdata (dac_00_axis_tdata),
    .dac_00_axis_tvalid(dac_00_axis_tvalid),
    .dac_00_axis_tready(dac_00_axis_tready),

    .dac_01_axis_tdata (dac_01_axis_tdata),
    .dac_01_axis_tvalid(dac_01_axis_tvalid),
    .dac_01_axis_tready(dac_01_axis_tready),

    .inference_start(inference_start),
    .calibration_start(calibration_start),
    .weight_ready(weight_ready_reg),
    .use_sparsity(use_sparsity_wire),
    .input_image_index(input_image_index),
    .optical_loss(optical_loss),
    .monitor_cycle_length(monitor_cycle_length),
    .preamble_cycle_length(preamble_cycle_length),
    .calibration_length_wire(calibration_length_wire),
    .calibration_wave_type(calibration_wave_type),
    .estimate_photonic_slack_cycle_length(estimate_photonic_slack_cycle_length),
    .propagation_cycle_delay_between_modulators(propagation_cycle_delay_between_modulators),
    .propagation_cycle_shift_between_modulators(propagation_cycle_shift_between_modulators),

    .state_changed_wire(state_changed_wire),
    .reset_all_wire(reset_all_wire),
    .photonic_integration_start_wire(photonic_integration_start_wire),
    .start_clock_count(),
    .final_clock_count(),
    .final_result_tdata(final_result_tdata),
    .final_result_tvalid(final_result_tvalid),
    .in_module_layer(in_module_layer),
    .pattern_match_agg(pattern_match_agg),
    .calibrated_loss(),
    .calibrated_loss_valid()
  );

endmodule

`resetall