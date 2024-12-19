// Seed: 1187754837
module module_0 (
    input wire id_0,
    input wor id_1,
    input tri id_2,
    input wor id_3,
    input wand id_4,
    input supply1 id_5,
    input tri0 id_6,
    output tri0 id_7
);
  assign id_7 = 1;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input  wand id_0,
    input  tri0 id_1,
    input  tri0 id_2,
    output tri1 id_3,
    output wand id_4,
    input  tri0 id_5,
    input  wire id_6,
    input  tri  id_7
);
  always @(posedge 1) begin : LABEL_0
    assume (id_5) $display("", 1'b0);
  end
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_6,
      id_6,
      id_5,
      id_3
  );
endmodule
