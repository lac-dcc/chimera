// Seed: 2975534843
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_4;
  assign module_1.id_16 = 0;
endmodule
module module_1 #(
    parameter id_16 = 32'd28,
    parameter id_17 = 32'd88
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
    id_14,
    id_15
);
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_4
  );
  always @(posedge id_10#(id_11 ==? 1) or posedge 1'b0) begin : LABEL_0
    wait (id_10);
  end
  defparam id_16.id_17 = id_6 + id_11;
endmodule
