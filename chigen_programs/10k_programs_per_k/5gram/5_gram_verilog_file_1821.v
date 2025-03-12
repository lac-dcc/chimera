// Seed: 700448638
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire [-1 : -1 'd0] id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  xnor primCall (id_1, id_3, id_4, id_2, id_5);
  inout wire id_3;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_5,
      id_5,
      id_4,
      id_2,
      id_1
  );
  inout wire id_2;
  output wire id_1;
  assign id_1 = 1;
endmodule
