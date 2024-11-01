// Seed: 1790394149
module module_0 (
    id_1
);
  inout wire id_1;
  wor id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  always
  fork
    id_4;
    #id_5
    if (1)
      if (id_4) begin
        id_1 <= 1;
      end else begin
        id_1 = #1 id_3;
        wait (1);
      end
    else begin
      id_4 = 'd0;
    end
  join
  module_0(
      id_4
  );
endmodule
module module_2 (
    output tri  id_0,
    output wand id_1
);
  tri1 id_3 = 1;
  wire id_4;
endmodule
module module_3 (
    output wire  id_0,
    input  tri0  id_1,
    input  wand  id_2,
    output uwire id_3
);
  assign id_3 = id_2;
  module_2(
      id_3, id_0
  );
  assign id_0 = id_1;
endmodule
