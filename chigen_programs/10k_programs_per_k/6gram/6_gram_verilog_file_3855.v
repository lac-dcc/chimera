// Seed: 3250791663
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout logic [7:0] id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_4 = 32'd42
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5
);
  output wire id_5;
  input wire _id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  logic [7:0][-1 'd0 : id_4] id_6;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_1,
      id_6,
      id_5,
      id_2
  );
  wire id_7;
  assign id_7 = id_6[-1 : id_4];
endmodule
