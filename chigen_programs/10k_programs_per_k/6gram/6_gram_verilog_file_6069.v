// Seed: 1921577152
module module_0 #(
    parameter id_13 = 32'd67,
    parameter id_14 = 32'd4
) (
    output wand id_0,
    output supply0 id_1,
    input tri0 id_2,
    output tri0 id_3,
    input wand id_4,
    input wand id_5,
    input tri1 id_6,
    input wor id_7,
    output wor id_8,
    output tri0 id_9,
    output supply0 id_10,
    input tri id_11
);
  assign id_1 = id_11 == 1;
  assign module_1.id_0 = 0;
  defparam id_13.id_14 = 1'b0;
endmodule
module module_1 (
    output wor id_0,
    input wor id_1,
    output uwire id_2,
    output tri id_3,
    input tri id_4,
    input supply0 id_5
);
  uwire id_7;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_5,
      id_2,
      id_5,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_3,
      id_4
  );
  wire id_8;
  assign id_3 = id_7 == 1;
  assign id_3 = 1 ? 1'b0 : 1 >= id_5 ? 1 : 1 - id_5;
  assign {1}  = id_5;
endmodule
