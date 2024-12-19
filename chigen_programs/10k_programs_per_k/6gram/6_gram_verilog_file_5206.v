// Seed: 3362027486
module module_0 (
    output supply1 id_0,
    output logic   id_1,
    output supply0 id_2,
    output supply1 id_3,
    input  logic   id_4
);
  reg id_6;
  reg id_7;
  always @(posedge 1) begin : LABEL_0
    id_6 <= id_6;
    id_1 <= 1;
    id_6 <= id_4;
    #id_8 begin : LABEL_0
      if (id_4 == 1) begin : LABEL_0
        id_0 = 1;
        id_6 <= 1;
        id_7 <= id_7;
      end
    end
  end
  assign module_1.id_15 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    output logic id_1,
    input logic id_2,
    output wand id_3,
    output tri id_4,
    input tri0 id_5,
    output supply1 id_6,
    input uwire id_7,
    output tri id_8,
    output wire id_9,
    input supply1 id_10,
    input supply0 id_11,
    output supply1 id_12,
    input supply1 id_13,
    input wire id_14,
    output wand id_15
);
  always @(posedge 1 or posedge id_7) begin : LABEL_0
    id_1 <= id_2;
    cover (id_5);
  end
  module_0 modCall_1 (
      id_6,
      id_1,
      id_0,
      id_3,
      id_2
  );
endmodule
