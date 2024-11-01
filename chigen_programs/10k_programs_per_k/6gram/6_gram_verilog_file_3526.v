// Seed: 3811893888
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    input tri1 id_2,
    input supply0 id_3,
    output wire id_4
);
  wand id_6;
  wire id_7;
  assign id_6 = 1;
  logic [7:0] id_8;
  generate
    assign id_8[1] = id_0;
    if (1) begin : id_9
      logic [7:0] id_10 = id_8;
    end
  endgenerate
  wire id_11;
  always @(*) begin
    id_6 = 1;
  end
endmodule
module module_1 (
    input  wor   id_0,
    output uwire id_1,
    output wor   id_2
);
  wire id_4;
  module_0(
      id_0, id_0, id_0, id_0, id_2
  );
endmodule
