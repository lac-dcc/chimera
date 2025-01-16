// Seed: 563613956
module module_0 #(
    parameter id_17 = 32'd60
) (
    input wand id_0,
    input supply1 id_1,
    input tri0 id_2,
    input wire id_3,
    input uwire id_4,
    input supply0 id_5,
    input uwire id_6,
    input wire id_7,
    input tri id_8,
    input uwire id_9,
    input wire id_10,
    input wor id_11,
    output uwire id_12
);
  reg id_14;
  always id_12 = 1 == id_10 !== id_8;
  always id_12 = id_2;
  wire id_15;
  wire id_16;
  final id_14 <= -1;
  defparam id_17 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    input wand id_1,
    input wor id_2,
    output tri0 id_3,
    input tri0 id_4,
    output wire id_5
);
  wire id_7, id_8;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_4,
      id_1,
      id_4,
      id_4,
      id_1,
      id_2,
      id_4,
      id_1,
      id_4,
      id_4,
      id_5
  );
  assign modCall_1.type_0 = 0;
endmodule
