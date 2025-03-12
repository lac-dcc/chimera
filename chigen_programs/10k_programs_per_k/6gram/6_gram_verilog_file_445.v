// Seed: 1288489485
module module_0 (
    input  wor  id_0,
    input  tri  id_1,
    output wor  id_2,
    output wire id_3
);
endmodule
module module_1 (
    output wor id_0,
    input supply0 id_1,
    output wor id_2
);
  assign id_0 = id_1;
  buf primCall (id_0, id_1);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
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
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22
);
  output wire id_22;
  inout wire id_21;
  output wire id_20;
  inout wire id_19;
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  initial assume (1 || 1 - id_10);
endmodule
module module_3 #(
    parameter id_8 = 32'd18,
    parameter id_9 = 32'd52
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    _id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  output logic [7:0] id_14;
  input wire id_13;
  module_2 modCall_1 (
      id_6,
      id_1,
      id_6,
      id_6,
      id_1,
      id_6,
      id_12,
      id_5,
      id_12,
      id_1,
      id_1,
      id_1,
      id_10,
      id_1,
      id_1,
      id_1,
      id_1,
      id_6,
      id_6,
      id_1,
      id_1,
      id_1
  );
  output wire id_12;
  inout logic [7:0] id_11;
  output wire id_10;
  inout wire _id_9;
  inout wire _id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output logic [7:0] id_3;
  output logic [7:0] id_2;
  inout wire id_1;
  assign id_14[id_9] = -1;
  assign id_2[id_8] = -1;
  assign id_3[1] = id_6 ? id_8 == id_6 : id_11[1];
endmodule
