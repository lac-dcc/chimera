// Seed: 1558971611
module module_0 (
    output tri1 id_0,
    output supply1 id_1,
    output uwire id_2
);
  supply0 id_4;
  assign id_0 = id_4;
  assign id_1 = id_4;
endmodule
module module_1 (
    input tri0 id_0,
    input wand id_1,
    input wand id_2,
    inout tri0 id_3
);
  tri0 #1 id_5;
  supply1 id_6;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_3
  );
  assign modCall_1.type_1 = 0;
  initial begin : LABEL_0
    fork
      id_7;
      #1 id_5 = id_6 == id_2 ? 1 : id_1;
    join
    #1;
    id_7 = id_0;
    id_6 = 1 == id_5;
  end
endmodule
