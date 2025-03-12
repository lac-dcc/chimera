// Seed: 2030042318
module module_0 (
    input tri1 id_0,
    input wand id_1,
    output supply1 id_2,
    output uwire id_3,
    output wand id_4,
    output uwire id_5,
    input wand id_6,
    input tri1 id_7,
    output tri id_8,
    output tri0 id_9,
    output tri1 id_10,
    output wor id_11,
    input wor id_12,
    output wire id_13,
    input tri0 id_14,
    output tri id_15,
    output wand id_16,
    output wand id_17
);
  wire id_19;
  ;
endmodule
module module_1 (
    input tri0 id_0,
    output logic id_1,
    input tri0 id_2,
    input supply0 id_3,
    input tri id_4,
    output supply0 id_5,
    output tri id_6,
    input tri1 id_7,
    output supply0 id_8
);
  initial begin : LABEL_0
    assert (1 - -1);
    if (-1) begin : LABEL_1
      $unsigned(86);
      ;
      id_1 <= 1;
    end else begin : LABEL_2
      force id_6 = id_7;
    end
  end
  xnor primCall (id_8, id_0, id_7, id_2, id_3);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_8,
      id_5,
      id_5,
      id_7,
      id_0,
      id_6,
      id_6,
      id_8,
      id_5,
      id_7,
      id_6,
      id_3,
      id_6,
      id_6,
      id_8
  );
  assign modCall_1.id_12 = 0;
endmodule
