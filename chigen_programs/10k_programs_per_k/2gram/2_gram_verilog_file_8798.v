// Seed: 4143006162
module module_0 (
    input  tri1  id_0,
    input  uwire id_1,
    output tri0  id_2,
    output wire  id_3,
    output wire  id_4
);
  assign id_4 = {id_0{1}};
  wire id_6;
  assign module_1.id_4 = 0;
  wand id_7 = id_1;
  initial id_2 = 1;
  wire id_8;
endmodule
module module_1 (
    input uwire id_0,
    inout wire id_1,
    input supply1 id_2,
    output uwire id_3,
    output tri id_4
);
  assign id_1 = 1'b0;
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_1,
      id_1
  );
endmodule
