// Seed: 997297387
module module_0 (
    output tri0 id_0,
    output tri0 id_1,
    input  wand id_2,
    input  tri1 id_3,
    input  wand id_4,
    input  tri0 id_5
);
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input uwire id_0,
    output supply1 id_1,
    output wor id_2,
    output tri1 id_3,
    input wire id_4,
    output supply1 id_5
);
  module_0 modCall_1 (
      id_2,
      id_5,
      id_0,
      id_4,
      id_0,
      id_0
  );
endmodule
module module_2 #(
    parameter id_0 = 32'd58,
    parameter id_4 = 32'd32
) (
    input wire _id_0,
    input wand id_1,
    input wand id_2,
    output tri1 id_3,
    input wand _id_4,
    input uwire id_5,
    output tri1 id_6,
    input supply0 id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_6,
      id_3,
      id_7,
      id_1,
      id_7,
      id_1
  );
  assign modCall_1.id_4 = 0;
  logic [id_0 : id_4] id_10;
endmodule
