// Seed: 3414627569
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
    id_14,
    id_15,
    id_16,
    id_17
);
  output wire id_17;
  output wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ;
endmodule
module module_1 #(
    parameter id_8 = 32'd26
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_2,
      id_2,
      id_2,
      id_2,
      id_5,
      id_5,
      id_3,
      id_6,
      id_6,
      id_2,
      id_2,
      id_2,
      id_5,
      id_6,
      id_6
  );
  input wire id_3;
  inout wire id_2;
  output logic [7:0] id_1;
  wire id_7, _id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15;
  assign id_1[id_8 :-1] = id_10;
endmodule
