// Seed: 1710152991
module module_0 (
    input uwire id_0,
    input wor id_1,
    input wor id_2,
    output uwire id_3,
    input supply0 id_4,
    input tri id_5,
    input tri id_6,
    input supply1 id_7,
    input uwire id_8,
    input uwire id_9
);
  logic id_11;
  ;
  wire id_12;
  wire id_13;
endmodule
module module_1 (
    input wor id_0,
    output wire id_1,
    input supply0 id_2
    , id_7,
    input supply1 id_3,
    input wand id_4,
    output supply1 id_5
);
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_1,
      id_3,
      id_4,
      id_0,
      id_2,
      id_3,
      id_3
  );
  assign modCall_1.id_7 = 0;
  always_latch $signed(56);
  ;
endmodule
