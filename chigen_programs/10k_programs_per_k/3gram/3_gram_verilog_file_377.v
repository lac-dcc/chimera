// Seed: 2200778145
module module_0 (
    input wire id_0,
    input tri0 id_1,
    output tri1 id_2,
    input uwire id_3,
    input tri0 id_4,
    input wire id_5,
    output tri id_6,
    input tri0 id_7,
    output tri1 id_8,
    input supply0 id_9,
    input tri id_10
);
  parameter id_12 = 1;
  wire id_13 = id_12;
  assign id_6 = 1'b0;
endmodule
module module_1 #(
    parameter id_5 = 32'd22
) (
    input supply1 id_0,
    input tri0 id_1,
    output wor id_2,
    input tri id_3,
    input supply1 id_4,
    input uwire _id_5,
    output wor id_6,
    input wor id_7,
    input supply1 id_8,
    input wire id_9,
    output tri1 id_10,
    input uwire id_11,
    input supply1 id_12,
    input wor id_13,
    input tri id_14
);
  assign id_10 = id_0;
  module_0 modCall_1 (
      id_8,
      id_3,
      id_6,
      id_9,
      id_4,
      id_9,
      id_6,
      id_13,
      id_10,
      id_14,
      id_12
  );
  assign modCall_1.id_7 = 0;
  assign id_2 = {id_11 ? -1 : id_3, id_9};
  parameter [1 'd0 : id_5] id_16 = 1;
endmodule
