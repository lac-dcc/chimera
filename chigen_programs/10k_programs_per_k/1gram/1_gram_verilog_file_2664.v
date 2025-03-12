// Seed: 1338860241
module module_0 (
    input tri1 id_0,
    output tri1 id_1,
    output wor id_2,
    output tri id_3,
    output uwire id_4,
    output tri0 id_5,
    output wire id_6[-1 : -1 'h0],
    output wor id_7,
    output uwire id_8,
    output wand id_9,
    input supply1 id_10,
    input supply0 id_11,
    output supply0 id_12,
    input uwire id_13
);
  wire [-1  &&  -1 : 1] id_15, id_16;
  assign id_4 = 1;
  assign module_1.id_3 = 0;
  assign id_12 = id_10;
endmodule
module module_1 #(
    parameter id_10 = 32'd78,
    parameter id_14 = 32'd46,
    parameter id_6  = 32'd78
) (
    output uwire id_0,
    output supply0 id_1,
    input wire id_2,
    output wor id_3,
    output wand id_4,
    output wire id_5,
    input wire _id_6,
    input wand id_7,
    input tri id_8,
    output supply1 id_9,
    input uwire _id_10,
    output tri1 id_11,
    output wire id_12
);
  wire [id_6  ===  id_6 : 1] _id_14, id_15;
  wire [id_14 : id_10] id_16;
  assign id_3 = 1;
  assign id_9 = id_14 && -1'h0;
  assign id_9 = id_6;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_1,
      id_4,
      id_12,
      id_9,
      id_9,
      id_11,
      id_11,
      id_4,
      id_2,
      id_7,
      id_5,
      id_8
  );
endmodule
