// Seed: 1561653981
module module_0;
  wire id_1;
  wire id_2;
  wire id_3;
  module_2 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1,
      id_3,
      id_2,
      id_3,
      id_3
  );
  assign id_1 = id_3;
  wire id_4;
endmodule
module module_1 (
    id_1
);
  output wire id_1;
  assign id_1[1] = id_2;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(posedge id_7 & id_2) begin : LABEL_0
    disable id_9;
  end
  id_10(
      .id_0(1), .id_1(1), .id_2(id_6)
  );
endmodule
