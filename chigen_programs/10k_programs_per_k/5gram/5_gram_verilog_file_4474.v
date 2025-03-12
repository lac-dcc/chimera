// Seed: 4090205786
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  assign module_1.id_5 = 0;
  inout wire id_1;
  wire id_8;
endmodule
module module_0 #(
    parameter id_0 = 32'd99
) (
    input  tri   _id_0,
    output uwire id_1
);
  wire [-1 : id_0] id_3;
  uwire id_4;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
      id_4
  );
  reg id_5;
  ;
  always @(id_3 == -1 or posedge 1) begin : LABEL_0
    id_5 = -1'b0;
  end
  localparam id_6 = module_1;
  logic [-1 'b0 : id_0] id_7;
  ;
  assign id_4 = -1 ? id_5 : id_4++;
endmodule
