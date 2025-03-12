// Seed: 2368449069
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    input supply0 id_2,
    input tri0 id_3,
    input wor id_4,
    output wor id_5,
    output wire id_6,
    output wand id_7,
    input tri1 id_8,
    input wire id_9,
    input uwire id_10,
    input tri id_11,
    output tri id_12,
    output wire id_13,
    input tri0 id_14,
    inout wire id_15,
    output tri1 id_16,
    output wor id_17,
    input supply0 id_18,
    input supply1 id_19,
    input uwire id_20,
    input supply0 id_21,
    input wand id_22
);
  assign {id_20, 1} = 1 + -1;
  wire id_24;
  wire id_25;
  assign id_6 = (-1);
  always @(posedge 1);
endmodule
module module_1 (
    output supply0 id_0,
    input wor id_1,
    output wand id_2,
    input supply1 id_3,
    input tri0 id_4,
    input uwire id_5,
    inout wand id_6
    , id_12,
    input tri id_7,
    input wire id_8,
    output logic id_9,
    input wand id_10
);
  assign id_6 = -1;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_5,
      id_6,
      id_2,
      id_2,
      id_2,
      id_1,
      id_8,
      id_10,
      id_1,
      id_2,
      id_0,
      id_10,
      id_6,
      id_6,
      id_0,
      id_8,
      id_10,
      id_10,
      id_7,
      id_4
  );
  assign modCall_1.id_17 = 0;
  always_latch id_9 <= id_12;
  tri0 id_13;
  assign id_13 = (!id_5 ** id_6);
  logic id_14 = {id_8, id_1};
  assign id_6 = id_12;
endmodule
