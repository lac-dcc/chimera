// Seed: 3242518238
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
  output tri1 id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_6 = 1 - id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wor id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_6,
      id_3,
      id_6,
      id_4,
      id_6
  );
  assign modCall_1.id_6 = 0;
  assign id_2 = -1;
endmodule
