// Seed: 687125966
module module_0 #(
    parameter id_5 = 32'd28,
    parameter id_6 = 32'd43
) (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wor  id_4;
  defparam id_5.id_6 = 1'b0;
  wire id_7;
  xor primCall (id_1, id_4, id_5, id_6, id_7);
  assign id_5 = id_4;
  module_2 modCall_1 ();
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
  wire id_2;
  integer id_3;
endmodule
module module_2;
  always id_1 = id_1;
  assign module_3.id_0 = 0;
endmodule
program module_3 (
    output logic id_0
);
  always id_0#(.id_2(1'b0)) <= 1;
  module_2 modCall_1 ();
endprogram
