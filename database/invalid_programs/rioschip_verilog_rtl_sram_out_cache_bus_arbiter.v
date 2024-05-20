// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

`ifndef BUS_ARBITER_V
`define BUS_ARBITER_V
`include "./params.vh"
module bus_arbiter(
`ifdef USE_POWER_PINS
    inout vccd1,       // User area 1 1.8V supply
    inout vssd1,       // User area 1 digital ground
`endif
    input clk, 
    input reset,
    // others <> SOC
    input [31:0] m2_others_wbd_dat_i,
    input [31:0] m2_others_wbd_adr_i, 
    input [3:0] m2_others_wbd_sel_i,
    input m2_others_wbd_we_i,
    input m2_others_wbd_cyc_i,
    input m2_others_wbd_stb_i,
    output [31:0] m2_others_wbd_dat_o,
    output m2_others_wbd_ack_o,
    // D$ <-> Soc
    input [31:0] m2_dcache_wbd_dat_i, 
    input [31:0] m2_dcache_wbd_adr_i, 
    input [3:0] m2_dcache_wbd_sel_i,
    input m2_dcache_wbd_we_i,
    input m2_dcache_wbd_cyc_i,
    input m2_dcache_wbd_stb_i,
    output [31:0] m2_dcache_wbd_dat_o,
    output m2_dcache_wbd_ack_o, 

    // lsu <-> Soc
    output [31:0] m2_wbd_dat_o, 
    output [31:0] m2_wbd_adr_o, 
    output [3:0] m2_wbd_sel_o,
    output [9:0] m2_wbd_bl_o,
    output m2_wbd_bry_o,
    output m2_wbd_we_o,
    output m2_wbd_cyc_o,
    output m2_wbd_stb_o,
    input [31:0] m2_wbd_dat_i,
    input m2_wbd_ack_i
);
reg[1:0] lock;
reg m2_wb_sel_ff; // 0 for others, 1 for dcache
reg [31:0] m2_dcache_wbd_dat;
reg [31:0] m2_dcache_wbd_adr; 
reg [3:0] m2_dcache_wbd_sel;
reg [9:0] m2_dcache_wbd_bl;
reg m2_dcache_wbd_bry;
reg m2_dcache_wbd_we;
reg m2_dcache_wbd_cyc;
reg m2_dcache_wbd_stb;
wire m2_wb_sel = lock == 0 ? ~m2_others_wbd_stb_i : m2_wb_sel_ff;
assign m2_wbd_cyc_o = m2_others_wbd_cyc_i | m2_dcache_wbd_cyc_i;
assign m2_wbd_stb_o = m2_others_wbd_stb_i | m2_dcache_wbd_stb_i;
assign m2_wbd_dat_o = ~m2_wb_sel ? m2_others_wbd_dat_i : m2_dcache_wbd_dat_i;
assign m2_wbd_adr_o = ~m2_wb_sel ? m2_others_wbd_adr_i : m2_dcache_wbd_adr_i;
assign m2_wbd_sel_o = ~m2_wb_sel ? m2_others_wbd_sel_i : m2_dcache_wbd_sel_i;
assign m2_wbd_we_o = ~m2_wb_sel ? m2_others_wbd_we_i : m2_dcache_wbd_we_i;

assign m2_others_wbd_dat_o = m2_wbd_dat_i;
assign m2_dcache_wbd_dat_o = m2_wbd_dat_i;
assign m2_others_wbd_ack_o = (m2_wb_sel == 0) & m2_wbd_ack_i;
assign m2_dcache_wbd_ack_o = (m2_wb_sel == 1) & m2_wbd_ack_i;
// unused wishbone interface for memory
assign m2_wbd_bry_o = m2_wbd_stb_o;
assign m2_wbd_bl_o = m2_wbd_stb_o ? 10'b1 : 10'b0 ;


always @(posedge clk) begin
    if(reset) begin
        lock <= '0;
        m2_wb_sel_ff <= '0;
        m2_dcache_wbd_dat <= '0;
        m2_dcache_wbd_adr <= '0;
        m2_dcache_wbd_sel <= '0;
        m2_dcache_wbd_bl <= '0;
        m2_dcache_wbd_bry <= '0;
        m2_dcache_wbd_we <= '0;
        m2_dcache_wbd_cyc <= '0;
        m2_dcache_wbd_stb <= '0;
    end
    else begin
        if(m2_wbd_stb_o & (lock == 2'b0)) begin
            lock <= 2'b01;
            if(m2_others_wbd_stb_i) begin
                m2_wb_sel_ff <= '0;
            end
            else begin
                m2_wb_sel_ff <= '1;
            end 
        end
        else if(m2_wbd_ack_i) begin
            if(m2_wb_sel_ff == 0) begin
                lock <= '0;
            end
            else begin
                lock <= (lock == 2'b01) ? 2'b10 : 2'b0;
            end 
        end
    end
end

endmodule 
`endif // BUS_ARBITER_V