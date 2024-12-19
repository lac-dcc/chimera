// Seed: 1122690877
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule
macromodule module_2 (
    input tri0 id_0
);
endmodule
module module_3 (
    input tri1 id_0,
    input tri0 id_1,
    input supply0 id_2
);
  module_2 modCall_1 (id_2);
  assign modCall_1.id_0 = 0;
endmodule
