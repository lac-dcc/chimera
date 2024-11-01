// Seed: 3827306338
module module_0 (
    input tri0 id_0,
    output supply1 id_1,
    output wor id_2,
    input uwire id_3,
    output wand id_4,
    input supply1 id_5,
    output wire id_6,
    output wand id_7,
    input tri1 id_8,
    input tri id_9,
    output tri id_10,
    input wire id_11,
    input supply0 id_12,
    input tri id_13,
    input wor id_14,
    output tri0 id_15,
    output uwire id_16,
    input wand id_17,
    output tri1 id_18,
    input tri0 id_19,
    output tri0 id_20
);
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    input wor id_2,
    output uwire id_3,
    output supply0 id_4,
    input tri id_5,
    input tri id_6,
    output supply1 id_7,
    input wor id_8,
    input uwire id_9,
    input uwire id_10,
    output tri id_11
);
  reg id_13;
  reg id_14;
  assign id_11 = id_6;
  wire id_15;
  module_0(
      id_8,
      id_11,
      id_4,
      id_6,
      id_4,
      id_2,
      id_7,
      id_4,
      id_1,
      id_5,
      id_4,
      id_10,
      id_10,
      id_8,
      id_8,
      id_11,
      id_4,
      id_0,
      id_4,
      id_5,
      id_11
  );
  always @(posedge id_9 + !(1)) id_14 <= id_13;
  xnor (id_11, id_2, id_14, id_5, id_0, id_6, id_1, id_15, id_8);
endmodule
