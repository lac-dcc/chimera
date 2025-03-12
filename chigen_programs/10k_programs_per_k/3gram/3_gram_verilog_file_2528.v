// Seed: 1592504665
module module_0 (
    output uwire id_0,
    input wor id_1,
    input tri0 id_2,
    input wire id_3,
    output tri id_4,
    input supply1 id_5,
    output tri id_6,
    input tri0 id_7,
    output supply0 id_8,
    output wor id_9,
    output supply1 id_10,
    output logic id_11,
    input uwire id_12,
    input tri1 id_13,
    input wire id_14,
    output wor id_15,
    output supply0 id_16,
    output wand id_17,
    output tri id_18,
    input tri id_19,
    output supply1 id_20,
    input wand id_21,
    input tri id_22,
    output supply0 id_23,
    output wire id_24,
    input tri1 id_25
    , id_29,
    input tri0 id_26,
    input wor id_27
);
  initial begin : LABEL_0
    id_11 <= -1'b0;
  end
endmodule
module module_1 #(
    parameter id_18 = 32'd57
) (
    input uwire id_0,
    output uwire id_1,
    output logic id_2,
    input tri id_3,
    input wire id_4,
    input wand id_5,
    input wand id_6,
    output wire id_7,
    input uwire id_8,
    input uwire id_9,
    input uwire id_10,
    output supply0 id_11,
    input wand id_12,
    input tri id_13,
    input wand id_14,
    output logic id_15,
    output logic id_16,
    output logic id_17,
    input uwire _id_18,
    output wand id_19
);
  wire id_21;
  module_0 modCall_1 (
      id_7,
      id_14,
      id_6,
      id_4,
      id_19,
      id_6,
      id_19,
      id_9,
      id_11,
      id_11,
      id_1,
      id_16,
      id_10,
      id_12,
      id_14,
      id_1,
      id_1,
      id_7,
      id_7,
      id_14,
      id_1,
      id_5,
      id_6,
      id_1,
      id_11,
      id_4,
      id_0,
      id_0
  );
  assign modCall_1.id_13 = 0;
  always @(posedge 1) begin : LABEL_0
    if (1) begin : LABEL_1
      id_2 <= id_12;
      wait (id_8);
      id_15 <= 1;
      id_17 <= 1;
      id_17 <= -1;
    end
    id_16 = id_13;
  end
  class id_22;
    logic [~  id_18 : id_18] id_23;
    logic [-1 : 1] id_24;
    logic id_25;
  endclass : SymbolIdentifier
  parameter id_26 = 1;
endmodule
