// Seed: 3679237402
module module_0 (
    input wor id_0,
    output tri1 id_1,
    output tri1 id_2,
    input supply1 id_3,
    output tri1 id_4,
    input supply1 id_5
);
  wire id_7;
  module_2 modCall_1 (id_3);
  supply1 id_8 = 1;
endmodule
module module_1 (
    input  tri0 id_0,
    output tri1 id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.type_13 = 0;
endmodule
module module_2 (
    input uwire id_0
);
  assign id_2 = ~id_0;
  assign module_0.type_2 = 0;
  assign #(1) id_2 = "" == 1 ? 1 : 1;
  final $display(id_2, id_0);
endmodule
