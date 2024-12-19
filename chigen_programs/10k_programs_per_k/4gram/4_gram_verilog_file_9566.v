// Seed: 4026995583
module module_0 (
    input  wand id_0,
    output wire id_1,
    output wor  id_2
);
  supply0 id_4 = 1;
  assign id_1 = id_4 ? id_0 : id_0 ? 1 : id_0 ? id_4 : 1'b0 ? 1 : 1'b0;
  wand id_5 = 1;
  wire id_6;
  assign id_5 = id_4;
  assign module_2.type_2 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    output tri id_1,
    input supply1 id_2
);
  generate
    assign id_1 = 1'b0;
  endgenerate
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.type_0 = 0;
endmodule
module module_2 (
    output wire id_0,
    output tri id_1,
    input wor id_2,
    output wire id_3,
    output supply0 id_4,
    input tri id_5,
    output supply1 id_6
);
  tri1 id_8;
  nor primCall (id_1, id_5, id_8, id_9, id_2);
  wire id_9;
  module_0 modCall_1 (
      id_8,
      id_1,
      id_1
  );
  assign id_6 = id_8;
endmodule
