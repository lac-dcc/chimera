// Seed: 1454657368
module module_0 (
    input tri id_0,
    input uwire id_1,
    output logic id_2,
    input supply0 id_3,
    output logic id_4
);
  always @(id_1 or posedge id_0) begin : LABEL_0
    id_4 = id_3;
    id_4 = #id_6 id_1;
    while (1 ^ id_0) begin : LABEL_1
      id_6 <= 1;
    end
    id_2 <= id_1;
    id_4 <= id_6;
  end
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output logic id_0,
    input uwire id_1,
    output tri id_2,
    input wor id_3,
    input supply1 id_4,
    input tri id_5,
    output logic id_6
);
  assign id_6 = 1;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_6,
      id_3,
      id_6
  );
  always @(posedge id_3 or negedge 1'h0) begin : LABEL_0
    id_0 <= id_1;
    id_6 <= id_3 & id_1 & 1'd0;
  end
endmodule
