// Seed: 2503184819
module module_0 (
    output wand  id_0,
    output wand  id_1,
    output uwire id_2,
    output uwire id_3,
    input  tri0  id_4,
    output wor   id_5
);
  initial
  fork : SymbolIdentifier
  join_any : SymbolIdentifier
endmodule
module module_1 (
    input  tri1 id_0,
    output tri0 id_1
);
  assign id_1 = 1'b0;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  input wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_14, id_15;
  wire id_16;
  assign module_3.type_5 = 0;
endmodule
module module_3 (
    input supply1 id_0,
    input wor id_1,
    input tri0 id_2,
    input supply1 id_3,
    input supply0 id_4,
    output supply0 id_5,
    output uwire id_6,
    output tri id_7,
    input logic id_8,
    output logic id_9
);
  logic id_11 = id_8;
  wire  id_12;
  module_2 modCall_1 (
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12,
      id_12
  );
  always @(posedge 1'd0 or posedge id_3) begin : LABEL_0
    id_9 <= id_11;
  end
endmodule
