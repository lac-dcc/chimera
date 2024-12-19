// Seed: 3476606755
module module_0 (
    input  tri id_0,
    output tri id_1
);
  assign id_1 = 1;
  module_2 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign module_1.id_2  = 0;
endmodule
module module_1 (
    input  wor   id_0,
    input  uwire id_1,
    input  logic id_2,
    output wor   id_3
);
  reg id_5 = 1;
  initial id_5 = #0 id_2;
  or primCall (id_3, id_2, id_0, id_5, id_1);
  module_0 modCall_1 (
      id_0,
      id_3
  );
endmodule
module module_2 ();
  assign id_1 = 1;
  module_3 modCall_1 ();
endmodule
module module_3;
  uwire id_1;
  integer id_2 (
      .id_0(1 - id_3),
      .id_1(id_3),
      .id_2(1),
      .id_3(id_4),
      .id_4(id_3),
      .id_5(id_4),
      .id_6(""),
      .id_7(id_3),
      .id_8(id_4)
  );
  wire id_5;
  wire id_6;
  wire id_7;
  assign id_1 = 1'b0;
endmodule
