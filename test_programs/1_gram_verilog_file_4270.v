// Seed: 3515022609
module module_0 (
    input tri id_0,
    input uwire id_1,
    output supply0 id_2
);
  supply0 id_4 = id_0;
  wire id_5;
  module_2 modCall_1 (id_5);
  initial begin : LABEL_0
    id_4 = id_1;
  end
endmodule
module module_1 (
    input  tri   id_0,
    input  wire  id_1,
    output uwire id_2,
    input  uwire id_3,
    input  tri0  id_4,
    output tri0  id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5
  );
  assign modCall_1.type_1 = 0;
endmodule
module module_2 (
    id_1
);
  output wire id_1;
  wire id_2;
  assign module_3.id_3 = 0;
endmodule
module module_3 (
    input tri0 id_0
);
  supply0 id_2 = -1'b0, id_3;
  module_2 modCall_1 (id_3);
endmodule
