// Seed: 4114992794
module module_0 (
    input logic   id_0,
    input supply0 id_1
);
  logic id_3;
  always
    if (1) id_3 <= 1;
    else id_3 = id_0;
  assign id_3 = 1;
endmodule
module module_1 (
    input tri0 id_0,
    input wand id_1,
    input tri id_2,
    output wand id_3,
    input wand id_4,
    output supply1 id_5,
    output tri1 id_6,
    output tri id_7,
    input wire id_8,
    output logic id_9,
    input tri1 id_10,
    input logic id_11,
    output supply0 id_12,
    input supply0 id_13
);
  `define pp_15 0
  wire id_16;
  module_0 modCall_1 (
      id_11,
      id_2
  );
  assign modCall_1.type_4 = 0;
  tri0 id_17;
  final begin : LABEL_0
    id_3 = id_4;
    if (`pp_15 * id_17)
      @(posedge 1) begin : LABEL_0
        id_9 <= id_11;
      end
  end
  uwire id_18;
  xor primCall (id_6, id_2, id_16, id_0, id_1, id_8, id_4, id_10, id_13);
  assign id_18 = id_11 & 1'b0;
endmodule
