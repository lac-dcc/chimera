// Seed: 2682243758
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
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_16;
  always begin : LABEL_0
    id_16 = id_15;
    id_10 = id_16;
    id_14 = 1'b0 << 1 & 1;
    id_3  = 1;
    id_13 <= id_16;
  end
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
    id_16
);
  input wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_6,
      id_9,
      id_2,
      id_3,
      id_9,
      id_3,
      id_5,
      id_4,
      id_5,
      id_15,
      id_3,
      id_3,
      id_7,
      id_4,
      id_13
  );
  generate
    wire id_17;
  endgenerate
  assign id_3 = id_9 <-> id_2;
  always #1 id_7 = #1 id_15;
  reg id_18;
  always begin : LABEL_0
    id_15 <= id_18;
  end
endmodule
