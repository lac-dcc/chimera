// Seed: 2756200299
module module_0 (
    input wire id_0,
    output tri1 id_1,
    input tri0 id_2,
    output uwire id_3,
    input tri id_4,
    input supply1 id_5,
    output supply1 id_6,
    output uwire id_7[1 : -1],
    output tri1 id_8,
    input supply0 id_9
);
  assign id_8 = {-1{1}};
  assign module_1.id_3 = 0;
  assign id_6 = id_9;
  wire ["" : 1] id_11, id_12, id_13, id_14;
endmodule
module module_1 #(
    parameter id_12 = 32'd74,
    parameter id_6  = 32'd26
) (
    input uwire id_0,
    input tri0 id_1,
    input uwire id_2,
    input wor id_3[id_12 : -1],
    input uwire id_4,
    input tri0 id_5,
    input wor _id_6,
    input tri1 id_7,
    output tri0 id_8,
    output uwire id_9,
    input wire id_10,
    input tri0 id_11,
    input uwire _id_12,
    input tri0 id_13,
    input wire id_14,
    output tri id_15,
    output wire id_16,
    output uwire id_17,
    output tri1 id_18,
    input wor id_19[id_6 : -1],
    input supply0 id_20
);
  assign id_18 = id_10;
  module_0 modCall_1 (
      id_3,
      id_8,
      id_5,
      id_9,
      id_1,
      id_20,
      id_18,
      id_9,
      id_16,
      id_20
  );
endmodule
