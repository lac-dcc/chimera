// Seed: 4006587552
module module_0 (
    input tri id_0,
    output wor id_1,
    input supply0 id_2,
    input supply0 id_3,
    input uwire id_4,
    input supply0 id_5,
    input wire id_6,
    input tri id_7,
    input wor id_8,
    output supply0 id_9,
    output wand id_10,
    input tri1 id_11,
    input wire id_12,
    input wire id_13,
    input wor id_14,
    input uwire id_15,
    output supply0 id_16,
    input supply0 id_17,
    input tri id_18,
    input wor id_19,
    input supply0 id_20,
    output wor id_21,
    input uwire id_22,
    output tri0 id_23
);
  wire id_25;
endmodule
module module_1 (
    input  wire  id_0,
    output logic id_1,
    input  tri0  id_2,
    output uwire id_3
);
  logic id_5;
  ;
  assign id_3 = 1;
  always begin : LABEL_0
    id_5 <= 1'b0;
    begin : LABEL_1
      @* id_5 = id_0;
    end
    id_1 = id_0 + 1;
  end
  initial id_5 = id_0;
  assign id_5 = -1;
  logic id_6;
  ;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_2,
      id_0,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_3,
      id_3,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_3,
      id_2,
      id_2,
      id_0,
      id_2,
      id_3,
      id_0,
      id_3
  );
  assign modCall_1.id_4 = 0;
  assign {-1 + id_6} = id_5 ? id_2 : 1;
  logic id_7;
  localparam id_8 = 1;
endmodule
