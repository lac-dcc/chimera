// Seed: 160721845
module module_0 (
    output tri1 id_0,
    output wor  id_1
);
  assign module_2.id_3 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input uwire id_1,
    input supply0 id_2,
    input supply1 id_3,
    input supply1 id_4,
    input tri1 id_5,
    output tri id_6,
    output uwire id_7
);
  assign id_7 = ~(id_2);
  module_0 modCall_1 (
      id_7,
      id_6
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    input  tri0 id_0
    , id_3,
    output wand id_1
);
  initial begin : LABEL_0
    id_3 <= (id_0 !== 1'h0);
    id_3 <= id_0 & 1;
  end
  module_0 modCall_1 (
      id_1,
      id_1
  );
endmodule
