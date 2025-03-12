// Seed: 1183769187
module module_0 (
    input tri id_0,
    input supply0 id_1,
    input tri1 id_2,
    input tri1 id_3
);
  localparam id_5 = 1;
  logic id_6, id_7;
  always_comb @(posedge {id_2,
    1,
    id_6,
    1,
    1,
    -1
  })
  begin : LABEL_0
    id_7 <= 1'b0 !== 1;
  end
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1,
    input supply0 id_2,
    output wor id_3,
    input tri1 id_4,
    output tri id_5,
    output wand id_6
);
  logic id_8;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_4,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
