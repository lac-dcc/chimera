// Seed: 1096688293
module module_0 (
    input tri id_0,
    output uwire id_1,
    input wor id_2,
    output wire id_3,
    output wand id_4,
    output wand id_5,
    input supply1 id_6,
    input tri1 id_7,
    input supply1 id_8,
    input wand id_9,
    input wor id_10,
    input tri id_11,
    output tri id_12,
    output supply0 id_13,
    output wand id_14,
    output supply0 id_15,
    output tri0 id_16,
    input tri0 id_17,
    input wor id_18,
    output tri id_19,
    input wand id_20,
    output tri1 id_21,
    input wor id_22,
    input wand id_23
);
  assign id_21 = -1;
  assign id_12 = 1;
  wire id_25;
  wire id_26;
  assign id_12 = $clog2(51);
  ;
  wire id_27;
  ;
endmodule
module module_1 #(
    parameter id_4 = 32'd33
) (
    output tri1  id_0,
    input  uwire id_1,
    output wor   id_2,
    output tri   id_3,
    input  tri1  _id_4,
    output uwire id_5,
    input  wor   id_6
);
  wire id_8;
  logic [1 : -1] id_9;
  ;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_6,
      id_0,
      id_3,
      id_5,
      id_6,
      id_6,
      id_6,
      id_6,
      id_1,
      id_6,
      id_3,
      id_3,
      id_2,
      id_2,
      id_0,
      id_1,
      id_6,
      id_3,
      id_6,
      id_3,
      id_1,
      id_1
  );
  assign modCall_1.id_6 = 0;
  wire [1 'h0 : id_4] id_10;
  xnor primCall (id_5, id_9, id_8, id_1, id_6);
endmodule
