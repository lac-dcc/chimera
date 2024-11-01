// Seed: 3749926538
module module_0 (
    input  tri1  id_0,
    input  tri0  id_1,
    output uwire id_2,
    input  tri1  id_3
    , id_6,
    input  tri0  id_4
);
  assign id_2 = {id_0, 1};
  always_ff @(negedge 1 or posedge 1) begin
    id_2 = 'h0;
    id_6 <= 1;
  end
  wire id_7 = id_4;
  wire id_8;
  assign id_2 = id_3 * id_8 - 1;
  wire id_9;
endmodule
program module_1 (
    input supply1 id_0,
    output tri0 id_1,
    input wor id_2
);
  id_4(
      .id_0(id_0), .id_1((1 - 1'b0))
  );
  wire id_5;
  module_0(
      id_0, id_2, id_1, id_0, id_0
  );
endprogram
