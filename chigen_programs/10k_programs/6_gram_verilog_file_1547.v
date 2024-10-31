// Seed: 4173522032
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    input wand id_2,
    output tri1 id_3
);
  assign id_3 = 1;
endmodule
module module_1 (
    input tri id_0,
    output uwire id_1,
    output supply1 id_2
);
  assign id_1 = {id_0{id_0}};
  wire id_4 = !id_0, id_5;
  module_0(
      id_0, id_0, id_0, id_1
  );
  wire id_6;
  wire id_7 = id_4;
endmodule
module module_2 (
    input  wor   id_0,
    input  tri1  id_1,
    input  uwire id_2,
    output logic id_3
);
  wor  id_5 = id_0;
  reg  id_6;
  wire id_7;
  module_0(
      id_0, id_1, id_5, id_5
  );
  wire id_8;
  initial id_3 = #1 id_6;
endmodule
