// Seed: 3542746731
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
    id_12
);
  input wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  output reg id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(id_12 or id_3 < 1 or 1'b0 or 1, 1 or -1'd0, id_12 != id_3 or 'd0) begin : LABEL_0
    id_7 <= id_4;
    disable id_13;
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
    id_11
);
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  module_0 modCall_1 (
      id_10,
      id_7,
      id_10,
      id_10,
      id_8,
      id_10,
      id_3,
      id_6,
      id_11,
      id_11,
      id_11,
      id_9
  );
  input wire id_4;
  inout reg id_3;
  input wire id_2;
  input wire id_1;
  initial begin : LABEL_0
    id_3 = id_4;
  end
endmodule
