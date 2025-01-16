// Seed: 3962623822
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = id_8;
  assign id_2 = id_6 ? -1 : 1;
endmodule
module module_1;
  wire id_2, id_3;
  wire id_4;
  wire id_5, id_6;
  wire id_7;
  wire id_8;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_8,
      id_4,
      id_7,
      id_2,
      id_3,
      id_3,
      id_4,
      id_7
  );
  assign modCall_1.id_6 = 0;
  wire id_9 = id_7;
endmodule
