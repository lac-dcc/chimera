// Seed: 1780147607
module module_0 (
    input uwire id_0,
    input tri   id_1,
    input tri   id_2
);
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    output supply1 id_2,
    output tri id_3,
    input uwire id_4
);
  buf primCall (id_3, id_1);
  wire id_6, id_7;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_4
  );
  assign modCall_1.id_2 = 0;
  assign id_3 = id_6 < 1;
  assign id_3 = id_4;
endmodule
module module_2 (
    input tri1 id_0,
    input tri1 id_1,
    output tri0 id_2,
    output wand id_3,
    output uwire id_4,
    input supply1 id_5,
    input wand id_6
    , id_12,
    input wand id_7,
    input tri0 id_8,
    output wand id_9,
    input wire id_10
);
  assign id_9 = $realtime;
  wire id_13;
  ;
  localparam id_14 = 1;
  assign id_4 = id_0;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6
  );
  assign modCall_1.id_0 = 0;
endmodule
