// Seed: 760736571
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wand id_4 = 1;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always @(id_4)
    if (id_2) begin : LABEL_0
      id_3 <= id_3;
    end else if (id_3 >> 1)
      if (1) begin : LABEL_0
        id_4 <= 1;
      end else begin : LABEL_0
        if ('h0) id_3 <= {1};
      end
  supply0 id_5;
  wire id_6;
  wire id_7;
  wire id_8;
  assign id_1 = id_5 != 1;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_6
  );
endmodule
