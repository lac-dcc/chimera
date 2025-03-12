// Seed: 2400601361
module module_0 (
    output wor id_0,
    output wand id_1,
    output supply1 module_0,
    output tri id_3,
    input wire id_4,
    input wand id_5,
    input tri0 id_6,
    input supply1 id_7,
    input supply0 id_8,
    output tri0 id_9,
    output uwire id_10,
    output wand id_11,
    output supply0 id_12,
    input tri id_13,
    input wor id_14
    , id_22,
    input supply1 id_15,
    output supply1 id_16,
    output wand id_17,
    input supply0 id_18,
    input tri0 id_19,
    input supply0 id_20
);
  logic id_23;
  ;
endmodule
module module_1 #(
    parameter id_11 = 32'd8,
    parameter id_3  = 32'd69,
    parameter id_9  = 32'd45
) (
    input uwire id_0,
    input supply1 id_1,
    input supply1 id_2,
    output supply1 _id_3,
    input supply0 id_4
    , id_14,
    input uwire id_5,
    input tri0 id_6,
    input supply1 id_7,
    output tri0 id_8,
    input supply1 _id_9,
    input tri id_10,
    output supply0 _id_11,
    input uwire id_12
);
  assign id_3 = id_0;
  assign id_3 = id_14++;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_8,
      id_8,
      id_5,
      id_4,
      id_4,
      id_6,
      id_12,
      id_8,
      id_8,
      id_8,
      id_8,
      id_6,
      id_10,
      id_0,
      id_8,
      id_8,
      id_7,
      id_10,
      id_10
  );
  assign modCall_1.id_7 = 0;
  wire id_15;
  ;
  or primCall (id_8, id_2, id_6, id_7, id_4, id_12);
  struct packed {
    logic [-1 : id_11] id_16;
    logic [id_3 : 1]   id_17;
  } [id_9 : 1] id_18;
  ;
endmodule
