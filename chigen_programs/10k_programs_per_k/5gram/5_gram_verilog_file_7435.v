// Seed: 105285302
module module_0 (
    id_1,
    id_2,
    id_3
);
  output logic [7:0] id_3;
  input wire id_2;
  input wire id_1;
  assign id_3[-1] = 1;
endmodule
module module_0 #(
    parameter id_25 = 32'd99,
    parameter id_4  = 32'd52,
    parameter id_8  = 32'd31
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
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
    module_1,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    _id_25
);
  output wire _id_25;
  output wire id_24;
  inout wire id_23;
  inout wire id_22;
  output wire id_21;
  output tri0 id_20;
  inout wire id_19;
  inout wire id_18;
  inout logic [7:0] id_17;
  output wire id_16;
  inout wire id_15;
  module_0 modCall_1 (
      id_22,
      id_14,
      id_2
  );
  input wire id_14;
  output wire id_13;
  input wire id_12;
  nor primCall (
      id_6, id_15, id_1, id_18, id_7, id_12, id_23, id_10, id_22, id_5, id_11, id_19, id_14
  );
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  input wire _id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire _id_4;
  output wire id_3;
  output logic [7:0] id_2;
  input wire id_1;
  logic [id_25 : 1] id_26 = id_17[-1 : ~id_4] - 1;
  assign id_2[id_8 :-1'b0] = -1;
  assign id_20 = -1;
  always @(-1 or id_15) begin : LABEL_0
    id_26 = id_23;
  end
endmodule
