// Seed: 1988523247
module module_0;
  always @(posedge 1)
    if (id_1) id_1 = 1'd0;
    else begin
      id_1 = 1;
      if (id_1) begin
        id_1 <= 1'b0;
      end else begin
        id_1 = id_1;
      end
      id_1 <= {id_1, $display};
    end
endmodule
module module_1 (
    output supply1 id_0,
    input logic id_1,
    input supply1 id_2,
    output wand id_3,
    input logic id_4,
    output logic id_5
);
  final begin
    id_5 = id_4;
    $display(id_1 & 1'b0 << id_1);
  end
  always @(posedge {id_5++, 1'b0} or posedge id_4) id_5 <= id_1;
  module_0();
endmodule
