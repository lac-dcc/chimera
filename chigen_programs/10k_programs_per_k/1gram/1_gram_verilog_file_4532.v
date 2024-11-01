// Seed: 2829567928
module module_0 ();
  wand id_1, id_2;
  assign id_2 = (1);
  id_3 :
  assert property (@(id_1) (1)) begin
    $display;
  end
  assign id_3 = id_2;
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1,
    output logic id_2
);
  reg id_4;
  always id_0 <= id_1;
  reg id_5;
  xnor (id_0, id_1, id_4, id_5);
  module_0();
  always begin
    id_5 = 1;
    fork
      if (1) id_4 <= 1 == id_1;
      else $display;
      id_2 <= #1 1;
    join
    id_5 <= 1;
  end
endmodule
