// Seed: 676001285
module module_0 (
    output uwire id_0,
    input  tri   id_1
    , id_8,
    output uwire id_2,
    input  wor   id_3,
    input  wor   id_4,
    output uwire id_5,
    input  uwire id_6
    , id_9
);
  reg id_10;
  assign id_2 = id_1;
  always @(1'b0) begin : LABEL_0
    id_10 <= id_8;
  end
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    output wor id_0,
    output tri0 id_1,
    input supply1 id_2,
    input supply1 id_3,
    input supply1 id_4,
    input supply0 id_5,
    input supply0 id_6,
    output supply1 id_7
);
  logic [7:0] id_9;
  assign id_7 = id_2;
  assign id_9[1 : 1] = 1'd0;
  assign id_7 = id_5;
  always @(negedge id_4) release id_0;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_1,
      id_3,
      id_5,
      id_1,
      id_6
  );
endmodule
