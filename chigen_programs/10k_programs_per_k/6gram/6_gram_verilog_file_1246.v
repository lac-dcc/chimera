// Seed: 1215303453
module module_0 ();
  wand id_3 = 1;
  assign id_3 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8;
  id_9(
      .id_0(1), .id_1(id_7)
  ); id_10(
      .id_0(1), .id_1(id_3)
  );
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  initial begin : LABEL_0
    wait (id_9);
    if (id_6 && 1) begin : LABEL_0
      id_1 = id_10;
    end
  end
endmodule
