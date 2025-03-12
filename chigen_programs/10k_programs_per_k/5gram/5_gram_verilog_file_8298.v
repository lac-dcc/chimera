// Seed: 1798893531
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1
  );
endmodule
module module_2 #(
    parameter id_8 = 32'd90
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout logic [7:0] id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  logic id_7;
  wire  _id_8;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7
  );
  always @(posedge id_2 or negedge -1) id_5[id_8] <= id_7 << id_2;
  wire [1 : -1] id_9;
endmodule
