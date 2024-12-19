// Seed: 3205887784
module module_0 ();
  wire id_2;
  wire id_3;
  integer id_4;
  assign module_2.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  logic [7:0] id_9;
  module_0 modCall_1 ();
  assign id_9[1] = id_2;
endmodule
module module_2 (
    output supply1 id_0,
    input supply0 id_1,
    input wor id_2,
    input wor id_3,
    output supply0 id_4,
    output uwire id_5,
    input wor id_6,
    output supply0 id_7,
    input wor id_8,
    input wand id_9,
    input wor id_10,
    output logic id_11,
    input supply0 id_12,
    output wor id_13
);
  always
  fork : SymbolIdentifier
    id_15(1'b0);
    #1;
    repeat (id_8) begin : LABEL_0
      id_11 <= id_2 !=? 1;
      $display(id_12);
      id_5 = id_1;
    end
  join
  module_0 modCall_1 ();
endmodule
