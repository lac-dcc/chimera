// Seed: 864440674
module module_0 (
    output tri1  id_0,
    output tri1  id_1,
    output wor   id_2,
    output logic id_3
);
  assign module_1.id_1 = 0;
  initial begin : LABEL_0
    id_3 = #(id_5) id_5;
  end
endmodule
module module_1 (
    input  uwire id_0,
    output logic id_1,
    input  wor   id_2,
    input  tri0  id_3,
    output tri1  id_4
);
  always @(posedge 1)
    if (1 == id_3) begin : LABEL_0
      id_1 <= 1;
      #1;
    end else id_1 <= 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_1
  );
endmodule
