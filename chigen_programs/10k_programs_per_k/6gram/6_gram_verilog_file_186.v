// Seed: 1143549347
module module_0 (
    input uwire id_0,
    output wand id_1,
    input tri0 id_2,
    input supply1 id_3,
    input tri id_4,
    input supply1 id_5,
    input tri id_6,
    input supply0 id_7,
    input tri0 id_8,
    output supply0 id_9
);
  assign id_9 = 1'b0;
  module_2();
endmodule
module module_1 (
    input  wand id_0,
    output tri  id_1
);
  wire id_3;
  module_0(
      id_0, id_1, id_0, id_0, id_0, id_0, id_0, id_0, id_0, id_1
  );
endmodule
module module_2;
  tri id_1;
  always @(posedge 1 or posedge 1) begin
    fork
      wait (id_1);
      id_2(1, id_1);
      id_3;
    join : id_4
  end
endmodule
