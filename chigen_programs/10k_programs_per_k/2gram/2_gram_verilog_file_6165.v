// Seed: 4173063289
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_4;
  assign id_4 = 1;
endmodule
module module_1 #(
    parameter id_7 = 32'd9
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8
);
  output logic [7:0] id_8;
  input wire _id_7;
  inout wire id_6;
  output logic [7:0] id_5;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_6
  );
  assign modCall_1.id_4 = 0;
  inout wire id_4;
  inout logic [7:0] id_3;
  output wire id_2;
  output wire id_1;
  assign id_5 = ~id_7;
  assign id_8[id_7] = 1;
  assign id_5[-1] = {id_6{id_3 ^ -1 ^ id_3[1][-1]}};
  wire id_9;
  wire id_10;
endmodule
