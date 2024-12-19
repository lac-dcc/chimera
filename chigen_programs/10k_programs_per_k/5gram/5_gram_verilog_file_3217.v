// Seed: 3050777230
module module_0 (
    output tri0  id_0,
    output wor   id_1,
    input  uwire id_2,
    output wand  id_3,
    output wand  id_4,
    input  uwire id_5,
    output wire  id_6
);
  wire id_8;
  wire id_9;
  tri  id_10 = 1'b0;
  assign module_1.id_1 = 0;
  wire id_11;
endmodule
module module_1 (
    input wand id_0,
    output supply0 id_1,
    input supply1 id_2,
    output supply0 id_3,
    input supply1 id_4,
    output uwire id_5,
    input supply0 id_6
    , id_9,
    input wire id_7
);
  reg id_10;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_1,
      id_5,
      id_0,
      id_1
  );
  always @(id_9++, id_0) id_9 <= 1'd0;
  always @(posedge 1) begin : LABEL_0
    id_10 <= 1;
  end
endmodule
