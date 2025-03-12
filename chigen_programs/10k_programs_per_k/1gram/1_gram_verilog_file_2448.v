// Seed: 1753073639
module module_0 (
    id_1
);
  inout wire id_1;
  parameter id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  module_0 modCall_1 (id_1);
  inout wire id_1;
  assign id_2 = id_1;
endmodule
module module_2 #(
    parameter id_1 = 32'd48,
    parameter id_2 = 32'd95
) (
    _id_1,
    _id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire _id_2;
  inout wire _id_1;
  wire id_6;
  ;
  module_0 modCall_1 (id_6);
  wire [id_1 : id_2] id_7;
  wire id_8, id_9;
  always $signed(71);
  ;
  buf primCall (id_5, id_6);
endmodule
