// Seed: 1386323819
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input uwire id_2,
    output tri id_3,
    output uwire id_4,
    input supply0 id_5,
    input wire id_6,
    output wor id_7,
    output tri0 id_8
);
  tri id_10;
  assign id_10 = id_2;
  assign module_1.id_1 = 0;
  assign id_4 = id_5;
endmodule
module module_1 (
    input  wire  id_0,
    output uwire id_1,
    output tri1  id_2,
    input  wand  id_3
);
  assign id_1 = id_3;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3,
      id_2,
      id_2,
      id_3,
      id_3,
      id_1,
      id_2
  );
  wire id_5, id_6, id_7, id_8, id_9;
  id_10(
      .id_0(id_1), .id_1(1), .id_2(1), .id_3(id_5), .id_4(id_3), .id_5(id_1)
  );
endmodule
