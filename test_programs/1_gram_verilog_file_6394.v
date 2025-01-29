// Seed: 4125016414
module module_0 (
    output wand id_0,
    input  wire id_1,
    output tri0 id_2,
    output wand id_3,
    input  tri1 id_4,
    output tri0 id_5,
    output wire id_6,
    input  tri0 id_7
);
  tri0 id_9 = -1;
  wire id_10;
  if (-1) assign id_2 = id_1;
  else begin : LABEL_0
    begin : LABEL_0
      begin : LABEL_0
        wire id_11;
      end
    end
  end
  wire id_12, id_13, id_14;
  genvar id_15;
  id_16(
      1, id_4
  );
  supply0 id_17 = id_4;
  assign id_6 = id_17;
  wire id_18;
  wire id_19 id_20, id_21;
  wire id_22;
endmodule
module module_1 (
    input logic id_0,
    output wand id_1,
    output logic id_2,
    output wire id_3,
    input logic id_4,
    input wand id_5,
    output tri1 id_6,
    input supply1 id_7
);
  assign id_6 = id_0 ^ ~id_0;
  logic id_9, id_10;
  wire id_11, id_12;
  assign id_3 = id_5;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_3,
      id_1,
      id_5,
      id_6,
      id_3,
      id_7
  );
  assign modCall_1.type_29 = 0;
  assign id_10 = id_4;
  always
    if (id_0) begin : LABEL_0
      id_10 <= !id_0;
      #1 id_9 = id_0;
    end
  initial id_2 <= -1'h0;
endmodule
