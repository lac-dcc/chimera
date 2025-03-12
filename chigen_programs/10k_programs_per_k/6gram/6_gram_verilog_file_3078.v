// Seed: 2770431388
module module_0;
  always disable id_1;
  assign module_3.id_3 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd92
) (
    input  supply0 _id_0,
    output supply1 id_1
);
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  logic [7:0] id_3;
  ;
  assign id_3[-1-id_0] = -1'b0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  output wire id_1;
endmodule
module module_3 (
    input  tri0  id_0,
    input  wor   id_1,
    input  wand  id_2,
    input  tri0  id_3,
    input  wire  id_4,
    input  tri0  id_5,
    output logic id_6,
    input  wor   id_7,
    input  tri1  id_8
);
  wire id_10;
  logic [7:0] id_11;
  module_0 modCall_1 ();
  reg id_12 = 1'b0;
  xor primCall (id_6, id_7, id_8);
  initial
  fork
    if (1 !=? 1)
      assume (id_1);
      else if (1) id_6 <= (id_5) >= id_1;
    repeat (-1) begin : LABEL_0
      id_11[-1] = id_7 == -1;
      id_12 = id_4;
    end
    #1 id_12 = "" < -1;
  join_none : SymbolIdentifier
endmodule
