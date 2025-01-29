// Seed: 771543007
module module_0 (
    input wor id_0,
    output tri0 id_1,
    input supply0 id_2,
    input supply1 id_3,
    output logic id_4,
    input supply0 id_5,
    input supply0 id_6,
    input supply0 id_7,
    output tri id_8,
    input wand id_9
);
  always begin : LABEL_0
    id_4 <= id_7 - ("");
  end
  wire id_11;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output tri id_0,
    output logic id_1,
    input uwire id_2,
    output tri0 id_3,
    output wor id_4,
    output tri1 id_5,
    output supply1 id_6,
    input wor id_7,
    input wor id_8,
    input uwire id_9,
    input wire id_10,
    output tri id_11,
    input tri id_12,
    input wand id_13,
    input wire id_14,
    input tri1 id_15
);
  logic [7:0][-1 'b0] id_17 = 1'b0;
  wire id_18;
  wire id_19;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_12,
      id_9,
      id_1,
      id_8,
      id_7,
      id_9,
      id_5,
      id_2
  );
  wire id_20, id_21;
  always begin : LABEL_0
    begin : LABEL_0
      @(id_7 or posedge -1) $display(id_14);
      id_1 <= 1;
    end
  end
endmodule
