// Seed: 3969163584
module module_0 ();
  wire id_2;
  wand id_3;
  assign id_1 = 1'b0;
  module_2 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3
  );
  initial begin : LABEL_0
    id_1 <= 1 & 1;
    if (id_3) begin : LABEL_0
      assume #1  (1);
    end else id_1 <= 1;
  end
endmodule
module module_1 (
    input  wire id_0,
    output wand id_1
);
  wire id_3;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  timeprecision 1ps;
endmodule
