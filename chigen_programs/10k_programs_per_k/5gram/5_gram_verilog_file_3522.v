// Seed: 4057864746
module module_0 (
    output supply0 id_0,
    input supply0 id_1,
    output supply1 id_2,
    input wand id_3
);
  wire id_5, id_6;
  generate
    for (id_7 = (id_6); -1 ==? ""; id_7 = id_3 + id_7) begin : LABEL_0
      logic ["" : 1] id_8;
    end
  endgenerate
endmodule
module module_1 (
    output uwire id_0,
    input supply1 id_1,
    output logic id_2,
    input uwire id_3,
    input tri0 id_4,
    output wor id_5
);
  module_0 modCall_1 (
      id_5,
      id_4,
      id_0,
      id_1
  );
  logic id_7;
  ;
  assign id_0 = -1;
  always @(posedge id_4 or negedge id_7) id_2 <= 1;
endmodule
