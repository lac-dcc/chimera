// Seed: 1896157023
module module_0 (
    input wand id_0,
    input supply1 id_1,
    input supply1 id_2,
    input supply1 module_0,
    output wire id_4,
    output wand id_5,
    input tri0 id_6,
    output tri1 id_7,
    input wire id_8,
    input tri1 id_9,
    output tri0 id_10,
    output supply0 id_11,
    output tri1 id_12,
    input tri0 id_13,
    input uwire id_14,
    input uwire id_15,
    input tri0 id_16
);
  assign id_10 = 'b0 ? id_9 : id_2 ? 1 : 1 ? id_6 : id_8 ? id_0 : id_15 == id_1;
  id_18(
      .id_0(1), .id_1(1)
  );
  always #1 for (id_4 = 1; id_1; id_10 = 1'b0 == id_13) id_5 = 1;
  wire id_19;
  assign id_12 = 1'b0;
endmodule
module module_1 (
    input wire id_0,
    input tri0 id_1,
    output uwire id_2,
    output supply1 id_3,
    output wand id_4,
    input tri0 id_5
    , id_12,
    output supply1 id_6,
    output tri1 id_7,
    output wire id_8,
    input supply0 id_9,
    output tri id_10
);
  rpmos (1 & 1'b0, id_6, 1);
  xor (id_6, id_12, id_1, id_9, id_0);
  module_0(
      id_5,
      id_0,
      id_9,
      id_5,
      id_6,
      id_7,
      id_5,
      id_7,
      id_1,
      id_0,
      id_2,
      id_10,
      id_3,
      id_0,
      id_0,
      id_0,
      id_5
  );
  assign id_2 = 1;
endmodule
