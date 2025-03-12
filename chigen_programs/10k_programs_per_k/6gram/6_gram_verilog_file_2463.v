// Seed: 1768288360
module module_0 (
    input wire id_0,
    input supply0 id_1,
    input tri0 id_2,
    input wor id_3,
    output tri0 id_4,
    input tri id_5,
    input tri id_6,
    input supply0 id_7,
    input tri0 id_8
);
  always @(posedge -1 - 1'b0 or posedge id_8) force id_4 = id_2;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input wire id_0,
    output wand id_1,
    output tri id_2,
    input wire id_3,
    input wand id_4,
    input supply1 id_5,
    output supply0 id_6,
    output logic id_7,
    output supply0 id_8
);
  always
  fork
    logic id_10;
    begin : LABEL_0
      $unsigned(0);
      ;
      id_7 <= -1;
    end
    #1;
  join : SymbolIdentifier
  module_0 modCall_1 (
      id_5,
      id_5,
      id_4,
      id_4,
      id_8,
      id_5,
      id_0,
      id_4,
      id_0
  );
endmodule
