// Seed: 2062970510
module module_0 (
    input tri0 id_0,
    input wor  id_1
);
endmodule
module module_1 (
    input  tri  id_0,
    input  wor  id_1,
    input  tri0 id_2,
    output tri0 id_3
);
  wire id_5;
  module_0(
      id_0, id_2
  );
endmodule
module module_2 (
    input  wire id_0,
    output wor  id_1,
    input  tri0 id_2,
    output wand id_3
);
  wire id_5;
  module_0(
      id_0, id_2
  );
  if (id_2) begin : id_6
    assign id_6 = 1;
  end else begin : id_7
    wor id_8 = 1;
  end
endmodule
