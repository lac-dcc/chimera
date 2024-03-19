module riscvProcDpath_VEC
(
  input clk,
  input reset,

  input wen,
  input fn,
  input [63:0] in,
  input [11:0] imm,
  input [3:0] vec_bank_count,
  output appvl_eq0,
  output [11:0] out
);

  wire [5:0] nxregs = imm[5:0];
  wire [5:0] nfregs = imm[11:6];
  wire [6:0] nregs = nxregs + nfregs;

  wire [8:0] uts_per_bank
    = nregs == 7'd0  ? 9'd256
    : nregs == 7'd1  ? 9'd256
    : nregs == 7'd2  ? 9'd256
    : nregs == 7'd3  ? 9'd128
    : nregs == 7'd4  ? 9'd85
    : nregs == 7'd5  ? 9'd64
    : nregs == 7'd6  ? 9'd51
    : nregs == 7'd7  ? 9'd42
    : nregs == 7'd8  ? 9'd36
    : nregs == 7'd9  ? 9'd32
    : nregs == 7'd10 ? 9'd28
    : nregs == 7'd11 ? 9'd25
    : nregs == 7'd12 ? 9'd23
    : nregs == 7'd13 ? 9'd21
    : nregs == 7'd14 ? 9'd19
    : nregs == 7'd15 ? 9'd18
    : nregs == 7'd16 ? 9'd17
    : nregs == 7'd17 ? 9'd16
    : nregs == 7'd18 ? 9'd15
    : nregs == 7'd19 ? 9'd14
    : nregs == 7'd20 ? 9'd13
    : nregs == 7'd21 ? 9'd12
    : nregs == 7'd22 ? 9'd12
    : nregs == 7'd23 ? 9'd11
    : nregs == 7'd24 ? 9'd11
    : nregs == 7'd25 ? 9'd10
    : nregs == 7'd26 ? 9'd10
    : nregs == 7'd27 ? 9'd9
    : nregs == 7'd28 ? 9'd9
    : nregs == 7'd29 ? 9'd9
    : nregs == 7'd30 ? 9'd8
    : nregs == 7'd31 ? 9'd8
    : nregs == 7'd32 ? 9'd8
    : nregs == 7'd33 ? 9'd8
    : nregs == 7'd34 ? 9'd7
    : nregs == 7'd35 ? 9'd7
    : nregs == 7'd36 ? 9'd7
    : nregs == 7'd37 ? 9'd7
    : nregs == 7'd38 ? 9'd6
    : nregs == 7'd39 ? 9'd6
    : nregs == 7'd40 ? 9'd6
    : nregs == 7'd41 ? 9'd6
    : nregs == 7'd42 ? 9'd6
    : nregs == 7'd43 ? 9'd6
    : nregs == 7'd44 ? 9'd5
    : nregs == 7'd45 ? 9'd5
    : nregs == 7'd46 ? 9'd5
    : nregs == 7'd47 ? 9'd5
    : nregs == 7'd48 ? 9'd5
    : nregs == 7'd49 ? 9'd5
    : nregs == 7'd50 ? 9'd5
    : nregs == 7'd51 ? 9'd5
    : nregs == 7'd52 ? 9'd5
    : 9'd4;

  reg  [11:0] reg_hwvl;
  reg         reg_appvl_eq0;
  wire [11:0] hwvl_vcfg = uts_per_bank * vec_bank_count;
  wire [11:0] hwvl = fn ? hwvl_vcfg : reg_hwvl;
  wire [11:0] appvl = in[11:0] < hwvl ? in[11:0] : hwvl;

  always @(posedge clk)
  begin
    if (reset)
    begin
      reg_hwvl <= 12'd32;
      reg_appvl_eq0 <= 1'b1;
    end
    else if (wen)
    begin
      if (fn == 1'b1) reg_hwvl <= hwvl_vcfg;
      reg_appvl_eq0 <= ~(|appvl);
    end
  end

  // bypass appvl_eq0
  assign appvl_eq0 = wen ? ~(|appvl) : reg_appvl_eq0;
  assign out = appvl;

endmodule
