// Seed: 1404251184
module module_0;
  generate
    for (id_1 = 1; 1'd0; id_1 = 1) begin : LABEL_0
      assign id_1 = 1;
    end
  endgenerate
endmodule
module module_1 #(
    parameter id_13 = 32'd71,
    parameter id_14 = 32'd58
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_9;
  assign id_1 = id_8;
  nor primCall (id_1, id_10, id_2, id_4, id_6, id_7, id_8, id_9);
  wire id_10;
  module_0 modCall_1 ();
  logic [7:0] id_11;
  id_12(
      .id_0(1), .id_1(1)
  ); defparam id_13.id_14 = id_11[1'b0 : 1] == 1;
endmodule
