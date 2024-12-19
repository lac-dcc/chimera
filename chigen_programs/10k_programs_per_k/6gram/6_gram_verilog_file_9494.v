// Seed: 338155038
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign id_2 = {1, id_1};
  assign module_1.type_11 = 0;
endmodule
module module_1 (
    input  tri0 id_0,
    input  tri0 id_1,
    input  wand id_2,
    input  tri0 id_3,
    output tri1 id_4
);
  uwire id_6;
  wire  id_7;
  wire  id_8;
  module_0 modCall_1 (
      id_8,
      id_6
  );
  assign id_4 = 1 - id_6;
  id_9(
      .id_0(~id_1), .id_1(1), .id_2(1), .id_3(), .id_4(1), .id_5(), .id_6(1), .id_7(1), .id_8(1)
  );
endmodule
