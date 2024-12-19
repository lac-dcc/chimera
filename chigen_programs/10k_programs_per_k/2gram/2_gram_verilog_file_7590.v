// Seed: 3009847396
macromodule module_0 (
    input  tri1 id_0,
    output wire id_1,
    output tri  id_2
);
  wire id_4;
  wire id_5;
  wire id_6;
  assign id_2 = ((1));
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1,
    input  uwire id_2
    , id_9,
    output logic id_3,
    output uwire id_4,
    output uwire id_5,
    output logic id_6
    , id_10,
    inout  logic id_7
);
  always id_7 <= 1;
  logic id_11;
  logic id_12;
  logic id_13, id_14, id_15;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_4
  );
  assign id_6  = id_10;
  assign id_14 = id_10;
  assign id_7  = id_13;
  assign id_0  = id_13 ? id_1 : id_15;
  if (id_7) begin : LABEL_0
    wire id_16;
    assign id_7 = id_12;
    wire id_17;
    final begin : LABEL_0
      begin : LABEL_0
        disable id_18;
      end
    end
    assign id_11 = 1;
    wire id_19;
    assign id_3  = id_10;
    assign id_11 = id_15;
  end
endmodule
