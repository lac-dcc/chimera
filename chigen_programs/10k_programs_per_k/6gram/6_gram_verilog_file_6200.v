// Seed: 2100274803
module module_0 (
    input supply1 id_0,
    input wor id_1,
    input wire id_2,
    input wand id_3,
    input wire id_4,
    input uwire id_5,
    output tri0 id_6,
    output tri0 id_7,
    output supply1 id_8,
    input supply1 id_9,
    input wand id_10,
    output wor id_11
);
  assign id_7 = -1;
endmodule
module module_1 (
    output supply0 id_0,
    output wand id_1,
    output tri0 id_2,
    input wor id_3,
    input tri1 id_4,
    input uwire id_5,
    output logic id_6,
    input wor id_7,
    output tri0 id_8
);
  wire  id_10;
  logic id_11;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4,
      id_7,
      id_7,
      id_5,
      id_0,
      id_0,
      id_2,
      id_5,
      id_3,
      id_8
  );
  assign modCall_1.id_4 = 0;
  wire id_12;
  always @(posedge id_5) id_6 = id_11 ? id_11 : 1;
endmodule
