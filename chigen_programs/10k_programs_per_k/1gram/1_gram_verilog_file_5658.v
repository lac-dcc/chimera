// Seed: 4010483326
module module_0 (
    output logic id_0
);
  always id_0 <= 1;
endmodule
program module_1 (
    output logic id_0,
    output wire id_1,
    input tri1 id_2,
    input tri id_3,
    input tri1 id_4,
    input tri id_5,
    input supply1 id_6,
    input tri id_7,
    input uwire id_8
);
  always id_0 <= id_6;
  module_0 modCall_1 (id_0);
  assign modCall_1.id_0 = 0;
endprogram
module module_2 #(
    parameter id_3 = 32'd56
) (
    output tri0  id_0,
    output logic id_1,
    output logic id_2,
    input  wire  _id_3
);
  for (id_5 = -1'b0; 1; id_1 = id_5) wire [id_3 : 1] id_6;
  assign id_1 = id_3;
  localparam id_7 = -1;
  wire id_8;
  always id_2 = -1;
  wire id_9;
  xor primCall (id_2, id_9, id_8, id_7, id_6, id_5);
  module_0 modCall_1 (id_2);
  assign modCall_1.id_0 = 0;
  wire id_10, id_11;
endmodule
