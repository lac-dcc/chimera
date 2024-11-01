// Seed: 4116649006
module module_0 (
    input supply0 id_0,
    input wor id_1,
    input tri1 id_2,
    input supply1 id_3,
    output wire id_4,
    input supply1 id_5
);
  assign id_4 = id_5;
  wire id_7;
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    input wor id_0,
    input tri1 id_1,
    input tri1 id_2,
    output supply0 id_3,
    output supply0 id_4,
    output supply0 id_5,
    input wor id_6,
    input wand id_7,
    output tri0 id_8
);
  assign id_5 = id_6;
  assign id_3 = id_2;
  module_0(
      id_0, id_1, id_1, id_0, id_5, id_1
  );
  wand id_10 = ~id_2 - id_0;
endmodule
