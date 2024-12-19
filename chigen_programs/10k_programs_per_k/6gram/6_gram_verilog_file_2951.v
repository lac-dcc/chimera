// Seed: 469274197
module module_0 (
    input tri id_0,
    output supply0 id_1,
    input uwire id_2,
    output tri id_3,
    input supply1 id_4,
    output wire id_5,
    input wire id_6,
    input tri1 id_7,
    input uwire id_8,
    output uwire id_9,
    input wor id_10,
    input wor id_11,
    input uwire id_12,
    input uwire id_13,
    output tri id_14
);
  initial begin : LABEL_0
    wait (id_11);
    id_5 = id_10;
  end
  assign module_1.type_18 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input tri id_1,
    output supply0 id_2,
    input supply1 id_3,
    input wand id_4,
    output logic id_5,
    input supply1 id_6,
    output supply0 id_7,
    input wor id_8,
    input tri1 id_9
);
  assign id_5 = 1;
  tri id_11, id_12, id_13, id_14, id_15, id_16;
  module_0 modCall_1 (
      id_6,
      id_2,
      id_0,
      id_2,
      id_1,
      id_2,
      id_8,
      id_4,
      id_0,
      id_2,
      id_3,
      id_8,
      id_6,
      id_4,
      id_2
  );
  always @(*) begin : LABEL_0
    id_5 <= !id_15;
    id_5 <= 1;
  end
endmodule
