module bn_mux_n_1_generate 
#( parameter  DATA_WIDTH = 8,
   parameter  SEL_WIDTH   = 2) 
(
    input   [((2**SEL_WIDTH)*DATA_WIDTH)-1:0] data,
    input   [SEL_WIDTH-1:0]                   sel,   
    output  [DATA_WIDTH-1:0]                  y
);

wire    [DATA_WIDTH-1:0] tmp_array [0:(2**SEL_WIDTH)-1];

genvar i;
generate
    for(i=0; i<2**SEL_WIDTH; i=i+1) 
    begin: gen_array
        assign  tmp_array[i] = data[((i+1)*DATA_WIDTH)-1:(i*DATA_WIDTH)];
    end
endgenerate

    assign  y =  tmp_array[sel];

endmodule


module bn_selector_n_1_generate 
#( parameter  DATA_WIDTH = 8,
   parameter  INPUT_CHANNELS   = 2) 
(
    input   [(INPUT_CHANNELS*DATA_WIDTH)-1:0] data,
    input   [INPUT_CHANNELS-1:0]              sel,   
    output  [DATA_WIDTH-1:0]                  y
);

genvar i;
generate
    for(i=0;i<INPUT_CHANNELS;i=i+1) 
    begin: gen_array
        assign y = sel[i] ? data[((i+1)*DATA_WIDTH)-1:(i*DATA_WIDTH)] : {DATA_WIDTH{1'bx}};
    end
endgenerate

endmodule

module lab4
(
    input   [ 1:0]  KEY,
    input   [ 9:0]  SW,
    output  [ 9:0]  LEDR
);

    bn_mux_n_1_generate #(2,2) bn_mux_n_1_generate (.data({SW[7:6],SW[5:4],SW[3:2],SW[1:0]}), .sel(KEY[1:0]), .y(LEDR[1:0]));
    bn_selector_n_1_generate #(4,2) bn_selector_n_1_generate (.data({SW[7:4],SW[3:0]}), .sel(SW[9:8]), .y(LEDR[9:6]));

endmodule