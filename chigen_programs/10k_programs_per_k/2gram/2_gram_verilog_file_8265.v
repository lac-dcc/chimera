// Seed: 1508057557
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  assign module_2.id_3 = 0;
  input wire id_1;
  wire id_4 = id_1;
endmodule
macromodule module_1 #(
    parameter id_3 = 32'd86
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire _id_3;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_5
  );
  inout wire id_2;
  inout logic [7:0] id_1;
  assign id_1[id_3] = $signed(91);
  ;
endmodule
module module_2 #(
    parameter id_3 = 32'd79
) (
    id_1,
    id_2,
    _id_3,
    id_4
);
  output reg id_4;
  input wire _id_3;
  input wire id_2;
  input wire id_1;
  logic [id_3 : (  1  )] id_5;
  always @(id_1) begin : LABEL_0
    id_4 <= id_3;
  end
  assign id_5 = id_2;
  assign id_5 = -1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5
  );
  assign id_5 = id_5;
endmodule
