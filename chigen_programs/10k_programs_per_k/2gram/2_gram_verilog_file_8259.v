// Seed: 2485077560
module module_0 (
    output tri0 id_0,
    output tri1 id_1,
    input uwire id_2,
    input supply1 id_3,
    output supply0 id_4,
    output uwire id_5
);
endmodule
module module_1 (
    output logic id_0,
    input wand id_1,
    input tri0 id_2,
    input tri0 id_3,
    input wand id_4,
    input tri1 id_5,
    input tri1 id_6,
    output wand id_7,
    input supply0 id_8,
    input wor id_9
);
  module_0 modCall_1 (
      id_7,
      id_7,
      id_5,
      id_9,
      id_7,
      id_7
  );
  always begin : LABEL_0
    if (1) begin : LABEL_1
      id_0 <= 1;
    end else
      @(posedge id_6)
      @(posedge id_2 or posedge 1)
      if (1 <-> 1) begin : LABEL_2
        fork
          do if (1) id_0 <= id_8; while (1);
        join : SymbolIdentifier
      end
  end
endmodule
