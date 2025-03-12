// Seed: 3139090251
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4 = id_3;
endmodule
macromodule module_1 #(
    parameter id_2 = 32'd60
) (
    id_1,
    _id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  input wire _id_2;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_1,
      id_4,
      id_4
  );
  output wire id_1;
  logic [-1 : 1  -  (  id_2  )] id_5;
endmodule
