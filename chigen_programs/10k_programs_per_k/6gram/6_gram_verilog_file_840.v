// Seed: 2287748314
module module_0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_4;
  wire id_5;
  module_0 modCall_1 ();
  initial begin : LABEL_0
    wait (1);
    begin : LABEL_0
      disable id_6;
      $display;
    end
    assert (id_5);
  end
endmodule
module module_2 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  logic [7:0] id_3;
  wire id_4;
  module_0 modCall_1 ();
  assign id_3[1] = 1;
  id_5(
      .id_0(1),
      .id_1(id_2),
      .id_2(1),
      .id_3(id_3),
      .id_4(id_3),
      .id_5(id_1),
      .id_6(1),
      .id_7(1),
      .id_8(1'b0),
      .id_9(1)
  );
endmodule
