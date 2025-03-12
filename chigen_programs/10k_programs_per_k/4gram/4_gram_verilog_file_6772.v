// Seed: 3611773863
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output uwire id_2;
  inout logic [7:0] id_1;
  assign id_2 = id_1 ? id_1[1 :-1] : -1;
  assign id_3 = -1;
endmodule
module module_1 #(
    parameter id_10 = 32'd46,
    parameter id_24 = 32'd23
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
    _id_10,
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
    id_22,
    id_23,
    _id_24,
    id_25,
    id_26
);
  inout wire id_26;
  inout wire id_25;
  inout wire _id_24;
  input wire id_23;
  output wire id_22;
  input wire id_21;
  inout logic [7:0] id_20;
  input wire id_19;
  output wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire _id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_20[-1**id_10-id_24] = id_15 ? {-1{id_14}} : id_24;
  module_0 modCall_1 (
      id_20,
      id_2,
      id_15,
      id_15
  );
  assign modCall_1.id_3 = 0;
  wire id_27;
endmodule
