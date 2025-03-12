// Seed: 4217802278
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
    id_17,
    id_18,
    id_19,
    id_20
);
  output wire id_20;
  output wire id_19;
  input wire id_18;
  input wire id_17;
  input wire id_16;
  output wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  supply1 id_21, id_22 = 1'b0;
endmodule
module module_1 #(
    parameter id_1 = 32'd40
) (
    _id_1
);
  inout wire _id_1;
  parameter id_2 = 1;
  reg id_3;
  always
    wait (id_3 == (~id_1) ? -1 : id_2) begin : LABEL_0
      id_3 = -1;
    end
  always id_3 = id_2;
  wire id_4;
  ;
  wire id_5;
  assign id_5 = id_4;
  assign id_3 = 1 & -1'd0 == id_5 ^ id_5;
  final id_3 <= id_2[id_1];
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_5,
      id_4,
      id_5,
      id_4,
      id_4,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_4,
      id_5,
      id_4,
      id_4,
      id_5
  );
  assign modCall_1.id_21 = 0;
endmodule
