// Seed: 1896766556
module module_0;
  always @(negedge id_1) id_1 = #1 1;
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
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_8;
  logic [7:0] id_9;
  wor id_10 = 1;
  assign #id_11 id_9[1] = id_10;
  wire id_12;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  tri1 id_6;
  genvar id_7;
  always @(*) begin : LABEL_0
    if (id_7) for (id_5 = 1'h0; 1; id_4 = id_6 >= 1) id_3 <= #id_6 1;
    else begin : LABEL_0
      id_3 <= id_2;
    end
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
