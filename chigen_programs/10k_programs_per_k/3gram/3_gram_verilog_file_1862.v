// Seed: 560653349
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
    id_16
);
  output wire id_16;
  output wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_5 = id_4;
  assign id_5 = 1'b0;
  always_ff @(posedge 1 or id_2) begin : LABEL_0
    id_15 = id_8 + 1;
  end
  assign id_15 = id_2;
  wire id_17;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_5, id_6;
  logic [7:0] id_7;
  initial begin : LABEL_0
    #1;
  end
  assign id_7[(1)] = 1;
  wire id_8;
  always @(negedge 1) begin : LABEL_0
    id_4 <= 1;
  end
  tri0 id_9 = 1;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_2,
      id_9,
      id_6,
      id_6,
      id_6,
      id_2,
      id_8,
      id_3,
      id_9,
      id_6,
      id_6,
      id_5,
      id_8,
      id_6
  );
endmodule
