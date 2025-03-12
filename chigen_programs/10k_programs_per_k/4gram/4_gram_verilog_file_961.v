// Seed: 2214844551
module module_0 (
    input uwire id_0,
    output tri1 id_1,
    input wor id_2,
    input tri id_3,
    input supply1 id_4
);
  assign id_1 = id_4;
endmodule
module module_1 (
    input wire id_0,
    output wire id_1,
    input wand id_2,
    input supply1 id_3,
    input wand id_4,
    output uwire id_5,
    input wor id_6
);
  generate
    wire id_8;
    ;
    assign id_5 = -1;
  endgenerate
  module_0 modCall_1 (
      id_2,
      id_5,
      id_4,
      id_0,
      id_6
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input supply1 id_0,
    output uwire id_1,
    output wand id_2
);
  assign id_2 = 1;
  logic id_4;
  ;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_0,
      id_0
  );
endmodule
