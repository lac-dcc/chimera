// Seed: 3902275960
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout supply0 id_3;
  input logic [7:0] id_2;
  output wire id_1;
  assign id_3 = id_2 == id_2[1'b0];
  logic [1 : -1] id_4 = -1 + id_3;
endmodule
module module_1 #(
    parameter id_0 = 32'd99
) (
    input tri _id_0,
    input supply0 id_1,
    input tri1 id_2
);
  logic [7:0][id_0 : id_0] id_4;
  parameter integer id_5 = 1;
  assign id_4[id_0] = id_4[id_0==~id_0];
  module_0 modCall_1 (
      id_5,
      id_4,
      id_5
  );
  assign modCall_1.id_4 = 0;
endmodule
