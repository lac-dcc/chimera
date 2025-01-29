// Seed: 1801564982
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
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  pmos (1, id_6, -1, 1, 1'b0);
  wire id_11;
  assign id_4 = 1'b0 != id_10;
  wire id_12;
  always_latch id_8 = id_9;
endmodule
module module_1 (
    output tri id_0,
    output wand id_1,
    input supply1 id_2,
    output wor id_3
);
  wire id_5;
  wire id_6, id_7, id_8, id_9;
  module_0 modCall_1 (
      id_5,
      id_9,
      id_5,
      id_9,
      id_6,
      id_6,
      id_7,
      id_7,
      id_8,
      id_5
  );
endmodule
