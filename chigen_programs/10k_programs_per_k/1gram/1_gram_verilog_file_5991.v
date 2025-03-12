// Seed: 2045540907
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input wand id_2,
    output supply1 id_3
);
  assign id_3 = id_1 ? 1 - 1 : id_2;
  struct packed {logic id_5 = 1;} id_6;
  ;
  wire id_7;
endmodule
module module_1 #(
    parameter id_0 = 32'd99
) (
    input supply0 _id_0["" : id_0],
    input supply1 id_1,
    input wand id_2,
    output wire id_3,
    input tri0 id_4,
    input tri0 id_5,
    input wor id_6,
    input tri1 id_7
);
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_3
  );
endmodule
