// Seed: 1728588339
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_4[1] = "";
  assign id_3 = 1'b0;
  wire id_5, id_6;
endmodule
module module_1 #(
    parameter id_8 = 32'd36
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire _id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_6[1] = 1'b0;
  module_0 modCall_1 (
      id_12,
      id_2,
      id_10,
      id_6
  );
  always @* if (1) assign id_10[id_8] = 1;
  always @(1 or posedge id_7) begin : LABEL_0
    id_1 <= id_7;
  end
endmodule
