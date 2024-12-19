// Seed: 2246610620
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
    id_18
);
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  id_19(
      .id_0(id_1 ^ 1), .id_1(1), .id_2(id_3)
  );
  assign id_13 = id_1;
  wire id_20;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_6;
  assign id_4 = id_6;
  initial begin : LABEL_0
    id_2 <= 1;
  end
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_4,
      id_6,
      id_4,
      id_4,
      id_6,
      id_4,
      id_6,
      id_6,
      id_4,
      id_4,
      id_4,
      id_4,
      id_6,
      id_1,
      id_4
  );
  initial begin : LABEL_0
    id_2 <= #1 id_5;
  end
  tri1 id_7 = 1;
endmodule
