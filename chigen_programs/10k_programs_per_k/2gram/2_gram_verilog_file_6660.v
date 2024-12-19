// Seed: 3779285134
module module_0 (
    id_1
);
  input wire id_1;
  always
    do begin : LABEL_0
      if (id_1) begin : LABEL_0
        @(posedge 1'b0) id_2 = 1;
        $display;
      end
    end while (1);
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  module_0 modCall_1 (id_2);
endmodule
module module_2 (
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
  output wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  id_12(
      .id_0(1'b0),
      .id_1(1'd0),
      .id_2(1'b0),
      .id_3(1'b0),
      .id_4(id_6),
      .id_5(id_10),
      .id_6(id_3),
      .id_7(id_6),
      .id_8(id_11),
      .id_9(1),
      .id_10(id_11),
      .id_11(id_9)
  );
  assign id_11 = id_5;
  wire id_13;
  assign id_3[1] = id_8;
  wire id_14;
  module_0 modCall_1 (id_8);
  assign id_9 = id_6;
  assign id_1 = 1'b0;
  wire id_15;
  wire id_16;
  wire id_17;
  id_18(
      1'b0, id_1
  );
endmodule
