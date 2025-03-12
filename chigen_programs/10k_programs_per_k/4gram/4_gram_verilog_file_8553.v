// Seed: 3087131023
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    input tri id_2,
    input supply1 id_3,
    output tri0 id_4,
    output wand id_5,
    input tri1 id_6,
    output tri id_7,
    input supply1 id_8,
    output wire id_9,
    output tri id_10,
    input tri id_11,
    input tri0 id_12,
    input supply0 id_13,
    input wand id_14,
    input tri0 id_15
);
  parameter id_17 = 1;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output wand id_0,
    output uwire id_1,
    output logic id_2,
    input tri0 id_3,
    input wor id_4,
    output tri id_5,
    input wand id_6,
    output logic id_7,
    input uwire id_8,
    output logic id_9,
    input wire id_10,
    output supply0 id_11,
    output logic id_12,
    input wire id_13,
    output uwire id_14,
    output logic id_15
);
  assign id_5 = id_10;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_10,
      id_10,
      id_1,
      id_1,
      id_8,
      id_5,
      id_10,
      id_14,
      id_14,
      id_8,
      id_6,
      id_10,
      id_4,
      id_8
  );
  initial begin : LABEL_0
    if (1)
      if (1) begin : LABEL_1
        case (id_13)
          -1: id_7 = id_6;
          -1: id_15 = 1'b0;
          default: begin : LABEL_2
            id_2 = "";
          end
        endcase
        id_9 <= -1;
      end else id_12 <= 1;
  end
endmodule
