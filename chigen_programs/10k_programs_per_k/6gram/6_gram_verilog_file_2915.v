// Seed: 360225353
module module_0 (
    input supply1 id_0,
    input wand id_1,
    output wor id_2,
    input supply0 id_3,
    input tri0 id_4,
    input supply1 id_5,
    input wire id_6
    , id_12,
    input tri1 id_7,
    output logic id_8,
    input tri id_9,
    output tri0 id_10
);
  wire id_13;
  assign module_1.id_3 = 0;
  always id_8 = @(1) 1 < -1 - id_6;
  assign id_13 = id_4;
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    input supply1 id_2,
    output tri id_3,
    output supply0 id_4,
    input uwire id_5,
    output tri0 id_6,
    output tri0 id_7,
    input uwire id_8,
    input supply0 id_9,
    output uwire id_10,
    output logic id_11,
    input supply1 id_12,
    input supply1 id_13,
    output supply1 id_14,
    input tri1 id_15
);
  always
  fork
    #(id_5);
    begin : LABEL_0
      wait (1);
      id_11 <= #1 id_2;
    end
  join : SymbolIdentifier
  nor primCall (id_3, id_15, id_2, id_8, id_0, id_5, id_13, id_9);
  module_0 modCall_1 (
      id_15,
      id_5,
      id_14,
      id_5,
      id_5,
      id_2,
      id_8,
      id_12,
      id_11,
      id_15,
      id_3
  );
endmodule
