// Seed: 2105041230
module module_0 (
    output wand id_0,
    input uwire id_1,
    input wand id_2,
    output tri id_3,
    output tri id_4,
    output uwire id_5,
    output supply0 id_6,
    input tri id_7,
    input uwire id_8,
    input wor id_9,
    input wor id_10,
    input tri1 id_11,
    output supply0 id_12,
    input supply1 id_13,
    output supply0 id_14
);
  logic id_16 [1 : {  -1  ,  -1 'h0 }];
  wire  id_17;
  parameter id_18 = -1;
endmodule
module module_1 (
    input  tri   id_0,
    output uwire id_1,
    output uwire id_2,
    output wand  id_3,
    input  wire  id_4
);
  parameter id_6 = 1 & {(-1) {-1}};
  and primCall (id_3, id_4, id_0, id_6);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_1,
      id_2,
      id_3,
      id_3,
      id_4,
      id_4,
      id_0,
      id_4,
      id_0,
      id_1,
      id_0,
      id_3
  );
  assign modCall_1.id_14 = 0;
  wire id_7;
endmodule
