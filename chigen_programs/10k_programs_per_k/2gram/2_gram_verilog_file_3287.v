// Seed: 1259028795
module module_0 (
    input uwire id_0,
    output supply0 id_1,
    input tri id_2
);
  assign id_1 = 1;
  assign module_2.id_3 = 0;
endmodule
module module_1 (
    output wire  id_0,
    input  tri   id_1,
    output uwire id_2
);
  logic id_4;
  assign id_2 = 1 & id_1 & id_1;
  wire [1 : -1] id_5;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.id_1 = 0;
  wire id_6;
endmodule
module module_2 (
    output uwire id_0,
    input tri1 id_1,
    input supply1 id_2,
    input supply1 id_3,
    output tri1 id_4,
    output tri1 id_5
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2
  );
endmodule
