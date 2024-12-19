// Seed: 1158691020
module module_0 (
    output wor id_0,
    input wire id_1,
    input uwire id_2,
    input supply1 id_3,
    output tri1 id_4,
    input supply0 id_5,
    input wor id_6,
    input wire id_7,
    input tri id_8,
    input tri1 id_9,
    input wor id_10,
    input uwire id_11,
    output tri0 id_12,
    output tri id_13
);
  assign module_1.id_7 = 0;
  assign id_12 = id_2;
endmodule
module module_1 (
    input supply1 id_0,
    input supply1 id_1,
    input supply0 id_2,
    output supply1 id_3,
    input wire id_4,
    output wire id_5,
    output logic id_6,
    output wand id_7,
    input tri id_8,
    input supply1 id_9,
    input wor id_10
);
  always @(negedge id_8) begin : LABEL_0
    id_6 = #id_12 1;
  end
  id_13(
      .id_0(1), .id_1(id_5), .id_2(1), .id_3(1)
  ); id_14(
      .id_0(id_6), .id_1(1), .id_2(1)
  );
  module_0 modCall_1 (
      id_3,
      id_10,
      id_0,
      id_9,
      id_5,
      id_9,
      id_4,
      id_8,
      id_4,
      id_2,
      id_10,
      id_2,
      id_3,
      id_3
  );
endmodule
