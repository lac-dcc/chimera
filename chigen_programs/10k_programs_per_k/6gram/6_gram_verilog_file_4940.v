// Seed: 3575280378
module module_0;
  wire id_1;
  wire id_3;
  assign module_2.id_1 = 0;
  always @(posedge id_3) begin : LABEL_0
    disable id_4;
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
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = id_5;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  always @(1 or posedge ((id_2 ^ id_2))) $display(.id_3(1 + 1), id_3, 1);
  module_0 modCall_1 ();
  initial begin : LABEL_0
    #1;
    id_3 <= id_2;
    id_3 <= 1;
    id_1 = id_3;
  end
endmodule
