// Seed: 1498127177
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
    id_12
);
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  id_13 :
  assert property (@(posedge {1, 1'b0 * id_10}) id_5)
  else $display;
  always @(posedge id_7) id_12 = 1;
  wire id_14;
  initial id_2 = id_10;
  assign id_11 = 1;
  assign id_10 = 1;
  wire id_15;
  assign id_12 = id_1;
  wire id_16;
  wire id_17;
  wire id_18;
  wire id_19;
endmodule
module module_1 (
    output wire id_0
    , id_4,
    input wand id_1,
    input supply1 id_2
);
  wire id_5, id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_5,
      id_11,
      id_12,
      id_7,
      id_12,
      id_10,
      id_8,
      id_5,
      id_10
  );
  assign modCall_1.id_12 = 0;
endmodule
