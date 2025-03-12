// Seed: 731996521
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout tri0 id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_9;
  assign id_4 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd11
) (
    _id_1,
    id_2
);
  output wire id_2;
  inout wire _id_1;
  wire [id_1 : -1 'b0] id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3
  );
  assign modCall_1.id_4 = 0;
endmodule
