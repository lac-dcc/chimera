// Seed: 1787764043
module module_0 (
    output tri0 id_0,
    input tri0 id_1,
    input wand id_2,
    output tri1 id_3,
    input uwire id_4,
    output tri0 id_5,
    output tri0 id_6,
    input tri0 id_7,
    output logic id_8,
    output uwire id_9,
    output supply1 id_10,
    input supply1 id_11,
    output supply1 id_12
);
  assign id_9 = id_1 == 1'b0;
  final
  fork
    id_8 = -1'b0;
  join
endmodule
module module_1 (
    input tri1 id_0,
    output logic id_1,
    input supply0 id_2,
    output logic id_3,
    input uwire id_4,
    output supply0 id_5,
    input tri1 id_6,
    input supply0 id_7
);
  always_comb begin : LABEL_0
    id_3 <= id_4;
    id_1 = #1 -1'b0;
  end
  module_0 modCall_1 (
      id_5,
      id_0,
      id_4,
      id_5,
      id_6,
      id_5,
      id_5,
      id_6,
      id_3,
      id_5,
      id_5,
      id_7,
      id_5
  );
  assign modCall_1.id_6 = 0;
endmodule
