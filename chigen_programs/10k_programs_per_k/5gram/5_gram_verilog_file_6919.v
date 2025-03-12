// Seed: 1868681093
module module_0 (
    input tri0 id_0,
    output wor id_1,
    input tri0 id_2,
    output wand id_3,
    input tri id_4,
    input tri0 id_5,
    input wire id_6,
    input supply0 id_7,
    input tri0 id_8,
    output uwire id_9,
    input tri1 id_10,
    input supply0 id_11,
    input wire id_12,
    output wand id_13,
    output supply0 id_14,
    input supply1 id_15,
    output uwire id_16,
    output wand id_17,
    input uwire id_18,
    output uwire id_19
);
  logic [1 : 1] id_21;
  ;
endmodule
module module_1 #(
    parameter id_4 = 32'd49
) (
    output tri0 id_0,
    input wor id_1,
    output supply0 id_2,
    input tri0 id_3,
    input tri0 _id_4,
    output tri id_5,
    output supply1 id_6,
    output tri0 id_7,
    output wor id_8
);
  assign id_8 = id_1;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_3,
      id_0,
      id_3,
      id_1,
      id_1,
      id_3,
      id_3,
      id_0,
      id_3,
      id_1,
      id_3,
      id_8,
      id_2,
      id_3,
      id_0,
      id_8,
      id_3,
      id_7
  );
  assign modCall_1.id_5 = 0;
  localparam [id_4 : id_4] id_10 = 1'b0;
  assign id_8 = -1;
endmodule
