// Seed: 3494581563
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    input uwire id_2,
    input wand id_3
);
  wor  id_5 = id_0;
  wire id_6;
  module_2 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
endmodule
module module_1 (
    input  wor  id_0,
    input  tri1 id_1,
    output tri0 id_2,
    output wor  id_3,
    inout  wire id_4,
    input  tri0 id_5,
    output tri  id_6
);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_5,
      id_0
  );
  assign modCall_1.type_7 = 0;
  initial
  fork : SymbolIdentifier
  join_none
  assign id_3 = id_4;
  wire id_8;
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
    id_13,
    id_14,
    id_15,
    id_16
);
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = id_12 ~^ 1 ? !id_15 : 1 ? 1 : 1'b0;
  id_17 :
  assert property (@(posedge 1) id_3)
  else $display(id_10, id_15, 1);
  assign id_6 = (1'b0);
  assign module_0.id_5 = 0;
  assign id_6 = id_11 - ~id_15;
  assign id_8 = id_11;
  wire id_18;
endmodule
