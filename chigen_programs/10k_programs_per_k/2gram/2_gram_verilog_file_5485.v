// Seed: 2196381672
module module_0 (
    input supply1 id_0
);
  wire id_2;
endmodule
module module_1 (
    input  uwire id_0,
    input  wand  id_1,
    input  tri0  id_2,
    output uwire id_3,
    input  wor   id_4
);
  wire id_6;
  module_0(
      id_2
  );
endmodule
module module_2 (
    input uwire id_0,
    input wand id_1,
    input supply0 id_2,
    output tri1 id_3,
    output wire id_4
);
  wire id_6;
  module_0(
      id_2
  );
endmodule
module module_3 (
    output tri id_0,
    output supply0 id_1,
    output uwire id_2,
    output logic id_3,
    input logic id_4,
    input supply0 id_5,
    input supply1 id_6,
    output supply1 id_7,
    input tri0 id_8
);
  assign id_7 = 1 & 1;
  logic id_10;
  module_0(
      id_6
  );
  always @(1 or id_8)
    if (~1'd0) id_10 <= id_4;
    else @(posedge id_5) id_3 = id_10;
  xor (id_1, id_5, id_8, id_4);
endmodule
