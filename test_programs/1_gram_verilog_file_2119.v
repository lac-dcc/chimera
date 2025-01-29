// Seed: 883922758
module module_0 (
    output uwire id_0,
    output wor   id_1,
    input  wire  id_2
);
  id_4(
      .id_0(1), .id_1(1'h0), .id_2(1), .id_3(1 | id_2), .id_4(1), .id_5(-1'b0)
  );
  wire id_5;
endmodule
module module_1 (
    output wire id_0,
    output tri0 id_1,
    input  wor  id_2,
    input  wor  id_3,
    output tri1 id_4
);
  tri0 id_6;
  assign id_1 = id_6;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_2
  );
  assign modCall_1.id_2 = 0;
  assign id_1.id_3 = -1;
endmodule
