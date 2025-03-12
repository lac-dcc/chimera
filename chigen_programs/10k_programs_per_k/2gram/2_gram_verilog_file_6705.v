// Seed: 3089642545
module module_0 (
    output tri1 id_0,
    input uwire id_1,
    input supply1 id_2,
    input supply1 id_3,
    output tri1 id_4,
    output wor id_5,
    input tri id_6,
    output tri1 id_7
);
  id_9(
      id_6
  );
  wire id_10;
endmodule
module module_1 #(
    parameter id_11 = 32'd93,
    parameter id_6  = 32'd56,
    parameter id_8  = 32'd11
) (
    input wire id_0,
    output logic id_1,
    output wor id_2,
    output wand id_3,
    input wire id_4,
    input tri0 id_5,
    input supply1 _id_6,
    output supply0 id_7,
    input supply1 _id_8,
    output tri0 id_9,
    input tri0 id_10,
    input tri1 _id_11,
    input tri0 id_12,
    input tri id_13
);
  parameter [id_6 : id_11  ||  id_11  ||  id_8] id_15 = 1 - 1'b0;
  module_0 modCall_1 (
      id_3,
      id_10,
      id_13,
      id_12,
      id_9,
      id_3,
      id_12,
      id_9
  );
  assign modCall_1.id_5 = 0;
  initial id_1 = id_5;
endmodule
