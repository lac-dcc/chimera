// Seed: 1396751660
module module_0 (
    output logic id_0,
    input supply0 id_1,
    output wand id_2,
    input tri0 id_3,
    input tri id_4,
    input tri id_5,
    input wire id_6,
    output logic id_7
);
  always @* begin : LABEL_0
    if (1'b0) begin : LABEL_1
      id_0 = id_5;
      id_0 <= #id_3 1;
    end
    id_7 <= id_6;
  end
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input wire id_0,
    output wand id_1,
    input wor id_2,
    input tri id_3,
    input uwire id_4,
    input wand id_5,
    input wor id_6,
    input wand id_7,
    input wire id_8,
    output supply1 id_9,
    input tri1 id_10,
    input wor id_11,
    output logic id_12,
    input supply0 id_13,
    output wire id_14,
    output uwire id_15
);
  localparam id_17 = 1;
  module_0 modCall_1 (
      id_12,
      id_11,
      id_14,
      id_5,
      id_4,
      id_5,
      id_8,
      id_12
  );
  logic \id_18 ;
  ;
  initial begin : LABEL_0
    \id_18 <= #1 1'h0;
    disable id_19;
    id_12 <= $clog2(43);
    ;
  end
endmodule
