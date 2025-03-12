// Seed: 4205472271
module module_0 (
    input wor id_0,
    input tri id_1,
    input tri id_2,
    input wire id_3,
    output supply1 id_4,
    input tri1 id_5,
    input uwire id_6
);
  wire id_8;
  module_2 modCall_1 (
      id_4,
      id_5
  );
endmodule
module module_1 (
    output tri1 id_0,
    output tri1 id_1,
    input  wor  id_2
);
  assign id_0 = id_2 & id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2
  );
  assign modCall_1.id_0 = 0;
  wire id_4;
  parameter id_5 = 1;
endmodule
macromodule module_2 (
    output tri1  id_0,
    input  uwire id_1
);
  assign id_0 = {id_1, id_1};
  assign module_0.id_0 = 0;
endmodule
