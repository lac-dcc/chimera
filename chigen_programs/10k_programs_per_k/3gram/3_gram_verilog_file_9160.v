// Seed: 3250937758
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
  input wire id_19;
  output wire id_18;
  output wire id_17;
  inout wire id_16;
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(1 or(1)) if ("") id_18 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
  module_0(
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_4,
      id_3,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_1,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4
  );
  assign id_3 = 1'b0;
  reg id_5;
  assign id_1 = id_3;
  always #1 id_5 <= 1;
  id_6 :
  assert property (@(~id_3) id_2)
  else id_2 <= id_6;
  wire id_7;
  tri  id_8 = 1, id_9;
endmodule
