// Seed: 420566938
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
    id_10
);
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  logic id_11;
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
    id_12
);
  input wire id_12;
  input wire id_11;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_8,
      id_8,
      id_10,
      id_7,
      id_4,
      id_7,
      id_6,
      id_8
  );
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output reg id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output reg id_1;
  always @(posedge id_9 > 1) begin : LABEL_0
    id_5 = id_12;
    id_1 <= id_8 == !id_2#(.id_2(1));
  end
endmodule
