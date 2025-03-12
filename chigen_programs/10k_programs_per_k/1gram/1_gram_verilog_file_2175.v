// Seed: 1131890205
module module_0 #(
    parameter id_9 = 32'd43
) (
    input tri0 id_0,
    output tri1 id_1,
    output supply0 id_2,
    output supply1 id_3,
    input supply1 id_4,
    input wire id_5,
    input tri id_6
);
  logic id_8;
  parameter id_9[1 : 1] = 1 ? 1 : 1;
  bit id_10;
  int id_11;
  assign id_10 = (id_9);
  logic id_12;
  ;
  wire [-1 : 1] id_13, id_14;
  wire id_15 = id_8, id_16;
  always_ff begin : LABEL_0
    struct packed {logic id_17;} id_18;
  end
  always id_10 = -1;
  defparam id_9 = id_9;
  wire id_19;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    output wire id_0,
    output wor id_1,
    inout supply0 id_2,
    output tri1 id_3,
    input uwire id_4
);
  module_0 modCall_1 (
      id_4,
      id_3,
      id_2,
      id_3,
      id_4,
      id_2,
      id_2
  );
  assign id_1 = id_2;
  logic id_6;
  ;
  wire id_7;
  assign id_2 = 1'd0;
  assign id_6 = -1;
  assign id_0 = -1;
endmodule
