// Seed: 638167630
module module_0 (
    output logic id_0,
    output tri1 id_1,
    output supply1 id_2
);
  logic id_5 = id_4;
  always @(posedge 1 or 1'b0) begin
    case (id_5)
      1: begin
        id_0 <= id_4;
      end
      id_5 ~^ id_5: id_0 = 1 ? 1 : (1);
      id_4: id_0 <= id_4 | id_4 | id_5;
      1: id_0 = id_5;
    endcase
  end
endmodule
module module_1 (
    input wand id_0,
    input tri id_1,
    output supply1 id_2,
    output wand id_3,
    output wire id_4,
    output logic id_5
);
  initial begin
    id_5 <= 1;
    #1 id_4 = 1;
  end
  xnor (id_2, id_0, id_1);
  module_0(
      id_5, id_4, id_2
  );
endmodule
