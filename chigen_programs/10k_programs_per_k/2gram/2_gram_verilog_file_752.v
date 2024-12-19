// Seed: 3932448406
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    output supply1 id_2,
    output tri0 id_3,
    input wire id_4
    , id_6
);
  assign id_2 = id_6.id_6;
endmodule
module module_1 (
    input tri id_0,
    output tri0 id_1,
    input wor id_2,
    output wand id_3,
    input supply1 id_4,
    input supply1 id_5
);
  wire id_7 = 1 & 1'd0;
  xor primCall (id_3, id_4, id_9, id_7, id_0, id_8, id_2);
  if (id_5) begin : LABEL_0
    always id_7 = id_7;
    assign id_3 = 1'b0;
  end else tri id_8;
  id_9 :
  assert property (@({1, 1, id_5 <-> id_5, 1 + 1, id_8 - id_0}) id_7)
  else;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_3,
      id_5
  );
  assign modCall_1.id_2 = 0;
  assign id_7 = 1;
  wire id_10;
endmodule
