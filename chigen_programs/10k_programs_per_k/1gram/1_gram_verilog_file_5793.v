// Seed: 1177221439
module module_0 (
    output tri1 id_0,
    input supply0 id_1,
    output tri0 id_2,
    input uwire id_3,
    output wor id_4,
    output wor id_5
);
  id_7(
      .id_0(id_1 == id_0), .id_1(1)
  );
endmodule
macromodule module_1 (
    output tri0  id_0,
    output tri1  id_1,
    output wor   id_2,
    input  wor   id_3,
    output uwire id_4
);
  wire id_6;
  wire id_7, id_8;
  wire id_9;
  xnor primCall (id_0, id_8, id_9, id_7, id_10, id_3);
  wire id_10;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_4,
      id_3,
      id_4,
      id_0
  );
endmodule
