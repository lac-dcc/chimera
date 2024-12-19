// Seed: 1867767507
module module_0 (
    input  uwire id_0,
    output tri   id_1,
    input  wor   id_2,
    input  tri0  id_3,
    input  wor   id_4,
    output tri1  id_5
);
  wire id_7;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output tri0  id_0,
    output logic id_1,
    input  logic id_2,
    input  wire  id_3,
    input  wire  id_4
);
  wire id_6;
  reg  id_7;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_4,
      id_3,
      id_3,
      id_0
  );
  wire id_8;
  initial begin : LABEL_0
    id_7 = #id_9 id_2;
  end
  assign id_1 = id_2;
endmodule
