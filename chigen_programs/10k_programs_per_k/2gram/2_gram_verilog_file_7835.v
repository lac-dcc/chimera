// Seed: 2427467357
module module_0 (
    output uwire id_0,
    output wor   id_1
);
  assign id_1 = -1;
  wire id_3;
  wire id_4;
  wire id_5;
endmodule
module module_1 (
    input  tri0  id_0,
    output uwire id_1,
    input  tri1  id_2,
    input  wor   id_3,
    output tri0  id_4
);
  wire id_6;
  ;
  xor primCall (id_1, id_2, id_0, id_3, id_7);
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_1
  );
  assign modCall_1.id_0 = 0;
  logic id_8;
endmodule
module module_2 #(
    parameter id_10 = 32'd16,
    parameter id_11 = 32'd24,
    parameter id_8  = 32'd9
) (
    output supply1 id_0,
    output wire id_1,
    input supply1 id_2,
    input supply0 id_3,
    input supply0 id_4,
    input tri1 id_5,
    input uwire id_6,
    output logic id_7,
    input wire _id_8,
    input wand id_9,
    input supply1 _id_10,
    input wand _id_11
);
  wire id_13;
  ;
  always id_7 = id_8;
  wire [id_10 : -1] id_14;
  wire id_15;
  wire [id_11 : -1] id_16;
  wor id_17, id_18 = -1, id_19;
  tri1  [  1  -  -1  :  id_8  ]  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ;
  wire id_33;
  assign id_22 = id_24 - id_11;
  wire [-1 : id_8] id_34;
  and primCall (
      id_1,
      id_29,
      id_27,
      id_17,
      id_5,
      id_15,
      id_2,
      id_4,
      id_19,
      id_18,
      id_28,
      id_23,
      id_24,
      id_25,
      id_9,
      id_3,
      id_16,
      id_22,
      id_6,
      id_26,
      id_13,
      id_30,
      id_20,
      id_33,
      id_31,
      id_32,
      id_34,
      id_14,
      id_21
  );
  module_0 modCall_1 (
      id_1,
      id_1
  );
  assign modCall_1.id_1 = 0;
  assign id_24 = -1'b0;
endmodule
