`include "riscvConst.vh"
`include "macros.vh"

module riscvProcDpath_PCR #
(
  parameter COREID = 0,
  parameter HAS_FPU = 0,
  parameter HAS_VECTOR = 0
)
(
  input clk,
  input reset,

  output [7:0] status,
  output [7:0] vec_bank,
  output [3:0] vec_bank_count,
  output error_mode,
  output log_control,

  input htif_fromhost_wen,
  input [31:0] htif_fromhost,
  output [31:0] htif_tohost,

  input exception,
  input [4:0] cause,
  input [31:0] pc,

  input eret,

  input [4:0]  raddr,
  input        ren,
  output [63:0] rdata,

  input [4:0]  waddr,
  input        wen,
  input [63:0] wdata
);

  reg        reg_error_mode;
  reg [7:0]  reg_status_im;
  reg        reg_status_sx;
  reg        reg_status_ux;
  reg        reg_status_ef;
  reg        reg_status_ev;
  reg        reg_status_s;
  reg        reg_status_ps;
  reg        reg_status_et;
  reg [31:0] reg_epc;
  reg [31:0] reg_badvaddr;
  reg [31:0] reg_ebase;
  reg [31:0] reg_count;
  reg [31:0] reg_compare;
  reg [4:0]  reg_cause;
  reg        reg_log_control;
  reg [31:0] reg_tohost;
  reg [31:0] reg_fromhost;
  reg [63:0] reg_k0;
  reg [63:0] reg_k1;
  reg [7:0]  reg_vec_bank;

  integer vec_bank_countfull;
  always @(*)
  begin
    integer i;
    vec_bank_countfull = 0;
    for(i = 0; i < 8; i=i+1)
      if(reg_vec_bank[i])
        vec_bank_countfull = vec_bank_countfull+1;
  end

  assign status = {reg_status_sx, reg_status_ux, reg_status_s, reg_status_ps, 1'b0, reg_status_ev, reg_status_ef, reg_status_et};
  assign vec_bank = reg_vec_bank;
  assign vec_bank_count = vec_bank_countfull[3:0];
  assign error_mode = reg_error_mode;
  assign log_control = reg_log_control;
  assign htif_tohost = htif_fromhost_wen ? 32'd0 : reg_tohost;

  assign rdata
    = !ren ? 64'd0
    : (raddr == `PCR_STATUS) ? {16'd0, reg_status_im, status}
    : (raddr == `PCR_EPC) ? {{32{reg_epc[31]}}, reg_epc}
    : (raddr == `PCR_BADVADDR) ? {{32{reg_badvaddr[31]}}, reg_badvaddr}
    : (raddr == `PCR_EVEC) ? {{32{reg_ebase[31]}}, reg_ebase}
    : (raddr == `PCR_COUNT) ? {{32{reg_count[31]}}, reg_count}
    : (raddr == `PCR_COMPARE) ? {{32{reg_compare[31]}}, reg_compare}
    : (raddr == `PCR_CAUSE) ? {59'd0, reg_cause}
    : (raddr == `PCR_MEMSIZE) ? {{64-`LG_PCR_MEMSIZE-1{1'b0}},1'b1,{`LG_PCR_MEMSIZE{1'b0}}}
    : (raddr == `PCR_VECBANK) ? {56'd0, reg_vec_bank}
    : (raddr == `PCR_COREID) ? {56'd0, COREID[7:0]}
    : (raddr == `PCR_LOG) ? {63'd0, reg_log_control}
    : (raddr == `PCR_TOHOST) ? {{32{reg_tohost[31]}}, reg_tohost}
    : (raddr == `PCR_FROMHOST) ? {{32{reg_fromhost[31]}}, reg_fromhost}
    : (raddr == `PCR_K0) ? reg_k0
    : (raddr == `PCR_K1) ? reg_k1
    : 64'd0;

  always @(posedge clk)
  begin
    if (reset)
    begin
      reg_error_mode <= 1'b0;
      reg_status_im <= 8'd0;
      reg_status_sx <= 1'b1;
      reg_status_ux <= 1'b1;
      reg_status_ef <= 1'b0;
      reg_status_ev <= 1'b0;
      reg_status_s <= 1'b1;
      reg_status_ps <= 1'b0;
      reg_status_et <= 1'b0;
      reg_epc <= 32'd0;
      reg_badvaddr <= 32'd0;
      reg_ebase <= 32'd0;
      reg_count <= 32'd0;
      reg_compare <= 32'd0;
      reg_cause <= 5'd0;
      reg_vec_bank <= 8'hFF;
      reg_log_control <= 1'b0;
      reg_tohost <= 32'd0;
      reg_fromhost <= 32'd0;
      reg_k0 <= 64'd0;
      reg_k1 <= 64'd0;
    end
    else
    begin
      if (htif_fromhost_wen)
      begin
        reg_tohost <= 32'd0;
        reg_fromhost <= htif_fromhost;
      end
      else if(!exception && wen && waddr == `PCR_TOHOST)
      begin
        reg_tohost <= wdata[31:0];
        reg_fromhost <= 32'd0;
      end
      
      if (exception && !reg_status_et)
      begin
        reg_error_mode <= 1'b1;
      end
      else if (exception)
      begin
        reg_status_s <= 1'b1;
        reg_status_ps <= reg_status_s;
        reg_status_et <= 1'b0;
        reg_epc <= pc;
        reg_cause <= cause;
      end
      else if (eret)
      begin
        reg_status_s <= reg_status_ps;
        reg_status_et <= 1'b1;
      end
      else if (wen)
      begin
        if (waddr == `PCR_STATUS)
        begin
          reg_status_im <= wdata[15:8];
          reg_status_sx <= wdata[7];
          reg_status_ux <= wdata[6];
          reg_status_s <= wdata[5];
          reg_status_ps <= wdata[4];
          reg_status_ev <= HAS_VECTOR & wdata[2];
          reg_status_ef <= HAS_FPU & wdata[1];
          reg_status_et <= wdata[0];
        end
        if (waddr == `PCR_EPC) reg_epc <= wdata[31:0];
        if (waddr == `PCR_BADVADDR) reg_badvaddr <= wdata[31:0];
        if (waddr == `PCR_EVEC) reg_ebase <= wdata[31:0];
        if (waddr == `PCR_COUNT) reg_count <= wdata[31:0];
        if (waddr == `PCR_COMPARE) reg_compare <= wdata[31:0];
        if (waddr == `PCR_CAUSE) reg_cause <= wdata[4:0];
        if (waddr == `PCR_VECBANK) reg_vec_bank <= wdata[7:0];
        if (waddr == `PCR_LOG) reg_log_control <= wdata[0];
        if (waddr == `PCR_FROMHOST) reg_fromhost <= wdata[31:0];
        if (waddr == `PCR_K0) reg_k0 <= wdata;
        if (waddr == `PCR_K1) reg_k1 <= wdata;
      end
    end
  end

endmodule
