// Seed: 380391025
module module_0 (
    input  uwire id_0,
    input  wor   id_1,
    input  tri0  id_2,
    output tri1  id_3,
    input  wand  id_4
);
  always @(posedge id_1) begin : LABEL_0
    id_3 = 1;
  end
  always @(negedge id_2);
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    input tri0 id_2,
    input tri1 id_3,
    input wire id_4,
    output tri1 id_5,
    input tri0 id_6
);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_6,
      id_5,
      id_3
  );
  assign id_5 = 1;
  assign id_5 = 1;
endmodule
