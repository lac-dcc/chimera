// Seed: 4146219591
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
    .id_16(id_13),
    id_14,
    id_15
);
  output wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_17 = id_10, id_18, id_19, id_20, id_21, id_22, id_23;
  parameter id_24 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  inout logic [7:0] id_4;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_2,
      id_2,
      id_1,
      id_2,
      id_6,
      id_5,
      id_3,
      id_6,
      id_6,
      id_2,
      id_2,
      id_2,
      id_6
  );
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(negedge id_3 or posedge id_2) id_4[1] = id_3;
endmodule
