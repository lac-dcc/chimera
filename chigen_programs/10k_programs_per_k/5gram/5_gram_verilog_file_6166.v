// Seed: 431054546
module module_0 (
    input supply0 id_0,
    input tri id_1,
    input tri0 id_2,
    input wor id_3,
    input uwire id_4,
    output wand id_5,
    input wire id_6
);
  assign id_5 = id_3;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output logic id_0,
    input tri id_1,
    input wire id_2,
    output logic id_3,
    output logic id_4,
    output logic id_5,
    input tri id_6,
    input tri id_7,
    output logic id_8,
    output logic id_9,
    input wor id_10,
    output supply0 id_11,
    input wand id_12,
    output tri id_13,
    input supply1 id_14,
    output wor id_15,
    input supply0 id_16,
    input supply0 id_17
);
  wire id_19;
  wire id_20;
  module_0 modCall_1 (
      id_14,
      id_1,
      id_6,
      id_1,
      id_6,
      id_15,
      id_6
  );
  assign id_13 = id_7;
  xor primCall (id_13, id_19, id_17, id_12, id_16, id_2, id_7, id_20, id_10, id_14, id_1);
  always_ff @(posedge 1) begin : LABEL_0
    id_3 = -1 == -1'd0;
    id_4 <= id_6;
    case (~id_14)
      id_7: id_0 = 1;
      -1: id_4 <= {id_10, id_17 == id_6};
      -1: id_9 = -1;
      1: id_8 = id_7;
      default: id_5 <= |id_7;
    endcase
  end
endmodule
