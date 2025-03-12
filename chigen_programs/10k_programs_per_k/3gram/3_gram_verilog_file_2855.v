// Seed: 3407739137
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  always_comb @(-1 && -1 or posedge id_2 - -1) begin : LABEL_0
    if (1) disable id_7;
    return "";
  end
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    output uwire id_1,
    output wire id_2,
    input wire id_3,
    input wand id_4
    , id_13,
    output tri0 id_5,
    output tri0 id_6,
    output tri0 id_7,
    input tri1 id_8,
    input tri id_9,
    output tri0 id_10,
    input supply1 id_11
);
  assign id_13 = id_0;
  wire id_14;
  tri0 id_15 = -1;
  nand primCall (id_2, id_0, id_11, id_9, id_14, id_13, id_8, id_3, id_15);
  module_0 modCall_1 (
      id_14,
      id_15,
      id_15,
      id_14,
      id_13,
      id_14
  );
endmodule
