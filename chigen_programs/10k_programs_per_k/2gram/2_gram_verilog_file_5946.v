// Seed: 3039594845
module module_0 (
    input uwire id_0,
    input tri id_1,
    output uwire id_2,
    input supply1 id_3,
    output tri id_4
);
  assign id_4 = id_0;
  module_2 modCall_1 (
      id_3,
      id_2,
      id_4
  );
endmodule
module module_1 (
    output wor   id_0,
    input  wand  id_1,
    output wand  id_2,
    input  tri0  id_3,
    input  uwire id_4
);
  wire [(  -1  )  +  1 : 1] id_6;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_2,
      id_1,
      id_0
  );
  assign modCall_1.id_2 = 0;
  parameter id_7 = 1;
endmodule
module module_2 (
    input  wire id_0,
    output tri  id_1,
    output tri0 id_2
);
  assign module_0.id_2 = 0;
endmodule
