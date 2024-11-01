// Seed: 3727922337
module module_0 (
    input wand id_0,
    output tri id_1,
    input tri0 id_2
    , id_14,
    input wand id_3,
    output uwire id_4,
    output tri0 id_5,
    output supply1 id_6,
    output wire id_7,
    input wor id_8,
    input wor id_9,
    output tri1 id_10,
    output tri0 id_11,
    output supply1 id_12
);
  assign id_5 = 1'b0 ? 1 : id_0;
  wire id_15;
  wire id_16;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1
    , id_10,
    input tri0 id_2,
    input tri1 id_3,
    output wand id_4,
    input uwire id_5,
    input wand id_6,
    input uwire id_7,
    output tri0 id_8
);
  always @(posedge id_0 != 1 or negedge 1) id_8 = id_10 == id_2;
  and (id_8, id_3, id_0, id_6, id_7);
  module_0(
      id_6, id_8, id_7, id_6, id_4, id_8, id_1, id_1, id_7, id_2, id_1, id_4, id_8
  );
endmodule
