// Seed: 401769534
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
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
  inout wire id_3;
  module_0 modCall_1 (
      id_3,
      id_4
  );
  inout wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    disable id_6;
  end
endmodule
module module_2 #(
    parameter id_1 = 32'd39,
    parameter id_7 = 32'd49
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output logic [7:0] id_5;
  inout wire id_4;
  input wire id_3;
  module_0 modCall_1 (
      id_2,
      id_4
  );
  inout wire id_2;
  input wire _id_1;
  logic [1 : id_1] _id_7;
  assign id_5[id_7] = id_1 * 1 + id_7 !== 1;
endmodule
