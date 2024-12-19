// Seed: 1218425920
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_6;
  wire id_7 = 1'b0;
  wire id_8;
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
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_7;
  wire id_8, id_9, id_10, id_11;
  wand id_12;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_8,
      id_5,
      id_6
  );
  always if (id_12) if (1) id_4 <= 1 | id_5;
  wire id_13, id_14;
  nor primCall (id_6, id_10, id_2, id_9, id_12, id_5, id_7, id_3, id_11, id_4, id_8);
  wire id_15 = id_8;
endmodule
