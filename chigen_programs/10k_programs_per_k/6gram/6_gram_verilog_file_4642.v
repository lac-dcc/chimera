// Seed: 280297737
module module_0 (
    output tri1 id_0,
    input wor id_1,
    output supply1 id_2,
    input wand id_3,
    output tri1 id_4
);
  wire id_6;
  module_2 modCall_1 (
      id_3,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_4
  );
  supply0 id_7 = 1;
  assign module_1.id_2 = 0;
  assign id_4 = 1;
endmodule
module module_1 (
    input  wand id_0,
    output wire id_1,
    output wand id_2
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_0,
      id_2
  );
endmodule
module module_2 (
    input  tri0 id_0,
    input  tri1 id_1,
    output tri  id_2,
    input  wire id_3
    , id_8,
    input  wire id_4,
    output tri  id_5,
    output tri  id_6
);
  assign id_6 = 1'b0;
  supply1 id_9;
  id_10(
      id_2, (1), 1
  );
  assign module_0.id_0 = 0;
  id_11(
      .id_0(~id_0), .id_1(~id_9), .id_2(1)
  );
endmodule
