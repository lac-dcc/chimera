// Seed: 1879690304
module module_0 (
    output wire id_0,
    input wand id_1,
    output tri id_2,
    output wand id_3,
    input wand id_4,
    input wor id_5,
    output supply1 id_6,
    input tri0 id_7,
    output tri0 id_8,
    input uwire id_9,
    output wire id_10
);
  wand id_12;
  assign module_1.type_22 = 0;
  id_13(
      .id_0(1),
      .id_1(id_2),
      .id_2(1),
      .id_3(id_12),
      .id_4(),
      .id_5(1 == id_2 - 1),
      .id_6(id_12),
      .id_7(id_0),
      .id_8(1),
      .id_9(1'h0)
  );
  wire id_14;
  assign id_6 = id_12;
endmodule
module module_1 (
    input supply0 id_0,
    output supply1 id_1,
    output logic id_2,
    input wand id_3,
    input logic id_4,
    output uwire id_5,
    output supply0 id_6,
    input logic id_7,
    output logic id_8,
    input logic id_9,
    output supply0 id_10,
    input tri0 id_11,
    input logic id_12,
    output tri id_13,
    input supply0 id_14
);
  always_comb begin : LABEL_0
    if (id_11)
      assume #1  (1)
      else id_2 <= 0;
    else id_1 = 1;
    if (id_9) id_8 = id_7;
    id_2 <= id_12;
    id_8 <= id_9;
  end
  wire id_16, id_17;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_13,
      id_5,
      id_11,
      id_14,
      id_13,
      id_11,
      id_1,
      id_11,
      id_5
  );
endmodule
