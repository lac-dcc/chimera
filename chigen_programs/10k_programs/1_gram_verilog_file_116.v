// Seed: 2824414485
module module_0 (
    output wire id_0,
    input supply1 id_1,
    input tri1 id_2,
    input wire id_3
);
endmodule
module module_1 (
    output uwire id_0,
    input tri1 id_1,
    input wand id_2,
    input tri0 id_3,
    input tri1 id_4,
    output wor id_5,
    output tri id_6,
    input tri1 id_7,
    output supply1 id_8
);
  wire id_10;
  xnor (id_8, id_1, id_4, id_2, id_3, id_10, id_7);
  assign id_8 = id_3;
  module_0(
      id_6, id_7, id_4, id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = 1;
  wire id_4;
  id_5(
      1
  );
endmodule
module module_3 (
    output logic id_0,
    input  logic id_1,
    output logic id_2
);
  assign id_2 = id_1;
  wire id_4;
  always begin
    id_2 <= id_1;
    id_0 <= (1 ^ id_4) && 1'b0;
  end
  wire id_5;
  module_2(
      id_4, id_4, id_5
  );
endmodule
