// Seed: 4043043213
module module_0 (
    input wor id_0,
    output supply1 id_1,
    input uwire id_2,
    output supply0 id_3,
    input tri0 id_4,
    input wor id_5,
    output logic id_6
);
  always while (1) id_6 <= 1;
  assign module_1.id_2 = 0;
endmodule
program module_1 (
    output wand id_0,
    input uwire id_1,
    input wire id_2,
    input supply0 id_3,
    output wor id_4,
    output logic id_5,
    input tri0 id_6,
    input logic id_7,
    output uwire id_8,
    input supply0 id_9,
    input supply1 id_10
);
  always @(posedge 1 or id_1)
    if (id_7) begin : LABEL_0
      if (id_1 == 1'b0) begin : LABEL_0
        if (id_10) $display(id_7);
      end else begin : LABEL_0
        id_5 <= 1;
      end
    end else for (id_0 = 1'h0; 1; id_8 += id_6 == 1 - 1) #1 force id_0 = id_7;
  module_0 modCall_1 (
      id_2,
      id_8,
      id_1,
      id_8,
      id_9,
      id_1,
      id_5
  );
endprogram
