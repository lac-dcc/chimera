/* mor1kx_wrapper.v */

// only removes all un-needed signals

module mor1kx_wrapper #(
  parameter AW = 24
)(
  // system
  input wire            clk,
  input wire            rst,
  // data bus
  output wire           dcpu_cs,
  output wire           dcpu_we,
  output wire [  4-1:0] dcpu_sel,
  output wire [ AW-1:0] dcpu_adr,
  output wire [ 32-1:0] dcpu_dat_w,
  input  wire [ 32-1:0] dcpu_dat_r,
  input  wire           dcpu_ack,
  // instruction bus
  output wire           icpu_cs,
  output wire           icpu_we,
  output wire [  4-1:0] icpu_sel,
  output wire [ AW-1:0] icpu_adr,
  output wire [ 32-1:0] icpu_dat_w,
  input  wire [ 32-1:0] icpu_dat_r,
  input  wire           icpu_ack
);

wire [ 31:0] d_adr;
wire         d_stb;
wire         d_cyc;
reg          d_ack;

wire [ 31:0] i_adr;
wire         i_stb;
wire         i_cyc;
reg          i_ack;

// cut address to desired width
assign dcpu_adr = d_adr[AW-1:0];
assign icpu_adr = i_adr[AW-1:0];


assign dcpu_cs = d_stb & d_cyc & !d_ack;
assign icpu_cs = i_stb & i_cyc & !i_ack;

always @(posedge clk) begin
  d_ack <= dcpu_ack & dcpu_cs;
  i_ack <= icpu_ack & icpu_cs;
end

mor1kx #(
    .FEATURE_DEBUGUNIT("NONE"),
    .FEATURE_CMOV("NONE"),
    .FEATURE_FFL1("NONE"),
    .FEATURE_ATOMIC("NONE"),
    .FEATURE_STORE_BUFFER("NONE"),
    .FEATURE_PIC("NONE"),
    .FEATURE_TIMER("NONE"),
    .FEATURE_MULTIPLIER("NONE"),
    .FEATURE_DIVIDER("NONE"),
    .FEATURE_INSTRUCTIONCACHE("NONE"),
    .OPTION_ICACHE_BLOCK_WIDTH(4),
    .OPTION_ICACHE_SET_WIDTH(8),
    .OPTION_ICACHE_WAYS(1),
    .OPTION_ICACHE_LIMIT_WIDTH(32),
    .FEATURE_IMMU("NONE"),
    .FEATURE_DATACACHE("NONE"),
    .OPTION_DCACHE_BLOCK_WIDTH(4),
    .OPTION_DCACHE_SET_WIDTH(8),
    .OPTION_DCACHE_WAYS(1),
    .OPTION_DCACHE_LIMIT_WIDTH(31),
    .FEATURE_DMMU("NONE"),

    .IBUS_WB_TYPE("B3_REGISTERED_FEEDBACK"),
    .DBUS_WB_TYPE("B3_REGISTERED_FEEDBACK"),
    .OPTION_CPU0("CAPPUCCINO"),
    .OPTION_RESET_PC(32'h00000004)
) mor1kx0 (
    .iwbm_adr_o(i_adr),
    .iwbm_stb_o(i_stb),
    .iwbm_cyc_o(i_cyc),
    .iwbm_sel_o(icpu_sel),
    .iwbm_we_o (icpu_we),
    .iwbm_cti_o(),
    .iwbm_bte_o(),
    .iwbm_dat_o(icpu_dat_w),

    .dwbm_adr_o(d_adr),
    .dwbm_stb_o(d_stb),
    .dwbm_cyc_o(d_cyc),
    .dwbm_sel_o(dcpu_sel),
    .dwbm_we_o (dcpu_we),
    .dwbm_cti_o(),
    .dwbm_bte_o(),
    .dwbm_dat_o(dcpu_dat_w),

    .clk(clk),
    .rst(rst),

    .iwbm_err_i(1'b0),
    .iwbm_ack_i(i_ack),
    .iwbm_dat_i(icpu_dat_r),
    .iwbm_rty_i(1'b0),

    .dwbm_err_i(1'b0),
    .dwbm_ack_i(d_ack),
    .dwbm_dat_i(dcpu_dat_r),
    .dwbm_rty_i(1'b0),

    .avm_d_address_o (),
    .avm_d_byteenable_o (),
    .avm_d_read_o (),
    .avm_d_readdata_i (32'h00000000),
    .avm_d_burstcount_o (),
    .avm_d_write_o (),
    .avm_d_writedata_o (),
    .avm_d_waitrequest_i (1'b0),
    .avm_d_readdatavalid_i (1'b0),

    .avm_i_address_o (),
    .avm_i_byteenable_o (),
    .avm_i_read_o (),
    .avm_i_readdata_i (32'h00000000),
    .avm_i_burstcount_o (),
    .avm_i_waitrequest_i (1'b0),
    .avm_i_readdatavalid_i (1'b0),

    .irq_i(32'h00000000),

    .du_addr_i(16'h0000),
    .du_stb_i(1'b0),
    .du_dat_i(32'h00000000),
    .du_we_i(1'b0),
    .du_dat_o(),
    .du_ack_o(),
    .du_stall_i(1'b0),
    .du_stall_o()
);

endmodule
