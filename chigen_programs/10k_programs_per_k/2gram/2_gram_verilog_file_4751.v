// Seed: 3378942294
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
    id_10,
    id_11,
    id_12
);
  input wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_13;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_6[1] = id_4;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_2,
      id_2,
      id_4,
      id_5,
      id_5,
      id_4,
      id_2,
      id_5,
      id_2
  );
  wire id_7;
  nor primCall (id_2, id_1, id_4, id_3, id_5);
endmodule
