// Seed: 2158522451
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    input tri1 id_2,
    output uwire id_3,
    output tri id_4,
    output wor id_5,
    output supply0 id_6,
    output tri id_7,
    input wand id_8
    , id_13,
    input supply1 id_9,
    input tri1 id_10,
    output tri id_11
);
  id_14 :
  assert property (@(posedge 1) id_8)
  else;
  assign id_5 = id_2;
  parameter id_15 = 1 == (1);
endmodule
module module_1 (
    output uwire id_0,
    input wire id_1,
    input wand id_2,
    input tri0 id_3,
    input wor id_4,
    input tri1 id_5,
    input uwire id_6,
    input uwire id_7,
    output uwire id_8
    , id_26,
    output supply1 id_9,
    input supply1 id_10,
    input supply1 id_11,
    input wand id_12,
    input tri0 id_13,
    input tri1 id_14,
    input wire id_15,
    input tri1 id_16,
    output tri0 id_17,
    inout tri id_18,
    input wand id_19,
    input wire id_20,
    input uwire id_21,
    output uwire id_22,
    input wand id_23,
    output supply1 id_24
);
  wire id_27;
  ;
  nor primCall (
      id_22,
      id_13,
      id_2,
      id_21,
      id_7,
      id_4,
      id_14,
      id_18,
      id_23,
      id_5,
      id_6,
      id_11,
      id_15,
      id_3,
      id_20,
      id_12,
      id_10,
      id_19,
      id_16
  );
  module_0 modCall_1 (
      id_20,
      id_0,
      id_10,
      id_22,
      id_17,
      id_17,
      id_8,
      id_24,
      id_10,
      id_7,
      id_20,
      id_22
  );
  assign modCall_1.id_11 = 0;
endmodule
