// Seed: 1442446807
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_3;
  wire id_4 = 1;
  wire id_5;
  wire id_6;
  generate
    wire id_7;
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always
    repeat (id_4)
      for (id_2 = 1; id_6; id_3 = {id_4 * id_1 + id_1 - 1'b0{1}} & id_4 & 1 & 1 & 1)
        @(id_6 or id_4) begin
          id_1 <= 1'b0;
        end
  module_0(
      id_3, id_5
  );
endmodule
