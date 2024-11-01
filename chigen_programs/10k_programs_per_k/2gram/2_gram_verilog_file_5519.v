// Seed: 2338526656
module module_0 (
    output supply1 id_0,
    input tri id_1,
    input wor id_2,
    input uwire id_3,
    input wor id_4
);
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    output tri id_0,
    input wand id_1,
    input supply0 id_2,
    input tri1 id_3,
    input supply1 id_4
);
  wire id_6;
  module_0(
      id_0, id_4, id_2, id_1, id_2
  );
endmodule
module module_2 (
    input tri0 id_0,
    input logic id_1,
    input tri1 id_2,
    input supply1 id_3,
    input tri0 id_4,
    output wand id_5
);
  reg id_7;
  assign id_5 = id_2;
  module_0(
      id_5, id_2, id_4, id_2, id_3
  );
  always
    if (1) @(posedge id_4 or posedge 1) id_7 <= {id_1{1'h0}};
    else id_7 <= id_7;
  assign id_5 = 1;
  assign id_5 = id_2;
endmodule
