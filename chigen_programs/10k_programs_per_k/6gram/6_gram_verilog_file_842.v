// Seed: 1801263064
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  logic id_5;
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
    id_13
);
  output wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_4,
      id_3
  );
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout logic [7:0] id_1;
  reg id_14;
  assign id_1[1] = ~id_12 ? id_5 : id_7;
  always @(posedge id_1 or 1) id_14 <= id_14;
endmodule
