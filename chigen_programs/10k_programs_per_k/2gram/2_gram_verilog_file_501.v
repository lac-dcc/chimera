// Seed: 249261480
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output supply1 id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  parameter id_9 = 1;
  assign id_3 = id_9;
  assign id_4 = -1'b0;
  integer id_10;
  ;
endmodule
macromodule module_1 #(
    parameter id_1 = 32'd88
) (
    _id_1,
    id_2
);
  input wire id_2;
  input wire _id_1;
  struct packed {
    logic id_3;
    logic id_4;
    logic [id_1 : ~  1] id_5;
  } id_6;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_3,
      id_4,
      id_6
  );
endmodule
