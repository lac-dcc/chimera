// Seed: 3912862008
module module_0 ();
  wire id_1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input tri1 id_0
);
  localparam id_2 = 1'h0;
  module_0 modCall_1 ();
endmodule
module module_2 #(
    parameter id_1 = 32'd67,
    parameter id_2 = 32'd29,
    parameter id_4 = 32'd82,
    parameter id_5 = 32'd30,
    parameter id_7 = 32'd62
) (
    _id_1,
    _id_2,
    id_3,
    _id_4,
    _id_5,
    id_6,
    _id_7
);
  output wire _id_7;
  inout wire id_6;
  output wire _id_5;
  inout wire _id_4;
  module_0 modCall_1 ();
  input wire id_3;
  input wire _id_2;
  input wire _id_1;
  struct packed {
    logic [id_5 : id_7] id_8;
    logic [&  id_1 : 1  &  -1 'h0] id_9;
  } [id_4 : id_2] id_10;
  id_11 :
  assert property (@(1 or 1) id_6 > 1'b0)
  else;
endmodule
