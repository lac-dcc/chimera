// Seed: 2188664127
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  reg id_4, id_5;
  always #1 id_4 = #1 -1;
  wire id_6;
endmodule
module module_1 #(
    parameter id_4 = 32'd82
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6
  );
  input wire _id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  logic [7:0][!  id_4 : 1] id_7, id_8, id_9;
  generate
    begin : LABEL_0
      assign id_9[1] = id_5;
    end
  endgenerate
endmodule
