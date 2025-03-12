// Seed: 1951183202
module module_0 (
    input wor id_0,
    input wor id_1,
    input wor id_2,
    output tri id_3,
    output wor id_4,
    input tri id_5,
    output wire id_6,
    input wand id_7,
    output tri id_8,
    input tri1 id_9,
    input uwire id_10,
    input supply1 id_11,
    input wire id_12,
    output supply1 id_13,
    input wand id_14,
    input wire id_15,
    input uwire id_16,
    input uwire id_17,
    input supply0 id_18,
    input wor id_19,
    output wire id_20,
    output wor id_21,
    input tri0 id_22,
    input wand id_23,
    input supply0 id_24,
    input wand id_25,
    output wor id_26,
    input wor id_27,
    input supply0 id_28,
    input supply1 id_29,
    input wor id_30,
    output tri id_31,
    input supply0 id_32,
    input supply0 id_33,
    output uwire id_34,
    output wand id_35,
    output supply1 id_36,
    output supply1 id_37,
    output wor id_38,
    input wor id_39
);
  wire  id_41  ,  id_42  ,  id_43  ,  id_44  =  -1 'b0 ,  id_45  ,  id_46  ,  id_47  ,  id_48  ,  id_49  ,  id_50  ,  id_51  ,  id_52  ,  id_53  ,  id_54  ;
  assign id_45 = $clog2(90);
  ;
  assign module_1._id_1 = 0;
  assign id_45 = id_33;
endmodule
module module_1 #(
    parameter id_1 = 32'd69
) (
    output tri   id_0,
    input  tri0  _id_1
    , id_4,
    input  uwire id_2
);
  wire id_5;
  always @(posedge id_4[id_1]) release id_0;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2
  );
endmodule
