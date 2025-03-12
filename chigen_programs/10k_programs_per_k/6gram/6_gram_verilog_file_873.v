// Seed: 4097616639
module module_0 (
    input wire id_0,
    input supply1 id_1,
    input tri1 id_2,
    output tri1 id_3,
    input wire id_4,
    output uwire id_5,
    output tri0 id_6,
    output supply1 id_7,
    input wire id_8,
    input tri1 id_9,
    input wor id_10,
    output wor id_11,
    input uwire id_12,
    input tri1 id_13,
    output supply1 id_14
);
  wire id_16;
  wire  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ;
  wire id_42;
  wire id_43;
  ;
endmodule
module module_1 #(
    parameter id_3 = 32'd58,
    parameter id_7 = 32'd20
) (
    input uwire id_0,
    input wand id_1,
    input tri0 id_2,
    input wand _id_3,
    input wor id_4,
    input wire id_5,
    output supply1 id_6,
    input supply0 _id_7,
    output wand id_8
);
  assign id_6 = 1 - id_1;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_5,
      id_6,
      id_4,
      id_6,
      id_6,
      id_6,
      id_2,
      id_5,
      id_4,
      id_8,
      id_5,
      id_0,
      id_8
  );
  assign modCall_1.id_0 = 0;
  logic [id_7 : id_3] id_10;
endmodule
