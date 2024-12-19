// Seed: 2258774047
module module_0 (
    output tri1 id_0,
    input wor id_1,
    input uwire id_2,
    input tri0 id_3,
    output tri id_4,
    output tri id_5,
    input supply0 id_6
);
  wire id_8, id_9;
  id_10(
      id_0
  );
  wire id_11;
  uwire id_12, id_13;
  id_14(
      1'b0, 1, 1, id_13, 1'b0
  );
  wire id_15;
  wire id_16;
  wire id_17, id_18;
  wire id_19;
  assign id_4 = 1;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    input wor id_0
    , id_10,
    input tri1 id_1,
    input tri1 id_2,
    output wand id_3,
    input supply0 id_4,
    output wor id_5,
    input wor id_6,
    input wire id_7,
    output wand id_8
);
  wire id_11;
  assign id_3 = id_0;
  wire id_12;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_7,
      id_4,
      id_5,
      id_3,
      id_4
  );
  wire id_13, id_14;
endmodule
