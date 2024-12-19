// Seed: 1813170694
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_6(
      .id_0(1), .id_1(1'b0), .id_2(id_4)
  );
  assign id_6 = id_6;
  wire id_7;
  wire id_8;
  task id_9(input id_10, output id_11);
    output id_12, id_13;
    #1;
  endtask
  wire id_14;
  assign id_1 = id_10;
  assign id_4 = id_14;
  byte id_15;
  assign id_4 = id_8;
  assign id_1 = id_10;
  assign id_3 = 1'b0;
  assign id_3 = 1;
  integer id_16;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_8, id_9;
  always begin : LABEL_0$display
    ;
  end
  nand primCall (id_6, id_4, id_5, id_9, id_7, id_1, id_8, id_3, id_2);
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_9,
      id_6
  );
endmodule
