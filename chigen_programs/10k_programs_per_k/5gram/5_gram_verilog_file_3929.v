// Seed: 3119084258
module module_0 (
    output wand id_0,
    input tri1 id_1,
    input wire id_2,
    output tri id_3,
    output wand id_4,
    output supply0 id_5,
    input uwire id_6,
    input uwire id_7,
    output uwire id_8,
    output supply0 id_9,
    output tri0 id_10,
    input supply0 id_11,
    output tri1 id_12,
    input wire id_13,
    input tri1 id_14,
    input wire id_15,
    input wand id_16,
    input uwire id_17,
    input wire id_18,
    output uwire id_19
);
  always_comb @(posedge id_2) begin : LABEL_0
    id_0 = !(id_13);
  end
  uwire id_21, id_22;
  assign module_1.type_3 = 0;
  assign id_10 = id_22;
endmodule
module module_1 (
    output tri  id_0,
    output tri0 id_1,
    input  tri1 id_2,
    input  wor  id_3,
    output tri  id_4
);
  module_0 modCall_1 (
      id_0,
      id_3,
      id_2,
      id_4,
      id_0,
      id_1,
      id_2,
      id_2,
      id_1,
      id_4,
      id_4,
      id_2,
      id_4,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_2,
      id_0
  );
  assign id_1 = 1 ? id_3 : 1;
  wire id_6;
endmodule
