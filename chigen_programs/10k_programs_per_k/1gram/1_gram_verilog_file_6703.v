// Seed: 1659132829
module module_0 (
    input tri0  id_0,
    input uwire id_1,
    input tri   id_2
);
  bit id_4;
  assign module_2.id_2 = 0;
  wire id_5;
  task id_6;
    id_4 <= id_1 ? (id_5) : 1;
  endtask
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output logic id_0,
    output logic id_1,
    input  wand  id_2,
    input  tri0  id_3,
    input  wand  id_4
);
  always
    if (-1) id_0 <= (id_4) | id_2;
    else id_1 <= -1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4
  );
  assign id_1 = id_3;
endmodule
module module_2 (
    output tri1 id_0,
    output wand id_1,
    input  tri0 id_2
);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2
  );
endmodule
