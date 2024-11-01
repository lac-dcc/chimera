// Seed: 4113028768
module module_0 (
    output wire id_0,
    output supply1 id_1,
    input tri id_2,
    input wire id_3,
    input tri1 id_4,
    output supply1 id_5,
    output tri1 id_6,
    output tri id_7
);
  wire id_9;
  assign id_0 = 1;
  initial assume (~id_4);
endmodule
module module_1 (
    input  wand  id_0,
    output tri0  id_1,
    output tri0  id_2,
    output uwire id_3
);
  assign id_2 = id_0;
  module_0(
      id_2, id_2, id_0, id_0, id_0, id_3, id_2, id_1
  );
endmodule
module module_2 (
    input tri0 id_0,
    output supply1 id_1,
    input supply0 id_2,
    input logic id_3,
    input tri id_4,
    input logic id_5,
    input tri1 id_6,
    output tri1 id_7,
    input supply0 id_8
);
  wire id_10;
  assign id_7  = 1;
  assign id_10 = !id_6;
  reg id_11;
  always id_11 = @(id_3) id_5;
  module_0(
      id_7, id_7, id_6, id_8, id_6, id_1, id_7, id_7
  );
  always @("" or negedge 1) id_11 <= 1;
endmodule
