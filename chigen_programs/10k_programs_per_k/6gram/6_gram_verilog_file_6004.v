// Seed: 681523284
module module_0;
  wand id_1;
  reg  id_3;
  always @(id_2 or posedge 1) begin : LABEL_0
    id_3 <= id_1 > 1'h0 - id_2;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_8 = 1 ? 1 - 1 : 1 ? id_4 : 1;
  wire id_9;
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
  assign id_8 = 1'b0;
  always @(posedge 1 & id_3 == 1'h0 or posedge id_4 & id_2 + id_3) begin : LABEL_0
    fork
      $display;
    join
  end
  integer id_10;
  initial assume (id_3);
  assign id_3 = id_3 + 1'b0 ^ 1;
  wire id_11;
  assign id_1 = 1;
  tri0 id_12 = 1;
  wire id_13;
  wire id_14;
endmodule
