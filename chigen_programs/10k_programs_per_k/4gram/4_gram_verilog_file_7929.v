// Seed: 118674129
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input supply1 id_3
);
  wire  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ;
  always @(id_13 or id_10) id_19 = id_9;
  id_29(
      .id_0(1), .id_1(id_5), .id_2(id_11), .id_3(1), .id_4(1)
  );
  wand id_30 = 1'b0;
  wire id_31;
  wire id_32, id_33;
  assign module_1.type_0 = 0;
  wire id_34;
  integer id_35, id_36;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1
);
  integer id_3;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0
  );
endmodule
