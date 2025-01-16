// Seed: 3230629554
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input tri0 id_2,
    output supply0 id_3,
    output supply0 id_4,
    output supply0 id_5,
    input wor id_6,
    output wire id_7,
    output uwire id_8
);
  uwire id_10 = -1'h0 || 1 != (id_6);
  assign id_7 = 1;
  wor id_11 = -1'h0;
endmodule
module module_1 #(
    parameter id_18 = 32'd24
) (
    output uwire id_0,
    input tri0 id_1,
    input tri1 id_2,
    input wor id_3,
    input tri1 id_4,
    input wor id_5,
    input supply0 id_6,
    output uwire id_7,
    input wor id_8,
    input uwire id_9,
    input tri0 id_10,
    output wand id_11,
    id_14,
    input wor id_12
);
  assign id_0  = 1'd0;
  assign id_7  = id_10;
  assign id_0  = id_5;
  assign id_11 = (id_3 * id_12) - 1;
  supply1 id_15, id_16 = -1, id_17;
  defparam id_18 = ~1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_6,
      id_7,
      id_11,
      id_7,
      id_4,
      id_7,
      id_11
  );
  assign modCall_1.id_3 = 0;
endmodule
