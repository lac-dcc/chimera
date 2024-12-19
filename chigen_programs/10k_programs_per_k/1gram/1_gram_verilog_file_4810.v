// Seed: 3233764748
module module_0 (
    input tri1 id_0,
    output wor id_1,
    input tri0 id_2,
    input tri0 id_3,
    input supply1 id_4,
    output supply1 id_5,
    output tri id_6,
    input tri0 id_7,
    input wand id_8,
    input uwire id_9
);
  assign module_1.type_23 = 0;
endmodule
macromodule module_1 (
    output tri id_0,
    output wand id_1,
    output logic id_2,
    input wor id_3,
    input uwire id_4,
    input tri0 id_5
    , id_15,
    output tri id_6,
    input tri0 id_7
    , id_16,
    input logic id_8,
    output tri id_9,
    output wor id_10,
    output logic id_11,
    output supply1 id_12,
    input supply0 id_13
);
  wor id_17 = id_3, id_18;
  always begin : LABEL_0
    begin : LABEL_0
      id_11 <= ~1'b0;
    end
  end
  module_0 modCall_1 (
      id_4,
      id_17,
      id_18,
      id_4,
      id_13,
      id_17,
      id_6,
      id_7,
      id_17,
      id_18
  );
  assign id_2 = id_15;
  tri id_19;
  assign id_19 = id_13;
  always_ff
    case (id_17)
      id_18: id_2 <= 1;
      id_5:  id_2 <= id_8;
    endcase
  initial id_12 -= 1;
endmodule
