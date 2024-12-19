// Seed: 1555844677
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
    id_10
);
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  always @* begin : LABEL_0
    id_2 = id_8;
  end
  always begin : LABEL_0
    id_9 = id_6;
  end
  wire id_11;
  if (id_10) begin : LABEL_0
    wire id_12;
    wand id_13;
    assign id_2 = id_13 > 1;
  end else begin : LABEL_0
    assign id_4 = 1'b0;
    wire id_14;
  end
endmodule
module module_1 (
    input  uwire id_0,
    output wand  id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
