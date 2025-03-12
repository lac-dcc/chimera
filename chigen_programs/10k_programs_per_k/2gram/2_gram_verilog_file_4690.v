// Seed: 719883537
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  input wire id_3;
  assign module_1.id_10 = 0;
  inout wire id_2;
  output wire id_1;
  parameter id_6 = 1;
endmodule
module module_1 #(
    parameter id_8 = 32'd46
) (
    output uwire id_0,
    output logic id_1,
    input tri0 id_2,
    output wor id_3,
    input supply0 id_4,
    output logic id_5,
    input tri0 id_6,
    input supply1 id_7,
    input tri _id_8,
    input wand id_9,
    input wor id_10,
    input tri1 id_11,
    output wire id_12,
    input wire id_13,
    output tri0 id_14
);
  assign id_0 = -1;
  wire  id_16;
  logic id_17;
  wire  id_18 = id_2;
  assign id_1 = 1;
  always begin : LABEL_0
    case (id_2)
      (id_16): begin : LABEL_1
        id_1 <= id_10;
      end
      id_11: begin : LABEL_2
        id_1 = -1;
        id_5 = id_18;
      end
    endcase
    id_5 <= 'h0;
  end
  module_0 modCall_1 (
      id_18,
      id_17,
      id_18,
      id_17,
      id_16
  );
  wire [-1 : id_8] id_19;
endmodule
