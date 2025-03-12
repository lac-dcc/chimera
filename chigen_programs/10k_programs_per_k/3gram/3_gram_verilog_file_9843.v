// Seed: 4110877544
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  localparam id_6 = -1;
  module_2 modCall_1 (
      id_3,
      id_1
  );
  wire id_7;
endmodule
program module_1 #(
    parameter id_1 = 32'd92
) (
    _id_1,
    id_2,
    id_3,
    id_4
);
  output logic [7:0] id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_2,
      id_2,
      id_3
  );
  inout wire id_2;
  inout wire _id_1;
  buf primCall (id_4, id_2);
  assign id_4[id_1] = 1;
endprogram
module module_2 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_3;
endmodule
