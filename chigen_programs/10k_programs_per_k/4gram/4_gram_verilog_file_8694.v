// Seed: 3713460499
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6;
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
    id_9
);
  output wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  final begin : LABEL_0
    if (1'b0 & 1)
      assert (id_1) $display(id_8);
      else disable id_10;
  end
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_10,
      id_10
  );
  pulldown (id_2, id_5);
  wire id_11;
endmodule
