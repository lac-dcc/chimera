// Seed: 1396358753
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input tri  id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
module module_2 (
    input logic id_0,
    output tri0 id_1,
    input supply0 id_2,
    input wire id_3,
    input uwire id_4
);
  reg id_6, id_7;
  wand id_8;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8
  );
  wire id_9;
  tri1 id_10 = 1 ? 1 : id_4;
  always_latch @(posedge 1 == 1 or id_0) begin : LABEL_0
    id_6 <= id_0;
    id_7 <= 1;
    id_9 = id_8;
    if (1) begin : LABEL_0
      id_9 = 1;
    end else begin : LABEL_0
      if (id_9) disable id_11;
      else id_8 = id_11[1] == 1;
    end
  end
  assign id_10 = id_2;
endmodule
