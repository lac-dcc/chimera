// Seed: 2575776894
module module_0 (
    output tri0 id_0,
    output tri id_1,
    input wand id_2,
    input uwire id_3,
    input wor id_4,
    input tri1 id_5,
    input tri id_6,
    output uwire id_7,
    input supply1 id_8
);
  wire id_10;
  assign module_1.id_6 = 0;
  module_0 id_11 = id_3;
endmodule
module module_1 #(
    parameter id_1 = 32'd70,
    parameter id_4 = 32'd18
) (
    output wire id_0,
    output supply1 _id_1,
    output tri id_2,
    input wand id_3,
    output wor _id_4
);
  generate
    for (id_6 = id_3; -1; id_6 = !id_6) begin : LABEL_0
      logic [-  id_1 : id_4] id_7;
      ;
    end
  endgenerate
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3
  );
endmodule
