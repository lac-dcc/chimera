// Seed: 41504046
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  always id_1 <= id_3;
  assign id_2 = 1;
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
    id_19,
    id_20,
    id_21,
    id_22
);
  output wire id_22;
  input wire id_21;
  output wire id_20;
  inout wire id_19;
  inout wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  always id_22 <= 1;
  always begin : LABEL_0
    fork
      begin : LABEL_0
        id_2 = id_21;
        id_10[1+:1] <= 1;
        id_23(id_18 != 1);
      end
    join_any
  end
  wire id_24;
  module_0 modCall_1 (
      id_22,
      id_19
  );
  assign id_18 = id_3;
endmodule
