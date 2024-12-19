// Seed: 4229927906
module module_0 (
    output tri1 id_0,
    output wor  id_1
);
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output tri id_0,
    input wor id_1,
    output supply1 id_2,
    output logic id_3,
    input supply1 id_4,
    output wire id_5,
    output uwire id_6,
    output wand id_7,
    output tri id_8,
    output supply0 id_9,
    input tri1 id_10
);
  always
    case ("")
      "": id_2 = 1;
      1: begin : LABEL_0
        id_3 <= id_1 - 1;
        wait (1'b0 == 1);
      end
      default: id_9 = ~{id_4{1'h0 == 1'b0}};
    endcase
  assign id_5 = 1;
  module_0 modCall_1 (
      id_2,
      id_7
  );
  assign id_9 = 1;
  assign id_2 = id_10;
endmodule
