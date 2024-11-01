// Seed: 2578437739
module module_0;
  id_2(
      .id_0(id_1), .id_1(1 + 1), .id_2()
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
  module_0();
endmodule
module module_2;
  assign id_1 = 1;
  module_0();
  always @(posedge 1, posedge 1)
    #1 begin
      id_1 = 1;
    end
  assign id_1 = id_1(1, 1);
  wire id_2;
endmodule
