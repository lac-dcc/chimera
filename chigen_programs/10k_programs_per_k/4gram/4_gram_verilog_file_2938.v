// Seed: 1289196556
module module_0 (
    output logic id_0,
    output tri id_1,
    output tri id_2,
    input tri0 id_3,
    input tri1 id_4,
    input uwire id_5,
    input wand id_6,
    input supply0 id_7,
    input wire id_8,
    input wand id_9,
    input supply0 id_10,
    output tri0 id_11,
    output wire id_12,
    output wor id_13
);
  logic [7:0] id_15;
  initial begin : LABEL_0
    id_0 <= id_12++;
  end
  localparam id_16 = -1;
  wire id_17;
  assign id_15[1] = {id_6, 1};
  logic id_18 = -1;
  pullup ((id_7), id_7, (1));
  wire id_19;
  ;
  wire id_20;
endmodule
module module_1 #(
    parameter id_3 = 32'd3
) (
    input uwire id_0,
    output logic id_1,
    input supply1 id_2,
    input wor _id_3,
    output wire id_4,
    input tri1 id_5,
    output uwire id_6,
    output tri0 id_7,
    output wire id_8,
    input wor id_9
);
  logic [7:0] id_11;
  final begin : LABEL_0
    if (1) id_1 = -1'b0;
    else begin : LABEL_1
      $clog2(60);
      ;
    end
    return "";
  end
  assign id_8 = -1;
  logic id_12;
  assign id_11[-1+id_3] = id_12;
  assign #id_13 id_7 = 1'd0;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_8,
      id_5,
      id_0,
      id_5,
      id_5,
      id_9,
      id_5,
      id_0,
      id_0,
      id_6,
      id_6,
      id_7
  );
endmodule
