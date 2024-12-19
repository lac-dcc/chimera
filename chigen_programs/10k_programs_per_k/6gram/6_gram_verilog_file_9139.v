// Seed: 3111920624
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
    id_14
);
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_15;
  assign id_2 = 1;
  always @(posedge 1'b0 or posedge $display) begin : LABEL_0
    id_9 = id_13;
  end
  assign id_4 = 1'b0 + id_9;
  wire id_16;
  assign module_1.id_1 = 0;
  always @(1, posedge id_13) begin : LABEL_0
    wait (id_13 ==? 1);
  end
endmodule
module module_1 #(
    parameter id_6 = 32'd3,
    parameter id_7 = 32'd51
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_4 = 1;
  assign id_5 = id_3;
  assign id_5 = id_1;
  defparam id_6.id_7 = id_7;
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_2,
      id_8,
      id_8,
      id_8,
      id_2,
      id_2,
      id_8,
      id_8,
      id_4,
      id_8,
      id_2,
      id_4
  );
  assign id_4 = 1 ? 1 : 1;
  always @(posedge 1 or negedge 1) id_5 <= 1;
endmodule
