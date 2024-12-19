// Seed: 2424082225
module module_0 (
    input wire id_0,
    input tri1 id_1,
    output tri1 id_2,
    input wor id_3,
    input supply0 id_4,
    output wand id_5,
    input wor id_6,
    output tri1 id_7,
    input wor id_8,
    input tri id_9,
    output tri0 id_10,
    input wor id_11,
    input tri id_12,
    output tri id_13,
    input uwire id_14,
    input tri1 id_15,
    input wor id_16,
    output tri id_17
    , id_28,
    output tri1 id_18,
    input wand id_19,
    input tri0 id_20,
    input tri0 id_21,
    output wand id_22,
    input wand id_23,
    output supply0 id_24,
    input wor id_25,
    input wor id_26
);
  wire id_29;
  assign module_1.type_20 = 0;
endmodule
module module_1 (
    input wor id_0,
    output wire id_1,
    input logic id_2,
    output tri0 id_3,
    input wand id_4,
    output tri0 id_5,
    output wand id_6,
    input tri0 id_7,
    inout uwire id_8,
    output tri id_9,
    output wor id_10,
    input supply1 id_11,
    input tri id_12,
    input supply1 id_13,
    output logic id_14,
    input supply1 id_15,
    output tri1 id_16
);
  assign id_6 = 1;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_3,
      id_12,
      id_15,
      id_5,
      id_8,
      id_1,
      id_8,
      id_7,
      id_9,
      id_15,
      id_4,
      id_6,
      id_8,
      id_12,
      id_7,
      id_9,
      id_5,
      id_4,
      id_12,
      id_7,
      id_3,
      id_12,
      id_3,
      id_0,
      id_11
  );
  assign id_9 = 1'h0;
  id_18(
      .id_0(id_4),
      .id_1(id_12 >= 1'b0),
      .id_2(1),
      .id_3(1'b0),
      .id_4(1),
      .id_5(~1),
      .id_6(""),
      .id_7(1)
  );
  always id_14 <= id_2;
endmodule
