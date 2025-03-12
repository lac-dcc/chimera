// Seed: 42323075
module module_0 (
    input  wor  id_0,
    output tri0 id_1
);
  always @(posedge id_0) begin : LABEL_0
    $signed(47);
    ;
    disable id_3;
  end
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output uwire id_0,
    output wand id_1,
    input tri1 id_2,
    input tri1 id_3,
    input supply1 id_4,
    input wand id_5,
    input wor id_6,
    input wor id_7,
    input uwire id_8,
    input supply1 id_9,
    input tri id_10,
    output wor id_11,
    output tri0 id_12,
    input supply1 id_13,
    input wor id_14,
    input wor id_15,
    output logic id_16,
    input supply0 id_17,
    input wand id_18,
    input wor id_19,
    output logic id_20
);
  always @(posedge 1 == 1) begin : LABEL_0
    id_20 <= {id_3{id_18}} >= -1;
    id_16 <= id_3;
  end
  nor primCall (
      id_1, id_19, id_6, id_9, id_10, id_5, id_18, id_17, id_14, id_4, id_3, id_2, id_8, id_7
  );
  module_0 modCall_1 (
      id_19,
      id_1
  );
endmodule
