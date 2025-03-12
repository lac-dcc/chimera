// Seed: 48170714
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  output wire id_16;
  input wire id_15;
  assign module_1.id_0 = 0;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout logic [7:0] id_3;
  input wire id_2;
  input wire id_1;
  final
    @(posedge 1)
      @(posedge 1'b0) begin : LABEL_0
        id_3[1] <= -1;
      end
endmodule
module module_1 #(
    parameter id_1 = 32'd21
) (
    input tri0 id_0,
    input wand _id_1
);
  logic [7:0] id_3;
  assign id_3[-1 : id_1!==1'b0] = id_3;
  localparam id_4 = 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  logic [-1 : 1] id_5;
  tri0 id_6 = -1;
endmodule
