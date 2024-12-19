// Seed: 3896823548
module module_0 ();
  assign id_1 = 1;
  initial begin : LABEL_0
    if (1) begin : LABEL_0
      id_1 <= 1;
      id_1 = id_1;
      assert (id_1);
    end else assume (~id_1);
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  id_9(
      .id_0(id_3), .id_1(1), .id_2(id_6), .id_3(!id_2)
  );
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
