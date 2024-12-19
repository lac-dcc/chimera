// Seed: 2569335557
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_6;
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
    id_16
);
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  always_comb @(posedge id_15 or id_2) id_14 <= 1;
  wire id_17;
  supply1 id_18 = 1;
  module_0 modCall_1 (
      id_16,
      id_17,
      id_18,
      id_2,
      id_12
  );
  assign id_4 = 1'b0;
  and primCall (id_14, id_16, id_12, id_18, id_9, id_1, id_17, id_13, id_6, id_5, id_15);
  always @(id_6) begin : LABEL_0
    id_3 <= 1;
  end
  wire id_19;
endmodule
