// Seed: 1134732911
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_6;
  assign id_3 = id_4;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_3 = 1;
  supply0 id_5;
  wand id_6;
  always @(posedge id_5, posedge id_6) begin
    fork
      for (id_3 = id_6; id_1; id_3 = 1) begin
        $display(1);
        id_4 <= 1;
      end
      repeat ((1'd0 && id_1 == 1'b0 & 1)) @(posedge (1));
    join : id_7
  end
  assign id_2 = id_6 & id_1;
  module_0(
      id_5, id_1, id_6, id_6, id_1
  );
endmodule
