// Seed: 1551085906
module module_0 (
    output uwire id_0,
    input wire id_1,
    input uwire id_2,
    input tri id_3,
    output tri id_4,
    input tri0 id_5,
    input tri1 id_6,
    input tri0 id_7,
    input supply1 id_8,
    output supply1 id_9,
    input supply0 id_10,
    input supply0 id_11,
    input wor id_12,
    output wire id_13,
    inout supply1 id_14,
    output wor id_15,
    input tri0 id_16,
    output tri0 id_17,
    output supply1 id_18
    , id_24,
    input supply0 id_19,
    input supply1 id_20,
    input tri0 id_21,
    input wire id_22
);
  wire id_25 = id_16;
  assign module_1.id_22 = 0;
  assign id_17 = 1;
endmodule
module module_1 (
    inout tri0 id_0,
    input supply1 id_1
);
  assign id_0 = id_0;
  tri0  id_3  ,  id_4  ,  id_5  ,  id_6  ,  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0
  );
  id_29(
      .id_0(id_27)
  );
  wire id_30;
  tri1 id_31;
  wire id_32, id_33;
  id_34 :
  assert property (@(posedge 1) !id_28 ? id_0 : id_31)
  else $display(id_25);
  id_35(
      .id_0((id_10)), .id_1(id_33), .id_2(1), .id_3(1), .id_4(id_27)
  );
endmodule
