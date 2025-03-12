// Seed: 2089243499
module module_0 (
    input tri0 id_0,
    output wire id_1,
    input wor id_2,
    input wand id_3,
    output wire id_4,
    input supply0 id_5,
    input uwire id_6,
    output wand id_7,
    output uwire id_8,
    input tri1 id_9,
    input supply0 id_10,
    output wand id_11,
    input supply0 id_12,
    input supply1 id_13,
    output supply1 id_14,
    output tri0 id_15
    , id_32,
    input wor id_16,
    input supply0 id_17,
    input tri id_18,
    output wire id_19,
    input tri1 id_20,
    input wire id_21,
    input wand id_22,
    output wire id_23,
    input wand id_24,
    output supply1 id_25,
    output supply0 id_26,
    output supply0 id_27,
    input wire id_28,
    input uwire id_29,
    output tri0 id_30
);
  assign id_11 = id_13;
  parameter id_33 = 1;
  assign module_1.id_3 = 0;
  parameter id_34 = id_33;
endmodule
module module_1 #(
    parameter id_3 = 32'd10
) (
    output supply0 id_0,
    output uwire id_1,
    input supply0 id_2,
    input wand _id_3#(.id_5(-1))
);
  logic [-1  >  1 'b0 : id_3] id_6;
  logic id_7;
  ;
  parameter id_8 = 1;
  not primCall (id_0, id_6);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_0,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2,
      id_0
  );
endmodule
