// Seed: 1243836106
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = -1;
endmodule
module module_1;
  wire id_1;
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2
  );
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
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always
    assert (-1) begin : LABEL_0
      if (id_5 ? id_6 : 1'h0) id_4 <= id_8;
      begin : LABEL_0
        id_1 = 1;
      end
    end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_5,
      id_1
  );
  wire id_9, id_10;
endmodule
