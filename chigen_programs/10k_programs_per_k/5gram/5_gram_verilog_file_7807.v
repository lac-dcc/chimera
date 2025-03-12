// Seed: 3135758053
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_4;
endmodule
module module_1 #(
    parameter id_5 = 32'd63
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire _id_5;
  inout wire id_4;
  output wire id_3;
  output logic [7:0] id_2;
  inout wire id_1;
  generate
    assign id_2[(id_5)] = 1'b0 ? id_4 : -1'h0;
  endgenerate
  module_0 modCall_1 (
      id_8,
      id_1,
      id_8
  );
endmodule
