// Seed: 3860585876
module module_0 (
    input  wand id_0,
    input  tri1 id_1,
    input  tri1 id_2,
    output tri0 id_3,
    output tri0 id_4,
    output wand id_5,
    input  wand id_6
);
  wire id_8;
endmodule
module module_1 (
    output uwire id_0,
    input  wor   id_1,
    input  tri0  id_2,
    input  wire  id_3,
    input  wire  id_4,
    input  tri0  id_5
);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_2,
      id_0,
      id_0,
      id_0,
      id_4
  );
  assign modCall_1.id_5 = 0;
endmodule
module module_2 #(
    parameter id_3 = 32'd17,
    parameter id_4 = 32'd64
) (
    input supply1 id_0,
    input tri1 id_1,
    output tri1 id_2,
    input tri1 _id_3,
    output wor _id_4,
    input tri0 id_5,
    output uwire id_6,
    input supply0 id_7
);
  struct packed {
    logic [1 : -1 'd0]  id_9;
    logic [id_3 : id_4] id_10;
    logic [-1 : 1 'b0]  id_11;
  } id_12;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_1,
      id_6,
      id_2,
      id_6,
      id_1
  );
endmodule
