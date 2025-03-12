// Seed: 3419851078
module module_0 (
    input tri0 id_0,
    output tri1 id_1,
    input wand id_2,
    input wire id_3,
    input supply0 id_4,
    input uwire id_5,
    input supply1 id_6,
    input wire id_7,
    output supply0 id_8,
    input tri id_9,
    output supply0 id_10
);
endmodule
module module_1 (
    input uwire id_0,
    inout supply1 id_1,
    inout tri0 id_2
);
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_0,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1
  );
  assign modCall_1.id_9 = 0;
endmodule
module module_2 #(
    parameter id_8 = 32'd12
) (
    input supply0 id_0,
    inout tri1 id_1
    , id_12, id_13,
    input uwire id_2,
    output tri1 id_3,
    input wand id_4,
    output uwire id_5,
    input supply1 id_6,
    input tri1 id_7,
    input supply0 _id_8,
    output uwire id_9,
    output uwire id_10
);
  wire [-1 : id_8] id_14;
  module_0 modCall_1 (
      id_0,
      id_10,
      id_7,
      id_4,
      id_7,
      id_7,
      id_6,
      id_6,
      id_10,
      id_7,
      id_1
  );
endmodule
