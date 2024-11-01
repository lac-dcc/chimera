// Seed: 1242144324
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    input wor id_2,
    input uwire id_3,
    output wor id_4,
    output tri0 id_5,
    output tri1 id_6,
    input wor id_7,
    output uwire id_8,
    output tri0 id_9,
    input wand id_10,
    input wor id_11,
    output supply1 id_12,
    input tri0 id_13,
    input tri0 id_14,
    output tri0 id_15,
    input uwire id_16,
    input supply1 id_17,
    input tri1 id_18,
    input supply0 id_19
    , id_22,
    output supply0 id_20
);
  assign id_5 = {1'h0, id_2, 1, 1, {id_14{1}}, 1'b0, id_3, 1'b0};
  genvar id_23;
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    output wire id_2,
    input tri id_3,
    input supply1 id_4,
    input tri0 id_5,
    output wor id_6,
    input tri1 id_7,
    input tri id_8,
    output uwire id_9,
    input wand id_10
);
  wire id_12;
  module_0(
      id_10,
      id_4,
      id_8,
      id_5,
      id_6,
      id_2,
      id_9,
      id_7,
      id_6,
      id_0,
      id_10,
      id_1,
      id_2,
      id_7,
      id_10,
      id_0,
      id_5,
      id_8,
      id_8,
      id_10,
      id_2
  );
endmodule
