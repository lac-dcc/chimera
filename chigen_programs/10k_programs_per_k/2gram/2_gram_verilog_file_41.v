// Seed: 1769141781
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign id_2 = id_1;
  always id_1 = 1;
  module_0(
      id_2, id_1, id_1, id_2, id_2, id_1
  );
  always begin
    $display(id_1);
  end
endmodule
module module_2 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  wire id_3;
  assign id_3 = id_1;
  wire id_4;
  module_0(
      id_3, id_3, id_4, id_3, id_3, id_4
  );
  wire id_5 = id_3;
  id_6(
      .id_0(~1)
  );
endmodule
