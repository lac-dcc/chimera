// Seed: 2768812449
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    output wire id_2,
    output wire id_3,
    input supply1 id_4,
    output tri1 id_5,
    input tri id_6,
    input wand id_7,
    input wand id_8,
    output tri0 id_9
);
  wire id_11;
  initial assume (id_6);
  assign module_1.id_3 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd84
) (
    input uwire id_0,
    output supply0 id_1,
    input uwire _id_2,
    output wire id_3,
    output wand id_4
);
  wire id_6;
  wire [1 : id_2] id_7;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_3,
      id_1,
      id_0,
      id_4,
      id_0,
      id_0,
      id_0,
      id_1
  );
  assign id_6 = id_0;
endmodule
