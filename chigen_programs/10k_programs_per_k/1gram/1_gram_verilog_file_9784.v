// Seed: 746065442
module module_0;
  wire id_1;
  localparam id_2 = 1;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input wand id_0,
    input wand id_1,
    output tri0 id_2,
    input tri0 id_3,
    input tri0 id_4,
    input supply1 id_5,
    input tri0 id_6,
    input tri0 id_7,
    input wire id_8
);
  wire id_10;
  ;
  module_0 modCall_1 ();
  assign id_10 = id_4;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout logic [7:0] id_3;
  input wire id_2;
  output wire id_1;
  module_0 modCall_1 ();
  id_7(
      1, id_3
  );
  logic id_8;
  ;
  always begin : LABEL_0
    begin : LABEL_1
      begin : LABEL_2
        @(id_2 or -1) begin : LABEL_3
          id_3[-1?-1'b0 : 1 : 1] = id_2 & -1;
        end
        @(posedge id_3 or negedge id_7 && id_2 or negedge id_2, posedge id_7#(.id_7(1)));
        id_8 <= 1;
      end
    end
  end
endmodule
