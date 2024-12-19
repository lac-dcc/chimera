// Seed: 4069053061
module module_0 (
    output tri0  id_0,
    input  tri0  id_1,
    output tri1  id_2,
    input  tri0  id_3,
    input  tri   id_4,
    input  tri   id_5,
    input  uwire id_6
    , id_8, id_9
);
  always @(id_5) begin : LABEL_0
    id_10.id_11(1, 1, id_9 == 1);
    $display(id_3, id_1 * (1));
    id_9 <= 1;
  end
endmodule
module module_1 (
    input  tri  id_0,
    input  tri1 id_1,
    output wand id_2
);
  supply0 id_4, id_5;
  wand id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_1,
      id_6
  );
  assign modCall_1.type_0 = 0;
  assign id_5 = id_4;
  function automatic integer id_7(input id_8, input id_9);
    return id_6;
  endfunction
  assign id_8 = 1'b0 ? id_1 : id_8;
  assign id_9 = id_0;
  wire id_10;
  assign id_5 = (1);
endmodule
