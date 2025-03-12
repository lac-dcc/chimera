// Seed: 728403257
module module_0 (
    input tri1 id_0,
    output uwire id_1,
    input uwire id_2[-1 : 1],
    output wor id_3
    , id_7,
    output supply0 id_4,
    input tri1 id_5
);
  assign id_4 = id_7;
  always if (1);
  wire id_8;
  assign module_1.id_4 = 0;
  assign id_1 = id_7;
  wire  id_9;
  logic id_10;
  assign id_7 = -1;
  wire id_11, id_12, id_13;
endmodule
module module_1 (
    input  wor   id_0,
    input  tri   id_1,
    output uwire id_2
);
  assign id_2 = {id_1, id_0 & -1, (-1 == ""), -1} - "";
  reg id_4;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_0,
      id_2,
      id_2,
      id_1
  );
  wire id_5;
  always @(posedge id_1) id_4 = {-1{id_4}};
endmodule
