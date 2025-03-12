// Seed: 2932824348
module module_0 (
    input supply0 id_0,
    input tri0 id_1
);
  logic [7:0] id_3;
  parameter id_4 = 1;
  assign id_3 = 1'b0 ? id_1 : id_4;
  assign id_3 = id_3;
  wire id_5;
  assign id_3[-1] = -1'b0;
endmodule
module module_1 (
    input  tri0 id_0,
    input  wor  id_1,
    input  tri  id_2,
    input  tri  id_3,
    output tri1 id_4,
    output tri1 id_5
);
  wire id_7;
  xor primCall (id_5, id_1, id_2, id_0, id_3, id_7);
  module_0 modCall_1 (
      id_3,
      id_1
  );
  assign modCall_1.id_0 = 0;
  assign id_7 = {id_2{(id_2)}};
endmodule
