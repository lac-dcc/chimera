// Seed: 1597987909
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  function id_8();
    id_2 = #id_9 id_1;
  endfunction
endmodule
module module_1 (
    output logic id_0,
    input tri id_1,
    input supply0 id_2,
    input uwire id_3,
    output logic id_4
    , id_12,
    input logic id_5,
    input wor id_6,
    output wand id_7,
    output logic id_8,
    input logic id_9,
    input supply0 id_10
);
  logic id_13;
  assign id_0 = id_9;
  wor id_14, id_15;
  final id_13 <= 1;
  reg id_16;
  always id_4 <= id_5;
  module_0 modCall_1 (
      id_16,
      id_16,
      id_15,
      id_14,
      id_14,
      id_14,
      id_15
  );
  always begin : LABEL_0
    id_8 = id_13;
    begin : LABEL_0
      begin : LABEL_0
        begin : LABEL_0
          @(posedge 1'h0) id_16 <= 1;
          id_12 = id_5;
          $display(id_10, id_14 == id_16);
          id_0 <= id_13;
        end
        id_12 <= id_5;
      end
    end
  end
  integer id_17;
  initial id_17 <= 1;
endmodule
