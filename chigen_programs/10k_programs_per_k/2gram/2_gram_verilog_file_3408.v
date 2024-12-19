// Seed: 2246311890
module module_0 ();
  wire id_2;
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    input wire id_0
);
  module_0 modCall_1 ();
endmodule
module module_2 (
    output supply1 id_0,
    input supply0 id_1,
    input wire id_2
);
  initial
    @(negedge (1) - id_2) begin : LABEL_0
      assume #1  (id_1);
    end
  module_0 modCall_1 ();
  supply1 id_4;
  always #1;
  assign id_4 = "" - "" - 1;
  id_5(
      .id_0(1'd0), .id_1(1), .id_2({1{id_4}}), .id_3(id_4), .id_4(id_2), .id_5(1 == ""), .id_6(id_2)
  );
  assign id_5 = id_5;
endmodule
