// Seed: 457004808
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = id_4 ? 1'b0 : id_5#(.id_4(1));
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wor id_2;
  input wire id_1;
  nor primCall (id_5, id_4, id_6, id_2, id_1);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_1,
      id_2,
      id_2,
      id_4,
      id_4
  );
  logic id_7;
  assign id_2 = -1;
endmodule
