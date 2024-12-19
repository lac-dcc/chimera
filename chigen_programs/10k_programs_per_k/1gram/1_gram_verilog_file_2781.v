// Seed: 2128954655
module module_0 (
    input tri0 id_0,
    output wire id_1,
    input wire id_2,
    input supply0 id_3,
    output tri1 id_4,
    input wand id_5,
    input uwire id_6
);
endmodule
module module_1 (
    output supply0 id_0,
    input tri id_1,
    input supply0 id_2,
    input tri id_3,
    input wand id_4,
    input tri1 id_5
);
  tri0 id_7 = 1 != id_4;
  wire id_8;
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_1,
      id_3,
      id_0,
      id_3,
      id_5
  );
  assign modCall_1.id_2 = 0;
  wire id_10 = !id_2;
  if (1) wire id_11;
  else begin : LABEL_0
    tri0 id_12, id_13, id_14, id_15;
    assign id_14 = 1 ? {1, 1} : 1;
    id_16(
        id_14, 1'b0, id_15
    );
  end
  assign id_10 = id_8;
endmodule
