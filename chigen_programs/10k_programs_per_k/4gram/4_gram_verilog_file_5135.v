// Seed: 3964591189
module module_0;
  assign module_2.type_8 = 0;
  assign module_1.id_9   = 0;
endmodule
module module_1 #(
    parameter id_8 = 32'd37,
    parameter id_9 = 32'd72
) (
    output supply0 id_0,
    output supply0 id_1,
    output wire id_2,
    input supply0 id_3
);
  wire id_5;
  id_6(
      .id_0(id_5)
  );
  xor primCall (id_0, id_3, id_5, id_6);
  module_0 modCall_1 ();
  wire id_7;
  generate
    defparam id_8.id_9 = 1;
  endgenerate
endmodule
module module_2 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  wor  id_3;
  wire id_4;
  module_0 modCall_1 ();
  assign id_3 = 1;
  uwire id_5;
  notif1 primCall (id_2, id_3, id_4);
  assign id_5 = "" + (1'b0);
endmodule
