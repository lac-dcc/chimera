// Seed: 2803006837
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wand id_5 = 1'b0, id_6;
  wire id_7;
  assign id_5 = (1'h0);
  wire id_8;
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
    id_10
);
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always_comb @(posedge id_3 or posedge 1'h0) begin : LABEL_0
    id_7 = 1;
  end
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_5
  );
  assign modCall_1.id_6 = 0;
endmodule
