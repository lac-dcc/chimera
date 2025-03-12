// Seed: 2630858112
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    output tri1 id_2,
    input tri0 id_3,
    output tri1 id_4,
    input wire id_5,
    input wire id_6,
    input tri id_7,
    input tri0 id_8,
    input supply1 id_9,
    output tri0 id_10,
    output supply0 id_11
);
  wire id_13;
  assign module_1.id_13 = 0;
  assign {id_6, id_3, 1, id_8, id_6, 1} = -1'b0;
endmodule
module module_1 #(
    parameter id_11 = 32'd92
) (
    input wand id_0,
    input supply0 id_1,
    input uwire id_2,
    input wire id_3,
    input wire id_4,
    input tri0 id_5,
    input wor id_6,
    output wire id_7,
    input supply0 id_8,
    output tri1 id_9,
    input uwire id_10,
    input tri1 _id_11,
    input wire id_12,
    output logic id_13
);
  wire [1 'h0 : id_11] id_15;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_7,
      id_12,
      id_9,
      id_8,
      id_6,
      id_5,
      id_4,
      id_2,
      id_9,
      id_9
  );
  assign id_13 = -1;
  parameter id_16 = "";
  nand primCall (id_9, id_0, id_10, id_1, id_12, id_8, id_6, id_5, id_15, id_4);
  initial begin : LABEL_0
    id_13 <= id_4;
    if (1 != 1)
      case ("")
        id_11: id_13 <= -1;
        id_0:  id_13 <= id_0;
      endcase
  end
endmodule
