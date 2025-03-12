// Seed: 2559942923
program module_0 (
    input uwire id_0,
    input wand id_1,
    input supply1 id_2,
    output supply0 id_3,
    output uwire id_4,
    output wire id_5,
    output tri id_6,
    output uwire id_7,
    input tri0 id_8
);
  logic id_10 = -1;
endprogram
module module_1 #(
    parameter id_10 = 32'd13,
    parameter id_15 = 32'd33,
    parameter id_16 = 32'd98,
    parameter id_20 = 32'd49,
    parameter id_9  = 32'd55
) (
    output uwire id_0,
    output wor id_1,
    input tri1 id_2,
    input tri0 id_3,
    input tri id_4,
    input tri id_5,
    input tri0 id_6,
    input uwire id_7
    , id_25,
    input wor id_8,
    input tri _id_9#(
        .id_26(1),
        .id_27(1),
        .id_28(1),
        .id_29(1)
    ),
    output wand _id_10,
    output tri0 id_11,
    input supply0 id_12[1  +  -1 : 1],
    input uwire id_13[-1  ==  -1 : id_10  ?  id_15 : 1],
    output supply0 id_14,
    input tri1 _id_15,
    input supply0 _id_16,
    input tri id_17,
    input tri1 id_18,
    input tri id_19[id_16 : id_9],
    output uwire _id_20,
    input supply0 void id_21,
    output logic id_22,
    input supply0 id_23
);
  union packed {
    logic id_30;
    logic id_31;
    logic id_32;
    logic id_33;
    logic [1  ==  1  ^  -1 'd0 === "" : id_20  -  (  1  )] id_34;
    logic id_35;
  } id_36;
  ;
  supply1 id_37 = -1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_7,
      id_11,
      id_0,
      id_0,
      id_0,
      id_14,
      id_6
  );
  assign modCall_1.id_7 = 0;
  always id_22 <= id_9;
  or primCall (
      id_14,
      id_28,
      id_5,
      id_18,
      id_2,
      id_35,
      id_23,
      id_7,
      id_36,
      id_8,
      id_25,
      id_12,
      id_26,
      id_19,
      id_32,
      id_34,
      id_3
  );
endmodule
