// Seed: 2942254998
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input tri id_2,
    output wire id_3,
    input tri1 id_4,
    output uwire id_5,
    output tri1 id_6,
    input supply0 id_7
);
  assign id_3 = 1'b0;
  module_2(
      id_6, id_0
  );
endmodule
module module_1 (
    output tri0 id_0,
    input  wire id_1
);
  module_0(
      id_1, id_1, id_1, id_0, id_1, id_0, id_0, id_1
  );
endmodule
macromodule module_2 (
    output tri  id_0,
    input  tri1 id_1
);
  assign id_0 = 1;
  `define pp_3 0
  supply0 id_4 = 1;
endmodule
