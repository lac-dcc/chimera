// Seed: 1011896562
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_4;
  tri  id_5;
  assign id_5 = 1 ^ 1'd0;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  always @(posedge id_2, posedge 1) begin
    #1
    case (id_2)
      1: id_1 = 1;
      1: {id_2, id_2} <= 1'b0;
    endcase
  end
  wire id_3;
  buf (id_1, id_3);
  module_0(
      id_3, id_3, id_1
  );
endmodule
