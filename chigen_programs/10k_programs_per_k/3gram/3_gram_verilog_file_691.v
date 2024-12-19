// Seed: 1412571562
module module_0 (
    output tri0 id_0,
    output tri0 id_1,
    input supply0 id_2,
    input wor id_3,
    input tri0 id_4
);
  always_latch @(1 or(id_2) ^ id_4) begin : LABEL_0
    id_0 = 1 - id_3;
  end
  assign module_2.id_0 = 0;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output tri1  id_0,
    input  tri   id_1,
    input  uwire id_2,
    output wor   id_3,
    output uwire id_4,
    output tri0  id_5
);
  nor primCall (id_0, id_2, id_1);
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_1,
      id_2
  );
endmodule
module module_2 (
    output tri1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input tri id_3,
    output supply1 id_4,
    output wire id_5,
    input tri1 id_6
);
  id_8(
      .id_0(id_2), .id_1(~id_1), .id_2()
  );
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_1,
      id_6
  );
endmodule
