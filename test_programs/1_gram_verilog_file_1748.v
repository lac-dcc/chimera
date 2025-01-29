// Seed: 643360819
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  genvar id_6;
  assign id_4 = id_4;
  localparam id_7 = id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  function id_7(id_8);
    begin : LABEL_0
      id_7 = id_5 - 1;
    end
  endfunction
  module_0 modCall_1 (
      id_3,
      id_1,
      id_7,
      id_1,
      id_7
  );
  assign id_6 = -1 == id_5;
endmodule
