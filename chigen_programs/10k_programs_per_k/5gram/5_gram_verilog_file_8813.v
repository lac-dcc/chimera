// Seed: 1089294416
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_4 = id_3 ? 1 : 1 ? 1 - 1 : 1;
  wire id_5;
endmodule
module module_1 (
    output logic id_0,
    input  tri   id_1,
    output wand  id_2
);
  always @(negedge {id_1, 1}) id_0 <= #id_1 1;
  assign id_0 = 1;
  assign id_2 = 1;
  generate
    wire id_4;
    assign id_2#(.id_4(1)) = 1;
  endgenerate
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4,
      id_4
  );
  assign modCall_1.id_3 = 0;
  id_7 :
  assert property (@(posedge 1) 1)
  else $display(1, id_4++);
  assign id_7 = 1;
endmodule
