// Seed: 3369475403
module module_0 (
    output supply0 id_0,
    output uwire id_1,
    output uwire id_2,
    input wor id_3,
    output uwire id_4,
    input uwire id_5,
    input supply0 id_6,
    input uwire id_7,
    output supply0 id_8,
    input wand id_9
);
  wire [1 : ""] id_11;
  assign module_1.id_3 = 0;
  generate
    assign id_4 = 1;
  endgenerate
endmodule
module module_1 (
    output logic id_0,
    output uwire id_1,
    output wand id_2,
    input tri0 id_3,
    output logic id_4,
    input tri1 id_5,
    input supply0 id_6,
    input tri0 id_7,
    input wire id_8
    , id_16,
    output wire id_9,
    input wire id_10,
    input wire id_11,
    output tri0 id_12,
    input wor id_13,
    input wor id_14
);
  wire id_17;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_5,
      id_1,
      id_5,
      id_8,
      id_11,
      id_2,
      id_7
  );
  wire id_18;
  nor primCall (id_4, id_11, id_14, id_8, id_10, id_5, id_6, id_3);
  assign id_16 = id_3;
  always
    while (id_7)
      #(1) begin : LABEL_0
        id_0 = id_6;
        assume (id_5);
        id_4 = -1'b0;
      end
  localparam id_19 = 1;
  assign id_4 = -1;
  assign id_9 = 1;
  parameter id_20 = id_19 == -1 + id_19;
  assign id_18 = id_16;
endmodule
