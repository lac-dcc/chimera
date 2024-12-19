// Seed: 1846450038
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  id_8(
      .id_0(id_4 >= id_3), .id_1(1), .id_2(1 - id_4), .product(""), .id_3(id_5)
  );
  assign module_1.type_14 = 0;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  assign id_1 = id_2;
  tri  id_3;
  tri  id_4;
  wire id_5;
  assign id_3 = id_4;
  wire id_6;
  always @(posedge 1) $display;
  tri0 id_7;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_3,
      id_6,
      id_4,
      id_6
  );
  always @((1'd0) or negedge id_3) begin : LABEL_0
    id_1 <= id_7 != 1;
  end
  wire id_8;
  tri1 id_9 = 1;
endmodule
