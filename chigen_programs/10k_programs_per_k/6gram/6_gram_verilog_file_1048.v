// Seed: 2645472255
module module_0 (
    input supply0 id_0,
    output tri0 id_1,
    input supply0 id_2,
    output tri id_3,
    output tri id_4,
    output tri1 id_5
);
  logic id_7;
  wire  id_8;
  ;
  logic [-1 : ""] id_9;
  assign id_8 = id_0;
endmodule
module module_1 (
    output uwire id_0,
    output tri1 id_1,
    input wire id_2,
    output supply0 id_3,
    output uwire id_4,
    output wand id_5,
    input supply1 id_6,
    output tri1 id_7
);
  logic id_9;
  ;
  module_0 modCall_1 (
      id_6,
      id_1,
      id_6,
      id_0,
      id_5,
      id_3
  );
  assign modCall_1.id_0 = 0;
  always @(posedge -1 or posedge id_6 & -1) begin : LABEL_0
    release id_7;
  end
endmodule
