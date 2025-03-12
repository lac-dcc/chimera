// Seed: 3587383094
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  timeprecision 1ps;
  module_2 modCall_1 ();
endmodule
module module_1;
  wire id_1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2
  );
  logic id_3;
  ;
  wire id_4;
  ;
endmodule
module module_2;
  reg id_1;
  always @(posedge -1) id_1 = #1 -1'b0 == 1 - 1;
endmodule
module module_3 #(
    parameter id_13 = 32'd59
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    _id_13,
    id_14,
    id_15
);
  inout wire id_15;
  output wire id_14;
  input wire _id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout logic [7:0] id_5;
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_16;
  assign id_5[id_13 :-1] = 1;
endmodule
