// Seed: 1396164462
module module_0 (
    output wire id_0,
    output tri id_1,
    input supply0 id_2,
    input uwire id_3,
    output wor id_4,
    output tri id_5,
    input tri id_6
);
  assign id_5 = -1;
  wire id_8;
  id_9 :
  assert property (@(posedge id_8) 1)
  else $unsigned(39);
  ;
  assign id_5 = id_3 | {id_9{id_9 | id_9}} ^ -1;
  wire id_10;
endmodule
module module_1 (
    input  wor   id_0,
    input  uwire id_1,
    input  wor   id_2,
    output uwire id_3,
    output tri0  id_4,
    input  wor   id_5,
    input  wire  id_6
);
  wire id_8;
  wire [1 : ""] id_9;
  nand primCall (id_3, id_2, id_9, id_1);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_0,
      id_3,
      id_3,
      id_6
  );
  assign modCall_1.id_4 = 0;
endmodule
