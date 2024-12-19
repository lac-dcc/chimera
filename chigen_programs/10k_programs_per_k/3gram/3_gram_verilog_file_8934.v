// Seed: 2213084291
module module_0 (
    output wire id_0,
    input wor id_1,
    input supply0 id_2,
    output supply1 id_3,
    output wor id_4,
    output tri0 id_5,
    input uwire id_6,
    output wand id_7,
    input supply0 id_8
);
  supply1 id_10, id_11 = id_1, id_12, id_13, id_14, id_15, id_16, id_17;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    output wor id_1,
    output tri0 id_2,
    output tri0 id_3,
    input wand id_4,
    input uwire id_5,
    input supply1 id_6
);
  wire id_8;
  nor primCall (id_3, id_6, id_8, id_0, id_4, id_5);
  always @(id_0 or 1) begin : LABEL_0
    if (1) begin : LABEL_0
      id_3 = id_5;
    end
  end
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_1,
      id_3,
      id_1,
      id_5,
      id_2,
      id_6
  );
endmodule
