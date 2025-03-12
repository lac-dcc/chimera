// Seed: 1704504105
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  assign module_1.id_4 = 0;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  parameter id_7 = 1;
  wire id_8;
endmodule
module module_1 #(
    parameter id_4 = 32'd96,
    parameter id_8 = 32'd59
) (
    id_1,
    id_2#(
        .id_3 (-1'b0),
        ._id_4(-1),
        .id_5 (-1)
    ),
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire _id_8;
  input wire id_7;
  module_0 modCall_1 (
      id_11,
      id_1,
      id_9,
      id_12,
      id_1,
      id_3
  );
  output wire id_6;
  output wire id_5;
  inout wire _id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire [id_4 : id_8] id_15;
  wire id_16 = id_16;
  wor id_17 = (1'b0), id_18, id_19 = -1;
  initial begin : LABEL_0
    if (-1) begin : LABEL_1
      id_13 <= id_18;
    end
  end
  assign id_11 = id_15;
endmodule
