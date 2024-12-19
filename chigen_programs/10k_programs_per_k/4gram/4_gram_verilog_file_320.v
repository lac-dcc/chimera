// Seed: 174027312
module module_0 (
    input uwire id_0,
    input tri id_1,
    input tri id_2,
    output supply1 id_3,
    input wire id_4,
    output supply0 id_5
);
  wire  id_7;
  uwire id_8 = 1;
  assign module_1.id_4 = 0;
  wire id_9;
  wire id_10;
  id_11(
      .id_0(id_4),
      .id_1(id_5),
      .id_2(id_9),
      .id_3(id_5),
      .id_4(id_3 == id_0),
      .id_5(""),
      .id_6(id_7),
      .id_7(1)
  );
  wire id_12, id_13, id_14;
endmodule
module module_1 (
    input logic id_0,
    input tri id_1,
    output supply1 id_2
);
  reg id_4, id_5, id_6, id_7, id_8;
  always @(1'h0 or posedge 1'b0) begin : LABEL_0
    id_5 <= id_0;
    id_2 = (1);
    id_7 = 1'h0;
  end
  supply0 id_9 = 1'b0;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2
  );
  wire id_10;
endmodule
