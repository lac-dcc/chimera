// Seed: 31103991
module module_0 (
    input  tri1 id_0,
    output wire id_1,
    input  tri0 id_2,
    output tri0 id_3,
    input  wor  id_4,
    output tri0 id_5,
    input  tri0 id_6
    , id_10,
    input  wire id_7
    , id_11,
    output wand id_8
);
  always @(posedge id_7 or posedge -1) begin : LABEL_0
    cover (id_4);
  end
endmodule
module module_1 (
    output supply1 id_0,
    input wire id_1
    , id_4,
    output supply0 id_2
);
  wire id_5;
  ;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
