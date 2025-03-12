// Seed: 1120208894
module module_0 (
    input wor id_0,
    output tri1 id_1,
    input tri1 id_2,
    input tri id_3,
    output wand id_4,
    input supply0 id_5,
    output wor id_6
);
  module_2 modCall_1 (
      id_3,
      id_1,
      id_6,
      id_2,
      id_6,
      id_0
  );
  assign modCall_1.id_1 = 0;
  assign module_1.id_0 = 0;
  assign id_4 = id_0;
  assign id_4 = id_3;
endmodule
module module_1 (
    output tri  id_0,
    input  tri0 id_1
);
  assign id_0 = -1 + id_1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0
  );
endmodule
module module_2 (
    input tri id_0,
    output supply0 id_1,
    output wand id_2,
    input tri0 id_3,
    output supply1 id_4,
    input tri0 id_5
);
  assign id_1 = id_3.id_5 * id_5;
  always @* begin : LABEL_0
    wait (~id_5);
  end
endmodule
