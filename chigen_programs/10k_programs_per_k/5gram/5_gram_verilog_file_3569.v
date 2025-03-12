// Seed: 207706932
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout tri1 id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_6 = id_6 | 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd72,
    parameter id_3 = 32'd72
) (
    _id_1,
    id_2,
    _id_3
);
  inout wire _id_3;
  output wire id_2;
  inout wire _id_1;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_4,
      id_4,
      id_4
  );
  wire [(  id_3  ) : id_1] id_5;
endmodule
