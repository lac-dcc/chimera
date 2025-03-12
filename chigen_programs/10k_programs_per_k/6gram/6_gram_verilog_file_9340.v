// Seed: 4072950137
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  specify
    (id_6 => id_7) = (id_1, ~id_3);
  endspecify
endmodule
module module_1 #(
    parameter id_2 = 32'd48
) (
    id_1,
    _id_2,
    id_3,
    id_4
);
  output logic [7:0] id_4;
  inout wire id_3;
  output wire _id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  assign id_3 = id_1;
  initial begin : LABEL_0
    $signed(57);
    ;
  end
endmodule
