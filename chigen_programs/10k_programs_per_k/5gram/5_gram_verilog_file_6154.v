// Seed: 2792477260
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  always_latch begin : LABEL_0
    disable id_3;
  end
  assign id_1 = 1;
  wire id_4;
  always @(posedge 1) $display;
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
    id_11
);
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = 1'b0;
  nor primCall (id_7, id_3, id_2, id_6, id_8, id_5, id_9, id_10, id_11);
  module_0 modCall_1 (
      id_2,
      id_7
  );
endmodule
