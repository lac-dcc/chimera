// Seed: 3499725699
module module_0;
  integer id_2;
  assign module_3.id_2   = 0;
  assign module_2.type_0 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign {~id_1} = id_2 == 1;
  module_0 modCall_1 ();
  uwire id_5;
  always_comb @(~id_1 or 1'b0) id_5 = 1;
endmodule
module module_2 (
    input  wire id_0,
    output wand id_1
);
  tri id_3 = 1 ? id_0 : id_3;
  module_0 modCall_1 ();
endmodule
module module_3 (
    input tri id_0,
    input wire id_1,
    output logic id_2,
    input logic id_3,
    input wire id_4,
    input supply0 id_5
    , id_10,
    output tri id_6,
    input logic id_7,
    output wor id_8
);
  assign id_2 = {id_7{id_5 - 1}};
  module_0 modCall_1 ();
  initial id_2 <= id_3;
  always_latch @(posedge id_7) begin : LABEL_0
    id_2 = 1;
  end
endmodule
