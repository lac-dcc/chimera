// Seed: 1465447166
module module_0 (
    output tri1 id_0,
    output supply1 id_1,
    input uwire id_2,
    output tri0 id_3,
    output uwire id_4,
    input wor id_5,
    output tri id_6,
    input wor id_7,
    input wor id_8,
    output wor id_9
);
  assign id_4 = id_8#(.id_7(1));
  assign module_1.id_14 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    output tri1 id_1,
    output wor id_2,
    input supply1 id_3,
    input tri id_4,
    input tri0 id_5,
    output wor id_6,
    input logic id_7,
    output supply0 id_8,
    output tri0 id_9,
    output logic id_10,
    input tri0 id_11,
    input wand id_12,
    input logic id_13,
    output supply0 id_14,
    input tri0 id_15
);
  assign id_1 = 1;
  always id_10 = @(id_7) id_13;
  always @(id_15) begin : LABEL_0
    #1;
  end
  module_0 modCall_1 (
      id_6,
      id_9,
      id_0,
      id_1,
      id_1,
      id_3,
      id_8,
      id_4,
      id_0,
      id_14
  );
  id_17(
      .id_0(1),
      .id_1(1),
      .id_2(1),
      .id_3(id_8),
      .id_4(1),
      .id_5(id_9 == 1),
      .id_6(1),
      .id_7(id_9),
      .id_8(1),
      .id_9(1)
  );
endmodule
