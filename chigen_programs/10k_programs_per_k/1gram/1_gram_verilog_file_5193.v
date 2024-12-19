// Seed: 1640669925
module module_0 (
    input wor id_0,
    input tri1 id_1,
    output supply1 id_2,
    input wand id_3,
    output tri1 id_4,
    output wand id_5,
    output uwire id_6,
    input tri1 id_7,
    input supply0 id_8,
    input tri0 id_9,
    output wand id_10,
    input wire id_11,
    output tri0 id_12,
    input wor id_13,
    input tri1 id_14,
    output tri0 id_15,
    output tri1 id_16,
    output supply1 id_17
);
  always_ff id_10 = id_3;
  wire id_19, id_20 = 1'b0, id_21;
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    output logic id_0,
    input supply1 id_1,
    input supply1 id_2,
    output supply1 id_3,
    input wand id_4,
    input tri0 id_5,
    input tri1 id_6
);
  always begin : LABEL_0
    id_0 <= 1;
  end
  wire id_8;
  assign id_3 = 1'b0 ^ id_6;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_6,
      id_6,
      id_5,
      id_3,
      id_5,
      id_3,
      id_6,
      id_2,
      id_3,
      id_3,
      id_3
  );
  wand id_9 = id_1;
  wire id_10, id_11;
endmodule
