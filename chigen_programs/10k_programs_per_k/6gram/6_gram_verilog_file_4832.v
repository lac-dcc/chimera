// Seed: 1190199215
module module_0 (
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
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output reg id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(posedge 1) begin : LABEL_0
    while (id_6) begin : LABEL_1
      id_5 <= 1;
    end
  end
endmodule
module module_1 #(
    parameter id_15 = 32'd77
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
    id_14
);
  output wire id_14;
  inout reg id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  output logic [7:0] id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output supply1 id_3;
  inout wire id_2;
  output tri id_1;
  wire _id_15;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_10,
      id_9,
      id_13,
      id_9,
      id_10,
      id_8,
      id_4
  );
  assign id_3 = -1'b0 == -1'b0;
  assign id_7[id_15] = id_2;
  assign id_1 = 1;
  always @(posedge id_15) id_13 <= id_15;
  assign id_7 = id_13;
endmodule
