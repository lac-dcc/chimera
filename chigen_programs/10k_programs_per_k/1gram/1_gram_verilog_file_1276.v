// Seed: 4290877550
module module_0 (
    input wor id_0,
    output tri id_1,
    output supply0 id_2,
    input tri0 id_3,
    input uwire id_4,
    input wand id_5,
    output wand id_6
);
  assign id_1 = 1;
  logic id_8;
  ;
endmodule
module module_1 #(
    parameter id_15 = 32'd24,
    parameter id_18 = 32'd72,
    parameter id_2  = 32'd22,
    parameter id_3  = 32'd54
) (
    input uwire id_0[id_3 : id_2],
    output wand id_1,
    output wire _id_2,
    input supply0 _id_3,
    input supply1 id_4,
    output tri id_5,
    input tri id_6,
    input supply1 id_7,
    input tri0 id_8,
    output wor id_9,
    input tri1 id_10,
    input uwire id_11
    , id_17, _id_18,
    output wire id_12,
    input wor id_13,
    input uwire id_14,
    input wire _id_15
);
  logic id_19;
  ;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_12,
      id_4,
      id_4,
      id_4,
      id_12
  );
  assign modCall_1.id_0 = 0;
  initial
    if ("" & 1) id_17 = id_17;
    else id_19 <= !id_13;
  tri1 id_20[id_15 : id_18];
  assign id_20 = {1 | 1, id_17, id_3 / 1};
  assign id_2  = id_14;
endmodule
