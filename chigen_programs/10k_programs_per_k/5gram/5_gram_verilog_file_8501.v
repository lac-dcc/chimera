// Seed: 3800711697
module module_0 (
    input  logic id_0,
    output logic id_1,
    input  logic id_2
);
  always @(posedge id_2 or negedge 1) begin
    cover (1);
    id_1 <= id_2 == 1;
    id_1 += 1;
    wait (1);
    case (1)
      id_2: id_1 = 1;
      1'h0: id_1 <= 1;
      1: begin
        disable id_4;
        disable id_5;
      end
      1 && id_2: id_1 <= 1;
      1: id_1 <= 1 ? 1 : id_0;
      default: id_1 <= #1 id_0 - id_0;
    endcase
    id_1 = id_2;
  end
endmodule
module module_1 (
    input supply0 id_0,
    output tri id_1,
    input logic id_2,
    input wor id_3,
    input wand id_4,
    output logic id_5,
    output supply1 id_6
);
  always @(id_3 == id_0) begin
    for (id_6 = 1 != 1'd0; 1; id_6 = 1 * 1) id_5 <= id_2;
  end
  wire id_8;
  module_0(
      id_2, id_5, id_2
  );
endmodule
