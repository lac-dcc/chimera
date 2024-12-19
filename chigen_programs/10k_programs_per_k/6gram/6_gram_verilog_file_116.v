// Seed: 2191633919
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
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    wait (1'd0);
    $display(1'b0 == 1);
    $display;
  end
  assign module_1.id_2 = 0;
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
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  output wire id_19;
  input wire id_18;
  input wire id_17;
  input wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1 ? id_2 : id_8 == 1 > 1;
  module_0 modCall_1 (
      id_4,
      id_11,
      id_13,
      id_5,
      id_1,
      id_11,
      id_4,
      id_15,
      id_5,
      id_1
  );
  always @(posedge id_3 or posedge id_18 / id_18 - id_12) begin : LABEL_0
    if (id_18) id_7 = id_8 & 1;
  end
  assign id_19[1] = 1'b0;
endmodule
