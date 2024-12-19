// Seed: 173456276
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
    id_15
);
  input wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_16, id_17, id_18, id_19, id_20, id_21, id_22, id_23, id_24, id_25, id_26, id_27, id_28;
endmodule
module module_1 (
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
    id_12
);
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_13 = id_3[1'd0 : 1];
  if (id_5) begin : LABEL_0
    id_14(
        .id_0(id_3)
    );
  end else begin : LABEL_0
    assign id_7[1] = 1'b0;
    assign id_5 = 1;
  end
  module_0 modCall_1 (
      id_8,
      id_11,
      id_6,
      id_13,
      id_5,
      id_2,
      id_6,
      id_5,
      id_4,
      id_2,
      id_11,
      id_2,
      id_4,
      id_6,
      id_12
  );
  wire id_15;
  wire id_16;
endmodule
