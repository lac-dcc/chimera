// Seed: 3168442152
module module_0 (
    input wor id_0,
    input supply0 id_1,
    output supply1 id_2,
    output wand id_3,
    input supply1 id_4,
    input supply0 id_5,
    input supply1 id_6,
    input wire id_7,
    input wand id_8,
    output logic id_9,
    output logic id_10,
    input logic id_11,
    input tri id_12,
    input uwire id_13,
    input uwire id_14,
    input wor id_15,
    output tri id_16
);
  assign id_2 = 1;
  always id_9 <= 1'h0;
  initial begin : LABEL_0
    @(negedge 1) id_3 = (1);
  end
  wor id_18;
  always id_10 <= 1'b0 ? id_11 : id_11;
  wire id_19;
  wire id_20;
  assign id_18 = id_0;
endmodule
module module_1 (
    input  wand  id_0,
    input  logic id_1,
    output logic id_2
);
  wire id_4;
  wor  id_5 = id_0;
  assign id_2 = id_1;
  wire id_6, id_7;
  always
    if (id_6)
      if (1)
        if (id_6) id_2 <= 1;
        else $display;
      else @(1 or 1 or id_7) if ((1)) id_5 = id_7;
  supply0 id_8, id_9, id_10;
  assign id_2 = 1 == id_9;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_5,
      id_7,
      id_5,
      id_6,
      id_7,
      id_5,
      id_0,
      id_2,
      id_2,
      id_1,
      id_6,
      id_0,
      id_5,
      id_7,
      id_6
  );
  assign modCall_1.type_21 = 0;
endmodule : SymbolIdentifier
