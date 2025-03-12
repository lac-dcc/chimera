// Seed: 3443594874
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output logic [7:0] id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3[1] = id_1;
  wire id_5;
  wire id_6;
endmodule
module module_1 #(
    parameter id_6 = 32'd55,
    parameter id_8 = 32'd55
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    _id_8,
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
    id_24
);
  inout wire id_24;
  inout wire id_23;
  inout wire id_22;
  output wire id_21;
  output wire id_20;
  output wire id_19;
  inout wire id_18;
  inout wire id_17;
  output logic [7:0] id_16;
  inout wire id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  module_0 modCall_1 (
      id_9,
      id_11,
      id_16,
      id_2
  );
  input wire id_10;
  inout wire id_9;
  inout wire _id_8;
  input wire id_7;
  inout wire _id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge -1) id_16[id_6] = 1;
  wire id_25;
  wire id_26;
  assign id_16[1] = 1'h0;
  supply0 [id_8 : id_8] id_27;
  logic [-1 : -1] id_28;
  wire id_29;
  nor primCall (
      id_2, id_24, id_7, id_10, id_18, id_15, id_22, id_5, id_13, id_17, id_11, id_9, id_4, id_23
  );
  generate
    assign id_27 = 1 ? -1 : id_29;
  endgenerate
endmodule
