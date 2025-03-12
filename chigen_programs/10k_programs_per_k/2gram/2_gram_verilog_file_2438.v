// Seed: 344469837
module module_0 (
    output tri0 id_0,
    input tri0 id_1,
    input supply0 id_2,
    output wor id_3,
    input wor id_4,
    input wand id_5,
    input tri0 id_6,
    input wand id_7,
    input tri1 id_8,
    input tri1 id_9,
    output wor id_10,
    input wand id_11,
    output supply0 id_12,
    input wor id_13,
    input wor id_14,
    input wand id_15,
    input supply0 id_16,
    input tri id_17,
    output tri0 id_18,
    output supply0 id_19,
    output supply1 id_20#(
        .id_23(1),
        .id_24(-1),
        .id_25(1),
        .id_26(1),
        .id_27(-1'd0),
        .id_28(1)
    ),
    input supply0 id_21
);
  assign #id_29 id_10 = 1;
  wire id_30;
  assign id_0 = -1;
  always begin : LABEL_0
    assume (id_23);
  end
  assign id_18 = id_14;
  assign id_10 = id_17;
  wire id_31;
  ;
  wire [-1  |  -1  +  -1 : 1] id_32;
  assign id_24 = id_28;
  wire  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  ,  id_45  ,  id_46  ,  id_47  ,  id_48  ,  id_49  ,  id_50  ,  id_51  ,  id_52  ;
  assign id_0 = id_39;
endmodule
module module_1 (
    output tri  id_0,
    output tri  id_1,
    input  wor  id_2,
    output tri0 id_3
);
  logic [7:0] id_5;
  assign id_1 = id_5;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_0,
      id_1,
      id_2
  );
  assign modCall_1.id_19 = 0;
  id_6 :
  assert property (@({1, id_6}) (id_5[-1'b0 :-1]))
  else;
endmodule
