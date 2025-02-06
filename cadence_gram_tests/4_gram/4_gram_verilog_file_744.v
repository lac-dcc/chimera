// Seed: 2087252521
module module_0 #(
    parameter id_10 = 32'd33,
    parameter id_11 = 32'd48
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  defparam id_10.id_11 = id_10;
  wire id_12;
  wire id_13;
  assign module_1.id_22 = 0;
  id_14(
      .id_0($realtime), .id_1()
  );
  wire id_15;
  real id_16;
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
    id_21
);
  input wire id_21;
  input wire id_20;
  input wire id_19;
  inout wire id_18;
  input wire id_17;
  inout wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  tri1 id_22;
  specify
    $hold(negedge id_23, negedge id_24, 1'b0);
    (id_25 + => id_26) = (-1  : id_13  : id_22, id_25  : $realtime : -1'b0);
  endspecify
  module_0 modCall_1 (
      id_5,
      id_20,
      id_5,
      id_9,
      id_10,
      id_14,
      id_21,
      id_23,
      id_26
  );
endmodule
