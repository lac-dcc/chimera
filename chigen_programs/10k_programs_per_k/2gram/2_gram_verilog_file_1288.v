// Seed: 964820715
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_7, id_8;
  assign id_2 = 'b0;
endmodule
module module_1 ();
  assign id_1[1] = 1;
  wire id_2;
  module_0(
      id_2, id_2, id_2, id_2, id_2, id_2
  );
  always begin
    assert (id_1[1]);
  end
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5;
  xnor (id_2, id_4, id_5, id_1);
  module_0(
      id_5, id_3, id_5, id_5, id_4, id_2
  );
endmodule
