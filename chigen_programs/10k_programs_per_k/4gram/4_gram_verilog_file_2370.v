// Seed: 3102309131
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout uwire id_2;
  inout wire id_1;
  assign id_2 = -1;
  timeprecision 1ps;
endmodule
module module_1 #(
    parameter id_2 = 32'd94
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout logic [7:0] id_6;
  input wire id_5;
  output logic [7:0] id_4;
  inout wire id_3;
  input wire _id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_1
  );
  final begin : LABEL_0
    if (-1'b0) begin : LABEL_1
      id_6[id_2] <= #1'b0;
    end else id_4[id_2] <= #1 id_7;
  end
  wire ["" : id_2  +  1 'b0] id_8 = id_5;
endmodule
