// Seed: 982858410
module module_0 #(
    parameter id_6 = 32'd20
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  assign module_1.id_1 = 0;
  input logic [7:0] id_8;
  output wire id_7;
  input wire _id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign #1 id_2 = id_8[id_6];
endmodule
module module_1 #(
    parameter id_1 = 32'd24
) (
    _id_1,
    id_2
);
  inout logic [7:0] id_2;
  inout wire _id_1;
  assign id_2[-1 : id_1] = ~id_2[-1 : ""];
  parameter id_3 = 1;
  assign id_1 = id_1;
  reg [1 : 1  ==  id_1] id_4;
  logic id_5;
  always id_4 <= id_1;
  wire  id_6;
  logic id_7;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_7,
      id_3,
      id_6,
      id_1,
      id_6,
      id_2,
      id_3,
      id_6,
      id_3
  );
endmodule
