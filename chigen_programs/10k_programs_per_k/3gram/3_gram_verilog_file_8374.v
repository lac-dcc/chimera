// Seed: 1553583841
module module_0;
  assign module_2.type_12 = 0;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd14,
    parameter id_5 = 32'd59,
    parameter id_8 = 32'd22,
    parameter id_9 = 32'd47
) (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_3;
  defparam id_4.id_5 = 1;
  module_0 modCall_1 ();
  wire id_7;
  defparam id_8.id_9 = id_4;
endmodule
module module_2 (
    input tri0 id_0,
    output supply1 id_1,
    input tri0 id_2,
    output supply1 id_3,
    input tri id_4,
    input supply0 id_5
    , id_9,
    input uwire id_6,
    output uwire id_7
);
  supply0 id_10;
  module_0 modCall_1 ();
  and primCall (id_1, id_10, id_2, id_4, id_5, id_6, id_9);
  assign id_10 = id_4;
  assign id_9  = id_5;
endmodule
