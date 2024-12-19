// Seed: 3725661563
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  tri1 id_5;
  id_6(
      .id_0(1), .id_1(1), .id_2(id_1), .id_3(id_1), .id_4(1)
  );
  assign id_3 = id_5 - 1;
  reg id_7;
  always @(1'b0 or posedge id_1) begin : LABEL_0
    id_4 = (1);
    #id_8;
    $display;
  end
  always @(1 | id_5 or posedge 1) begin : LABEL_0
    id_7 <= 1;
  end
endmodule
module module_1 (
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
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_5 = ~&id_2;
  initial begin : LABEL_0
    if (1'h0)
      if ("")
        if ("") id_3[(1) : 1'd0] = id_7;
        else id_8 <= 1 == id_1;
    id_1 = #id_9 id_2;
    id_6 = id_7[1];
  end
  module_0 modCall_1 (
      id_4,
      id_6,
      id_5,
      id_5
  );
  assign modCall_1.id_7 = 0;
endmodule
