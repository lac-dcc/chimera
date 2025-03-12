// Seed: 4081370940
module module_0 (
    input  tri1  id_0,
    output tri   id_1,
    input  tri   id_2,
    output uwire id_3,
    input  tri   id_4,
    input  tri   id_5,
    input  wire  id_6,
    input  wire  id_7
);
  wire id_9;
  assign module_1.id_4 = 0;
  wire id_10;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    input supply0 id_2,
    input supply1 id_3,
    output tri id_4,
    output uwire id_5,
    inout supply1 id_6,
    output tri1 id_7
);
  wire id_9;
  nor primCall (id_6, id_0, id_9, id_3, id_2);
  module_0 modCall_1 (
      id_3,
      id_5,
      id_1,
      id_7,
      id_3,
      id_3,
      id_6,
      id_1
  );
  initial begin : LABEL_0
    return id_2 + -1;
  end
endmodule
