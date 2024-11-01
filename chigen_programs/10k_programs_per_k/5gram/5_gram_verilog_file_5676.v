// Seed: 2843575563
module module_0;
  wire id_2;
  wire id_3;
  assign id_3 = id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = 1'h0;
  assign id_3 = id_3 == 1'b0 | id_2;
  module_0();
  assign id_1 = 1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always_ff @(posedge id_2) begin
    if (id_3) begin
      id_4 <= id_2 !== id_3;
    end else begin
      id_5 <= 1 == 1;
    end
  end
  module_0();
endmodule
