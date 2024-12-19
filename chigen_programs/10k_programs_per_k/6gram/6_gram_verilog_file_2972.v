// Seed: 2271170266
module module_0 ();
  supply0 id_1 = 1'b0, id_2;
  assign module_2.type_3 = 0;
endmodule
module module_1 (
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
  assign id_2[1] = 1;
  buf primCall (id_2, id_4);
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input logic id_0,
    input wire  id_1,
    input wire  id_2,
    input tri   id_3,
    input tri   id_4,
    input tri0  id_5
);
  initial begin : LABEL_0
    id_7 <= 1;
    id_7 = #id_8 id_0;
    $display;
  end
  module_0 modCall_1 ();
endmodule
