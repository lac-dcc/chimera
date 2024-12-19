// Seed: 3146493860
module module_0 ();
  wire id_2;
  assign module_1.type_11 = 0;
  wire id_3;
  assign module_2.id_17 = 0;
  wire id_4;
  wire id_5;
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 ();
  reg id_2;
  tri0 id_3, id_4, id_5;
  always @(posedge 1, posedge 1)
    case (id_4)
      id_4: id_2 = 1'd0;
      id_1: id_2 <= 1;
      1: id_2 = 1 == id_1;
      default: id_4 = 1'd0 === id_4;
    endcase
  wire  id_6;
  wire  id_7;
  uwire id_8 = 1;
endmodule
module module_2 (
    output wire id_0,
    output tri1 id_1,
    input supply0 id_2,
    input tri0 id_3,
    output tri0 id_4,
    input tri1 id_5,
    input logic id_6,
    input tri id_7,
    input wire id_8,
    input tri id_9,
    input tri id_10,
    input tri1 id_11,
    input supply1 id_12,
    input supply0 id_13,
    input wand id_14,
    input uwire id_15,
    input supply1 id_16,
    output wor id_17,
    input uwire id_18,
    output tri id_19,
    input wire id_20,
    input tri0 id_21,
    output tri id_22
);
  wire id_24;
  module_0 modCall_1 ();
  reg id_25, id_26 = 1 == 1;
  xor primCall (
      id_0,
      id_10,
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      id_16,
      id_18,
      id_2,
      id_20,
      id_21,
      id_24,
      id_3,
      id_5,
      id_6,
      id_7,
      id_8,
      id_9
  );
  always @(negedge id_2) begin : LABEL_0
    id_25 <= id_6;
  end
endmodule
