// Seed: 3341355255
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
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_3,
      id_6,
      id_4,
      id_5,
      id_5,
      id_3,
      id_3,
      id_4,
      id_3
  );
  inout wire id_3;
  inout reg id_2;
  output wire id_1;
  logic id_8;
  always @(1'b0 or posedge -1) begin : LABEL_0
    id_2 = -1'b0;
  end
endmodule
