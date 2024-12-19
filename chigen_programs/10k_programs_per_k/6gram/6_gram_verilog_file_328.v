// Seed: 2559362229
module module_0 ();
  uwire id_3;
  generate
    assign id_2 = 1;
    for (id_4 = 1'b0; ~|id_3; id_1 = 1) begin : LABEL_0
      always @(posedge id_1, negedge 1 or 1 or posedge ($display != id_2) ^ id_2) begin : LABEL_0
        wait (1'b0);
        release id_2;
      end
    end
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  logic [7:0] id_6;
  xor primCall (id_3, id_4, id_5, id_6);
  assign id_4[1'h0] = 1 < id_2;
  assign id_6[~(1'b0)] = id_2;
  module_0 modCall_1 ();
  id_7(
      .id_0(1),
      .id_1(id_2),
      .id_2(1),
      .id_3(id_1),
      .id_4(id_5),
      .id_5(),
      .id_6(1),
      .id_7(""),
      .id_8((1)),
      .id_9(1'd0 == id_3),
      .id_10(id_4),
      .id_11(id_2 - ""),
      .id_12(1)
  );
  tri1 id_8 = 1'h0;
  wire id_9;
  wand id_10;
  wire id_11;
  assign id_10 = 1;
endmodule
