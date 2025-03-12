// Seed: 2939421980
module module_0 #(
    parameter id_1 = 32'd90
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output logic [7:0] id_2;
  inout wire _id_1;
  logic id_6;
  assign id_2[id_1 : id_1] = 1'h0 && id_4;
  wire id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17, id_18, id_19;
  assign id_6 = -1;
endmodule
module module_1 #(
    parameter id_1 = 32'd23,
    parameter id_3 = 32'd67
) (
    _id_1,
    id_2,
    _id_3
);
  inout wire _id_3;
  inout logic [7:0] id_2;
  inout wire _id_1;
  assign id_3 = id_1;
  wire [id_1 : id_3] id_4;
  assign id_2 = id_2[-1];
  module_0 modCall_1 (
      id_3,
      id_2,
      id_4,
      id_4,
      id_4
  );
  id_5 :
  assert property (@(posedge -1'b0) -1'd0)
  else;
endmodule
