// Seed: 1605556418
module module_0 (
    id_1
);
  inout wire id_1;
  wire id_2;
  id_3(
      1, id_1
  );
  assign module_1.id_6 = 0;
  assign id_1 = id_1;
  wire id_4 = id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  id_5(
      .id_0(1), .id_1(id_6 != 1)
  );
  assign id_3 = 1;
  module_0 modCall_1 (id_3);
  always #1
    if (id_6) begin : LABEL_0
      id_1 <= id_6;
    end
endmodule
