// Seed: 4189119945
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  always id_1 <= id_2;
  module_4 modCall_1 ();
  assign module_1.id_3 = 0;
endmodule
module module_1;
  reg id_1, id_3 = -1;
  module_0 modCall_1 (
      id_3,
      id_1
  );
  final begin : LABEL_0
    id_1 <= 1;
  end
endmodule
module module_2 (
    input wand  id_0,
    input uwire id_1,
    input wire  id_2
);
endmodule
module module_3 (
    input tri id_0
);
  module_2 modCall_1 (
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.type_5 = 0;
endmodule
module module_4;
  wire id_2, id_3;
  assign module_0.id_2 = 0;
  id_4(
      .id_0(),
      .id_1(id_1),
      .id_2(),
      .id_3(1'b0),
      .id_4(-1),
      .id_5(1'b0 == {id_2, 1}),
      .id_6(-1 - id_2)
  );
  wire id_5;
  id_6(
      -1
  );
  assign id_4 = id_1;
  assign id_3 = id_2;
endmodule
