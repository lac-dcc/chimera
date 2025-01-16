// Seed: 3058421255
module module_0;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    output tri0  id_0,
    input  wand  id_1,
    output logic id_2,
    input  tri0  id_3
);
  reg id_5;
  module_0 modCall_1 ();
  assign id_2 = 1;
  assign id_0 = id_1;
  supply1 id_6;
  always begin : LABEL_0
    #1 begin : LABEL_0
      id_0 = id_3;
      id_5 <= id_3 - -1;
      @(posedge id_3(
          1'h0,
          -1,
          id_6
      ) or 1)
      #(1) begin : LABEL_0
        id_2 <= id_5;
      end
    end
  end
  always id_5 = 1;
endmodule
