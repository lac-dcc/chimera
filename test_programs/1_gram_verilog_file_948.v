// Seed: 1584033634
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
endmodule
macromodule module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_9;
  always
    if (1) begin : LABEL_0
      @(posedge id_1)
      if (id_4) begin : LABEL_0
        id_2 <= "";
      end
    end
  final if (1) id_6 = id_4;
  module_0 modCall_1 (
      id_5,
      id_9
  );
endmodule
