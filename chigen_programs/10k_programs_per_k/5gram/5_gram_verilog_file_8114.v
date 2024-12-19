// Seed: 81425914
module module_0 (
    input  wor   id_0,
    input  tri   id_1,
    input  tri1  id_2,
    output tri1  id_3,
    output tri0  id_4,
    input  uwire id_5
);
  wire id_7;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    output wor   id_0,
    input  logic id_1,
    output tri   id_2,
    output logic id_3,
    input  tri0  id_4
);
  always @(*) begin : LABEL_0
    id_3#(
        .id_4({1, id_1} <= id_4 + 1),
        .id_1(1 == 1)
    ) <= 1;
    begin : LABEL_0
      id_3 <= id_1;
    end
  end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_0,
      id_0,
      id_4
  );
endmodule
