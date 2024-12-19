// Seed: 2127095660
module module_0 (
    id_1
);
  input wire id_1;
  wire id_2;
  assign module_2.id_10 = 0;
  assign module_1.id_9  = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_3 - 1;
  wire id_4, id_5;
  reg id_6, id_7, id_8, id_9;
  module_0 modCall_1 (id_4);
  always_comb id_8 <= 1;
  wire id_10, id_11, id_12, id_13;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wor id_9 = 1, id_10, id_11 = 'h0;
  logic [7:0][1] id_12;
  assign id_11 = id_1;
  wire id_13;
  module_0 modCall_1 (id_12);
  assign id_9 = id_4 - 1;
  if (id_8) begin : LABEL_0
    begin : LABEL_0
      int id_14;
    end
    always if (id_11) id_2 = id_9;
  end else
    always begin : LABEL_0
      if ("") begin : LABEL_0
        begin : LABEL_0
          if (1)
            @(1 or posedge id_12 or 1, posedge id_11) begin : LABEL_0
              if ("") id_5 = id_7;
            end
          else id_6 <= 1'b0;
        end
      end
    end
  assign id_11 = 1 == id_7;
endmodule
