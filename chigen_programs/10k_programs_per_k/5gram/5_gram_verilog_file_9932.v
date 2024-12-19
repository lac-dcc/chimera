// Seed: 837788569
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    input wire id_2,
    input wor id_3,
    input supply0 id_4,
    input tri id_5
    , id_21,
    input tri id_6
    , id_22,
    input tri0 id_7,
    output wire id_8,
    input uwire id_9,
    output supply0 id_10,
    output wand id_11,
    input tri0 id_12,
    output wor id_13,
    output wire id_14,
    output supply0 id_15,
    input tri1 id_16
    , id_23,
    input tri0 id_17,
    input uwire id_18,
    output tri1 id_19
);
  wire id_24;
endmodule
module module_0 (
    input logic id_0,
    input supply1 id_1,
    output wor id_2,
    output logic id_3,
    input wire id_4,
    input wand id_5,
    input wire id_6,
    input uwire id_7,
    input tri0 id_8
    , id_12,
    output tri0 id_9,
    input supply1 id_10
);
  wor id_13;
  assign id_13 = id_7;
  wire module_1;
  reg  id_14 = 1;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_7,
      id_5,
      id_8,
      id_6,
      id_5,
      id_9,
      id_6,
      id_13,
      id_2,
      id_4,
      id_9,
      id_2,
      id_13,
      id_6,
      id_1,
      id_4,
      id_2
  );
  assign modCall_1.id_14 = 0;
  always @(1'h0 or negedge id_10 & 1'h0 != 1) begin : LABEL_0
    if ("" > id_8) begin : LABEL_0
      id_14 <= 1;
    end else begin : LABEL_0
      if (1) begin : LABEL_0
        if (1 != 1) id_3 <= id_0;
      end
      id_14 <= 1'b0;
    end
  end
  xor primCall (id_3, id_1, id_4, id_13, id_8, id_6, id_0, id_5, id_7, id_12, id_14, id_10);
  assign id_13 = 1;
  assign id_14 = 1'b0 - id_5;
  logic id_15;
  supply1 id_16, id_17;
  assign id_15 = id_0;
  always_comb @(id_6 == 1'h0 - id_16 or negedge 1) id_12 <= 1;
endmodule
