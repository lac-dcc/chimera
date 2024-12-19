// Seed: 369570267
module module_0 (
    input tri0  id_0,
    input uwire id_1,
    input wor   id_2,
    input tri1  id_3,
    input tri0  id_4,
    input wire  id_5
);
  assign module_2.type_0 = 0;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    output logic id_1,
    input wor id_2,
    input supply1 id_3,
    input tri1 id_4,
    input uwire id_5,
    input tri id_6,
    output tri0 id_7
);
  always id_1 = #1 1'b0;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_6,
      id_4
  );
endmodule
module module_2 (
    input supply0 id_0,
    input tri0 id_1,
    input supply1 id_2,
    input uwire id_3
);
  tri1 id_5;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_1
  );
  id_6(
      .id_0(1), .id_1(1)
  );
  assign id_5 = id_1 - id_1;
endmodule
