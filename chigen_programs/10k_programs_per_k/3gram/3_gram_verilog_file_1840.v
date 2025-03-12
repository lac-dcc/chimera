// Seed: 3354501981
module module_0 (
    input supply0 id_0,
    input wor id_1,
    output tri1 id_2,
    input tri0 id_3,
    input supply0 id_4,
    output supply0 id_5,
    output wor id_6,
    output logic id_7
);
  assign id_6 = (1);
  parameter id_9 = 1;
  wire id_10;
  for (id_11 = id_10; -1; id_7 = -1'b0) begin : LABEL_0
    case (id_4.id_0)
      id_0: wire id_12;
      default:
      begin : LABEL_1
        logic id_13, id_14, id_15, id_16, id_17, id_18;
      end
    endcase
    wire id_19;
  end
endmodule
module module_1 (
    input supply1 id_0,
    input tri1 id_1,
    input uwire id_2,
    input wire id_3,
    input uwire id_4,
    input uwire id_5,
    output logic id_6,
    input supply1 id_7,
    output tri1 id_8
);
  wire id_10 = 1;
  assign id_6 = id_5;
  always @(posedge id_2 or negedge id_4) id_6 = -1;
  assign id_10 = (-1);
  module_0 modCall_1 (
      id_1,
      id_5,
      id_8,
      id_1,
      id_4,
      id_8,
      id_8,
      id_6
  );
  logic id_11;
endmodule
