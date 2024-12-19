// Seed: 3677544952
module module_0 (
    input uwire id_0,
    output supply0 id_1,
    input uwire id_2,
    input tri0 id_3,
    output supply1 id_4,
    input tri0 id_5,
    input supply1 id_6,
    input tri id_7,
    input supply1 id_8,
    input supply1 id_9,
    input supply1 id_10,
    output tri1 id_11,
    output tri id_12,
    output uwire id_13
);
  assign module_1.id_11 = 0;
  assign id_1 = {id_5{1}} + id_5;
endmodule
module module_1 (
    output wire  id_0,
    output tri0  id_1,
    input  wire  id_2,
    output tri0  id_3,
    input  tri1  id_4,
    input  wor   id_5,
    output tri0  id_6,
    input  uwire id_7,
    output wor   id_8
);
  wire id_10;
  wire id_11;
  assign id_0 = (id_11);
  module_0 modCall_1 (
      id_11,
      id_6,
      id_11,
      id_11,
      id_6,
      id_11,
      id_7,
      id_7,
      id_2,
      id_5,
      id_2,
      id_8,
      id_8,
      id_0
  );
endmodule
