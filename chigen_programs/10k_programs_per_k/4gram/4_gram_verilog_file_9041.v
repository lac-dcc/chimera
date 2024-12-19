// Seed: 1045399619
module module_0 (
    input wand id_0,
    output uwire id_1,
    input uwire id_2,
    output tri1 id_3,
    input wand id_4,
    input wor id_5,
    input uwire id_6,
    input supply1 id_7,
    output uwire id_8
    , id_21,
    output supply1 id_9,
    output wire id_10,
    input supply0 id_11,
    output supply0 id_12,
    input wire id_13,
    input tri1 id_14,
    input supply0 id_15,
    input wire id_16,
    input tri id_17,
    output wand id_18,
    input wor id_19
    , id_22
);
  wire id_23;
  assign module_1.id_4 = 0;
  id_24(
      .id_0(1), .id_1(1)
  );
  wire id_25;
endmodule
module module_1 (
    input wire id_0,
    input wand id_1,
    input wand id_2,
    input supply0 id_3,
    output supply1 id_4,
    output wand id_5,
    input wand id_6
);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_4,
      id_3,
      id_0,
      id_1,
      id_1,
      id_5,
      id_5,
      id_4,
      id_2,
      id_4,
      id_0,
      id_1,
      id_6,
      id_1,
      id_3,
      id_4,
      id_6
  );
  wand id_8;
  assign id_4 = 1'd0;
  assign id_8 = 1'd0;
endmodule
