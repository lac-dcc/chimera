// Seed: 151712176
module module_0 ();
  wire id_1;
  wire id_2;
  assign module_2.type_2 = 0;
endmodule
module module_1 ();
  wire id_2;
  module_0 modCall_1 ();
endmodule
module module_2 (
    output wand  id_0,
    input  wor   id_1,
    output tri0  id_2,
    output wand  id_3,
    input  wire  id_4,
    output uwire id_5
);
  always @(posedge id_1 or id_4)
    if ('b0) begin : LABEL_0
      assert (id_4);
    end else assume (id_1);
  id_7(
      id_0 - id_3, 1'b0, id_4, 1, id_2, 1'b0 | 1, id_1
  );
  module_0 modCall_1 ();
  wire id_8;
endmodule
