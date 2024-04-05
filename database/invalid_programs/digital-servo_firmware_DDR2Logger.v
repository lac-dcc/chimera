///////////////////////////////////////////////////////////////////////////////
// DDR2Logger.v
//
// 6/20/11
// David Leibrandt
//
//	Logging module.  Stores data to the DDR2 RAM to be read out later via a pipe.
//
// cmd_addr_in = 16'h1000?? --- Reset FIFOs and enter read mode
// cmd_addr_in = 16'h1001?? --- Reset FIFOs and write for next cmd_data_in clock cycles
//
///////////////////////////////////////////////////////////////////////////////

`include "timescale.v"

module DDR2Logger(
	input	 wire			 clk_in,
	input  wire			 rst_in,
	
	input  wire 		 cmd_trig_in,
	input  wire [15:0] cmd_addr_in,
	input  wire [15:0] cmd_data_in,
	
	input wire [239:0] data_in,
	
	input  wire	[8:0]	 PipeCount_in,
   output wire			 PipeReset_out,
	output wire			 PipeWriteClock_out,
	output wire			 PipeWrite_out,
   output wire [63:0] PipeData_out,
	
	inout  wire [15:0] mcb3_dram_dq,
	output wire [12:0] mcb3_dram_a,
	output wire [2:0]  mcb3_dram_ba,
	output wire        mcb3_dram_ras_n,
	output wire        mcb3_dram_cas_n,
	output wire        mcb3_dram_we_n,
	output wire        mcb3_dram_odt,
	output wire        mcb3_dram_cke,
	output wire        mcb3_dram_dm,
	inout  wire        mcb3_dram_udqs,
	inout  wire        mcb3_dram_udqs_n,
	inout  wire        mcb3_rzq,
	inout  wire        mcb3_zio,
	output wire        mcb3_dram_udm,
	inout  wire        mcb3_dram_dqs,
	inout  wire        mcb3_dram_dqs_n,
	output wire        mcb3_dram_ck,
	output wire        mcb3_dram_ck_n,
	output wire        mcb3_dram_cs_n,
	input  wire			 c3_sys_rst_n
);

// Latch the input commands
reg 			readEnable_f, writeEnable_f, reset_f;
reg [25:0]	writeCounter_f;
reg [16:0]	data_clk_divider_f;

always @(posedge clk_in) begin
	if (rst_in) begin
		readEnable_f <= 1'b0;
		writeEnable_f <= 1'b0;
		writeCounter_f <= 26'b0;
		reset_f <= 1'b1;
		data_clk_divider_f <= 17'h64;
	end
	else begin
		if (cmd_trig_in & (cmd_addr_in[15:12] == 4'h1)) begin
			case (cmd_addr_in[3:0])
				4'h0:	begin
							readEnable_f <= 1'b1;
							writeCounter_f <= 26'b0;
							reset_f <= 1'b1;
						end
				4'h1:	begin
							readEnable_f <= 1'b0;
							writeCounter_f <= {cmd_data_in, 10'b0};
							reset_f <= 1'b1;
						end
				4'h2:	begin
							data_clk_divider_f <= {cmd_data_in, 1'b0};
						end
			endcase
		end
		else begin
			reset_f <= 1'b0;
			writeCounter_f <= ((writeCounter_f > 0) && data_clk_f) ? writeCounter_f - 1'b1 : writeCounter_f;
			writeEnable_f <= (writeCounter_f > 0) ? 1'b1 : 1'b0;
		end
	end
end

// Latch the input data to prevent glitches
reg [239:0] data_in1;
always @(posedge clk_in) data_in1 <= data_in;

// Clock divider & data latch
// Don't latch the data when the the data clock is switching
reg   [239:0]  data_f;
reg				data_clk_f;
reg	[16:0]	clk_counter_f;

always @(posedge clk_in or posedge rst_in) begin
	if (rst_in) begin
		data_f <= 240'b0;
		clk_counter_f <= 17'b0;
		data_clk_f <= 1'b0;
	end
	else if (clk_counter_f == (data_clk_divider_f - 17'b1)) begin
		clk_counter_f <= 17'b0;
		data_clk_f <= 1'b1;
	end
	else if (clk_counter_f == 17'b0) begin
		clk_counter_f <= clk_counter_f + 17'b1;
		data_clk_f <= 1'b0;
	end
	else begin
		data_f <= data_in1;
		clk_counter_f <= clk_counter_f + 17'b1;
		data_clk_f <= 1'b0;
	end
end

// Wires
wire                              c3_sys_clk;
wire                              c3_error;
wire                              c3_calib_done;
wire                              c3_clk0;
wire                              c3_rst0;
wire                              c3_async_rst;
wire                              c3_sysclk_2x;
wire                              c3_sysclk_2x_180;
wire                              c3_pll_ce_0;
wire                              c3_pll_ce_90;
wire                              c3_pll_lock;
wire                              c3_mcb_drp_clk;
wire                              c3_cmp_error;
wire                              c3_cmp_data_valid;
wire                              c3_vio_modify_enable;
wire  [127:0]                     c3_error_status;
wire  [2:0]                       c3_vio_data_mode_value;
wire  [2:0]                       c3_vio_addr_mode_value;
wire  [31:0]                      c3_cmp_data;
wire                              c3_p0_cmd_en;
wire [2:0]                        c3_p0_cmd_instr;
wire [5:0]                        c3_p0_cmd_bl;
wire [29:0]                       c3_p0_cmd_byte_addr;
wire                              c3_p0_cmd_empty;
wire                              c3_p0_cmd_full;
wire                              c3_p0_wr_en;
wire [3:0]                        c3_p0_wr_mask;
wire [31:0]                       c3_p0_wr_data;
wire                              c3_p0_wr_full;
wire                              c3_p0_wr_empty;
wire [6:0]                        c3_p0_wr_count;
wire                              c3_p0_wr_underrun;
wire                              c3_p0_wr_error;
wire                              c3_p0_rd_en;
wire [31:0]                       c3_p0_rd_data;
wire                              c3_p0_rd_full;
wire                              c3_p0_rd_empty;
wire [6:0]                        c3_p0_rd_count;
wire                              c3_p0_rd_overflow;
wire                              c3_p0_rd_error;

wire        RAMinputbufferRead;
wire [63:0] RAMinputbufferDataOut;
wire [8:0]  RAMinputbufferCount;
wire        RAMinputbufferValid;
wire        RAMinputbufferEmpty;

assign mcb3_dram_cs_n = 1'b0;

assign PipeWriteClock_out = c3_clk0;
assign PipeReset_out = reset_f;

// Memory controller - generated by xilinx MIG (memory interface generator)
memc3_infrastructure #
(
   .C_MEMCLK_PERIOD                  (3200),
   .C_RST_ACT_LOW                    (0),
   .C_INPUT_CLK_TYPE                 ("DIFFERENTIAL"),
   .C_CLKOUT0_DIVIDE                 (1),
   .C_CLKOUT1_DIVIDE                 (1),
   .C_CLKOUT2_DIVIDE                 (16),
   .C_CLKOUT3_DIVIDE                 (8),
   .C_CLKFBOUT_MULT                  (2),
   .C_DIVCLK_DIVIDE                  (1)
)
memc3_infrastructure_inst
(
   .sys_clk                        (clk_in),
   .sys_rst_n                      (c3_sys_rst_n),
   .clk0                           (c3_clk0),
   .rst0                           (c3_rst0),
   .async_rst                      (c3_async_rst),
   .sysclk_2x                      (c3_sysclk_2x),
   .sysclk_2x_180                  (c3_sysclk_2x_180),
   .pll_ce_0                       (c3_pll_ce_0),
   .pll_ce_90                      (c3_pll_ce_90),
   .pll_lock                       (c3_pll_lock),
   .mcb_drp_clk                    (c3_mcb_drp_clk)
);

memc3_wrapper #
(
   .C_MEMCLK_PERIOD                  (3200),
   .C_CALIB_SOFT_IP                  ("TRUE"),
   .C_SIMULATION                     ("FALSE"),
   .C_ARB_NUM_TIME_SLOTS             (12),
   .C_ARB_TIME_SLOT_0                (3'o0),
   .C_ARB_TIME_SLOT_1                (3'o0),
   .C_ARB_TIME_SLOT_2                (3'o0),
   .C_ARB_TIME_SLOT_3                (3'o0),
   .C_ARB_TIME_SLOT_4                (3'o0),
   .C_ARB_TIME_SLOT_5                (3'o0),
   .C_ARB_TIME_SLOT_6                (3'o0),
   .C_ARB_TIME_SLOT_7                (3'o0),
   .C_ARB_TIME_SLOT_8                (3'o0),
   .C_ARB_TIME_SLOT_9                (3'o0),
   .C_ARB_TIME_SLOT_10               (3'o0),
   .C_ARB_TIME_SLOT_11               (3'o0),
   .C_MEM_TRAS                       (40000),
   .C_MEM_TRCD                       (15000),
   .C_MEM_TREFI                      (7800000),
   .C_MEM_TRFC                       (127500),
   .C_MEM_TRP                        (15000),
   .C_MEM_TWR                        (15000),
   .C_MEM_TRTP                       (7500),
   .C_MEM_TWTR                       (7500),
   .C_MEM_ADDR_ORDER                 ("ROW_BANK_COLUMN"),
   .C_NUM_DQ_PINS                    (16),
   .C_MEM_TYPE                       ("DDR2"),
   .C_MEM_DENSITY                    ("1Gb"),
   .C_MEM_BURST_LEN                  (4),
   .C_MEM_CAS_LATENCY                (5),
   .C_MEM_ADDR_WIDTH                 (13),
   .C_MEM_BANKADDR_WIDTH             (3),
   .C_MEM_NUM_COL_BITS               (10),
   .C_MEM_DDR1_2_ODS                 ("FULL"),
   .C_MEM_DDR2_RTT                   ("50OHMS"),
   .C_MEM_DDR2_DIFF_DQS_EN           ("YES"),
   .C_MEM_DDR2_3_PA_SR               ("FULL"),
   .C_MEM_DDR2_3_HIGH_TEMP_SR        ("NORMAL"),
   .C_MEM_DDR3_CAS_LATENCY           (6),
   .C_MEM_DDR3_ODS                   ("DIV6"),
   .C_MEM_DDR3_RTT                   ("DIV2"),
   .C_MEM_DDR3_CAS_WR_LATENCY        (5),
   .C_MEM_DDR3_AUTO_SR               ("ENABLED"),
   .C_MEM_DDR3_DYN_WRT_ODT           ("OFF"),
   .C_MEM_MOBILE_PA_SR               ("FULL"),
   .C_MEM_MDDR_ODS                   ("FULL"),
   .C_MC_CALIB_BYPASS                ("NO"),
   .C_MC_CALIBRATION_MODE            ("CALIBRATION"),
   .C_MC_CALIBRATION_DELAY           ("HALF"),
   .C_SKIP_IN_TERM_CAL               (0),
   .C_SKIP_DYNAMIC_CAL               (0),
   .C_LDQSP_TAP_DELAY_VAL            (0),
   .C_LDQSN_TAP_DELAY_VAL            (0),
   .C_UDQSP_TAP_DELAY_VAL            (0),
   .C_UDQSN_TAP_DELAY_VAL            (0),
   .C_DQ0_TAP_DELAY_VAL              (0),
   .C_DQ1_TAP_DELAY_VAL              (0),
   .C_DQ2_TAP_DELAY_VAL              (0),
   .C_DQ3_TAP_DELAY_VAL              (0),
   .C_DQ4_TAP_DELAY_VAL              (0),
   .C_DQ5_TAP_DELAY_VAL              (0),
   .C_DQ6_TAP_DELAY_VAL              (0),
   .C_DQ7_TAP_DELAY_VAL              (0),
   .C_DQ8_TAP_DELAY_VAL              (0),
   .C_DQ9_TAP_DELAY_VAL              (0),
   .C_DQ10_TAP_DELAY_VAL             (0),
   .C_DQ11_TAP_DELAY_VAL             (0),
   .C_DQ12_TAP_DELAY_VAL             (0),
   .C_DQ13_TAP_DELAY_VAL             (0),
   .C_DQ14_TAP_DELAY_VAL             (0),
   .C_DQ15_TAP_DELAY_VAL             (0)
)
memc3_wrapper_inst
(
   .mcb3_dram_dq                        (mcb3_dram_dq),
   .mcb3_dram_a                         (mcb3_dram_a),
   .mcb3_dram_ba                        (mcb3_dram_ba),
   .mcb3_dram_ras_n                     (mcb3_dram_ras_n),
   .mcb3_dram_cas_n                     (mcb3_dram_cas_n),
   .mcb3_dram_we_n                      (mcb3_dram_we_n),
   .mcb3_dram_odt                       (mcb3_dram_odt),
   .mcb3_dram_cke                       (mcb3_dram_cke),
   .mcb3_dram_dm                        (mcb3_dram_dm),
   .mcb3_dram_udqs                      (mcb3_dram_udqs),
   .mcb3_dram_udqs_n                    (mcb3_dram_udqs_n),
   .mcb3_rzq                            (mcb3_rzq),
   .mcb3_zio                            (mcb3_zio),
   .mcb3_dram_udm                       (mcb3_dram_udm),
   .calib_done                          (c3_calib_done),
   .async_rst                           (c3_async_rst),
   .sysclk_2x                           (c3_sysclk_2x),
   .sysclk_2x_180                       (c3_sysclk_2x_180),
   .pll_ce_0                            (c3_pll_ce_0),
   .pll_ce_90                           (c3_pll_ce_90),
   .pll_lock                            (c3_pll_lock),
   .mcb_drp_clk                         (c3_mcb_drp_clk),
   .mcb3_dram_dqs                       (mcb3_dram_dqs),
   .mcb3_dram_dqs_n                     (mcb3_dram_dqs_n),
   .mcb3_dram_ck                        (mcb3_dram_ck),
   .mcb3_dram_ck_n                      (mcb3_dram_ck_n),
   .p0_cmd_clk                          (c3_clk0),
   .p0_cmd_en                           (c3_p0_cmd_en),
   .p0_cmd_instr                        (c3_p0_cmd_instr),
   .p0_cmd_bl                           (c3_p0_cmd_bl),
   .p0_cmd_byte_addr                    (c3_p0_cmd_byte_addr),
   .p0_cmd_empty                        (c3_p0_cmd_empty),
   .p0_cmd_full                         (c3_p0_cmd_full),
   .p0_wr_clk                           (c3_clk0),
   .p0_wr_en                            (c3_p0_wr_en),
   .p0_wr_mask                          (c3_p0_wr_mask),
   .p0_wr_data                          (c3_p0_wr_data),
   .p0_wr_full                          (c3_p0_wr_full),
   .p0_wr_empty                         (c3_p0_wr_empty),
   .p0_wr_count                         (c3_p0_wr_count),
   .p0_wr_underrun                      (c3_p0_wr_underrun),
   .p0_wr_error                         (c3_p0_wr_error),
   .p0_rd_clk                           (c3_clk0),
   .p0_rd_en                            (c3_p0_rd_en),
   .p0_rd_data                          (c3_p0_rd_data),
   .p0_rd_full                          (c3_p0_rd_full),
   .p0_rd_empty                         (c3_p0_rd_empty),
   .p0_rd_count                         (c3_p0_rd_count),
   .p0_rd_overflow                      (c3_p0_rd_overflow),
   .p0_rd_error                         (c3_p0_rd_error)
);

// WireIn00 = 16'b0001???????????? --- RAM read enable
// WireIn00 = 16'b0010???????????? --- RAM write enable
// WireIn00 = 16'b0100???????????? --- reset FIFOs

// State machine which coordinates writing to and reading from the RAM
ddr2_controller ddr2_controller1
(
	.clk(c3_clk0),
	.reset(reset_f | c3_rst0), 
	.reads_en(readEnable_f),
	.writes_en(writeEnable_f),
	.calib_done(c3_calib_done), 

	.ib_re(RAMinputbufferRead),
	.ib_data(RAMinputbufferDataOut),
	.ib_count(RAMinputbufferCount),
	.ib_valid(RAMinputbufferValid),
	.ib_empty(RAMinputbufferEmpty),
	
	.ob_we(PipeWrite_out),
	.ob_data(PipeData_out),
	.ob_count(PipeCount_in),
	
	.p0_rd_en_o(c3_p0_rd_en),  
	.p0_rd_empty(c3_p0_rd_empty), 
	.p0_rd_data(c3_p0_rd_data), 
	
	.p0_cmd_en(c3_p0_cmd_en),
	.p0_cmd_full(c3_p0_cmd_full), 
	.p0_cmd_instr(c3_p0_cmd_instr),
	.p0_cmd_byte_addr(c3_p0_cmd_byte_addr), 
	.p0_cmd_bl_o(c3_p0_cmd_bl), 
	
	.p0_wr_en(c3_p0_wr_en),
	.p0_wr_full(c3_p0_wr_full), 
	.p0_wr_data(c3_p0_wr_data), 
	.p0_wr_mask(c3_p0_wr_mask) 
);

// FIFO for buffering data to be written to the RAM
fifo_w256_128_r64_512 RAMinputbuffer_fifo (
	.rst(reset_f),
	.wr_clk(clk_in),
	.rd_clk(c3_clk0),
	.din({16'h2323, data_f}), // Bus [255 : 0] 
	.wr_en(data_clk_f),
	.rd_en(RAMinputbufferRead),
	.dout(RAMinputbufferDataOut), // Bus [63 : 0] 
	.empty(RAMinputbufferEmpty),
	.valid(RAMinputbufferValid),
	.rd_data_count(RAMinputbufferCount) // Bus [8 : 0] 
);

endmodule