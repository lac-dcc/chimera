// Seed: 4227903454
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  wire id_3;
  wire id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_5(
      id_3
  );
  reg id_6;
  module_0 modCall_1 (
      id_3,
      id_3
  );
  id_7(
      .id_0(1), .id_1(id_5)
  );
  assign id_6 = {1, id_6};
  wire id_8;
  always begin : LABEL_0
    @((id_6)) #1 $display(id_7);
    id_6 <= 1;
    id_5 = 1'b0;
    id_5 <= id_2;
  end
  wire id_9;
  wire id_10;
endmodule
