// Seed: 2615090705
module module_0 ();
  uwire id_1, id_2, id_3, id_4, id_5;
  always @(posedge (id_4) or posedge id_3)
    #1 begin
      fork
        $display;
      join
    end
endmodule
module module_1 (
    output logic id_0,
    input  wor   id_1
);
  initial begin
    if (1) id_0 <= 1 & id_1;
    id_0 = 1 - id_1;
  end
  buf (id_0, id_1);
  module_0();
endmodule
module module_2 #(
    parameter id_12 = 32'd4,
    parameter id_13 = 32'd18
) (
    output wire  id_0,
    output tri0  id_1,
    output tri1  id_2,
    input  wor   id_3,
    output tri0  id_4,
    output tri0  id_5,
    input  uwire id_6,
    input  wire  id_7,
    input  wor   id_8,
    output wire  id_9,
    output tri1  id_10
);
  defparam id_12.id_13 = id_3 == id_8; module_0();
endmodule
