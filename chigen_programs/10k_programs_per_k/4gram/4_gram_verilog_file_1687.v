// Seed: 3112990885
module module_0 #(
    parameter id_17 = 32'd83,
    parameter id_18 = 32'd12
) (
    output uwire id_0,
    output supply0 id_1,
    input wand id_2,
    input supply1 id_3,
    output supply0 id_4,
    input supply1 id_5,
    output uwire id_6,
    output wire id_7,
    input uwire id_8,
    output tri0 id_9,
    input tri0 id_10,
    input supply0 id_11,
    input supply0 id_12,
    input supply0 id_13,
    input wor id_14
);
  assign id_4 = 1 ? 1'b0 : 1;
  wor id_16 = id_8;
  defparam id_17.id_18 = 1;
  wor id_19;
  tri id_20, id_21 = id_13 / id_6++;
  assign id_16 = id_19;
endmodule
module module_1 (
    input wor id_0,
    input uwire id_1,
    output wor id_2,
    output supply0 id_3,
    input tri0 id_4
);
  assign id_3 = 1 + 1'b0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_4,
      id_3,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_4,
      id_1,
      id_4,
      id_0,
      id_0
  );
  assign modCall_1.id_9 = 0;
endmodule
