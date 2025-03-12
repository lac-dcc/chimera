// Seed: 3407631102
module module_0 (
    output uwire id_0,
    input wor id_1,
    input tri1 id_2,
    input supply1 id_3,
    output wor id_4,
    input wor id_5,
    input supply0 id_6
);
endmodule
module module_1 #(
    parameter id_2 = 32'd63
) (
    output wor id_0,
    output uwire id_1,
    input wor _id_2,
    input uwire id_3,
    input uwire id_4,
    input uwire id_5,
    input supply0 id_6,
    output uwire id_7,
    input tri id_8[1 : id_2],
    input wand id_9,
    output wire id_10,
    input wor id_11
);
  module_0 modCall_1 (
      id_0,
      id_3,
      id_11,
      id_9,
      id_7,
      id_11,
      id_8
  );
  assign modCall_1.id_2 = 0;
  reg id_13;
  final @(1 or posedge 1) @(id_5) id_13 = id_9;
  logic id_14;
  wire  id_15;
endmodule
