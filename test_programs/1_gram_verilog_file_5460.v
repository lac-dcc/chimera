// Seed: 1365535594
module module_0 (
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
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_16;
  wire id_17;
  assign module_1.id_3 = 0;
  id_18(
      -1 - $display(id_16), 1
  );
  assign id_9 = id_11;
endmodule
macromodule module_1 (
    id_1
);
  output wire id_1;
  assign id_1 = id_2;
  reg id_3;
  id_4 :
  assert property (@(posedge 1 or posedge {id_3 - id_2{-1, id_3}}) id_4) begin : LABEL_0
    id_3 <= "";
  end
  wire id_5;
  always id_1 <= id_6;
  always if (1) id_1 = 1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5
  );
  initial id_3 = 1;
endmodule
