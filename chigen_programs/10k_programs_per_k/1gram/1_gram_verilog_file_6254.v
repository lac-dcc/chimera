// Seed: 1240378117
module module_0 (
    input  supply0 id_0[1 : -1 'b0],
    output supply1 id_1,
    input  supply1 id_2
);
  id_4 :
  assert property (@(*) 1 - id_0) begin : LABEL_0
    id_4 = 1'b0;
    @(*);
  end
  assign id_1 = id_0;
  logic id_5;
endmodule
module module_1 (
    output uwire id_0,
    input  tri0  id_1,
    output wor   id_2,
    input  tri   id_3,
    output wand  id_4,
    output tri0  id_5
);
  assign id_2 = 1 + 1'd0;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_3
  );
  assign modCall_1.id_0 = 0;
  assign id_4 = id_3;
  assign id_4 = 1;
  notif1 primCall (id_2, id_3, id_1);
endmodule
