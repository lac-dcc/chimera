// Seed: 1503957315
module module_0 (
    input supply0 id_0,
    output supply1 id_1,
    input wor id_2
);
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    input tri1 id_2,
    input supply0 id_3,
    output wand id_4,
    input tri1 id_5,
    input tri0 id_6
);
  assign id_0 = -1;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_6
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 #(
    parameter id_22 = 32'd59,
    parameter id_24 = 32'd36
) (
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
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_15;
  wire  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  _id_22  ,  id_23  ,  _id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ;
  logic [id_22 : id_24] id_35;
  ;
  logic id_36;
  ;
  wire id_37;
endmodule
module module_3 #(
    parameter id_1 = 32'd93
) (
    _id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  module_2 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_4,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
  output logic [7:0] id_3;
  inout wire id_2;
  input wire _id_1;
  assign id_3[id_1] = id_2;
endmodule
