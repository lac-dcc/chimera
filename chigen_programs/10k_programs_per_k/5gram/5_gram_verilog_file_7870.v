// Seed: 424573084
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  integer id_3, id_4;
  module_2();
endmodule
module module_1;
  wire id_1;
  module_0(
      id_1, id_1
  );
endmodule
module module_2;
  wire id_1;
  wire id_2;
  wire id_3;
endmodule
macromodule module_3 (
    output supply0 id_0,
    output tri1 id_1,
    input uwire id_2,
    input supply0 id_3
);
  tri1 id_5;
  wire id_6;
  module_2();
  wire id_7;
  function id_8;
    input integer id_9;
    id_8 = 1;
  endfunction
  nor (id_0, id_2, id_3, id_5, id_6);
  initial begin
    assert (id_5 == 1);
  end
endmodule
