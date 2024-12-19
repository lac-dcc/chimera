// Seed: 1685785586
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_6;
endmodule
macromodule module_1 (
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
  inout wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  always @(negedge 1 or posedge 1) begin : LABEL_0
    id_6 <= 1;
  end
  xor primCall (id_10, id_14, id_9, id_12, id_16, id_11, id_3, id_13, id_4);
  assign id_7 = 1;
  module_0 modCall_1 (
      id_16,
      id_11,
      id_16,
      id_5,
      id_14
  );
  always @(posedge 1) begin : LABEL_0
    id_10 <= 1 - (1'h0 ^ id_14);
  end
  wire id_17;
endmodule
