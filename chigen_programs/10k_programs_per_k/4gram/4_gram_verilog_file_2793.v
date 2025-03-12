// Seed: 1337262559
module module_0 (
    output wor id_0,
    output wor id_1,
    input supply1 id_2,
    output supply0 id_3,
    output supply0 id_4,
    input supply0 id_5,
    input wor id_6,
    output uwire id_7,
    output wor id_8,
    input tri1 id_9,
    input wand id_10,
    output supply0 id_11,
    output wor id_12,
    output logic id_13,
    input wire id_14,
    input wand id_15,
    output wand id_16,
    output wand id_17,
    output wor id_18,
    input supply0 id_19,
    output wor id_20,
    output uwire id_21,
    input wand id_22,
    input tri id_23
    , id_31,
    input wand id_24,
    output tri1 id_25,
    input tri1 id_26,
    output tri id_27,
    input wire id_28,
    input wor id_29
);
  assign id_4 = id_24 + 1;
  wire id_32;
  assign module_1.id_9 = 0;
  always @(id_5 > 1) begin : LABEL_0
    id_13 <= id_24;
    id_13 = "";
  end
endmodule
module module_1 (
    output wand  id_0,
    output tri1  id_1,
    input  uwire id_2,
    input  tri0  id_3,
    output uwire id_4,
    output tri1  id_5,
    input  tri1  id_6,
    output tri   id_7,
    input  wor   id_8,
    input  uwire id_9,
    output logic id_10,
    input  uwire id_11,
    input  wire  id_12,
    output tri0  id_13
);
  assign id_1 = (1);
  parameter id_15 = {1, -1'h0};
  module_0 modCall_1 (
      id_0,
      id_0,
      id_11,
      id_4,
      id_4,
      id_2,
      id_2,
      id_4,
      id_1,
      id_12,
      id_9,
      id_7,
      id_7,
      id_10,
      id_8,
      id_11,
      id_4,
      id_0,
      id_4,
      id_11,
      id_13,
      id_1,
      id_9,
      id_12,
      id_8,
      id_0,
      id_9,
      id_4,
      id_2,
      id_8
  );
  always @(posedge id_6 or -1'd0) id_10 = ~-1'b0;
  wire id_16 = id_9;
endmodule
