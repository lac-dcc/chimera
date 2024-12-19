// Seed: 3457964424
module module_0 (
    input uwire id_0,
    input supply1 id_1,
    input wire id_2,
    input wand id_3,
    output tri id_4,
    output tri0 id_5
);
  assign module_1.type_1 = 0;
  wire id_7;
  assign id_5 = 1;
  assign id_4 = id_1;
endmodule
module module_1 (
    input  wire  id_0,
    output wand  id_1,
    input  tri   id_2,
    input  wire  id_3,
    output logic id_4
);
  always_comb @(posedge id_3 ? 1 : 1'd0) begin : LABEL_0
    return 1;
    id_4 <= 'd0 !== 1;
    if (id_0) assume (id_0);
  end
  wire id_6;
  assign id_4 = id_2 - id_3;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_3,
      id_1,
      id_1
  );
endmodule
