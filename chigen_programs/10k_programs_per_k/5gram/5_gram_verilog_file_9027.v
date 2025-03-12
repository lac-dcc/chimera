// Seed: 1134441988
module module_0 #(
    parameter id_7 = 32'd90
) (
    input wor id_0,
    input tri1 id_1,
    input supply0 id_2,
    input supply0 id_3,
    input supply0 id_4,
    input wor id_5
);
  wire _id_7;
  wire [-1 : id_7] id_8;
  wire id_9;
  ;
  wire id_10;
endmodule
module module_1 #(
    parameter id_8 = 32'd31
) (
    input supply0 id_0,
    output tri0 id_1,
    input tri1 id_2,
    output wire id_3,
    input tri1 id_4,
    output wire id_5,
    inout wand id_6,
    input supply0 id_7,
    input uwire _id_8,
    output wire id_9
);
  wire [1 : id_8] id_11;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_4,
      id_6,
      id_4,
      id_0
  );
  assign modCall_1.id_4 = 0;
  assign id_6 = -1;
endmodule
