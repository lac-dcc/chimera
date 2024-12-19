// Seed: 345452436
module module_0;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input tri1 id_0
    , id_8,
    input supply1 id_1,
    input tri0 id_2,
    input wor id_3,
    output logic id_4,
    input wire id_5,
    input wand id_6
);
  always
    casez (1)
      1: id_8 = #1 id_5 - 1'b0;
      1'd0: begin : LABEL_0
        id_8 <= 1;
      end
      ~id_8: begin : LABEL_0
        id_8 = !id_3;
        id_8 <= 1;
        id_8 <= 1;
        id_4 <= 1;
        id_4 <= id_8;
      end
      1'b0: id_8 = id_8;
      default: id_4 <= 1;
    endcase
  module_0 modCall_1 ();
endmodule
