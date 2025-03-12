// Seed: 4251640204
module module_0 (
    id_1
);
  output uwire id_1;
  assign module_1.id_2 = 0;
  bit id_2;
  always begin : LABEL_0
    id_2 = 1;
  end
  wire id_3, id_4 = -1;
  assign id_1.id_4 = id_2;
  wire id_5;
  ;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout reg id_2;
  inout wire id_1;
  module_0 modCall_1 (id_3);
  always id_2 = id_3;
  logic id_4;
  wire  id_5;
endmodule
module module_2 (
    input supply1 id_0,
    input tri id_1,
    input wire id_2
);
  parameter id_4 = 1;
endmodule
module module_3 (
    input tri1 id_0
);
  module_2 modCall_1 (
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_1 = 0;
  wire id_2;
endmodule
