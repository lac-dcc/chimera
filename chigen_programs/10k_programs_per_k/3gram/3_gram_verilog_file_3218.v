// Seed: 19011341
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wand id_5;
  assign id_4 = id_5;
  wire id_6;
  reg  id_7;
  wire id_8;
  initial begin : LABEL_0
    id_7 <= 1;
    id_7 <= id_5++;
    if (1) id_7 = 1;
    else begin : LABEL_0
      id_2 = 1'b0;
      #1 assume (1);
    end
    id_7 = 1;
    id_8 = id_6;
  end
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_1,
      id_4,
      id_5
  );
endmodule
