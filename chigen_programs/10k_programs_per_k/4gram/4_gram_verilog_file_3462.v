// Seed: 3723064952
module module_0 (
    input supply0 id_0,
    input supply0 id_1,
    input wor id_2,
    input tri0 id_3,
    output tri0 id_4,
    output uwire id_5,
    input wire id_6,
    input uwire id_7,
    output supply0 id_8,
    input tri id_9,
    input supply1 id_10,
    input tri0 id_11,
    input uwire id_12,
    input wor id_13,
    output wor id_14,
    output supply1 id_15,
    input tri1 id_16
);
  wire id_18;
  wire  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ;
  wire id_41;
  wire id_42;
  wire id_43;
endmodule
module module_1 (
    input supply1 id_0,
    output wor id_1,
    input tri id_2,
    output wor id_3,
    input supply1 id_4,
    input tri0 id_5,
    inout wor id_6,
    input supply1 id_7,
    output wire id_8,
    input tri1 id_9,
    input uwire id_10,
    input supply1 id_11,
    input wor id_12,
    output tri id_13,
    output uwire id_14,
    input wor id_15,
    output tri1 id_16
);
  wire id_18;
  assign id_8 = 1;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_6,
      id_2,
      id_13,
      id_13,
      id_4,
      id_10,
      id_6,
      id_10,
      id_5,
      id_15,
      id_15,
      id_12,
      id_8,
      id_8,
      id_9
  );
  assign modCall_1.id_2 = 0;
  int id_19 (
      .id_0(id_7),
      .id_1(),
      .id_2((id_8 ^ 1'b0)),
      .id_3(1),
      .id_4(id_5),
      .id_5(id_14),
      .id_6(id_13),
      .id_7(1'b0),
      .id_8(1),
      .id_9(id_0)
  );
  wire id_20;
endmodule
