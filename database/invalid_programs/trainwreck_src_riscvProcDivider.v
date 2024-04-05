`include "macros.vh"
`include "riscvConst.vh"

module riscvProcDivider #(parameter W=0)
(
  input clk,
  input reset,

  output div_rdy,
  input div_val,
  input [2:0] div_fn,
  input [4:0] div_waddr,

  input [W-1:0] dpath_rs2,
  input [W-1:0] dpath_rs1,

  output [W-1:0] div_result_bits,
  output [4:0] div_result_tag,
  output div_result_val
);

  localparam STATE_READY = 3'd0;
  localparam STATE_NEG_INPUTS = 3'd1;
  localparam STATE_BUSY = 3'd2;
  localparam STATE_NEG_OUTPUTS = 3'd3;
  localparam STATE_DONE = 3'd4;

  reg [2:0] state, next_state;
  reg [`ceilLog2(W+1)-1:0] count;
  reg rem,v_tc,v_rem,v_half,half,tc;
  reg neg_quo,neg_rem;
  reg [4:0] reg_waddr;

  reg divby0;
  wire next_divby0;

  always @(*) begin
    v_tc = (div_fn == `DIV_64D || div_fn == `DIV_64R) ||
           (div_fn == `DIV_32D || div_fn == `DIV_32R);
    v_rem = (div_fn == `DIV_32R || div_fn == `DIV_32RU) ||
            (div_fn == `DIV_64R || div_fn == `DIV_64RU);
    v_half = (div_fn == `DIV_32R || div_fn == `DIV_32RU) ||
             (div_fn == `DIV_32D || div_fn == `DIV_32DU);

    case(state)
      STATE_READY:       next_state = !div_val ? STATE_READY
                                    : v_tc    ? STATE_NEG_INPUTS
                                    : STATE_BUSY;
      STATE_NEG_INPUTS:  next_state = STATE_BUSY;
      STATE_BUSY:        next_state = count != W ? STATE_BUSY
                                    : !(neg_quo|neg_rem) ? STATE_DONE
                                    : STATE_NEG_OUTPUTS;
      STATE_NEG_OUTPUTS: next_state = STATE_DONE;
      STATE_DONE:        next_state = STATE_READY;
      default:           next_state = 3'bx;
    endcase
  end

  always @(posedge clk) begin
    if(reset)
      state <= STATE_READY;
    else
      state <= next_state;

    if(div_rdy)
      count <= {`ceilLog2(W+1)-1{1'b0}};
    else if(state == STATE_BUSY)
      count <= count + 1'b1;

    if(div_rdy && div_val) begin
      rem <= v_rem;
      half <= v_half;
      tc <= v_tc;
      reg_waddr <= div_waddr;
    end
  end

  reg [W-1:0] divisor;
  reg [2*W:0] remainder;
  wire [W:0] subtractor = remainder[2*W:W] - divisor;
  
  assign next_divby0 = divby0 & ~subtractor[W];

  // if we're doing 32-bit unsigned division, then we don't want the 32-bit
  // inputs to be sign-extended.
  wire [W-1:0] in_lhs = (v_half && !v_tc) ? {{W/2{1'b0}},dpath_rs1[W/2-1:0]}
                      : dpath_rs1;
  wire [W-1:0] in_rhs = (v_half && !v_tc) ? {{W/2{1'b0}},dpath_rs2[W/2-1:0]}
                      : dpath_rs2;

  always @(posedge clk) begin
    if(div_rdy && div_val) begin
      remainder <= {{W+1{1'b0}},in_lhs};
      divisor <= in_rhs;
      divby0 <= 1'b1;
    end else if(state == STATE_NEG_INPUTS || state == STATE_NEG_OUTPUTS) begin
      if(divisor[W-1])
        divisor <= subtractor[W-1:0];
      if(remainder[W-1] && state == STATE_NEG_INPUTS || state == STATE_NEG_OUTPUTS && neg_quo && !divby0)
        remainder[W-1:0] <= -remainder[W-1:0];
      if(state == STATE_NEG_OUTPUTS && neg_rem)
        remainder[2*W:W+1] <= -remainder[2*W:W+1];
    end else if(state == STATE_BUSY) begin
      divby0 <= next_divby0;
      remainder <= {subtractor[W] ? remainder[2*W-1:W] : subtractor[W-1:0],
                    remainder[W-1:0], ~subtractor[W]};
    end

    if(div_rdy && div_val) begin
      neg_rem <= 1'b0;
      neg_quo <= 1'b0;
    end else if(state == STATE_NEG_INPUTS) begin
      neg_rem <= remainder[W-1];
      neg_quo <= remainder[W-1] != divisor[W-1];
    end
  end

  wire [W-1:0] result = rem ? remainder[2*W:W+1] : remainder[W-1:0];

  // sign-extend the result for 32-bit division
  assign div_result_bits = half ? {{W/2{result[W/2-1]}},result[W/2-1:0]}
                         : result;
  assign div_rdy = state == STATE_READY;
  assign div_result_tag = reg_waddr;
  assign div_result_val = state == STATE_DONE;

endmodule
