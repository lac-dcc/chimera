// Seed: 3826946034
module module_0 (
    input uwire id_0,
    input wand id_1,
    output tri0 id_2,
    input supply1 id_3,
    output wand id_4,
    output wand id_5,
    input supply0 id_6,
    input wand id_7
);
  assign id_4 = 1;
  integer module_0;
  assign module_1.type_1 = 0;
  integer id_9 = 1;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri1  id_1,
    output logic id_2,
    input  uwire id_3,
    input  tri1  id_4,
    output tri1  id_5
);
  always @(id_3 or posedge id_0)
    if (id_3) $display(id_4);
    else if (1) begin : LABEL_0
      case (id_1 && 1)
        id_3: id_5 = 1;
        default: id_2 <= 1'b0;
      endcase
    end
  module_0 modCall_1 (
      id_3,
      id_0,
      id_5,
      id_1,
      id_5,
      id_5,
      id_4,
      id_4
  );
endmodule
