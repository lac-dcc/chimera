// Seed: 4113321776
module module_0 ();
  wire id_2;
  module_2 modCall_1 ();
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  assign id_2 = 1'b0;
  module_0 modCall_1 ();
endmodule
module module_2 ();
  reg id_2;
  always @(negedge 1'b0) begin : LABEL_0
    id_2 <= 1;
  end
endmodule
module module_3 (
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
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_9[1] = 1 - id_4;
  or primCall (id_1, id_10, id_11, id_12, id_3, id_4, id_6, id_7, id_8);
  id_11(
      .id_0(id_10 != 1 - 1'h0), .id_1(id_3)
  );
  reg id_12 = 1 ? 1 : id_4;
  module_2 modCall_1 ();
  assign modCall_1.id_2 = 0;
  initial id_12 <= id_12;
endmodule
