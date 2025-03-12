// Seed: 4251538932
module module_0 (
    output logic id_0,
    input wor id_1,
    input supply1 id_2
);
  always @(posedge 1'b0) begin : LABEL_0
    id_0 <= id_1;
  end
endmodule
module module_0 (
    output supply0 id_0,
    output uwire id_1,
    input uwire id_2,
    output wor id_3,
    output tri0 id_4,
    output tri1 module_1,
    input wor id_6,
    input tri1 id_7,
    input wor id_8,
    input uwire id_9,
    input tri0 id_10,
    output logic id_11,
    output wand id_12,
    input wor id_13,
    input supply1 id_14
    , id_30,
    input tri0 id_15,
    output tri0 id_16,
    output supply0 id_17,
    output supply0 id_18,
    output wor id_19,
    input tri1 id_20,
    input wor id_21,
    input supply1 id_22,
    output wor id_23,
    output tri1 id_24,
    output tri1 id_25,
    input tri id_26,
    output wor id_27,
    input tri id_28
);
  initial begin : LABEL_0
    fork
      begin : LABEL_1
        $signed(71);
        ;
        disable id_31;
      end
    join_any
    begin : LABEL_2
      if (-1) begin : LABEL_3
        id_11 <= id_30 == id_20;
      end
    end
  end
  module_0 modCall_1 (
      id_11,
      id_8,
      id_26
  );
  assign modCall_1.id_1 = 0;
endmodule
