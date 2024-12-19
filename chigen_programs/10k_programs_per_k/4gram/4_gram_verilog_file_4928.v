// Seed: 1293135312
module module_0 (
    input wand id_0
    , id_26,
    input wand id_1,
    output wand id_2,
    input wire id_3,
    input tri id_4,
    input tri id_5,
    input tri0 id_6,
    input tri1 id_7,
    input supply0 id_8,
    input supply1 id_9,
    output wand id_10,
    input wand id_11,
    output tri id_12
    , id_27,
    output tri id_13
    , id_28,
    input supply0 id_14,
    input wor id_15,
    input tri id_16,
    output wire id_17,
    input tri1 id_18,
    output tri0 id_19,
    input wand id_20,
    input supply1 id_21,
    input tri id_22,
    input wire id_23,
    input wor id_24
);
  wire id_29;
endmodule
module module_1 (
    output wand id_0,
    input uwire id_1,
    input wand id_2,
    input uwire id_3,
    input logic id_4,
    input wire id_5,
    input supply0 id_6,
    output logic id_7,
    input tri0 id_8,
    input wor id_9,
    input tri id_10,
    output supply0 id_11,
    output wire id_12,
    input tri id_13
);
  always @(posedge id_6) begin : LABEL_0
    id_7 <= (id_4);
  end
  module_0 modCall_1 (
      id_8,
      id_10,
      id_12,
      id_9,
      id_5,
      id_9,
      id_6,
      id_13,
      id_9,
      id_2,
      id_12,
      id_3,
      id_11,
      id_11,
      id_2,
      id_2,
      id_6,
      id_0,
      id_13,
      id_12,
      id_13,
      id_8,
      id_10,
      id_8,
      id_9
  );
  id_15 :
  assert property (@(posedge 1) id_6)
  else $display(1, 1'b0, (1'b0 - id_15), id_9);
endmodule
