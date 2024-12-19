// Seed: 3008161045
module module_0 (
    input logic id_0,
    input logic id_1,
    output wor id_2,
    output wor id_3,
    input wire id_4,
    output tri0 id_5,
    output wor id_6,
    output wor id_7,
    output supply0 id_8,
    output tri1 id_9,
    output supply1 id_10,
    output tri0 id_11,
    output supply0 id_12,
    input supply0 id_13,
    output logic id_14,
    input tri id_15,
    input wand id_16,
    input logic id_17,
    input wor id_18,
    input tri0 id_19,
    output tri0 id_20,
    output tri0 id_21
);
  logic id_23;
  id_24 :
  assert property (@(negedge id_0) 1 ? id_23 : ~id_24) if (id_16);
  logic id_25;
  wire id_26, id_27;
  always #1 id_14 <= id_1;
  wire id_28;
  always id_14 = {1, id_0, id_17, 1};
  assign id_7 = 1;
  wire id_29;
  id_30 :
  assert property (@(posedge 1'b0 * 1'b0) id_17) id_23 = id_0;
  assign id_25 = id_0;
endmodule
module module_1 (
    output supply1 id_0,
    input logic id_1,
    input logic id_2,
    input tri1 id_3,
    output logic id_4,
    input logic id_5,
    input wand id_6,
    input logic id_7
);
  assign id_4 = id_7;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_0,
      id_0,
      id_6,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_3,
      id_4,
      id_6,
      id_3,
      id_7,
      id_3,
      id_6,
      id_0,
      id_0
  );
  assign modCall_1.id_21 = 0;
  wire  id_9;
  logic id_10;
  wire id_11, id_12;
  assign id_10 = id_7;
  always {1 ? id_10 : 1, 1'b0, id_2, id_5, 1, 1, 1} <= id_1;
  assign id_4 = id_7;
  wire id_13, id_14;
  uwire id_15, id_16;
  assign id_16 = 1;
endmodule
