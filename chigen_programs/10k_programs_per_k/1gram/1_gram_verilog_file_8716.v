// Seed: 2932499050
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  id_7(
      id_2, 1
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
  supply1 id_5;
  module_0(
      id_4, id_4, id_5, id_4, id_4, id_2
  );
  assign id_5 = id_3;
  assign id_4 = id_2;
  genvar id_6;
  always_latch begin
    id_6 = id_5;
    #1;
    if (id_3) id_4 = {id_3 + id_2} == 1;
  end
  wire id_7;
endmodule
