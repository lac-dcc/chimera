// Seed: 1115245108
module module_0 #(
    parameter id_10 = 32'd6,
    parameter id_9  = 32'd15
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wand id_7;
  assign id_5 = 1;
  assign id_4 = 1;
  assign module_1.id_1 = 0;
  wire id_8;
  defparam id_9.id_10 = id_7 - 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3,
      id_6,
      id_1,
      id_4
  );
endmodule
