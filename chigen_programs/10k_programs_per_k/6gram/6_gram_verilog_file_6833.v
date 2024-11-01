// Seed: 218420395
module module_0 (
    output logic id_0,
    input  logic id_1,
    input  logic id_2,
    input  logic id_3,
    output logic id_4
);
  assign id_4 = id_3;
  initial begin
    id_4 <= 1;
    id_0 <= id_2;
    id_0 <= id_1;
    case (id_1)
      {id_1, 1 * id_3} : id_4 = 1;
      !id_1 < 1: id_4 <= 1'b0;
    endcase
    begin
      id_4 = id_3;
      id_4 <= 1;
    end
  end
endmodule
module module_1 (
    output logic id_0,
    input logic id_1,
    output supply0 id_2,
    input tri1 id_3,
    input wand id_4,
    output uwire id_5
);
  assign id_0 = 1;
  always @(*) begin
    id_0 <= id_1;
  end
  module_0(
      id_0, id_1, id_1, id_1, id_0
  );
endmodule
