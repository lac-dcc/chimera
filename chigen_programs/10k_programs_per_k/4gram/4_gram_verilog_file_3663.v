// Seed: 1247682768
module module_0 (
    output tri1 id_0,
    input  wor  id_1,
    input  tri  id_2,
    output tri  id_3
);
  assign id_3 = 1'b0;
endmodule
module module_1 (
    input  wand id_0,
    output wand id_1,
    input  tri  id_2
);
  logic id_4 = 1, id_5;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_0 (
    input tri0  id_0,
    input wor   id_1,
    input wor   id_2,
    input uwire module_2
    , id_6,
    inout tri1  id_4
);
  assign id_6 = -1 ? id_2(id_1 && id_3, 1'b0) & id_0 : id_6;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_2,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule
