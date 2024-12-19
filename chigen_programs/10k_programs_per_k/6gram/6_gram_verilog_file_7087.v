// Seed: 4181789744
module module_0 (
    output tri1 id_0,
    input wor id_1,
    input tri0 id_2,
    output uwire id_3,
    input supply1 id_4,
    input tri id_5,
    input tri0 id_6,
    input tri id_7,
    input tri0 id_8,
    input wire id_9,
    output tri0 id_10
);
  wire id_12;
  wire id_13 = 1;
  timeunit 1ps;
  assign id_10 = 1;
endmodule
module module_1 (
    output tri id_0,
    input wor id_1,
    input supply1 id_2,
    output tri0 id_3
);
  tri id_5;
  tri id_6;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_3
  );
  assign modCall_1.id_6 = 0;
  supply1 id_7 = 1;
  always @(posedge id_5 or id_5)
    case (1'b0)
      id_5: begin : LABEL_0$display
        ;
      end
      id_2 + id_5: id_0 = 1;
      1: id_6 = id_5;
      default: begin : LABEL_0
        id_3 = 1;
      end
    endcase
endmodule
