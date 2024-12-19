// Seed: 2050150060
module module_0;
  tri0 id_1 = 1'b0;
  wire id_2;
  wire id_3;
  always @(1'b0) begin : LABEL_0$display
    ;
  end
  module_2 modCall_1 (
      id_3,
      id_2
  );
endmodule
module module_1;
  initial begin : LABEL_0
    id_1 <= 1'b0 - 1;
    wait (1);
  end
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  always @(1 or posedge id_2)
    if (id_1 < id_1) assign id_1 = 1;
    else $display(1, "");
  wire id_3 = 1;
  wire id_4;
  initial assume (id_2);
endmodule
