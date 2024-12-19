// Seed: 2740163568
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
    id_17,
    id_18,
    id_19
);
  output wire id_19;
  input wire id_18;
  inout wire id_17;
  inout wire id_16;
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_20;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  supply1 id_7 = 1;
  module_0 modCall_1 (
      id_7,
      id_2,
      id_7,
      id_2,
      id_6,
      id_2,
      id_2,
      id_2,
      id_6,
      id_3,
      id_1,
      id_2,
      id_7,
      id_7,
      id_2,
      id_7,
      id_2,
      id_4,
      id_3
  );
  tri1 id_8;
  assign id_7 = 1 || 1 || 1 ? (1) : 1;
  tri1 id_9;
  always @(id_8 or posedge id_9) begin : LABEL_0
    id_10(id_6, 1);
    $display;
  end
  assign id_7 = id_8;
  xor primCall (id_3, id_4, id_2, id_5, id_6, id_7);
  assign id_2 = 1;
endmodule
