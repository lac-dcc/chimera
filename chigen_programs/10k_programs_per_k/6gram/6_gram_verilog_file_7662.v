// Seed: 3671347712
module module_0;
  always @(1 or posedge id_1[((1))]) $display;
  module_3 modCall_1 ();
  assign modCall_1.id_1  = 0;
  assign module_2.type_1 = 0;
endmodule
module module_1;
  wire id_2;
  wire id_3;
  module_0 modCall_1 ();
  assign id_1 = 1;
  id_4(
      .id_0(1), .id_1(""), .id_2()
  );
endmodule
module module_2 (
    input wand id_0,
    output logic id_1,
    input supply1 id_2
);
  initial id_1 = #1 id_0 - id_2;
  module_0 modCall_1 ();
endmodule
module module_3;
  always @(1 == ~id_1)
    for (id_1 = 1; id_1; id_1 += id_1) begin : LABEL_0
      id_1 = 1'b0;
    end
endmodule
