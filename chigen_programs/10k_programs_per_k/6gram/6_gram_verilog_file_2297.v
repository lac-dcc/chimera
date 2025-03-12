// Seed: 1424213132
module module_0 (
    output wand id_0,
    input tri0 id_1,
    input supply0 id_2
    , id_11,
    input tri1 id_3,
    input wand id_4,
    input wor id_5,
    output tri1 id_6,
    input wand id_7,
    input tri0 id_8,
    output uwire id_9
);
endmodule
module module_1 #(
    parameter id_1 = 32'd11
) (
    output uwire id_0
    , id_7,
    input  wor   _id_1,
    input  uwire id_2,
    input  uwire id_3,
    output wor   id_4,
    output uwire id_5
);
  logic id_8;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_3,
      id_3,
      id_3,
      id_5,
      id_2,
      id_3,
      id_5
  );
  assign modCall_1.id_9 = 0;
  always @(posedge id_8[1 :-1] == 1'h0 - -1'b0) begin : LABEL_0
    id_7[1==1&id_1 :-1] <= id_7;
  end
endmodule
