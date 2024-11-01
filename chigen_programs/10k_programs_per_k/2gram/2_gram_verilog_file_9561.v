// Seed: 951729161
module module_0;
  always #1;
  supply1 id_1;
  always $display(id_1);
  assign id_1 = 1'h0;
  timeunit 1ps;
endmodule
module module_1 (
    output wor id_0
);
  module_0();
endmodule
module module_2 (
    input supply1 id_0,
    input tri1 id_1
);
  assign id_3 = id_1 && 1 && 1;
  module_0(); id_4(
      id_1 - id_3 == 1, id_0
  );
endmodule
module module_3 (
    output wand  id_0,
    input  uwire id_1
);
  assign id_0 = id_1;
  not (id_0, id_1);
  module_0();
endmodule
