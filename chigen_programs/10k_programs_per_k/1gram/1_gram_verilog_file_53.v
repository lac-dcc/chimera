// Seed: 473722460
module module_0 (
    input tri0 id_0,
    output wire id_1,
    input supply0 id_2,
    input uwire id_3,
    input uwire id_4,
    output wire id_5,
    input wand id_6,
    input wand id_7,
    output tri0 id_8,
    output tri0 id_9,
    input supply1 id_10,
    output tri0 id_11,
    output tri0 id_12,
    input tri1 id_13,
    input tri0 id_14,
    input uwire id_15,
    output wand id_16,
    input tri0 id_17,
    input wor id_18,
    input wand id_19
);
  wire id_21;
  id_22(
      .id_0(id_17), .id_1(1'd0), .id_2(id_3), .id_3("")
  );
  wire id_23;
endmodule
module module_1 (
    output uwire id_0,
    input  uwire id_1,
    output uwire id_2,
    input  wire  id_3,
    input  uwire id_4,
    output uwire id_5
);
  assign id_0 = 1 - ~id_3;
  module_0(
      id_3,
      id_0,
      id_3,
      id_1,
      id_1,
      id_2,
      id_4,
      id_4,
      id_2,
      id_5,
      id_4,
      id_0,
      id_2,
      id_3,
      id_3,
      id_4,
      id_0,
      id_4,
      id_1,
      id_3
  );
endmodule
