// Seed: 2009475499
module module_0 (
    id_1
);
  inout wire id_1;
  logic id_2;
  always begin : LABEL_0
    begin : LABEL_1
      begin : LABEL_2
        id_2 = 1;
      end
    end
  end
  logic id_3;
endmodule
module module_1 #(
    parameter id_1 = 32'd52,
    parameter id_3 = 32'd99
) (
    _id_1[id_3-id_1 :-1],
    id_2,
    _id_3,
    id_4
);
  inout wire id_4;
  inout wire _id_3;
  inout wire id_2;
  output logic [7:0] _id_1;
  parameter id_5 = 1;
  module_0 modCall_1 (id_5);
  assign id_1 = id_5;
endmodule
