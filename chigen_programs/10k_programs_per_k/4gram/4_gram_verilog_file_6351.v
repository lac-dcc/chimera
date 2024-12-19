// Seed: 3910714413
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8;
  logic [7:0] id_9;
  wand id_10;
  wire id_11;
  id_12(
      .id_0(id_10), .id_1(1 + 1)
  );
  assign id_3 = 1'b0;
  id_13(
      .id_0(1 * 1), .id_1(1), .id_2(1), .id_3(1), .id_4(id_9[1 : 1==1])
  );
  wire id_14;
  initial begin : LABEL_0
    if (1'b0 >= {1{id_10}})
      if (1) disable id_15;
      else begin : LABEL_0
        id_3 = 1'b0;
      end
  end
  assign id_4 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2,
      id_4
  );
  wire id_7;
endmodule
