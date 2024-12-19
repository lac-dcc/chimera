// Seed: 3289580994
module module_0;
  assign module_1.id_14 = 0;
  supply0 id_2, id_3, id_4;
  wire id_5;
  wand id_6;
  assign id_2 = 1;
  wire id_7;
  tri0 id_8;
  wire id_9;
  wire id_10;
  id_11(
      id_6
  );
  genvar id_12;
  assign id_8 = id_6 + 1;
  assign id_3 = id_4;
endmodule
module module_1 (
    input  logic id_0,
    output uwire id_1,
    input  logic id_2,
    output logic id_3,
    input  uwire id_4
    , id_9,
    input  wor   id_5,
    input  logic id_6,
    input  tri   id_7
);
  reg id_10;
  reg id_11;
  reg id_12, id_13;
  reg id_14 = $display;
  module_0 modCall_1 ();
  always id_3 <= id_6;
  initial #1 id_13 <= (id_2);
  function id_15;
    input id_16;
    input id_17;
    id_11 <= id_0;
  endfunction
  final
    if (id_16) id_9 = 1;
    else begin : LABEL_0
      begin : LABEL_0
        id_10 <= 1;
      end
    end
  always begin : LABEL_0
    id_10 <= id_16;
    if (id_17) id_3 <= 1;
  end
  reg id_18 = id_14;
endmodule
