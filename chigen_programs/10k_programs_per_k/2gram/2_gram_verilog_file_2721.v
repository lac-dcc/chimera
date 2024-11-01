// Seed: 783651429
module module_0;
  id_2(
      .id_0(1)
  );
endmodule
module module_1;
  reg id_2;
  always begin
    $display(id_2);
  end
  always id_2 <= 1;
  wire id_3;
  module_0();
endmodule
module module_2 (
    id_1
);
  inout wire id_1;
  module_0();
  wire id_2;
endmodule
module module_3 (
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
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  always $display(id_2[1], id_6, 'b0, 1, 1, id_6);
  module_0();
endmodule
