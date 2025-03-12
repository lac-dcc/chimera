// Seed: 468881220
module module_0 (
    output tri0 id_0,
    input  tri0 id_1,
    output tri0 id_2,
    input  tri  id_3
);
  wire id_5;
  assign module_1.id_18 = 0;
  logic id_6;
endmodule
module module_1 #(
    parameter id_1 = 32'd69,
    parameter id_7 = 32'd10
) (
    output uwire id_0,
    input supply0 _id_1,
    input wand id_2,
    output wire id_3,
    output tri0 id_4,
    output tri1 id_5,
    input wire id_6,
    input wor _id_7,
    input tri id_8,
    input uwire id_9,
    input wand id_10,
    output supply0 id_11,
    input wand id_12,
    output logic id_13,
    output wire id_14,
    input wand id_15,
    output wor id_16,
    input wor id_17,
    input wire id_18
);
  reg [id_7 : id_1] id_20;
  xnor primCall (id_3, id_20, id_15, id_18, id_17, id_9, id_8, id_10, id_6, id_12);
  always_ff @(-1) begin : LABEL_0
    fork
      disable id_21;
      begin : LABEL_1
        id_20 = -1;
      end
    join_any
  end
  initial id_13 <= -1;
  module_0 modCall_1 (
      id_3,
      id_17,
      id_5,
      id_2
  );
endmodule
