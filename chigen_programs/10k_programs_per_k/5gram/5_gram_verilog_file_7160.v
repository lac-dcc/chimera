// Seed: 2926659280
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
    id_16,
    id_17
);
  output wire id_17;
  output wire id_16;
  output wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always_ff @(id_5++or posedge id_14) id_17 = id_7;
  id_18 :
  assert property (@(posedge 1'b0) id_10)
  else $display;
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
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(posedge 1) id_7 = id_15;
  module_0 modCall_1 (
      id_14,
      id_2,
      id_15,
      id_14,
      id_9,
      id_2,
      id_1,
      id_8,
      id_11,
      id_9,
      id_9,
      id_7,
      id_11,
      id_15,
      id_4,
      id_10,
      id_4
  );
  always @(1 & 1) begin : LABEL_0
    id_5 <= 1;
  end
endmodule
