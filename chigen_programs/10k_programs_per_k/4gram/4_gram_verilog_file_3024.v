// Seed: 2014085430
module module_0 (
    output tri1 id_0,
    input supply1 id_1
    , id_11,
    input uwire id_2,
    input wor id_3,
    input tri0 id_4,
    input uwire id_5,
    input tri id_6,
    input wor id_7,
    output wor id_8,
    input wor id_9
);
  wire id_12;
endmodule
module module_1 #(
    parameter id_1 = 32'd52
) (
    input supply0 id_0,
    input wire _id_1,
    input uwire id_2,
    input tri1 id_3,
    output tri1 id_4,
    output wire id_5,
    output tri0 id_6,
    input uwire id_7,
    output wor id_8,
    input tri0 id_9,
    output wand id_10,
    input supply0 id_11
);
  wire [id_1 : -1] id_13;
  module_0 modCall_1 (
      id_5,
      id_11,
      id_9,
      id_0,
      id_0,
      id_7,
      id_3,
      id_7,
      id_10,
      id_0
  );
  assign modCall_1.id_3 = 0;
endmodule
