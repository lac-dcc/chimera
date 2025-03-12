// Seed: 1912151002
module module_0 (
    input tri0 id_0,
    output wor id_1,
    input supply1 id_2,
    input wand id_3,
    output uwire id_4,
    output uwire id_5,
    input wor id_6,
    input tri id_7,
    output tri0 id_8,
    output wand id_9,
    output uwire id_10,
    output wand id_11,
    input wand id_12,
    output wire id_13
    , id_37,
    input tri id_14,
    input uwire id_15,
    output uwire id_16,
    input wire id_17,
    input wor id_18,
    output supply0 id_19,
    output tri id_20,
    input tri id_21,
    input wand id_22,
    output wand id_23,
    output supply1 id_24,
    output supply0 id_25,
    output wand id_26,
    output wand id_27,
    output wand id_28,
    input wire id_29,
    input wire id_30,
    input tri id_31,
    input tri id_32,
    input tri0 id_33,
    output tri1 id_34,
    input tri1 id_35
);
  specify
    if (-1) (id_38 => id_39) = 1;
  endspecify
  assign module_1.id_16 = 0;
endmodule
module module_1 #(
    parameter id_6 = 32'd44
) (
    output wand id_0,
    input wire id_1,
    input wire id_2,
    output supply1 id_3,
    output tri0 id_4,
    input wor id_5,
    input tri1 _id_6,
    output tri1 id_7,
    input wor id_8
);
  wire id_10;
  wire id_11;
  tri  id_12 = -1'h0;
  wand id_13;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_8,
      id_1,
      id_4,
      id_3,
      id_2,
      id_5,
      id_4,
      id_0,
      id_0,
      id_4,
      id_1,
      id_0,
      id_2,
      id_5,
      id_3,
      id_5,
      id_1,
      id_0,
      id_4,
      id_5,
      id_2,
      id_7,
      id_7,
      id_3,
      id_0,
      id_4,
      id_4,
      id_5,
      id_8,
      id_8,
      id_5,
      id_1,
      id_4,
      id_2
  );
  assign id_0  = -1;
  assign id_13 = -1;
  logic [id_6 : -1 'h0] id_14, id_15;
  id_16 :
  assert property (@(posedge 1) -1)
  else $clog2(48);
  ;
endmodule
