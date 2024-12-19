// Seed: 1434781037
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  logic [7:0] id_9;
  tri id_10 = 1;
  id_11(
      .id_0(id_9), .id_1(1)
  );
  wire id_12;
  for (id_13 = 1 + 1; 1; id_9[!1] = id_10) begin : LABEL_0
    id_14(
        .id_0(1), .id_1(1'b0), .id_2(""), .id_3(id_9), .id_4(1)
    );
    wire id_15;
    wire id_16;
  end
  assign module_1.type_2 = 0;
  wire id_17;
  wire id_18;
  wire id_19;
  wire id_20;
  wire id_21;
  id_22 :
  assert property (@(id_10) 1'd0)
  else;
endmodule
module module_1 ();
  wand id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign id_1 = 1'b0 <-> id_1;
endmodule
