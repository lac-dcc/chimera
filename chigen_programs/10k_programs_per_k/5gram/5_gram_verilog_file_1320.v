// Seed: 4122890841
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_7;
  assign module_1.type_8 = 0;
endmodule
module module_1 (
    input wire  id_0,
    input logic id_1,
    input wand  id_2
);
  assign id_4 = 1;
  always_comb @(posedge 1 or 1'b0) begin : LABEL_0
    id_4 <= id_1;
    `define pp_5 0
    assume #1  (1) $display(1'b0, 1 + id_2 < 1);
    for (`pp_5 = 1; 1'b0; id_4 = 1'b0 == id_4) begin : LABEL_0
      `pp_5 <= id_4++;
    end
  end
  wire  id_6;
  uwire id_7 = id_0;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
endmodule
