// Seed: 3737194002
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
  input wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_11;
  assign module_1.id_7 = 0;
  initial begin : LABEL_0
    if (id_3) begin : LABEL_0
      #1;
    end
  end
  assign id_1 = id_7;
  wire id_12;
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
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always_latch @(posedge id_9 && id_7) begin : LABEL_0
    id_6 <= 1;
    id_8 <= id_11;
  end
  wire id_13;
  assign id_5 = id_11 ? id_8 : 1;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_10,
      id_7,
      id_12,
      id_13,
      id_7,
      id_13,
      id_12,
      id_12
  );
endmodule
