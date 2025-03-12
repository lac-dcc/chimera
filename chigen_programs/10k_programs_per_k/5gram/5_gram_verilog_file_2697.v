// Seed: 3947373684
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    input tri id_2,
    input wor id_3,
    output wor id_4,
    output supply1 id_5,
    input supply0 id_6,
    input supply0 id_7,
    input uwire id_8,
    input wire id_9
);
  tri0 id_11;
  assign id_4 = 1 == id_8 && 1 || id_11++;
endmodule
module module_1 (
    input wor id_0,
    input uwire id_1,
    input wire id_2,
    input supply0 id_3,
    input tri0 id_4,
    output wor id_5,
    input tri1 id_6,
    output tri1 id_7,
    output supply0 id_8,
    input tri1 id_9
);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1,
      id_9,
      id_5,
      id_8,
      id_1,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.id_7 = 0;
  reg id_11;
  xor primCall (id_7, id_6, id_2, id_0, id_4);
  supply0 id_12;
  assign id_5 = id_12;
  supply1 id_13 = id_0;
  parameter id_14 = 1'b0 ? -1'b0 : 1;
  case ({
    1, id_6
  })
    id_14: begin : LABEL_0
      initial begin : LABEL_1
        id_11 <= -1;
      end
      for (id_15 = id_4; -1; id_11 = -1) begin : LABEL_2
        wire id_16;
      end
    end
    1:
    if (id_14) begin : LABEL_3
      assign id_13 = -1;
    end else begin : LABEL_4
      assign id_12 = 1;
    end
    default:
    logic id_17;
  endcase
  parameter id_18 = id_14 == id_14;
  logic id_19;
  wire  id_20;
  wire  id_21;
endmodule
