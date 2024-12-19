// Seed: 2767233357
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  always #1 begin : LABEL_0
    id_1 = id_2;
  end
  assign id_1 = 1;
  assign id_1 = 1 <-> id_2;
  assign id_1 = 1;
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  function id_4(output id_5);
    id_1 = 1;
    id_3 <= id_4;
  endfunction
  wire id_6;
  or primCall (id_1, id_6, id_5, id_2, id_4);
  module_0 modCall_1 (
      id_2,
      id_1
  );
endmodule
