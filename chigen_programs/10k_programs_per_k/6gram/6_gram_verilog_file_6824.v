// Seed: 108732422
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  generate
    if (1) begin : LABEL_0
      assign id_1  = 1;
      assign id_10 = id_5;
    end else begin : LABEL_0
      wire id_11, id_12;
    end
  endgenerate
endmodule
module module_1 (
    output wand  id_0,
    output uwire id_1,
    input  wire  id_2,
    output wire  id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5
  );
  assign id_0 = id_2 == (1);
endmodule
