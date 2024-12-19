// Seed: 1987900062
module module_0 (
    output supply0 id_0,
    input wor id_1,
    input uwire id_2
    , id_9,
    output tri0 id_3,
    input wire id_4,
    output tri0 id_5,
    input uwire id_6,
    output supply0 id_7
);
  wire id_10;
  wire id_11;
  id_12(
      id_10, 1
  );
  wand id_13, id_14, id_15, id_16;
  wire id_17;
endmodule
module module_1 (
    input uwire id_0,
    output tri0 id_1,
    output supply1 id_2,
    input supply0 id_3,
    input uwire id_4,
    input supply1 id_5,
    input supply1 id_6
);
  module_0 modCall_1 (
      id_1,
      id_5,
      id_6,
      id_2,
      id_5,
      id_2,
      id_5,
      id_1
  );
  assign modCall_1.type_19 = 0;
endmodule
