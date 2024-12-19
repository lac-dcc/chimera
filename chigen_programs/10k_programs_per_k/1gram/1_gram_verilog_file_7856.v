// Seed: 3398004667
module module_0 (
    input tri0 id_0
);
  wire id_2;
endmodule
module module_1 (
    input wand id_0,
    output supply0 id_1
);
  module_0 modCall_1 (id_0);
  wire id_3;
endmodule
module module_2 ();
  wor   id_1;
  reg   id_2;
  uwire id_3;
  uwire id_4 = 1'h0;
  tri   id_5 = id_4;
  assign id_5 = id_1#(.id_3(id_3));
  reg id_6, id_7, id_8;
  id_9 :
  assert property (@(posedge 1'b0) id_2) id_2 <= id_7;
  reg id_10 = id_2;
  initial id_7 = 1'h0;
  wire id_11;
  wire id_12;
  id_13 :
  assert property (@(1) id_1) begin : LABEL_0
    id_9 = 1;
    if (!1) begin : LABEL_0
      begin : LABEL_0
        if (1) id_2 = ~1;
      end
      repeat (id_13) {id_7 ^ 1'b0, id_10} <= id_9;
      id_1 = 1'h0;
      $display("" & id_2.id_10);
    end else id_5 = 1 && 1;
  end
endmodule
module module_3 (
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
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  generate
    assign id_3.id_6 = id_7;
    assign id_5 = id_6;
    tri0 id_8 = id_5 || 1;
  endgenerate
  module_2 modCall_1 ();
endmodule
