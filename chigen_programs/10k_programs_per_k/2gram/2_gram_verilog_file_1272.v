// Seed: 1089238213
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
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_8;
  wire id_9;
endmodule
module module_1 (
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
  inout wire id_1;
  assign id_4[1] = id_3;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_2,
      id_1,
      id_3,
      id_6
  );
  assign modCall_1.id_3 = 0;
  wire id_7;
endmodule
