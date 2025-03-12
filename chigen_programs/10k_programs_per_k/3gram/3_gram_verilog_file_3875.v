// Seed: 1400343710
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
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_9 = 32'd5
) (
    output supply1 id_0,
    input tri1 id_1,
    output uwire id_2,
    output wire id_3,
    input uwire id_4,
    output wand id_5,
    input uwire id_6
);
  wire id_8;
  parameter id_9 = 1;
  wire id_10;
  parameter id_11 = -1'b0;
  wire [-1 : id_9] id_12;
  bit id_13;
  ;
  supply1 id_14;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_12,
      id_12,
      id_8,
      id_8,
      id_11,
      id_8,
      id_11,
      id_14,
      id_10,
      id_14,
      id_14,
      id_11,
      id_11,
      id_12
  );
  assign id_14 = -1;
  always @(id_8 or negedge id_14) begin : LABEL_0
    id_13 = id_1;
  end
  initial begin : LABEL_1
    $clog2(id_9);
    ;
  end
  logic id_15;
endmodule
