// Seed: 3803949086
module module_0;
  logic [7:0] id_1;
  ;
  assign module_2.id_0 = 0;
  assign module_1.id_1 = 0;
  assign id_1[-1] = 1 ? id_1 == -1 : -1;
endmodule
module module_1 #(
    parameter id_0 = 32'd86,
    parameter id_1 = 32'd52
) (
    input wire _id_0,
    input supply1 _id_1,
    output wire id_2
);
  logic [7:0] id_4;
  assign id_4[id_0] = id_4[-1&id_1] < 1;
  xor primCall (id_2, id_4, id_5);
  logic id_5;
  ;
  module_0 modCall_1 ();
endmodule : SymbolIdentifier
module module_2 (
    output tri id_0,
    input supply1 id_1,
    output wire id_2
);
  module_0 modCall_1 ();
  wire id_4;
  wire id_5;
endmodule
