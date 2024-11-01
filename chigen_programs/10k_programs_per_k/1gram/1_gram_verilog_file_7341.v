// Seed: 1750255618
module module_0 (
    output supply0 id_0
);
  always @(posedge 1) id_0 = id_2;
endmodule
module module_1 (
    output supply1 id_0,
    output tri1 id_1,
    output wor id_2,
    output tri id_3,
    input tri1 id_4,
    input tri1 id_5,
    input supply0 id_6,
    input uwire id_7,
    input supply1 id_8,
    output tri1 id_9,
    output tri1 id_10,
    output logic id_11
);
  always id_11 <= 1'b0;
  module_0(
      id_10
  );
  final begin
    $display(id_4);
  end
  wire id_13;
  assign id_3 = id_4#(.id_13(id_7 && id_5));
  assign id_3 = ~id_8;
endmodule
