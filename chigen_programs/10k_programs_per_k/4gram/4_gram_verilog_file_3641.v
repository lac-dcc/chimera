// Seed: 671838106
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign module_1.id_5 = 0;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  always #(1) begin : LABEL_0
    if (1)
      id_7#(
          .id_3(1 | 1'h0),
          .id_2(1),
          .id_4(1'd0),
          .id_3(1'b0)
      ) = id_9;
  end
  xor primCall (id_6, id_10, id_1, id_2, id_9, id_12, id_5, id_7, id_3, id_11, id_4, id_8);
  id_10(
      .id_0(id_7),
      .id_1(1),
      .id_2(id_7),
      .id_3(1),
      .id_4(1),
      .id_5(!id_5),
      .id_6(id_9),
      .id_7({1, {1, id_6}})
  );
  logic [7:0] id_11;
  assign #id_12 id_10 = id_10;
  assign id_11[1] = 1'd0;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_4,
      id_5,
      id_6
  );
endmodule
