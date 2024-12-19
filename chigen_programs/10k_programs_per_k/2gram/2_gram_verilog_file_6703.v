// Seed: 4016778038
module module_0 (
    input tri id_0,
    input tri1 id_1,
    input supply0 id_2,
    input wor id_3,
    input tri0 id_4,
    output tri0 id_5
);
  always begin : LABEL_0
    id_5 = 1'b0;
  end
  wire id_7;
  assign id_5 = 1;
  wire id_8;
  wire id_10;
  id_11(
      .id_0(id_8)
  );
  wire  id_12;
  uwire id_13;
  wand  id_14, id_15 = 1'b0;
  assign id_7 = id_14 & 1'b0;
  wire id_16;
  wire id_17;
  assign id_15 = id_13;
  wire id_18 = id_12;
  wire id_19;
  wire id_20;
endmodule
module module_1 (
    output wor id_0,
    input wire id_1,
    input supply0 id_2,
    output supply0 id_3,
    input supply1 id_4,
    output supply1 id_5,
    input wire id_6,
    output supply1 id_7,
    output wor id_8,
    input tri0 id_9,
    input uwire id_10,
    input wand id_11,
    output tri1 id_12,
    input supply0 id_13,
    input tri0 id_14
);
  wire  id_16  =  1  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  =  id_4  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ;
  wire  id_33;
  uwire id_34 = 1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_27,
      id_22,
      id_23,
      id_30
  );
  assign modCall_1.type_2 = 0;
  wire id_35;
  assign id_31 = !1;
endmodule
