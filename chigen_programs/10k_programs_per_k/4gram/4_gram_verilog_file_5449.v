// Seed: 3569750294
module module_0 (
    input  tri0  id_0,
    input  tri   id_1,
    input  wire  id_2,
    output logic id_3
);
  assign id_3 = ~id_1;
  integer [-1 : 1 'b0] id_5 = ((1'b0)), id_6;
  assign id_5 = id_1;
  always @(posedge id_6) begin : LABEL_0
    if (1) id_3 <= id_5;
  end
  tri id_7 = 1;
  parameter id_8 = 1;
  parameter id_9 = -1;
endmodule
module module_1 #(
    parameter id_0 = 32'd73
) (
    input  tri   _id_0,
    output uwire id_1,
    output tri1  id_2,
    input  tri1  id_3,
    output tri1  id_4,
    output logic id_5,
    input  uwire id_6
);
  assign id_4 = id_6;
  `define pp_8 0
  wire [-1 : -1] id_9;
  assign #(id_5++) id_4 = `pp_8[1] == -1;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_5
  );
  always @(-1, posedge id_3) id_5 = id_0;
  wire [(  id_0  ) : 1] id_10;
endmodule
