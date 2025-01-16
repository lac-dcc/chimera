// Seed: 2326397810
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_2 = -1'b0;
  tri id_9, id_10;
  always id_3 <= id_5 ? id_1 : -1'h0;
  wire id_11, id_12;
  assign id_5 = 1'b0;
  wire id_13 = !id_9;
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
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  inout wire id_19;
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  if (id_5) assign id_14 = 1'h0;
  else begin : LABEL_0
    localparam id_20 = 1 + -1'b0;
  end
  wire id_21, id_22, id_23;
  module_0 modCall_1 (
      id_19,
      id_11,
      id_14,
      id_21,
      id_3,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_3 = 0;
  always begin : LABEL_0
    @(id_22)
    if (-1'h0) id_14 <= id_18;
    else wait (id_18) id_6 <= id_19;
  end
endmodule
