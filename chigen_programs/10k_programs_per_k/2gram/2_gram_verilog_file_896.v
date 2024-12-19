// Seed: 1908620689
module module_0 (
    output uwire id_0,
    input  tri0  id_1,
    input  wor   id_2,
    input  tri0  id_3,
    output uwire id_4
);
  id_6(
      .id_0(id_0), .id_1(id_1), .id_2(1), .id_3("")
  );
endmodule
module module_1 (
    input  logic id_0,
    output tri0  id_1,
    input  wor   id_2,
    output uwire id_3,
    input  uwire id_4,
    input  wire  id_5,
    output logic id_6,
    output wand  id_7
);
  initial begin : LABEL_0
    id_6 = #1 id_0;
  end
  module_0 modCall_1 (
      id_7,
      id_5,
      id_5,
      id_5,
      id_3
  );
  assign modCall_1.id_3 = 0;
endmodule
