// Seed: 3441265679
module module_0 (
    output uwire id_0,
    input  uwire id_1,
    output wire  id_2,
    input  wor   id_3,
    input  tri0  id_4
);
  wire id_6;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output logic id_0,
    output tri   id_1,
    input  wor   id_2,
    input  uwire id_3,
    output wor   id_4,
    output uwire id_5
);
  wire id_7;
  wire id_9;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_5,
      id_2,
      id_3
  );
  tri0 id_10;
  always_ff @(posedge (1)) id_0 <= 'b0;
  assign id_10 = 1;
  assign id_7  = 1;
endmodule
