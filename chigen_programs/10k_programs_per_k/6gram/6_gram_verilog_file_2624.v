// Seed: 3736877629
module module_0 (
    output tri id_0,
    output tri id_1,
    input wand id_2,
    input wor id_3,
    input tri id_4,
    output wor id_5,
    input uwire id_6,
    output supply0 id_7,
    input wand id_8,
    input supply1 id_9,
    output supply0 id_10,
    input wand id_11,
    output wand id_12,
    input wand id_13
);
  logic [7:0] id_15;
  wire id_16 = id_4;
  assign id_15[1] = id_8 <= 1 - 1'b0;
endmodule
module module_1 (
    input  uwire id_0,
    output uwire id_1,
    output logic id_2
);
  reg id_4, id_5;
  wire id_6;
  always disable id_7;
  always
  fork : SymbolIdentifier
    id_2 <= id_7;
    #1;
    $display(1);
  join
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0
  );
  assign modCall_1.SymbolIdentifier.type_6 = 0;
  assign id_2 = 1;
  wire id_8;
  wire id_9;
  assign id_1 = id_0;
  assign id_2 = 1;
  assign id_4 = id_7;
  wire id_10 = 1'b0 / 1;
endmodule
