// Seed: 854623952
module module_0 (
    output tri id_0,
    input tri0 id_1,
    input uwire id_2,
    input wor id_3,
    input tri0 id_4
    , id_13,
    input tri id_5,
    input wire id_6,
    input tri1 id_7,
    input uwire id_8,
    input supply1 id_9,
    output supply0 id_10,
    input supply1 id_11
);
  wire id_14;
  always @(posedge 1 or -1 or posedge -1'b0) force id_0 = id_7;
  assign module_1.id_2 = 0;
  assign id_13 = id_5;
endmodule
module module_1 (
    input supply1 id_0,
    input uwire id_1,
    input supply0 id_2,
    output wor id_3
);
  always force id_3 = -1'b0;
  not primCall (id_3, id_2);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_0,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_0,
      id_3,
      id_1
  );
endmodule
