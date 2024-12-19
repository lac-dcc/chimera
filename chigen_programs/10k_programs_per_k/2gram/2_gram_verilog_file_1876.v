// Seed: 74283901
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
  inout wire id_20;
  output wire id_19;
  output wire id_18;
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  id_21(
      .id_0(1)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  reg id_8;
  generate
    initial begin : LABEL_0
      id_1[1] = id_3;
      id_8 <= ~|id_7;
    end
  endgenerate
  always begin : LABEL_0
    id_8 <= 1;
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_2,
      id_4,
      id_5,
      id_6,
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_3,
      id_7,
      id_3,
      id_3,
      id_4,
      id_4,
      id_4,
      id_3
  );
endmodule
