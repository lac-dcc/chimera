// Seed: 2140978847
module module_0 (
    input wor id_0,
    output tri0 id_1,
    output supply1 id_2,
    output supply0 module_0,
    output tri id_4,
    input tri id_5
);
  logic id_7 = 1;
  wire  id_8;
endmodule
module module_1 (
    output tri0 id_0,
    output logic id_1,
    input supply1 id_2,
    output logic id_3,
    input tri1 id_4,
    input wor id_5,
    input tri0 id_6,
    input wire id_7,
    input supply0 id_8,
    input tri id_9,
    input wand id_10,
    output tri1 id_11,
    output uwire id_12,
    input tri0 id_13,
    output tri1 id_14,
    output logic id_15,
    output wor id_16,
    input tri0 id_17
);
  assign id_1 = -1;
  localparam id_19 = 1;
  assign id_12 = id_8;
  module_0 modCall_1 (
      id_4,
      id_11,
      id_12,
      id_16,
      id_0,
      id_6
  );
  assign modCall_1.id_1 = 0;
  reg id_20;
  ;
  always @(posedge 1)
    case (id_5)
      id_20 + 1: id_20 = 1;
      1: begin : LABEL_0
        if (-1'b0) id_3 = id_17 + id_6;
      end
      -1: id_3 = -1'b0;
      1: begin : LABEL_1
        if (-1 && -1 && -1) begin : LABEL_2
          id_15 <= 1;
        end
        if (id_19)
          for (id_3 = -1 * ""; id_17; id_1 = id_5)
          id_15 <= 1'b0 ? 1 : "" ? -1 : 1 ? "" : 1 ? -1 : "";
        else assert (1'd0);
      end
    endcase
endmodule
