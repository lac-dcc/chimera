// Seed: 2841497396
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input supply1 id_2,
    input wand id_3,
    output tri1 id_4,
    input uwire id_5,
    input tri0 id_6,
    input tri1 id_7,
    input supply1 id_8,
    input wand id_9
);
  wire id_11;
endmodule
module module_1 #(
    parameter id_3 = 32'd40
) (
    input uwire id_0,
    output tri1 id_1,
    input supply0 id_2,
    input wand _id_3,
    input tri0 id_4,
    input tri id_5,
    output tri1 id_6,
    output tri1 id_7,
    input wire id_8,
    output supply1 id_9,
    output tri id_10,
    input supply0 id_11
);
  wire [id_3 : 'b0] id_13;
  wire id_14;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_5,
      id_1,
      id_8,
      id_4,
      id_5,
      id_11,
      id_8
  );
  assign modCall_1.id_7 = 0;
endmodule
