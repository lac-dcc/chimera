// Seed: 2703112058
module module_0 (
    output tri1  id_0,
    input  wand  id_1,
    output uwire id_2,
    input  tri0  id_3
);
  assign id_0 = id_3;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output wor   id_0,
    input  uwire id_1,
    input  tri0  id_2
);
  wire id_4;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_2
  );
endmodule
module module_2 (
    id_1
);
  input wire id_1;
  always begin : LABEL_0
    id_2 <= 1;
  end
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_3 = 1'b0;
  tri1 id_7 = 1'b0;
  module_2 modCall_1 (id_4);
  assign modCall_1.id_2 = 0;
endmodule
