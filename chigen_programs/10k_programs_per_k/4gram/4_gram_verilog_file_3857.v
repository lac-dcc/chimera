// Seed: 1533058888
module module_0 #(
    parameter id_18 = 32'd21,
    parameter id_19 = 32'd47
) (
    input tri0 id_0,
    input supply0 id_1,
    input uwire id_2,
    input uwire id_3,
    input tri0 id_4,
    output tri1 id_5,
    input wire id_6,
    input tri id_7,
    output uwire id_8,
    input uwire id_9,
    input wand id_10,
    input wor id_11,
    input supply1 id_12,
    input tri0 id_13,
    output tri1 id_14,
    output supply0 id_15
);
  wire id_17;
  generate
    defparam id_18.id_19 = 1;
  endgenerate
endmodule
module module_1 (
    input  tri  id_0,
    output wor  id_1,
    input  tri0 id_2,
    output tri0 id_3
);
  wire id_5, id_6;
  assign id_3 = 1;
  module_0(
      id_2, id_0, id_2, id_0, id_0, id_3, id_2, id_0, id_3, id_0, id_0, id_0, id_2, id_0, id_3, id_1
  );
  tri id_7;
  assign id_7 = id_2;
endmodule
