// Seed: 3123555672
module module_0 (
    output supply1 id_0,
    input uwire id_1,
    input wand id_2,
    input tri id_3,
    input supply1 id_4,
    input tri id_5,
    output supply0 id_6,
    output uwire id_7,
    output tri0 id_8,
    input tri0 id_9,
    input supply0 id_10,
    output wor id_11,
    input tri0 id_12
);
  assign id_11 = 1 + id_5 - id_4;
  assign module_1.id_13 = 0;
  wire id_14;
  generate
    tri id_15 = id_12;
  endgenerate
endmodule
module module_1 #(
    parameter id_11 = 32'd72,
    parameter id_12 = 32'd59
) (
    output tri1 id_0,
    input uwire id_1,
    input tri1 id_2,
    output wor id_3,
    output supply1 id_4,
    input tri id_5,
    input tri1 id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_1,
      id_6,
      id_6,
      id_0,
      id_3,
      id_3,
      id_5,
      id_2,
      id_0,
      id_5
  );
  supply1 id_9;
  wire id_10;
  defparam id_11.id_12 = id_9#(id_1 < 1);
  tri1 id_13 = id_5;
endmodule
