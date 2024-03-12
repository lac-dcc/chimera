module fm_444_422 (
  clk_v,
  rst_x,
  // video in
  i_state,
  i_y,
  i_cr,
  i_cb,
  // video out
  o_y,
  o_cr,
  o_cb
);
  input  clk_v;
  input  rst_x;

  input i_state;
  // video in
  input [7:0] i_y;
  input [7:0] i_cr;
  input [7:0] i_cb;
  // video out
  output [7:0] o_y;
  output [7:0] o_cr;
  output [7:0] o_cb;

//////////////////////////////////
// wire
//////////////////////////////////
  wire [8:0]   w_cb;
  wire [8:0]   w_cr;
//////////////////////////////////
// reg
//////////////////////////////////
  reg [7:0]   r_y_1z;
  reg [7:0]   r_y_2z;
  reg [7:0]   r_cr_1z;
  reg [7:0]   r_cb_1z;
  reg [7:0]   r_cr;
  reg [7:0]   r_cb;
//////////////////////////////////
// assign
//////////////////////////////////
  assign w_cr = i_cr + r_cr_1z;
  assign w_cb = i_cb + r_cb_1z;

  assign o_y = r_y_2z;
  assign o_cr = r_cr;
  assign o_cb = r_cb;
//////////////////////////////////
// module instantiation
//////////////////////////////////

always @(posedge clk_v) begin
  r_y_1z <= i_y;
  r_y_2z <= r_y_1z;
  r_cr_1z <= i_cr;
  r_cb_1z <= i_cb;
  if (i_state)  begin
     r_cr <= w_cr[8:1];
     r_cb <= w_cb[8:1];
  end
end

endmodule
