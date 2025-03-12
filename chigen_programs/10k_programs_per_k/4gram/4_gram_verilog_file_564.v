// Seed: 510153651
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wor id_3,
    input wand id_4
);
  localparam id_6 = 1'b0;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output logic id_0,
    input tri0 id_1,
    output logic id_2,
    input supply1 id_3,
    input wire id_4
);
  always @(posedge 1 or 1 or id_1 or negedge id_3) begin : LABEL_0
    casez (1)
      -1'b0: id_2 = id_4;
      id_3: id_0 <= id_1 ==? id_3 && -1;
      1: id_0 <= -1;
      -1: id_0 = -1;
      1:
      #(((1))) begin : LABEL_1
        disable id_6;
      end
      1 * id_1: id_2 = (id_4);
      default: begin : LABEL_2
        id_0 <= -1;
        id_2 <= id_1;
      end
    endcase
    id_2 <= -1;
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3
  );
  assign id_0 = 1;
  assign id_0 = -1;
endmodule
