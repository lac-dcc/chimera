/*
 * Software License Agreement (MIT License)
 *
 * Copyright (c) 2018, DUKELEC, Inc.
 * All rights reserved.
 *
 * Author: Duke Fong <d@d-l.io>
 */

module cdctl_pcie(
    input gclk,
    input rst_n,
    input pcie_refclk,
    input pcie_rx,
    output wire pcie_tx,
    output wire clkreq_n,
    output reg led0,
    inout wire [15:0] pio_0_pins
);

assign clkreq_n = 1'b0;

wire top_pll_50m;
wire top_pll_125m;
wire reconfig_busy;
wire [3:0] reconfig_togxb_data;
wire [4:0] reconfig_fromgxb_data;

wire [63:0] test_out;
wire [39:0] test_in;
assign test_in[39:32] = 0;
assign test_in[31:9] = 0;
assign test_in[8:5] = 4'b0101;
assign test_in[4:0] = 5'b01000;


reg [22:0] counter;

always @(posedge top_pll_50m or negedge top_pll_locked)
    if (!top_pll_locked) begin
        counter <= 0;
        led0 <= 1;
    end
    else begin
        counter <= counter + 1;
        if (counter == 0) begin
            led0 <= ~led0;
        end
    end


altpll_ip altpll_top(
    .inclk0(gclk),
    .areset(~rst_n),
    .c0(top_pll_125m),
    .c1(top_pll_50m),
    .locked(top_pll_locked));


cdctl_sys cdctl_sys_m(
    .pcie_ip_cal_blk_clk_clk(top_pll_50m),
    .pcie_ip_fixedclk_clk(top_pll_125m),
    .pcie_ip_pcie_rstn_export(rst_n),
    .pcie_ip_pipe_ext_pipe_mode(1'b0),
    
    .pcie_ip_powerdown_pll_powerdown(~top_pll_locked),
    .pcie_ip_powerdown_gxb_powerdown(~top_pll_locked),
    
    .pcie_ip_refclk_export(pcie_refclk),
    .pcie_ip_rx_in_rx_datain_0(pcie_rx),
    .pcie_ip_tx_out_tx_dataout_0(pcie_tx),
    
    .pcie_ip_test_in_test_in(test_in),
    .pcie_ip_test_out_test_out(test_out),
    
    .pcie_ip_reconfig_gxbclk_clk(top_pll_50m),
    .pcie_ip_reconfig_busy_busy_altgxb_reconfig(reconfig_busy),
    .pcie_ip_reconfig_togxb_data(reconfig_togxb_data),
    .pcie_ip_reconfig_fromgxb_0_data(reconfig_fromgxb_data),
    
    .pio_0_external_connection_export(pio_0_pins));

altgxb_reconfig_ip altgxb_reconfig_m(
    .reconfig_clk(top_pll_50m),
    .reconfig_fromgxb(reconfig_fromgxb_data),
    .busy(reconfig_busy),
    .reconfig_togxb(reconfig_togxb_data));

endmodule
