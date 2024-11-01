// Seed: 54607566
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    output tri0 id_2,
    output uwire id_3,
    input wire id_4,
    input tri id_5,
    input tri id_6,
    input uwire id_7,
    input tri0 id_8
);
  assign id_3 = id_1;
endmodule
module module_1 (
    input tri id_0,
    input wire id_1,
    output tri1 id_2,
    output wor id_3,
    output wire id_4,
    input supply1 id_5,
    input tri id_6,
    output supply0 id_7
);
  generate
    for (id_9 = 1; id_6; id_9 = 1) begin : id_10
      assign id_10 = 1;
      assign id_9  = 1;
    end
  endgenerate
  module_0(
      id_0, id_1, id_4, id_9, id_5, id_5, id_6, id_1, id_0
  );
  always @(posedge 1, posedge 1) begin
    id_4 = 1'd0;
    fork
      id_11;
      #1 id_3 = id_9;
    join
  end
endmodule
