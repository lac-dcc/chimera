// Seed: 1554181475
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  uwire id_8 = 1'b0;
  assign id_4 = id_2;
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
    id_18
);
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  inout wire id_13;
  nand primCall (id_4, id_6, id_18, id_14, id_5, id_7, id_9, id_1, id_11, id_8, id_2, id_13);
  output wire id_12;
  inout wire id_11;
  output reg id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_18,
      id_2,
      id_2,
      id_14,
      id_18
  );
  inout wire id_2;
  inout wire id_1;
  always @(posedge id_11) begin : LABEL_0
    id_10 <= 1;
  end
endmodule
