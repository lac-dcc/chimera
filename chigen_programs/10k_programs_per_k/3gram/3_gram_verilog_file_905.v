// Seed: 564146263
module module_0 (
    input tri id_0,
    input tri0 id_1,
    input wor id_2,
    output wor id_3,
    output tri1 id_4,
    input supply0 id_5,
    input tri0 id_6,
    input wand id_7,
    output tri0 id_8,
    input supply0 id_9,
    output tri0 id_10,
    input tri0 id_11,
    input wand id_12,
    output uwire id_13,
    output supply1 id_14,
    output tri id_15,
    input supply1 id_16,
    input tri id_17,
    output supply1 id_18,
    output wire id_19,
    output wire id_20
);
  wire id_22;
endmodule
module module_1 (
    output uwire id_0,
    input tri id_1,
    input wor id_2,
    input uwire id_3,
    output logic id_4,
    output wor id_5,
    input logic id_6,
    input wand id_7
    , id_12,
    input wire id_8,
    output wor id_9,
    input supply0 id_10
);
  wire id_13;
  always @(posedge id_2 | id_8) id_12 <= id_6;
  xor (id_0, id_14, id_13, id_2, id_7, id_12, id_1, id_3, id_8, id_10, id_6);
  supply1 id_14 = 1 - !id_8;
  always @(posedge id_14) id_4 <= 1;
  module_0(
      id_8,
      id_10,
      id_1,
      id_9,
      id_5,
      id_8,
      id_10,
      id_8,
      id_9,
      id_2,
      id_5,
      id_3,
      id_2,
      id_9,
      id_0,
      id_5,
      id_8,
      id_3,
      id_5,
      id_0,
      id_0
  );
endmodule
