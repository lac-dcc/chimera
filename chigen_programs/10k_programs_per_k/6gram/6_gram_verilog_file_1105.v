// Seed: 1935354429
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
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29,
    id_30
);
  output wire id_30;
  output logic [7:0] id_29;
  output wire id_28;
  output wire id_27;
  inout wire id_26;
  input wire id_25;
  inout wire id_24;
  output wire id_23;
  output wire id_22;
  inout wire id_21;
  input wire id_20;
  output wire id_19;
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire [-1 : 1] id_31, id_32, id_33, id_34, id_35, id_36, id_37, id_38, id_39, id_40, id_41;
  wire id_42;
  wire module_0;
  ;
  assign id_29[1] = id_21 !== ~id_20;
  assign id_35 = id_6;
endmodule
module module_1 #(
    parameter id_2 = 32'd82
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output reg id_5;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_6,
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_6,
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_6,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1,
      id_4,
      id_6
  );
  output logic [7:0] id_4;
  input wire id_3;
  inout wire _id_2;
  inout wire id_1;
  assign id_1 = id_2;
  assign id_4[-1] = id_1;
  assign id_4[-1&id_2] = id_1 ? id_2 : id_2;
  generate
    for (id_7 = id_3; id_7; id_5 = id_1 >= id_1) begin : LABEL_0
      assign id_7 = 1 || -1 || -1;
    end
  endgenerate
endmodule
