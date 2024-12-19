// Seed: 37225444
module module_0;
  wire id_2;
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
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_5 = 1;
  always_latch @*
    if (id_4) begin : LABEL_0
      assign id_9.id_6 = 1;
      id_10 <= id_7;
      foreach (id_11[1'h0]) $display;
    end
  always @(-id_6 or posedge ((1 ? 1 : id_7) == id_7 < 1 || id_1)) $display(1 == id_2);
  module_0 modCall_1 ();
endmodule
