// Seed: 2971278105
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  tri0  id_15  =  1  &  1  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  =  id_16  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  =  id_11  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  assign id_3 = id_1;
  wire id_4;
  wire id_5;
  wire id_6;
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_3,
      id_6,
      id_1,
      id_6,
      id_5,
      id_3,
      id_6,
      id_4,
      id_3,
      id_7,
      id_7
  );
  assign modCall_1.id_33 = 0;
  assign id_3 = id_4;
  id_8 :
  assert property (@(posedge id_2 or posedge 1) 1)
  else id_8 = 1;
endmodule
