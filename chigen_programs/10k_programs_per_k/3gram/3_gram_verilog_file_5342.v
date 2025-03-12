// Seed: 1289702514
module module_0 (
    output uwire id_0,
    input supply0 id_1,
    output uwire id_2,
    output supply0 id_3,
    output wire id_4,
    input tri1 id_5,
    input wor id_6,
    input tri1 id_7,
    input uwire id_8,
    input wor id_9,
    output uwire id_10,
    input supply0 id_11,
    output uwire id_12,
    output supply0 id_13
);
  assign #id_15 id_4 = id_11;
endmodule
module module_1 #(
    parameter id_2 = 32'd99
) (
    output tri1 id_0,
    output supply0 id_1,
    input tri1 _id_2,
    input tri0 id_3,
    output uwire id_4,
    input supply0 id_5,
    output tri id_6,
    output tri id_7,
    input wand id_8,
    input uwire id_9,
    input tri id_10,
    input wor id_11,
    input supply1 id_12
);
  wire [-1 : id_2] id_14;
  logic [7:0] id_15;
  wire id_16;
  assign id_15[-1] = -1;
  logic id_17;
  ;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_0,
      id_1,
      id_1,
      id_3,
      id_11,
      id_12,
      id_12,
      id_11,
      id_0,
      id_8,
      id_6,
      id_4
  );
  assign modCall_1.id_15 = 0;
  assign id_4 = id_17;
endmodule
