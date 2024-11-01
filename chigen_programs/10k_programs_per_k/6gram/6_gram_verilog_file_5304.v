// Seed: 1047993334
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(negedge id_6) begin
    id_3 = 1;
    if (id_4)
      #1 begin
        disable id_7;
      end
  end
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
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3[1] = id_5;
  module_0(
      id_4, id_4, id_5, id_4, id_4, id_2
  );
endmodule
