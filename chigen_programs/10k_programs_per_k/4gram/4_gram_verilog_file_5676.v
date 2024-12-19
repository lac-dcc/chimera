// Seed: 4118351228
module module_0;
  always @(posedge id_1)
    #1
      if (!1) id_1 <= id_1;
      else begin : LABEL_0
        assume (1'd0);
      end
  module_2 modCall_1 ();
endmodule
module module_1 (
    output tri1 id_0,
    input supply1 id_1
);
  module_0 modCall_1 ();
  assign id_0 = 1;
endmodule
module module_2 ();
  assign id_1 = 1;
  assign module_0.id_1 = 0;
  always @(id_1 or posedge {1'd0,
    1
  })
  begin : LABEL_0
    if (1'b0) id_1 <= 1 ? id_1 + id_1 : id_1 ? id_1 : 1;
  end
  wire id_2;
  wire id_3;
  supply1 id_4 = 1'b0 - id_1;
endmodule
