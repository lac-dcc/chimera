// Seed: 415300162
module module_0 (
    output tri0  id_0
    , id_5,
    input  wor   id_1,
    input  tri   id_2,
    output uwire id_3
);
  assign id_0 = id_1 && {id_1{1}};
endmodule
module module_1 (
    input tri0 id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri id_3,
    input supply0 id_4,
    input tri1 id_5,
    output wire id_6,
    output tri id_7,
    input tri0 id_8
);
  always @(negedge id_3);
  xnor primCall (id_7, id_4, id_5);
  module_0 modCall_1 (
      id_7,
      id_1,
      id_1,
      id_7
  );
  assign modCall_1.type_6 = 0;
endmodule
