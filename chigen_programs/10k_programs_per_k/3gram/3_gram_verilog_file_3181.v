// Seed: 986036674
module module_0 (
    output uwire id_0,
    input supply0 id_1,
    input uwire id_2,
    output wor id_3,
    output uwire id_4,
    input supply0 id_5,
    input uwire id_6,
    input supply0 id_7,
    input uwire id_8,
    input supply0 id_9,
    input wire id_10,
    output tri1 id_11,
    input wor id_12,
    output tri1 id_13,
    output supply0 id_14,
    output wand id_15,
    output uwire id_16,
    input tri0 id_17
);
  wire id_19;
  assign module_1.id_13 = 0;
  assign id_15 = -1'b0;
endmodule
module module_1 #(
    parameter id_8 = 32'd92
) (
    input wor id_0,
    input tri1 id_1,
    output uwire id_2,
    input tri0 id_3,
    output uwire id_4,
    input tri1 id_5,
    output tri0 id_6,
    input tri0 id_7,
    input tri1 _id_8,
    output tri1 id_9,
    output supply1 id_10
    , id_15,
    input supply0 id_11,
    input supply1 id_12,
    output supply0 id_13
);
  assign id_10 = id_15;
  assign id_15[id_8] = id_11;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_5,
      id_9,
      id_4,
      id_7,
      id_5,
      id_7,
      id_3,
      id_5,
      id_12,
      id_2,
      id_3,
      id_13,
      id_9,
      id_2,
      id_13,
      id_1
  );
endmodule
