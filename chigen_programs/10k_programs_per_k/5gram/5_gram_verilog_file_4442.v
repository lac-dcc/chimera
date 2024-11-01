// Seed: 1875589339
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_5 = 1'b0;
  wire id_6;
  wire id_7;
  wire id_8;
  assign id_5#(.id_6(~id_5)) = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(posedge 1 or 1 & id_3) begin
    begin
      if (1) begin
        id_1 = #1 1'b0;
      end
    end
  end
  module_0(
      id_3, id_2, id_2, id_2
  );
endmodule
