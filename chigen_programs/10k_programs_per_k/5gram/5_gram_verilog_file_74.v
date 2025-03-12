// Seed: 3362794397
module module_0 (
    input wor id_0,
    output tri0 id_1,
    input tri1 id_2,
    input uwire id_3,
    output wand id_4,
    input tri1 id_5,
    input wire id_6,
    input supply0 id_7,
    input wand id_8,
    output tri0 id_9
);
  assign module_2._id_15 = 0;
endmodule
module module_1 (
    input wor id_0,
    output supply0 id_1,
    output supply1 id_2,
    input tri id_3
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3,
      id_2
  );
  assign modCall_1.id_7 = 0;
endmodule
module module_2 #(
    parameter id_15 = 32'd39,
    parameter id_7  = 32'd18
) (
    input tri id_0,
    input supply0 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input tri1 id_4,
    input supply0 id_5,
    input supply1 id_6,
    input supply0 _id_7,
    output tri id_8,
    output tri1 id_9,
    output supply0 id_10,
    input supply1 id_11,
    output tri0 id_12,
    output tri0 id_13,
    input supply1 id_14,
    input uwire _id_15,
    input supply1 id_16,
    output wor id_17,
    input wire id_18,
    output tri0 id_19,
    output tri1 id_20,
    output supply1 id_21
);
  wire [id_15  >>  1 : id_7] id_23 = id_2;
  module_0 modCall_1 (
      id_0,
      id_13,
      id_6,
      id_4,
      id_9,
      id_18,
      id_14,
      id_0,
      id_14,
      id_17
  );
endmodule
