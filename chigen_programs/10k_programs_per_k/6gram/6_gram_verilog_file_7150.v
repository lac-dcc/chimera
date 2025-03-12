// Seed: 1018539782
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  localparam id_5 = 1;
  wire id_6;
  assign id_1 = id_2#(
      .id_2(-1),
      .id_6(-1 == {-1, id_5}),
      .id_4(id_5)
  );
endmodule
module module_1 #(
    parameter id_2 = 32'd17
) (
    id_1,
    _id_2,
    id_3
);
  inout wire id_3;
  input wire _id_2;
  output logic [7:0] id_1;
  assign id_1[id_2] = id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
