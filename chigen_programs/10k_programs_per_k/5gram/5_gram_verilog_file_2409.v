// Seed: 1311752644
module module_0;
  reg id_2;
  always @(1 or(1)) begin : LABEL_0
    id_1 <= id_2;
  end
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output logic id_0,
    input  logic id_1,
    output wand  id_2,
    input  logic id_3
);
  initial begin : LABEL_0
    #1;
    id_0#(.id_1(1)) <= 1;
    begin : LABEL_0
      begin : LABEL_0
        {id_3} = id_1;
        $display(1 - id_3);
      end
      $display(1, id_3 == 1, 1, id_1, id_2++ ^ id_3);
      id_0 <= id_3;
    end
  end
  wire id_5;
  wire id_6;
  module_0 modCall_1 ();
  wire id_7;
  wire id_8;
endmodule
