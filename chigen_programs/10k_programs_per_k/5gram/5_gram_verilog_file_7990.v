// Seed: 2418615182
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
    id_15
);
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(id_2 * id_12 or negedge id_2) begin : LABEL_0
    assume #1  (id_8 - id_4) $display;
  end
  id_16 :
  assert property (@(posedge 1) id_4 / 1 * id_4)
  else $display(1'h0);
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
    id_15
);
  output wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  uwire id_16 = id_1 == id_14;
  module_0 modCall_1 (
      id_6,
      id_2,
      id_2,
      id_3,
      id_10,
      id_3,
      id_12,
      id_13,
      id_1,
      id_16,
      id_3,
      id_6,
      id_6,
      id_11,
      id_2
  );
endmodule
