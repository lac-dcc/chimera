// Seed: 3540278275
module module_0 (
    input tri0  id_0,
    input uwire id_1,
    input tri0  id_2,
    input wor   id_3,
    input tri1  id_4,
    input tri1  id_5,
    input tri1  id_6
);
  assign id_8 = (id_3);
  assign module_2.id_3 = 0;
  assign module_1.type_8 = 0;
endmodule
program module_1 (
    input tri0 id_0,
    input supply1 id_1,
    output tri0 id_2,
    input uwire id_3,
    input supply0 id_4,
    output uwire id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_0,
      id_3,
      id_0,
      id_1
  );
endmodule
module module_2 (
    input  tri   id_0,
    output wor   id_1,
    input  wand  id_2,
    output tri   id_3,
    output logic id_4
);
  assign id_1 = id_2;
  task id_6;
    id_4 = -1'd0;
    #1;
  endtask
  supply1 id_7;
  always_ff id_3 = id_7;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_7,
      id_2,
      id_7,
      id_0,
      id_7
  );
  wire id_8;
  always id_4 <= #1 1 && id_2;
endmodule
