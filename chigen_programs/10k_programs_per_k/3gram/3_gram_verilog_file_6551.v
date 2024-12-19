// Seed: 1093145
module module_0 ();
  final $display(id_1);
endmodule
module module_1 #(
    parameter id_18 = 32'd81,
    parameter id_19 = 32'd19
) (
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
    id_14
);
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always @(1 or posedge 1 == id_9 or posedge ~id_2) id_3 = 1'b0 & id_9;
  genvar id_15;
  tri  id_16;
  wire id_17;
  always @(id_9 or id_15) begin : LABEL_0
    deassign id_15.id_17;
    assign id_12[1] = 1;
  end
  defparam id_18.id_19 = id_16 - 1;
  module_0 modCall_1 ();
endmodule
