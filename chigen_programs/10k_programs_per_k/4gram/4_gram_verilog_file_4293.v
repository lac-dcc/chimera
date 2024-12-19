// Seed: 2300866882
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input tri id_3
);
  wire id_5, id_6, id_7, id_8, id_9, id_10;
  assign id_9 = id_5;
  wire id_11;
  id_12(
      .id_0(1), .id_1(id_6), .id_2(""), .id_3(1'b0)
  );
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    input  wand id_0,
    input  tri0 id_1,
    input  wire id_2,
    output wor  id_3,
    input  tri0 id_4,
    output tri0 id_5,
    output tri0 id_6
);
  assign id_6 = ~id_4;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_4,
      id_2
  );
endmodule
