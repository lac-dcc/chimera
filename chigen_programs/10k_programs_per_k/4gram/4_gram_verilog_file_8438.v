// Seed: 3787605216
module module_0 (
    input wand id_0,
    output wire id_1,
    input wand id_2,
    input supply1 id_3,
    input wand id_4,
    input tri id_5,
    output tri1 id_6,
    output wor id_7
);
  wire id_9;
  nor primCall (id_1, id_2, id_4, id_5);
  module_2 modCall_1 (
      id_9,
      id_9,
      id_9,
      id_9
  );
endmodule
module module_1 (
    input tri id_0,
    output uwire id_1,
    input uwire id_2,
    output supply1 id_3,
    input tri id_4
);
  assign id_1 = 1 >= (-1);
  module_0 modCall_1 (
      id_0,
      id_3,
      id_4,
      id_4,
      id_0,
      id_2,
      id_3,
      id_1
  );
  assign modCall_1.id_7 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout tri1 id_3;
  input wire id_2;
  input wire id_1;
  assign module_0.id_6 = 0;
  assign (strong1, strong0) id_3 = id_1 ? id_2 : 1;
endmodule
