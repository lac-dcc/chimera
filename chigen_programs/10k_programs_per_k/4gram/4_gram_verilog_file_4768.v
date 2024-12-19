// Seed: 1198614180
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
    id_18
);
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign module_0 = id_9;
endmodule
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    module_1
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = 1 ? 1'b0 : id_5;
  wire id_6;
  tri1 id_7 = (1);
  wire id_8;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_8,
      id_3,
      id_7,
      id_1,
      id_2,
      id_1,
      id_3,
      id_7,
      id_4,
      id_3,
      id_8,
      id_1,
      id_3,
      id_8,
      id_2,
      id_7
  );
  assign id_4 = 1;
  final $display(1);
  always_comb @(posedge id_3) begin : LABEL_0
    id_7 = id_2;
  end
  wire id_9;
  tri0 id_10 = 1'b0 - id_7;
  wire id_11 = !id_2;
endmodule
