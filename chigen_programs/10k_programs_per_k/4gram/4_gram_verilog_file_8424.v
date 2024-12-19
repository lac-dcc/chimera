// Seed: 3152906980
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input wor id_2,
    output tri0 id_3,
    output wor id_4
    , id_12,
    output uwire id_5,
    input uwire id_6,
    output supply0 id_7,
    input wand id_8,
    input tri0 id_9,
    input wor id_10
);
  assign id_4 = 1 << ~id_9;
  tri0 id_13;
  wire id_14;
  assign id_13 = id_8;
endmodule
module module_1 (
    output uwire id_0,
    input tri0 id_1,
    input wand id_2,
    input wire id_3,
    output tri0 id_4,
    input wand id_5,
    input tri0 id_6,
    input uwire id_7,
    input uwire id_8,
    input supply1 id_9,
    input tri1 id_10
);
  assign id_4 = id_3;
  wire id_12;
  always repeat (id_3) id_13((id_3));
  assign id_13 = id_9;
  wor id_14 = id_13;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_13,
      id_14,
      id_0,
      id_6,
      id_14,
      id_9,
      id_2,
      id_10
  );
  assign modCall_1.id_2 = 0;
  wire id_15;
endmodule
