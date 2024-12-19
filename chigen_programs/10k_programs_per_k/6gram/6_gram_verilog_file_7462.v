// Seed: 2316903819
module module_0 #(
    parameter id_2 = 32'd83,
    parameter id_3 = 32'd89
);
  wire id_1;
  assign id_1 = id_1;
  defparam id_2.id_3 = 1;
endmodule
module module_1 (
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
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_12 = id_8;
  reg id_16;
  always @(posedge id_9) begin : LABEL_0
    id_5  = 1;
    id_16 = id_1 !== id_6;
    id_13 = 1;
    wait (1 - id_5);
    id_5 <= 1;
    id_13 = id_16;
    if (1) begin : LABEL_0
      #1 $display(id_15 * 1'd0, id_2, 1, id_11);
      id_12 <= id_6 + 1;
      id_13 = 1;
      id_13 <= id_4 == 1'b0;
    end else id_3 <= id_1;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
endmodule
