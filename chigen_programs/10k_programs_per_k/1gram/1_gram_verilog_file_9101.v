// Seed: 4014983749
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3, id_4, id_5;
  module_2 modCall_1 ();
  assign module_1.id_3 = 0;
  wire id_6, id_7;
endmodule
module module_1 (
    input logic id_0,
    input uwire id_1#(.id_3(1), .id_4(1))
);
  wire id_5;
  wire id_6;
  always id_3 <= id_0;
  module_0 modCall_1 (
      id_5,
      id_6
  );
endmodule
module module_2;
  id_1(
      .id_0(1), .id_1(!id_2.id_3), .id_2(id_3 + 1), .id_3(1), .id_4(), .id_5(id_3), .id_6(1'b0)
  );
endmodule
