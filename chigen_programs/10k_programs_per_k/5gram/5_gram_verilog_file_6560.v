// Seed: 4026709274
module module_0 (
    input tri0  id_0,
    input uwire id_1
);
  assign module_1.type_6 = 0;
endmodule
module module_1 (
    output tri id_0,
    output supply1 id_1,
    input supply0 id_2,
    input supply1 id_3,
    input wand id_4
);
  wire id_6;
  wor  id_7;
  generate
    for (id_8 = id_7; id_3 == id_2 > 1; id_8 = (1)) begin : LABEL_0
      id_9(
          .id_0(1'b0), .id_1(1), .id_2(1 != id_3), .id_3(id_8)
      );
    end
  endgenerate
  wire id_10;
  module_0 modCall_1 (
      id_3,
      id_2
  );
endmodule
