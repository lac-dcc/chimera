// Seed: 1874668566
module module_0 (
    output tri id_0,
    input supply1 id_1,
    input uwire id_2,
    output wor id_3,
    input tri id_4,
    input supply1 id_5,
    output supply1 id_6,
    output wor id_7,
    input tri0 id_8,
    input wand id_9
);
endmodule
module module_1 #(
    parameter id_8 = 32'd35
) (
    output tri1 id_0,
    input tri0 id_1,
    input tri0 id_2,
    input supply0 id_3,
    input wire id_4,
    output tri1 id_5,
    output tri1 id_6,
    input wand id_7,
    input supply1 _id_8
);
  logic [7:0] id_10;
  wire id_11;
  wire id_12;
  xnor primCall (id_0, id_11, id_1, id_10, id_12, id_7, id_2, id_3, id_4, id_13);
  wire [(  ~  id_8  )  -  -1 : -1 'b0] id_13;
  assign id_10[1] = -1;
  module_0 modCall_1 (
      id_6,
      id_2,
      id_7,
      id_6,
      id_4,
      id_3,
      id_6,
      id_5,
      id_1,
      id_1
  );
  assign modCall_1.id_5 = 0;
  wire id_14;
endmodule
