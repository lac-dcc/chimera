// Seed: 3944671654
module module_0 (
    input tri1 id_0,
    input tri1 id_1
);
  assign id_3 = id_3 ^ 1;
endmodule
module module_1 (
    output uwire id_0,
    output wand id_1,
    input supply1 id_2,
    output tri id_3,
    output supply1 id_4,
    input tri id_5,
    input supply0 id_6,
    output tri0 id_7
);
  module_0 modCall_1 (
      id_2,
      id_5
  );
  assign modCall_1.type_0 = 0;
  assign id_0 = 0;
  always_comb @* begin : LABEL_0
    for (id_1 = 1'b0; 1; id_1 = id_5) id_0 = 1;
  end
endmodule
