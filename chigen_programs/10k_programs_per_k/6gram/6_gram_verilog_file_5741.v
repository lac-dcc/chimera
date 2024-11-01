// Seed: 841236788
module module_0 (
    output tri0 id_0,
    output tri1 id_1,
    output uwire id_2,
    input uwire id_3,
    output wire id_4,
    output wire id_5,
    input tri0 id_6,
    input supply0 id_7,
    output uwire id_8,
    output wand id_9,
    output tri id_10,
    output supply1 id_11,
    input supply0 id_12,
    output supply1 id_13,
    input wor id_14,
    input tri0 id_15
);
  wire id_17;
  wire id_18;
  assign id_2 = id_18;
  wire id_19;
  id_20(
      .id_0(id_4),
      .id_1(id_10),
      .id_2(1'h0),
      .id_3(1),
      .id_4(1),
      .id_5(module_0),
      .id_6(id_0),
      .id_7(),
      .id_8(id_13),
      .id_9(id_8),
      .id_10(id_5)
  );
endmodule
module module_1 (
    output logic id_0,
    output tri id_1,
    input tri0 id_2,
    output tri id_3,
    input wor id_4,
    input wand id_5,
    input supply1 id_6,
    output supply1 id_7,
    output wand id_8,
    input logic id_9,
    input tri id_10,
    output tri0 id_11,
    input tri1 id_12
    , id_14
);
  wire id_15;
  module_0(
      id_8,
      id_11,
      id_11,
      id_4,
      id_1,
      id_11,
      id_2,
      id_4,
      id_1,
      id_1,
      id_1,
      id_7,
      id_10,
      id_8,
      id_4,
      id_2
  );
  always @(id_2 or posedge 1) id_0 <= ((id_9));
endmodule
