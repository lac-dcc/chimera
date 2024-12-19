// Seed: 2841021891
module module_0 #(
    parameter id_10 = 32'd51,
    parameter id_9  = 32'd64
) (
    input tri id_0,
    output uwire id_1,
    input supply1 id_2,
    output supply1 id_3,
    output tri id_4,
    output supply1 id_5,
    output tri0 id_6
);
  wire id_8;
  defparam id_9.id_10 = 1;
endmodule
module module_1 (
    output supply0 id_0,
    input wand id_1,
    input wand id_2,
    input wor id_3,
    input wor id_4,
    input tri0 id_5
);
  assign id_0 = id_5;
  initial begin : LABEL_0
    id_0 = id_2;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule
