// Seed: 3205942642
module module_0 (
    output tri0 id_0,
    input tri id_1,
    input supply1 id_2,
    output supply0 id_3,
    input tri0 id_4,
    output tri0 id_5,
    output wand id_6,
    input uwire id_7,
    input wor id_8,
    input tri0 id_9,
    input wor id_10,
    input tri1 id_11
);
  wire id_13;
  assign id_13 = id_8;
endmodule
module module_1 #(
    parameter id_1 = 32'd73
) (
    input wire id_0,
    input tri0 _id_1,
    input supply1 id_2,
    output supply0 id_3
);
  assign id_3 = id_2;
  assign id_3 = -1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0
  );
  assign modCall_1.id_8 = 0;
  assign id_3 = id_1;
  logic [7:0][-1 : id_1] id_5;
  assign id_5[""] = id_0;
endmodule
