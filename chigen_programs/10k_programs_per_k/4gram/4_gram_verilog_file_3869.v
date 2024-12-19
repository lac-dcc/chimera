// Seed: 1541997511
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
  assign module_3.id_1 = 0;
endmodule
module module_1;
  always @(id_1, 1'b0) begin : LABEL_0
    #1;
  end
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2
  );
  wire id_3, id_4, id_5, id_6, id_7;
  wire id_8;
endmodule
module module_2 (
    output tri0 id_0,
    input uwire id_1,
    input tri id_2,
    input supply0 id_3
);
  genvar id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5
  );
endmodule
module module_3 (
    input wand id_0,
    output logic id_1,
    input wor id_2,
    input tri1 id_3,
    input logic id_4,
    input supply1 id_5
);
  wire id_7;
  tri1 id_8;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7
  );
  assign id_8 = id_2;
  wand  id_9;
  logic id_10 = id_4;
  logic id_11;
  wire  id_12 = ~id_9;
  wire  id_13;
  wire  id_14;
  assign id_9 = 1;
  always @(posedge 1 + 1) begin : LABEL_0
    #1 begin : LABEL_0
      if (1) begin : LABEL_0
        id_11 = id_10;
        if (1) id_11 <= 1;
      end else id_1 <= 1;
    end
  end
endmodule
