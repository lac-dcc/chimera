// Seed: 2746460039
module module_0 (
    input wand  id_0,
    input uwire id_1,
    input tri   id_2,
    input uwire id_3,
    input wand  id_4,
    input tri1  id_5
);
  assign id_7 = id_1;
endmodule
module module_1 (
    input wire id_0,
    output supply0 id_1,
    input tri1 id_2
);
  tri0 id_4, id_5;
  assign id_1 = id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    input supply0 id_0,
    input wand id_1,
    output tri0 id_2,
    output uwire id_3,
    input tri id_4,
    output supply1 id_5,
    output logic id_6,
    input wire id_7,
    input supply0 id_8
);
  uwire id_10;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_8,
      id_4,
      id_0
  );
  assign modCall_1.type_8 = 0;
  task id_11;
    if (id_4) id_6 <= -1;
    id_3 = id_10 + -1;
  endtask
  assign id_5 = id_11;
endmodule
