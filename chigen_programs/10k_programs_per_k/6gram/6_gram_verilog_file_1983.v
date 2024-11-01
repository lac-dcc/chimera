// Seed: 3527608551
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  input wire id_1;
  initial
    #(1) begin
      id_4 <= 1;
    end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  supply0 id_5 = {1, id_3};
  buf (id_3, id_1);
  assign id_4 = !id_5;
  always @(1) begin
    id_2 <= 1 == 1;
  end
  module_0(
      id_1, id_3, id_5
  );
endmodule
