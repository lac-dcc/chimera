// Seed: 717513014
module module_0 #(
    parameter id_26 = 32'd35
) (
    output uwire id_0,
    output supply1 id_1,
    input tri1 id_2,
    output wand id_3,
    input tri id_4,
    input tri id_5,
    output tri1 id_6,
    input tri1 id_7,
    input wor id_8,
    output wor id_9,
    output tri id_10,
    input wor id_11,
    input wire id_12
    , _id_26,
    output wor id_13,
    input tri0 id_14,
    input wor id_15,
    output supply1 id_16,
    input supply0 id_17,
    input wire id_18,
    input uwire id_19,
    output wand id_20,
    output wire id_21,
    output wor id_22,
    input uwire id_23,
    output wire id_24
);
  wire [-1 : -1] id_27;
  wire id_28;
  ;
  struct packed {
    logic id_29;
    logic id_30;
  } id_31;
  ;
  wire [id_26 : -1] id_32;
endmodule
module module_1 (
    input  wire  id_0,
    output uwire id_1,
    input  tri0  id_2,
    input  wor   id_3,
    input  tri0  id_4,
    output uwire id_5
);
  wire id_7;
  or primCall (id_1, id_4, id_7, id_3, id_0);
  module_0 modCall_1 (
      id_5,
      id_5,
      id_4,
      id_1,
      id_3,
      id_0,
      id_1,
      id_0,
      id_2,
      id_5,
      id_1,
      id_2,
      id_4,
      id_1,
      id_2,
      id_2,
      id_1,
      id_3,
      id_2,
      id_3,
      id_1,
      id_5,
      id_5,
      id_4,
      id_1
  );
  assign modCall_1.id_13 = 0;
endmodule
