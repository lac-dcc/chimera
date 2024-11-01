// Seed: 1197057062
module module_0 ();
  assign id_1[(1)] = 1;
  assign id_1[1]   = 1;
  initial
  fork : id_2
  join : id_3
endmodule
module module_1 (
    output uwire id_0,
    input  tri   id_1,
    output logic id_2
);
  always @(posedge 1 or posedge id_1) begin
    id_2 <= ~id_1;
  end
  module_0();
endmodule
module module_2 (
    input supply1 id_0,
    input tri1 id_1,
    input supply0 id_2,
    input supply0 id_3,
    input tri1 id_4,
    output tri0 id_5
);
  wire id_7 = 1;
  module_0();
  assign id_5 = 1 & 1'b0 & id_3;
endmodule
