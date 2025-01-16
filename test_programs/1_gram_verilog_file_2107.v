// Seed: 3103420623
module module_0 (
    input tri id_0,
    input supply0 id_1,
    inout supply0 id_2,
    input supply1 id_3,
    input tri id_4,
    output uwire id_5,
    input uwire id_6,
    input tri1 id_7,
    input supply1 id_8,
    input tri0 id_9,
    input wand id_10,
    output tri id_11,
    input tri1 id_12
);
  uwire id_14, id_15;
  wire id_16, id_17 = 1;
  assign module_1.type_8 = 0;
  assign id_14 = {id_0{id_0}};
endmodule
module module_1 (
    output wire id_0,
    id_6,
    output uwire id_1,
    input supply1 id_2,
    id_7,
    input wand id_3,
    output tri id_4
);
  assign id_0 = id_6;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_7,
      id_2,
      id_6,
      id_0,
      id_6,
      id_6,
      id_2,
      id_6,
      id_3,
      id_4,
      id_7
  );
endmodule
