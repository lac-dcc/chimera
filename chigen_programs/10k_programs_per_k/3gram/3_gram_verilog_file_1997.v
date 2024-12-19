// Seed: 3943840784
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    #1 begin : LABEL_0
      id_4 = id_4;
    end
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5;
  wire id_6 = 1;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_2,
      id_2
  );
  assign id_6 = 1;
  wire id_7;
  assign id_4#(.id_2(id_3)) = 1;
  wire id_8;
endmodule
