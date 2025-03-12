// Seed: 4079776962
module module_0 (
    input wire id_0,
    input wire id_1,
    output tri1 id_2,
    output supply1 id_3,
    output tri id_4
);
  assign id_3 = id_1;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input wor id_1,
    output logic id_2,
    output tri1 id_3,
    input supply0 id_4,
    input tri1 id_5
);
  always @(posedge (-1) or negedge id_4) begin : LABEL_0
    fork
      id_2 = -1'b0;
      id_7;
    join_any
  end
  module_0 modCall_1 (
      id_1,
      id_0,
      id_3,
      id_3,
      id_3
  );
  always @(*) begin : LABEL_1
    if (1'b0) id_2 <= #id_0 id_5;
    else disable id_8;
  end
endmodule
