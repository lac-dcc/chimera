// Seed: 2965569415
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    id_1
);
  output wire id_1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1
  );
endmodule
module module_2 (
    output tri   id_0,
    input  tri   id_1,
    input  uwire id_2,
    input  tri0  id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5
  );
endmodule
module module_3 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  wire id_3;
  nand primCall (id_2, id_1, id_3);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2
  );
endmodule
