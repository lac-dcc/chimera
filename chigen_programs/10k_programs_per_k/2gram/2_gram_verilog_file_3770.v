// Seed: 3465514896
module module_0 (
    output supply1 id_0
);
  wire id_2 = id_2;
  assign id_0 = 1'b0;
  wire id_3;
  wire id_4;
  generate
    string id_5;
    id_6 :
    assert property (@("" or posedge id_5) id_6)
    else;
  endgenerate
  if (1) begin : LABEL_0
    wire id_7;
  end else begin : LABEL_0
    wire id_8;
  end
endmodule
module module_1 (
    output tri id_0
);
  string id_2 = id_2;
  assign id_2 = "";
  module_0 modCall_1 (id_0);
endmodule
module module_2;
  assign id_1 = id_1;
  id_2(
      id_2 ? id_2 : id_2, id_1, 1'b0
  );
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
    id_10,
    id_11,
    id_12,
    id_13
);
  output wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_14;
  assign id_10 = id_8 - 1;
  id_15 :
  assert property (@(id_1) id_8)
  else;
  initial begin : LABEL_0
    id_13 <= 1'b0;
    fork
      id_4 <= id_3;
    join_any
  end
  module_2 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
