// Seed: 23170186
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    #1 if (id_3) id_3 = !(1);
  end
  assign module_1.id_6 = 0;
  wire id_5;
endmodule
module module_1 (
    input  tri1  id_0,
    input  wand  id_1,
    input  tri0  id_2,
    output wand  id_3,
    input  tri0  id_4,
    output tri0  id_5,
    output tri   id_6,
    input  wire  id_7,
    input  tri   id_8,
    input  tri0  id_9,
    output uwire id_10
);
  initial begin : LABEL_0
    if (1'h0 == 1) begin : LABEL_0
      id_10 = {1, 1'b0, id_8 - ""} - id_4;
    end
  end
  id_12(
      .id_0(id_10 && id_8), .id_1(1), .id_2(1), .id_3(~id_2), .id_4(id_1)
  );
  assign id_5 = id_7;
  wire id_13;
  module_0 modCall_1 (
      id_13,
      id_13,
      id_13,
      id_13
  );
endmodule
