// Seed: 2521585670
module module_0 #(
    parameter id_10 = 32'd48
) (
    id_1,
    id_2,
    id_3#(
        .id_4(-1),
        .id_5(~1'b0),
        .id_6(-1),
        .id_7(-1'b0)
    ),
    id_8,
    id_9
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_9 = id_9;
  assign id_6 = -1;
  always id_9 = -1;
  wire _id_10;
  parameter id_11 = -1;
  wire [id_10 : -1 'b0] id_12;
endmodule
macromodule module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_9,
      id_4
  );
  assign modCall_1.id_6 = 0;
  inout wire id_5;
  inout wire id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  input wire id_1;
  always @(posedge -1 or posedge {id_9,
    -1
  })
  begin : LABEL_0
    id_3[-1] <= id_1;
  end
endmodule
