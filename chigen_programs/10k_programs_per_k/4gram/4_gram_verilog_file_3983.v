// Seed: 1236202427
module module_0 (
    output wor id_0,
    input wor id_1,
    input supply1 id_2,
    input tri0 id_3,
    input tri1 id_4,
    input supply0 id_5,
    output supply0 id_6,
    output tri id_7,
    output supply0 id_8,
    input wor id_9,
    input wor id_10,
    output wire id_11
);
  tri0 id_13;
  assign id_13 = 1;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output wor   id_0,
    output tri0  id_1,
    output tri0  id_2,
    input  uwire id_3,
    input  tri1  id_4,
    input  logic id_5
);
  function int id_7(input reg id_8);
    if (id_5) begin : LABEL_0
      id_7 = #({{id_5{id_5 == 1 & 1}}, 1, id_7}) 1;
    end
  endfunction
  xor primCall (id_0, id_7, id_4, id_3);
  module_0 modCall_1 (
      id_2,
      id_4,
      id_4,
      id_3,
      id_3,
      id_4,
      id_1,
      id_2,
      id_0,
      id_3,
      id_3,
      id_0
  );
  assign id_8 = 1 ? -id_3 : (1'b0);
endmodule
