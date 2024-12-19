// Seed: 3963008494
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = id_5;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  wire id_3, id_4, id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4
  );
endmodule
module module_2 ();
  assign id_1 = 1;
  assign id_1 = id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1
  );
  id_2(
      .id_0(1'b0), .id_1(1)
  );
endmodule
