// Seed: 718716020
module module_0;
  wire id_1;
endmodule
module module_1 (
    output logic id_0
    , id_11,
    output logic id_1,
    inout  logic id_2,
    output uwire id_3,
    input  tri   id_4,
    output tri1  id_5,
    output wand  id_6,
    output logic id_7,
    input  logic id_8,
    inout  wand  id_9
);
  always_ff @(id_4)
  fork
    id_0 <= id_11;
    if (1'b0) begin : LABEL_0
      id_1 <= 1;
    end else begin : LABEL_0
      id_2 <= 1;
      id_7 <= id_8;
    end
  join
  module_0 modCall_1 ();
endmodule
