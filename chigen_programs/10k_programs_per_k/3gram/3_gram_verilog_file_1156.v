// Seed: 38546487
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
    id_12,
    id_13,
    id_14,
    id_15
);
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  supply1 id_16 = 1;
  assign module_1.id_1 = 0;
  assign id_3 = 1 && id_12;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  tri id_5;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_5,
      id_4,
      id_1,
      id_2,
      id_1,
      id_5,
      id_2,
      id_5,
      id_3,
      id_2,
      id_5,
      id_3,
      id_1
  );
  assign id_5 = 1;
  assign id_2 = id_4;
  assign id_1 = 1;
  assign id_5 = 1;
  or primCall (id_1, id_2, id_3, id_5);
endmodule
