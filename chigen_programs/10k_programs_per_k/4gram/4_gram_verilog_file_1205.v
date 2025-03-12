// Seed: 1948152357
module module_0 (
    output wand id_0,
    output tri1 id_1,
    output tri0 id_2,
    input supply0 id_3,
    input supply1 id_4,
    output supply0 id_5,
    output tri1 id_6,
    input wand id_7
);
  wire id_9;
  assign id_6.id_4 = id_9;
  assign (weak1, supply0) id_5 = ~&id_9;
  wire id_10;
endmodule
module module_1 #(
    parameter id_2 = 32'd15,
    parameter id_9 = 32'd41
) (
    output uwire id_0,
    input  tri0  id_1,
    input  tri   _id_2,
    input  uwire id_3,
    output tri1  id_4,
    output uwire id_5,
    output tri   id_6,
    output tri   id_7
);
  wire _id_9;
  wire id_10;
  logic [-1 : 1 'b0 -  -1] id_11;
  wire [id_9 : id_2] id_12;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_6,
      id_1,
      id_3,
      id_4,
      id_5,
      id_1
  );
  assign modCall_1.id_5 = 0;
endmodule
