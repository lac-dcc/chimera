// This program was cloned from: https://github.com/Mr-Kaushal-22/WS2812_Interfacing
// License: MIT License

module fifo_demo_top #(
    parameter SYNC_CLK           = 0,
    parameter SYNC_STAGE         = 2,
    parameter MODE               = "STANDARD",
    parameter DEPTH              = 512, 
    parameter DATA_WIDTH         = 16,
    parameter PIPELINE_REG       = 1,
    parameter OPTIONAL_FLAGS     = 1,
    parameter OUTPUT_REG         = 0,
    parameter PROGRAMMABLE_FULL  = "STATIC_DUAL",
    parameter PROG_FULL_ASSERT   = 128,
    parameter PROG_FULL_NEGATE   = 196,
    parameter PROGRAMMABLE_EMPTY = "STATIC_DUAL",
    parameter PROG_EMPTY_ASSERT  = 8,
    parameter PROG_EMPTY_NEGATE  = 16,
    parameter ASYM_WIDTH_RATIO   = 5
) (
    input  wire pll_clkout_0,
    input  wire pll_clkout_1,
    input  wire led_clk,
    input  wire pll_lock,
    input  wire sys_rst_n,
    input  wire stop_fifo_wr,
    input  wire stop_fifo_rd,
    output wire pll_reset,
    output reg  led_blink,
    output wire led_rdata_error,
    output wire led_fifo_full,
    output wire led_fifo_empty
);

wire        wr_clk;
wire        rd_clk;
wire [31:0] dut_rdata;
wire [31:0] golden_rdata;
wire        dut_rd_valid;
wire        golden_rd_valid;
wire        dut_trigger_rd;
wire        dut_rst_busy;
wire        golden_rst_busy;
wire        compare_error;
wire        dut_wr_en;
wire        dut_full_o;
wire        dut_empty_o;
wire        sys_rst;
wire        rst_busy_all;

reg        rd_en;
reg        rdata_error;
reg        dut_wren;
reg        dut_wr_en_r;
reg [15:0] dut_wr_data;
reg [31:0] golden_wr_data;
reg        golden_wr_en;

`ifdef SIMULATION
reg [1:0] led_counter;
`else
reg [19:0] led_counter;
`endif

assign pll_reset       = 1'b1;
assign led_rdata_error = rdata_error;
assign led_fifo_full   = dut_full_o;
assign led_fifo_empty  = dut_empty_o;

// ===========================================================
// ========== LED will blink if the design is alive ==========
// ===========================================================

always @ (posedge led_clk) begin
    if (sys_rst) begin
        led_counter <= 'd0;	
    end
    else begin
        led_counter <= led_counter + 1'b1;
    end
end

always @ (posedge led_clk) begin
    if (sys_rst) begin
        led_blink <= 1'b0;	
    end
    else if (&led_counter) begin
        led_blink <= ~led_blink;
    end
end

// ===========================================================
// ========== Asymmetric Width FIFO 1:2 DUT ==================
// ===========================================================

assign wr_clk    = pll_clkout_0;
assign rd_clk    = pll_clkout_1;
assign sys_rst   = ~sys_rst_n;              // push button is active low
assign dut_wr_en = dut_wren & stop_fifo_wr; // push button is active low
assign dut_rd_en = rd_en    & stop_fifo_rd; // push button is active low

assign rst_busy_all = ~dut_rst_busy & ~golden_rst_busy; 

always @ (posedge wr_clk or posedge sys_rst) begin 
    if (sys_rst) begin
        dut_wren    <= 1'b0;
        dut_wr_data <= 16'h0;
    end
    else if (pll_lock &&  rst_busy_all) begin 
        dut_wren    <= 1'b1;
        dut_wr_data <= dut_wr_data + 1'b1;  
    end
end

phy_fifo xdut_1_to_2_fifo (
    .a_rst_i            (sys_rst),
    .wr_clk_i           (wr_clk),
    .wr_en_i            (dut_wr_en),
    .wdata              (dut_wr_data),
    .rd_clk_i           (rd_clk),
    .rd_en_i            (dut_rd_en),
    .rdata              (dut_rdata),
    .rd_valid_o         (dut_rd_valid),
    .prog_full_o        (dut_trigger_rd),
    .rst_busy           (dut_rst_busy),
    .full_o             (dut_full_o),
    .empty_o            (dut_empty_o)
);

always @ (posedge wr_clk or posedge sys_rst) begin
    if (sys_rst) begin
        golden_wr_data <= 'h0;
        dut_wr_en_r    <= 'h0;
    end
    else if (~golden_rst_busy) begin
        golden_wr_data <= {golden_wr_data[15:0],dut_wr_data};    
        dut_wr_en_r    <= dut_wren;    
    end
end

always @ (posedge wr_clk or posedge sys_rst) begin 
    if (sys_rst) begin
        golden_wr_en <= 'h0;
    end
    else if (dut_wr_en_r)begin
        golden_wr_en <= ~golden_wr_en;  
    end
end

// ===========================================================
// ========== Symmetric Width FIFO 1:1 Storage ===============
// ===========================================================

efx_symmetric_width_fifo_top #(
    .SYNC_CLK           (0),
    .OUTPUT_REG         (0),
    .MODE               ("STANDARD"),
    .PIPELINE_REG       (PIPELINE_REG),
    .OPTIONAL_FLAGS     (1'b0),
    .PROGRAMMABLE_FULL  ("NONE"),
    .PROGRAMMABLE_EMPTY ("NONE"),
    .ASYM_WIDTH_RATIO   (4),
    .DATA_WIDTH         (32),
    .DEPTH              (DEPTH)
) xdut_1_to_1_golden (
    .a_rst_i            (sys_rst),
    .wr_clk_i           (wr_clk),
    .wr_en_i            (golden_wr_en),
    .wdata              (golden_wr_data),
    .rd_clk_i           (rd_clk),
    .rd_en_i            (rd_en),
    .rdata              (golden_rdata),
    .rd_valid_o         (golden_rd_valid),
    .rst_busy           (golden_rst_busy)
);

always @ (posedge rd_clk or posedge sys_rst) begin 
    if (sys_rst) begin
        rd_en   <= 1'b0;
    end
    else if (dut_trigger_rd) begin
        rd_en   <= 1'b1;
    end
end

// ===========================================================
// ========== Read Data Comparison Logic =====================
// ===========================================================

assign compare_error = dut_rd_valid|golden_rd_valid ?  dut_rdata != golden_rdata : 0;

always @ (posedge rd_clk or posedge sys_rst) begin 
    if (sys_rst) begin
        rdata_error <= 1'b0;
    end
    else if (compare_error) begin
        rdata_error <= 1'b1;
    end
end

endmodule
