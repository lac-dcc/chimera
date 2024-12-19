// Seed: 3591714211
module module_0 (
    input tri id_0,
    input tri id_1,
    input uwire id_2
    , id_20,
    input tri0 id_3,
    output uwire id_4,
    output tri0 id_5,
    input wand id_6,
    input wire id_7,
    input uwire id_8,
    input supply1 id_9,
    output tri id_10
    , id_21,
    input supply1 id_11,
    input supply1 id_12,
    input wor id_13,
    output supply0 id_14,
    input tri1 id_15,
    input wand id_16,
    output wire id_17,
    input supply0 id_18
);
  wand  id_22 = 1'b0;
  wire  id_23;
  tri0  id_24;
  uwire id_25 = 1;
  assign id_21 = id_16;
  assign module_1.id_1 = 0;
  static id_26(
      {id_24{id_15}}, id_10, id_11 * 1
  );
  wire id_27, id_28;
  wire id_29;
endmodule
module module_1 (
    input supply0 id_0,
    output tri0 id_1
    , id_5,
    input supply0 id_2,
    input wor id_3
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_1,
      id_1,
      id_3,
      id_3,
      id_2,
      id_3,
      id_1,
      id_0,
      id_2,
      id_3,
      id_1,
      id_0,
      id_0,
      id_1,
      id_2
  );
endmodule
