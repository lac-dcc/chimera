// Seed: 1976229151
module module_0;
  assign id_1 = 1;
  assign module_2.id_2 = 0;
  wire id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  id_4(
      .id_0(id_3), .id_1(1), .id_2(id_1), .id_3(1), .id_4(id_3)
  );
  not primCall (id_2, id_4);
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1
);
  input wire id_1;
  assign id_2 = id_1;
  module_0 modCall_1 ();
  always id_2 <= id_1;
endmodule
