// Seed: 378773074
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign module_1.id_3 = 0;
  logic id_5;
endmodule
module module_1 #(
    parameter id_3 = 32'd58
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6
  );
  output wire id_5;
  output wire id_4;
  inout wire _id_3;
  output wire id_2;
  inout reg id_1;
  function void id_7;
    input [id_3 : -1 'b0] id_8, id_9, id_10;
    id_1 <= 1;
  endfunction
  initial begin
    id_7(id_6);
  end
endmodule
