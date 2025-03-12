// Seed: 1451948114
module module_0 (
    output tri1 id_0,
    output tri id_1,
    input wand id_2,
    output wor id_3,
    input wire id_4,
    input uwire id_5,
    input wand id_6,
    input wand id_7,
    input tri1 id_8,
    input wand id_9,
    output uwire id_10,
    output tri0 id_11,
    output tri0 id_12,
    output tri id_13,
    input wor id_14,
    output wor id_15,
    input supply0 id_16,
    output tri1 id_17,
    input supply0 id_18,
    input uwire id_19,
    input wand id_20
);
  wire id_22;
  ;
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd39,
    parameter id_7  = 32'd69
) (
    input tri0 id_0,
    input wor id_1,
    input uwire id_2,
    output wand id_3,
    output wand id_4,
    input uwire id_5,
    input wire id_6,
    input tri _id_7,
    input supply0 id_8,
    output wire id_9,
    input tri _id_10
);
  wire [id_7 : -1 'b0 -  id_10] id_12;
  or primCall (id_3, id_5, id_0, id_2, id_12, id_1, id_8);
  module_0 modCall_1 (
      id_3,
      id_9,
      id_1,
      id_9,
      id_5,
      id_5,
      id_6,
      id_1,
      id_1,
      id_1,
      id_3,
      id_4,
      id_9,
      id_9,
      id_5,
      id_3,
      id_8,
      id_3,
      id_8,
      id_6,
      id_6
  );
endmodule
