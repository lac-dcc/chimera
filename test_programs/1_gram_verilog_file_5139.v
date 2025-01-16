// Seed: 3094655677
module module_0;
  supply1 id_1;
  id_2(
      .id_0({1'b0, -1}),
      .id_1(),
      .id_2(-1'b0),
      .id_3(~id_1.id_1 | id_1),
      .id_4(-1),
      .id_5(),
      .id_6(1),
      .id_7(id_1),
      .id_8(1),
      .id_9(-1),
      .id_10(-1)
  );
  assign id_1 = 1;
  assign module_1.id_2 = 0;
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  module_0 modCall_1 ();
  assign id_3 = id_1;
  reg id_6, id_7;
  generate
    wire id_8;
    always_latch begin : LABEL_0
      id_3 <= 1'd0;
      if (id_6);
      else $display(-1);
    end
  endgenerate
  parameter id_9 = -1;
endmodule
