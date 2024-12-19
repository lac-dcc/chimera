// Seed: 2005801381
module module_0 (
    input  uwire id_0,
    input  wand  id_1,
    output wand  id_2
);
endmodule
module module_1 (
    input  tri id_0,
    input  tri id_1,
    output wor id_2
);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_3;
  assign id_1 = 1'b0 & 1;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = id_3;
  module_2 modCall_1 (
      id_1,
      id_1
  );
endmodule
