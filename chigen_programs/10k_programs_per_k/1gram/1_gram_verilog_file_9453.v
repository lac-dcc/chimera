// Seed: 4088081073
module module_0;
  wire id_2;
  assign id_2 = id_1 & 1'b0;
  assign id_2 = id_1;
  tri id_3 = 1;
endmodule
module module_1 #(
    parameter id_13 = 32'd7
) (
    input supply1 id_0,
    input tri1 id_1,
    input supply0 id_2,
    output supply1 id_3,
    output supply0 id_4,
    input supply0 id_5,
    input tri1 id_6,
    output uwire id_7,
    input supply1 id_8,
    output tri0 id_9,
    output supply0 id_10,
    inout wire id_11
);
  assign id_7 = id_0;
  defparam id_13 = id_6 == 1;
  initial
    if (id_8) id_11 = 1'b0;
    else id_10 = 1;
  module_0 modCall_1 ();
  assign modCall_1.type_4 = 0;
endmodule
