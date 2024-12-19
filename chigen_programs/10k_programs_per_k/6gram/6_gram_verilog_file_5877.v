// Seed: 3176424473
module module_0;
  reg id_2;
  always @(posedge id_1 < 1 or negedge 1) id_2 <= 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_5;
  initial
  fork : SymbolIdentifier
    id_6(id_5);
    $display;
  join_any : SymbolIdentifier
endmodule
module module_2 #(
    parameter id_5 = 32'd8,
    parameter id_6 = 32'd29
) (
    input  uwire   id_0,
    input  supply1 id_1,
    output logic   id_2
);
  reg id_4;
  module_0 modCall_1 ();
  assign modCall_1.type_4 = 0;
  always @(1 or(id_4 + 1)) begin : LABEL_0
    if (1) id_2 <= id_4;
    else id_4 <= 1 == id_1;
  end
  defparam id_5.id_6 = 1;
endmodule
