// Seed: 3251094272
module module_0 (
    output tri0 id_0,
    input wor id_1,
    input wor id_2,
    output supply0 id_3,
    input tri id_4,
    input tri0 id_5,
    output supply0 id_6
);
endmodule
module module_1 (
    input supply0 id_0,
    output wire id_1,
    input tri0 id_2,
    input tri1 id_3,
    input wand id_4,
    input supply1 id_5,
    input tri1 id_6,
    input wor id_7
);
  wire id_9;
  module_0(
      id_1, id_3, id_4, id_1, id_5, id_3, id_1
  );
  wire id_10;
endmodule
module module_2 (
    input tri1 id_0,
    output tri0 id_1,
    input wand id_2,
    output supply0 id_3,
    input logic id_4,
    input supply1 id_5,
    output supply0 id_6,
    input tri id_7
);
  tri id_9;
  assign id_9 = id_7;
  assign {1, id_7} = 1 && 1;
  wire  id_10;
  logic id_11;
  module_0(
      id_9, id_2, id_0, id_9, id_9, id_5, id_3
  );
  assign id_9  = id_7 - id_7;
  assign id_11 = id_4;
  nor (id_3, id_0, id_11, id_4, id_2, id_9);
  always_ff
    if (1) id_11 <= 1;
    else assume (~id_4);
  supply0 id_12 = 1;
endmodule
