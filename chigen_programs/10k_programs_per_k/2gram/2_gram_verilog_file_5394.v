// Seed: 1200999377
module module_0 (
    input  tri1  id_0,
    input  tri0  id_1,
    output uwire id_2,
    output tri   id_3,
    output tri1  id_4,
    output tri0  id_5,
    input  wor   id_6,
    input  wor   id_7,
    input  wor   id_8
    , id_11,
    input  tri1  id_9
);
  assign module_1.type_1 = 0;
  wire id_12;
endmodule
module module_1 (
    input uwire id_0,
    input tri1 id_1,
    output supply1 id_2
);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_0,
      id_1,
      id_1
  );
  always_ff begin : LABEL_0
    wait (id_1 == 1'b0);
  end
  always
  fork
    id_2 = 1'b0;
  join_any
endmodule
