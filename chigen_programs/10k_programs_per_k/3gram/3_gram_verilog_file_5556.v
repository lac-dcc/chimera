// Seed: 3092753427
module module_0 (
    output uwire id_0,
    input supply1 id_1,
    input uwire id_2,
    input tri id_3,
    output wand id_4,
    output supply1 id_5,
    input wand id_6,
    input tri1 id_7,
    output tri1 id_8,
    output logic id_9
);
  logic id_11;
  always @(id_11 || 1)
    if (-1) begin : LABEL_0
      id_9 <= "";
    end
  wire id_12;
  wire id_13, id_14;
  logic id_15 = -1;
endmodule
module module_1 #(
    parameter id_0 = 32'd46,
    parameter id_4 = 32'd30,
    parameter id_6 = 32'd95
) (
    input wire _id_0,
    input wor id_1,
    output wand id_2,
    output supply0 id_3,
    output wire _id_4,
    input tri id_5,
    input uwire _id_6,
    input wor id_7,
    input tri1 id_8,
    output logic id_9,
    output wor id_10,
    output wor id_11,
    input tri0 id_12
);
  logic [id_4 : ""] id_14[id_0 : id_6];
  ;
  always @(negedge id_1 or id_8) begin : LABEL_0
    $unsigned(4);
    ;
    id_9 = id_12;
  end
  module_0 modCall_1 (
      id_2,
      id_7,
      id_7,
      id_7,
      id_2,
      id_10,
      id_8,
      id_8,
      id_11,
      id_9
  );
  assign modCall_1.id_7 = 0;
endmodule
