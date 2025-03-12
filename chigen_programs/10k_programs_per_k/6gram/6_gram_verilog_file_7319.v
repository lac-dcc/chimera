// Seed: 1396289131
module module_0 (
    input supply0 id_0,
    output logic id_1,
    input tri0 id_2
);
  assign id_1 = id_2;
  assign module_1.id_3 = 0;
  always @(*) begin : LABEL_0
    id_1 <= (id_0);
    id_1 = id_0;
  end
endmodule
module module_1 (
    input uwire id_0,
    input wire id_1,
    output logic id_2,
    output supply1 id_3,
    input tri1 id_4,
    input supply1 id_5,
    output tri1 id_6
);
  assign id_3 = (-1);
  always @(posedge 1'h0) begin : LABEL_0
    id_2 <= id_1 - 1;
  end
  module_0 modCall_1 (
      id_0,
      id_2,
      id_5
  );
endmodule
