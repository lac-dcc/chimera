// Seed: 1186895303
module module_0 (
    input wire id_0,
    input tri1 id_1,
    input wire id_2,
    input supply1 id_3,
    input tri id_4,
    input tri id_5,
    input supply0 id_6,
    input supply1 id_7,
    output tri1 id_8,
    input tri id_9,
    input wand id_10,
    output supply0 id_11,
    output wand id_12,
    input wor id_13,
    output wire id_14,
    input wire id_15,
    output tri0 id_16
);
  assign id_12 = id_10;
  wire id_18;
  assign id_14 = id_0 << 1;
  uwire id_19 = 1;
  uwire id_20;
  assign id_20 = 1 * id_1 * id_4;
  assign id_14 = 1'b0;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    input supply0 id_2,
    output logic id_3,
    input supply1 id_4,
    input logic id_5,
    output logic id_6
);
  always_comb begin : LABEL_0
    id_3 = id_4 == id_2;
    @(posedge id_5, 1) id_6 <= id_5;
    id_3 = #1 1;
    id_1 = id_2;
  end
  xnor primCall (id_3, id_5, id_8, id_2, id_4);
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_0,
      id_0,
      id_4,
      id_0,
      id_2,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.id_12 = 0;
endmodule
