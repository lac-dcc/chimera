// Seed: 3108989542
module module_0 (
    input  wand id_0,
    output wor  id_1
);
  wire id_3;
  assign module_1.type_0 = 0;
  wire id_4;
endmodule
module module_1 (
    output tri1  id_0,
    input  uwire id_1,
    output tri   id_2
);
  wire id_4;
  assign id_0 = 1;
  module_0 modCall_1 (
      id_1,
      id_2
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  id_8 :
  assert property (@(1) 1 == id_3)
  else begin : LABEL_0
    id_8 <= 1'h0;
  end
  assign module_3.id_8 = 0;
  wire id_9;
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
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_3 = 1;
  assign id_9 = id_7;
  id_11(
      .id_0(!1), .id_1(id_2), .id_2(), .id_3(id_3), .id_4(~1), .id_5(id_10), .id_6(id_6)
  );
  module_2 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  always
  fork
    id_2 = 1 != 1;
    id_5 <= 1'b0;
    id_6 = id_7;
    if (id_1) id_7 = #1 1;
    if (1 == id_9) begin : LABEL_0
      #(1 - 1) id_2 = id_9;
    end
    id_2 = id_7;
    id_3 <= id_8;
  join
  assign id_10 = 1 | ~1;
  xor primCall (id_8, id_4, id_1, id_5, id_9, id_7);
endmodule
