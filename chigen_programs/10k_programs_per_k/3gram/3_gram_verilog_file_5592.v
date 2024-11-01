// Seed: 1373708659
module module_0 (
    output tri1  id_0,
    input  uwire id_1,
    input  tri1  id_2,
    output tri0  id_3
);
  assign id_0 = id_2;
endmodule
module module_1 (
    output tri0 id_0,
    input tri0 id_1,
    output wire id_2,
    output uwire id_3,
    input wire id_4,
    input supply1 id_5
);
  always @(id_1 or posedge id_1) begin
    if (1'b0) begin
      #1 begin
        id_2 = 1;
      end
    end else begin
      #1;
    end
  end
  module_0(
      id_2, id_5, id_1, id_3
  );
endmodule
