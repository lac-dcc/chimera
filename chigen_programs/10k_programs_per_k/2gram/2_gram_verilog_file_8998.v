// Seed: 816997245
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  always begin : LABEL_0
    id_2 <= id_1;
  end
  wire id_3;
  always begin : LABEL_0$display
    ;
  end
  id_6(
      .id_0(""), .id_1({id_4, id_2}), .id_2(id_3), .id_3(1), .id_4(1 / 1)
  );
  wire id_7 = id_3;
endmodule
module module_1;
  reg  id_2;
  wor  id_3;
  wire id_4;
  wire id_5;
  always_ff id_1 <= 1 + id_3;
  assign id_3 = 1;
  wire id_6;
  wire id_7;
  module_0 modCall_1 (
      id_1,
      id_2
  );
  initial id_2 <= 1;
endmodule
