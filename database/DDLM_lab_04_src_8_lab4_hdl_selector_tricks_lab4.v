module bn_selector_4_1_and_or 
#( parameter  DATA_WIDTH = 32) 
(
    input   [(DATA_WIDTH*4)-1:0] data,
    input   [3:0]                sel,   
    output  [DATA_WIDTH-1:0]     y
);

    wire [(DATA_WIDTH*4)-1:0] mask;
    wire [(DATA_WIDTH*4)-1:0] masked_data;
    
    assign mask        = {{DATA_WIDTH{sel[3]}}, 
                          {DATA_WIDTH{sel[2]}}, 
                          {DATA_WIDTH{sel[1]}}, 
                          {DATA_WIDTH{sel[0]}}};
    assign masked_data = data & mask;
    assign y           = masked_data[DATA_WIDTH*4-1:DATA_WIDTH*3]|
                                masked_data[DATA_WIDTH*3-1:DATA_WIDTH*2]|
                                masked_data[DATA_WIDTH*2-1:DATA_WIDTH]|
                                masked_data[DATA_WIDTH-1:0];

endmodule

module lab4
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LEDR
);

    bn_selector_4_1_and_or #(2) bn_selector_4_1_and_or 
                                (.data(SW[7:0]), .sel({SW[9:8], KEY[1:0]}), .y(LEDR[9:8]));
    assign LEDR[3:0] = {SW[9:8], KEY[1:0]};

endmodule