// Seed: 1346343816
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0(
      .id_0(1), .id_1(1), .id_2(1)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_5 = 1;
  module_0(
      id_4, id_4, id_5
  );
  wire id_6;
  always @(id_5) begin
    id_4 = id_5;
  end
  initial
    #1 begin
      if (id_2 - (1)) #1;
    end
endmodule
