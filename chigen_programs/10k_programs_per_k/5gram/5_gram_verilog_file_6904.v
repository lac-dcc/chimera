// Seed: 4128614786
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  output wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  supply0 id_12 = 1;
  parameter id_13 = 1;
  logic id_14;
  ;
endmodule
module module_1 (
    output logic id_0,
    output wor id_1,
    input supply0 id_2,
    output tri id_3,
    input tri0 id_4,
    output wor id_5,
    output supply1 id_6,
    input tri1 id_7,
    output uwire id_8,
    output wor id_9,
    input wor id_10
);
  wire id_12 = id_4;
  always @(posedge id_7) begin : LABEL_0
    id_0 <= id_2;
    case (-1)
      default: begin : LABEL_1
        $signed(37);
        ;
      end
    endcase
  end
  tri1 id_13 = -1'b0;
  nor primCall (id_1, id_2, id_12, id_10, id_4, id_7, id_13);
  module_0 modCall_1 (
      id_12,
      id_12,
      id_13,
      id_13,
      id_12,
      id_13,
      id_12,
      id_13,
      id_12,
      id_12,
      id_12
  );
endmodule
