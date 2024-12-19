// Seed: 2531694943
module module_0 (
    id_1
);
  output wire id_1;
  assign id_1 = (1'b0);
  wire id_2;
  id_3(
      .id_0(id_2), .id_1(1), .id_2(1), .id_3(id_1)
  );
  wire id_4;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3;
  module_0 modCall_1 (id_3);
endmodule
module module_2 (
    output uwire id_0,
    output supply0 id_1,
    input tri id_2,
    inout uwire id_3,
    input uwire id_4
);
  wire id_6, id_7;
  xnor primCall (id_3, id_4, id_7, id_6, id_2);
  module_0 modCall_1 (id_7);
  assign modCall_1.id_2 = 0;
endmodule
