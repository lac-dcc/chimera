// Seed: 939556193
module module_0;
  assign id_1 = 1;
  wire id_2;
endmodule
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    module_1,
    id_9,
    id_10,
    id_11
);
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  always force id_8 = 1;
  assign id_9 = 1;
  wire id_13;
  assign id_11[""] = 1;
  wire id_14;
  xnor primCall (id_10, id_13, id_14, id_3, id_5, id_8);
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  reg id_15 = id_8;
  always @(id_3 == id_8) begin : LABEL_0
    id_15 <= 1 - 1 ? 1'b0 : 1;
  end
  assign id_8 = 1;
endmodule
