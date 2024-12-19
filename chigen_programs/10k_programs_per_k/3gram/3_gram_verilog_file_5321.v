// Seed: 3203513813
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6;
  if (id_5) begin : LABEL_0
    if (1 - id_2) assign id_5 = id_5;
    else
      for (id_7 = 1'h0; id_7; id_7 = 1) begin : LABEL_0
        initial begin : LABEL_0
          id_1 <= 1;
        end
      end
  end
  assign module_1.id_4 = 0;
  wand id_8 = 1;
  wire id_9;
  genvar id_10;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  initial begin : LABEL_0
    id_4 = 1;
  end
  module_0 modCall_1 (
      id_2,
      id_4,
      id_5,
      id_4,
      id_4
  );
  wire id_6;
  always_comb @(id_3[1==1-1]) begin : LABEL_0
    id_2 <= 1;
  end
  wire id_7;
endmodule
