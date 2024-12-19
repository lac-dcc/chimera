// Seed: 127647383
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  final $display(1);
  wand id_3 = 1'h0 == id_2;
  wire id_4;
  id_5(
      .id_0(~('b0)), .id_1(id_1), .id_2(1'b0)
  );
  wor  id_6 = 1'b0 != (1);
  wire id_7;
  wire id_8, id_9;
endmodule
module module_1 (
    input wor   id_0,
    input logic id_1,
    input tri0  id_2
);
  always
    case ({id_1, id_0} + 1)
      id_2 == "": id_4 <= id_0 - 1;
      1: id_4 = id_1;
    endcase
  wire id_5;
  generate
    assign id_4 = id_1;
  endgenerate
  id_6(
      .id_0(1'b0), .id_1(""), .id_2(), .id_3(id_5)
  );
  module_0 modCall_1 (
      id_5,
      id_5
  );
  assign modCall_1.id_2 = 0;
endmodule
