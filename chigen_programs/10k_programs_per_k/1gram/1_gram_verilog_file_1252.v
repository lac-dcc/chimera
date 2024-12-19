// Seed: 3010995241
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  module_2 modCall_1 ();
  assign module_1.id_1 = 0;
  wire id_4, id_5;
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  logic [7:0][1 : 1] id_2 (.id_0(1 | id_1));
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1
  );
endmodule
module module_2;
  assign id_1[1] = "";
  id_2(
      .id_0(id_1), .id_1(id_3 ? 1 : id_3), .id_2(1)
  );
endmodule
