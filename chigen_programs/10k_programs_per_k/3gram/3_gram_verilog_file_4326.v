// Seed: 368352387
module module_0 (
    input wor id_0,
    input supply0 id_1,
    input tri0 id_2,
    input uwire id_3,
    output tri0 id_4,
    input supply1 id_5,
    input tri id_6,
    output wand id_7,
    input tri1 id_8,
    input supply0 id_9,
    input uwire id_10,
    input supply0 id_11,
    output tri1 id_12
);
  assign module_1.type_1 = 0;
  wire id_14;
endmodule
module module_1 (
    output logic id_0,
    input  tri   id_1
);
  wand id_3 = id_1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3
  );
  always_latch @(posedge id_3 + 1 * 1 + id_1 + 1) begin : LABEL_0
    id_0 <= #id_1 1;
  end
endmodule
