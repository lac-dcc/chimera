// Seed: 3964905093
module module_0 (
    input uwire id_0,
    input wor id_1,
    output tri0 id_2,
    input tri1 id_3,
    output wor id_4,
    output supply0 id_5
);
  wire id_7;
endmodule
module module_1 (
    input tri id_0,
    input wand id_1,
    input supply1 id_2,
    input tri1 id_3,
    input wor id_4,
    input tri id_5,
    input supply1 id_6,
    output supply0 id_7
);
  assign id_7 = id_4;
  wand id_9 = id_0;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_7,
      id_9,
      id_9,
      id_9
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 #(
    parameter id_8 = 32'd53,
    parameter id_9 = 32'd43
) (
    output tri0  id_0,
    input  wand  id_1,
    input  wand  id_2,
    input  tri0  id_3,
    input  tri1  id_4,
    output logic id_5,
    input  wire  id_6
);
  defparam id_8.id_9 = id_8;
  xor primCall (id_5, id_9, id_1, id_4, id_6, id_2, id_8);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_3,
      id_0,
      id_0
  );
  assign modCall_1.id_3 = 0;
  initial begin : LABEL_0
    id_5 <= 1;
  end
endmodule
