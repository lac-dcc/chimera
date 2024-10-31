// Seed: 2428569939
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  assign id_2 = (id_1);
  wire id_3;
  assign id_2 = 1'b0;
  id_4(
      .id_0(id_2), .id_1(id_2 == id_2), .id_2(1'b0)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
  assign id_5 = id_1;
  module_0(
      id_4, id_1
  );
  wire id_6;
  initial begin
    fork
      #1;
      $display(1, 1);
    join
    id_3 <= "";
  end
endmodule
