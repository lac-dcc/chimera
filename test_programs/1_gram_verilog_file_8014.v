// Seed: 3299586020
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1 = -1'b0 + 1'b0;
  wire id_7;
  assign id_2 = -1'b0;
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
    id_14
);
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_15;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_15,
      id_4,
      id_10,
      id_4
  );
  assign modCall_1.id_1 = 0;
  assign id_5 = -1'b0;
  final id_14 = -1 & id_13;
  tri1 id_16, id_17 = id_4, id_18;
  wire id_19;
  initial id_16 = id_13;
  wand id_20;
  always_latch @(posedge id_17)
    @(-1 or id_20)
      @(posedge -1'h0 or posedge id_6) begin : LABEL_0
        id_3 = id_18 & id_20;
      end
endmodule
