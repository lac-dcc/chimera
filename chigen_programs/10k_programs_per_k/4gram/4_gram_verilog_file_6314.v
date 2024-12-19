// Seed: 3231253528
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
endmodule
module module_1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_2
  );
endmodule
module module_2 (
    output supply1 id_0,
    input supply0 id_1,
    input supply0 id_2,
    input wor id_3,
    input wor id_4,
    output uwire id_5,
    output wor id_6,
    output tri1 id_7,
    output supply0 id_8
);
  wire id_10;
endmodule
module module_3 (
    input  tri0 id_0,
    output tri1 id_1,
    input  wire id_2
);
  assign id_1 = id_2;
  id_4(
      .id_0({id_2, id_1}), .id_1(id_2)
  );
  module_2 modCall_1 (
      id_1,
      id_2,
      id_0,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_1 = 0;
  assign id_4 = id_4;
endmodule
