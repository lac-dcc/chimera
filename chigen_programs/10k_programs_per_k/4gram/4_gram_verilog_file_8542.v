// Seed: 1564598582
module module_0 (
    input  tri   id_0,
    input  uwire id_1,
    input  tri1  id_2,
    output wand  module_0,
    input  uwire id_4
);
  assign module_2.id_11 = 0;
  assign module_1.id_6  = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1,
    input tri1 id_2,
    input uwire id_3,
    input tri1 id_4,
    output wire id_5,
    output tri0 id_6,
    input wor id_7
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_5,
      id_3
  );
  assign id_5 = id_1;
  assign id_5 = 1;
endmodule
module module_2 (
    output supply0 id_0,
    input wire id_1,
    input tri id_2,
    input uwire id_3,
    output uwire id_4,
    input wire id_5,
    input uwire id_6,
    input wand id_7,
    output supply1 id_8,
    input tri0 id_9,
    input wire id_10,
    output tri id_11
);
  tri0 id_13;
  assign id_13 = "" ? id_9 : 1;
  xnor primCall (id_11, id_2, id_1, id_10, id_9, id_7, id_13, id_5, id_3, id_6);
  assign id_11 = 1'b0 ** 1'b0;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_1,
      id_4,
      id_2
  );
  assign id_8 = id_7 ? ~id_1 : 1'b0;
endmodule
