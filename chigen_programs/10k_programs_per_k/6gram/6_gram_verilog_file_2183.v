// Seed: 4028676786
module module_0 (
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
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  initial
  fork : SymbolIdentifier
    id_9(id_7, id_1);
    #1 id_7 = 1;
    $display(id_1, 1, id_6 == 1);
  join : SymbolIdentifier
  uwire id_10, id_11;
  uwire id_12;
  wire  id_13;
  always @(posedge {id_4{id_4 - id_10}} or posedge id_12) #1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_2,
      id_2
  );
  assign modCall_1.id_12 = 0;
  always @(negedge 1) begin : LABEL_0
    id_3 <= id_3;
  end
endmodule
