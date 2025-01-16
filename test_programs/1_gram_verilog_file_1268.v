// Seed: 4196594804
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign module_2.type_21 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  wire id_3, id_4;
  nor primCall (id_1, id_2, id_3);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4
  );
endmodule
module module_2 (
    output wire id_0,
    input wire id_1,
    output tri1 id_2,
    output supply0 id_3,
    input supply1 id_4,
    input wire id_5,
    output wire id_6,
    output wand id_7,
    output tri0 id_8,
    input tri id_9,
    input supply0 id_10,
    output wire id_11,
    input tri1 id_12,
    input tri0 id_13,
    id_16,
    input wire id_14
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_16,
      id_16,
      id_16
  );
  assign id_0 = id_14;
  assign #1 id_2 = (-1);
  tri0 id_17;
  localparam id_18 = 1;
  always @(posedge id_16, -1 or posedge 1'h0 or id_17) if (id_12) id_7 = id_9;
  assign id_2 = id_18;
  assign id_6 = (id_10);
endmodule : SymbolIdentifier
