// Seed: 4214567390
module module_0 (
    output uwire id_0,
    input uwire id_1,
    output wire id_2,
    output wand id_3,
    input wor id_4,
    input uwire id_5,
    output tri1 id_6,
    input wand id_7,
    output supply1 id_8,
    input uwire id_9,
    input supply1 id_10,
    input wire id_11,
    input supply0 id_12
    , id_17,
    output supply0 id_13,
    output wire id_14,
    output tri1 id_15
);
  id_18(
      .id_0(1)
  );
  wire id_19;
  wire id_20;
  assign id_13 = 1;
  assign id_3  = 1'd0;
  wire id_21;
  assign id_3 = 1;
endmodule
module module_1 (
    input  supply0 id_0,
    output supply0 id_1
);
  assign id_1 = id_0;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_8 = 0;
endmodule
