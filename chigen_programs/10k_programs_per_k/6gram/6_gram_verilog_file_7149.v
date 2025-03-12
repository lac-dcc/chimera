// Seed: 3958910619
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input wor id_2,
    input uwire id_3,
    input wor id_4,
    output wor module_0,
    input tri1 id_6,
    output tri1 id_7
);
  assign id_7 = id_6;
endmodule
module module_1 (
    input wor id_0,
    input tri id_1,
    input tri id_2,
    input supply1 id_3,
    output tri id_4,
    input supply0 id_5,
    input tri0 id_6,
    output logic id_7,
    input uwire id_8,
    input uwire id_9,
    inout supply1 id_10,
    input tri0 id_11,
    output supply1 id_12,
    input supply0 id_13,
    input uwire id_14,
    output tri id_15
);
  always @(posedge id_5) begin : LABEL_0
    force id_12 = id_13;
    id_7 <= id_13;
  end
  module_0 modCall_1 (
      id_6,
      id_10,
      id_14,
      id_5,
      id_1,
      id_4,
      id_11,
      id_4
  );
  assign modCall_1.id_5 = 0;
endmodule
