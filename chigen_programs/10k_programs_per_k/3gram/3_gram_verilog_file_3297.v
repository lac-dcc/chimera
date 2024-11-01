// Seed: 2335034289
module module_0 (
    input tri id_0,
    input uwire id_1,
    output supply0 id_2,
    output supply0 id_3,
    output supply1 id_4,
    input wor id_5,
    input wand id_6,
    output wire id_7,
    output uwire id_8,
    input tri1 id_9
);
  wire id_11;
  wire id_12;
  wire id_13;
  wire id_14;
  wire id_15;
  reg
      id_16,
      id_17,
      id_18,
      id_19,
      id_20,
      id_21,
      id_22,
      id_23,
      id_24,
      id_25,
      id_26,
      id_27,
      id_28,
      id_29,
      id_30,
      id_31,
      id_32,
      id_33,
      id_34,
      id_35;
  wire id_36;
  wire id_37;
  always_latch @(id_12) id_23 = #1 1;
  assign id_19 = id_17;
  wire id_38;
  id_39(
      .id_0(1),
      .id_1(id_20),
      .id_2(id_27),
      .id_3(id_35),
      .id_4(1'b0 ? id_25 : 1),
      .id_5(1),
      .id_6(1)
  );
endmodule
module module_1 (
    input uwire id_0,
    output tri1 id_1,
    output wand id_2,
    input supply1 id_3,
    input wire id_4,
    input wand id_5,
    input tri0 id_6,
    output tri0 id_7,
    input tri1 id_8,
    output tri0 id_9,
    input supply1 id_10,
    output wor id_11,
    input tri id_12,
    output tri id_13,
    input wire id_14,
    input supply0 id_15,
    output tri id_16,
    output tri id_17,
    output supply1 id_18
);
  assign id_16 = 1;
  module_0(
      id_4, id_10, id_1, id_9, id_1, id_3, id_4, id_9, id_2, id_3
  );
  always @(posedge id_8) id_2 = 1;
endmodule
