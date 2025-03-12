// Seed: 3994720707
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_4;
endmodule
module module_1 #(
    parameter id_9 = 32'd49
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  nor primCall (id_7, id_5, id_4, id_2);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_5
  );
  assign id_1 = id_2;
  wire id_8;
  wire _id_9;
  wire [id_9 : 1] id_10;
endmodule
