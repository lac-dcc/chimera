// Seed: 3837092776
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  if (1 ? -1 - -1 : 1) begin : LABEL_0
    if (1) begin : LABEL_1
      always @(id_6 - id_1 or posedge id_1 == id_2);
    end
  end
endmodule
module module_1 #(
    parameter id_16 = 32'd16
) (
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
    id_15
);
  output logic [7:0] id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  module_0 modCall_1 (
      id_14,
      id_9,
      id_9,
      id_14,
      id_9,
      id_9
  );
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  output reg id_5;
  inout reg id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_4 = -1;
  assign #_id_16 id_14 = 1;
  assign id_15[id_16 : 1&-1] = 1;
  always @(negedge id_16 or posedge 1) id_4 = -1;
  logic id_17;
  initial begin : LABEL_0
    id_5 <= id_9;
  end
endmodule
