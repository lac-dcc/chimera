// Seed: 1018830110
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_3,
      id_4,
      id_4
  );
  task automatic id_6;
    begin : LABEL_0
      id_2 <= "";
    end
  endtask
  assign id_6 = id_4;
endmodule
