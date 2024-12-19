// Seed: 3215440048
module module_0 ();
  wire id_1;
  specify
    (id_2 *> id_3) = 1;
  endspecify
endmodule
module module_1 (
    input  tri0  id_0,
    input  tri0  id_1,
    input  logic id_2,
    output wire  id_3
);
  reg id_5;
  assign id_3 = id_0;
  supply1 id_6 = 1 == id_5 && 1;
  reg id_7;
  nor primCall (id_3, id_5, id_6, id_7);
  always @(posedge 1) begin : LABEL_0
    if (1) id_5 <= id_1 & 1;
    else begin : LABEL_0
      id_7 <= id_2;
    end
  end
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
  always
    if (1) begin : LABEL_0
      id_1 <= id_2;
      id_5 <= 1;
    end
  logic [7:0] id_6;
  module_0 modCall_1 ();
  always @(posedge id_1 or posedge 1) begin : LABEL_0
    if ("") begin : LABEL_0
      id_6[1'b0 : 1] <= 1;
    end else disable id_7;
  end
endmodule
