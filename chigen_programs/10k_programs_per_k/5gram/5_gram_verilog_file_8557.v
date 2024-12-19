// Seed: 2862280211
module module_0 (
    output wand id_0,
    output tri id_1,
    input tri1 id_2,
    input supply1 id_3,
    input wand id_4,
    input wire id_5
);
  always @(id_5 or posedge 1) begin : LABEL_0
    fork
      $display(id_4);
    join_any
  end
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    output supply1 id_1,
    output wand id_2,
    output tri id_3,
    input wire id_4
    , id_6
);
  wire id_7;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_0,
      id_4,
      id_0
  );
  wire id_8;
endmodule
